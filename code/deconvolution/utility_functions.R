## Libraries
library(edgeR)
library(dplyr)
library(data.table)
library(tidyverse)
library(magrittr)
library(plyr)
library(biomaRt)
library(stringr)
library(GenomicFeatures)
library(SummarizedExperiment)
library(dtangle)
library(biomaRt)
library(pander)
library(preprocessCore)
library(ModelMetrics)
library(DTWBI)
library(DeconRNASeq)

## Deconvolution functions

run.DRS <- function(mixture, signature) {
  res <- as.data.frame(DeconRNASeq(mixture, signature, use.scale = TRUE)$out.all)
  rownames(res) <- colnames(mixture)
  return(res)
}

## Normalization

## CPM
cpm = function(matrix){
  apply(matrix, 2, function(x) {
    lib.size <- 10^6 / sum(x)
    x <- x * lib.size
    return(x)
  })}

## RPKM
## geneList being rowname of features
getLength = function(geneList){
  ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl", mirror = "useast")
  annotations <- biomaRt::getBM(mart = ensembl, attributes=c("ensembl_gene_id", "external_gene_name", "start_position", "end_position"))
  annotations <- dplyr::transmute(annotations, ensembl_gene_id, external_gene_name, gene_length = end_position - start_position)
  x = annotations %>% dplyr::filter(annotations$ensembl_gene_id %in% geneList)
  x <- x[order(match(x$ensembl_gene_id, geneList)),]; rownames(x) <-NULL
  return(x)
}

rpkm = function(exp, gene_length){
  x = data.frame(sapply(exp, function(column) 10^9 * column / gene_length / sum(column)))
  rownames(x) = rownames(exp)
  return(x)
}


write.gof<- function(measuredExp, estimatedComp, signatureUsed, returnPred = FALSE) {
  # set to common row order
  commonGenes <- rownames(measuredExp)[which(rownames(measuredExp) %in% rownames(signatureUsed))]
  measuredExp <- measuredExp[commonGenes,]; signatureUsed <- signatureUsed[commonGenes,]

  # quantile normalise
  qn <- data.frame(signatureUsed, measuredExp)
  qn <- as.data.frame(normalize.quantiles(as.matrix(qn), copy = FALSE))
  signatureUsed <- qn[,1:ncol(signatureUsed)]
  measuredExp <- qn[,-c(1:ncol(signatureUsed))]

  # predict expression (predExp) from the estimatedComp * signatureUsed
  predExp <- as.data.frame(matrix(nrow = length(commonGenes), ncol = ncol(measuredExp)))
  rownames(predExp) <- commonGenes

  for(j in 1:ncol(predExp)) {
    # storage
    a <- list()

    # the contribution of each cell-type to predicted expression
    for(k in colnames(signatureUsed)) { a[[k]] <- estimatedComp[j,k] * signatureUsed[,k] }

    # sum expression from all cell-types to a single predicted value
    predExp[,j] <- rowSums(do.call("cbind", a))
  }

  ## Calculate statistics
  stats <- as.data.frame(matrix(ncol = 5, nrow = ncol(measuredExp)))
  colnames(stats) <- c("rho", "r", "mae", "rmse", "nmae")
  rownames(stats) <- colnames(measuredExp)
  for(j in 1:ncol(measuredExp)) {
    a <- measuredExp[,j]
    b <- predExp[,j]
    stats$r[j] <- cor(log2(a+0.5), log2(b+0.5), method = "p")
    stats$rho[j] <- cor(a, b, method = "s")
    stats$mae[j] <- mae(a, b)
    stats$rmse[j] <- rmse(a, b)
    stats$nmae[j] <- compute.nmae(a, b)
  }
  # return
  if(returnPred) {
    res <- list()
    res$predExp <- predExp
    res$stats <- stats
  } else {
    res <- stats
  }

  return(res)
}


calculate_rpkm = function(exp){

  ## Retrieve gene lengths from bioMart
  ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl", mirror = "useast")
  annotations <- biomaRt::getBM(mart = ensembl, attributes=c("ensembl_gene_id", "external_gene_name", "start_position", "end_position"))
  annotations <- dplyr::transmute(annotations, ensembl_gene_id, external_gene_name, gene_length = end_position - start_position)

  ## Ensure gene lengths match exp matrix
  final.genes <- annotations %>% dplyr::filter(annotations$ensembl_gene_id %in% rownames(exp))
  final.genes <- final.genes[order(match(final.genes$ensembl_gene_id, rownames(exp))),]; rownames(final.genes) <-NULL

  exp.rpkm = signatures[rownames(exp) %in% final.genes$ensembl_gene_id,]
  expression.rpkm <- data.frame(sapply(exp.rpkm, function(column) 10^9 * column / final.genes$gene_length / sum(column)))
  rownames(expression.rpkm) = rownames(exp.rpkm)
  return(expression.rpkm)
}

create.seurat.signature <- function(w) {
  # print
  print(w@project.name)

  # get counts
  counts <- as.data.frame(w@assays$RNA@counts)

  # convert to EnsID and remove non-coding genes
  counts <- addENSID(counts)

  # get CPM of every cell
  cpm <- apply(counts, 2, function(x) {
    lib.size <- 10^6 / sum(x)
    x <- x * lib.size
    return(x)
  })

  cpm <- as.data.frame(cpm)

  # get RPKM of every cell
  rpkm <- length.correct(cpm)

  # signatures are the average normalised expression of every member
  output <- list(rpkm = list(), cpm = list())
  for (j in rownames(ct.counts)) {
    # print((j))
    k <- which(w$brain.ct == j)

    output$cpm[[j]] <- rowMeans(cpm[,k])
    output$rpkm[[j]] <- rowMeans(rpkm[,k])
  }

  output <- lapply(output, function(x) as.data.frame(do.call("cbind", x)))

  # add neurons, which come from pooling exc and inh cells
  neu <- which(w$brain.ct %in% c("Excitatory", "Inhibitory"))

  output$cpm$Neurons <- rowMeans(cpm[,neu])
  output$rpkm$Neurons <- rowMeans(rpkm[,neu])


  # expression threshold: a gene is kept if > 1 unit in at least 1 cell-type
  output <- lapply(output, function(x) {
    keep <- which(apply(x, 1, max) > 1)
    x <- x[keep,]
    return(x)
  })

  # return
  return(output)
}


run_dtg = function(exp, sig){

  common_genes = intersect(rownames(exp), rownames(sig))
  exp = exp[pmatch(common_genes, rownames(exp)),]
  sig = sig[pmatch(common_genes, rownames(sig)),]

  y = cbind(exp, sig)
  y = normalizeBetweenArrays(y)
  y = t(y)


  annot = colnames(sig) %>%
    as.data.frame() %>%
    set_colnames("Sample") %>%
    mutate(Cell_type = gsub("\\..*", "", Sample))

  of_interest = unique(annot$Sample)

  ps = lapply(1:length(of_interest), function(i) {
    which(annot$Sample == of_interest[i])
  })


  names(ps) = of_interest
  marker_list = find_markers(y,pure_samples=ps,data_type="rna-seq",marker_method='ratio')


  q = .1
  quantiles = lapply(marker_list$V,function(x)quantile(x,1-q))
  K = length(ps)
  n_markers = sapply(1:K,function(i){max(which(marker_list$V[[i]] > quantiles[[i]]))})


  marks = marker_list$L
  dc <- dtangle(y, pure_samples=ps, n_markers=n_markers, data_type = 'rna-seq', markers = marks)
  final_est <- dc$estimates[(dim(sig)[2]+1):dim(y)[1],]
  colnames(final_est) <-  of_interest


  return(final_est)

}


run_decon = function(m, s) {
  res <- as.data.frame(DeconRNASeq(m, s, use.scale = TRUE)$out.all)
  rownames(res) <- colnames(m)
  return(res)
}
