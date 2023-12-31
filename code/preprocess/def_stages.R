################### Defining stages ####################
stages = list()
## prenatal
stages[["s1"]] = c("4 pcw", "7 pcw") # 1 4-7 pcw Embryonic
stages[["s2a"]] = c("8 pcw","9 pcw") # 2A 8-9 pcw Early prenatal
stages[["s2b"]] = c("12 pcw") # 2B 10-12 pcw Early prenatal
stages[["s3a"]] = c("13 pcw") # 3A 13-15 pcw Early mid-prenatal
stages[["s3b"]] = c("16 pcw","17 pcw") # 3B 16-18 pcw Early mid-prenatal
stages[["s4"]] = c("19 pcw","21 pcw","24 pcw") # 4 19-24 pcw Late mid-prenatal
stages[["s5"]] = c("25 pcw","26 pcw","35 pcw","37 pcw") # 5 25-38 pcw Late prenatal
stages[["s6"]] = c("4 mos") # 6 Birth-5 months Early infancy


## Postnatal
stages[["s7"]] = c("10 mos", "1 yrs") # 7 6-18 months Late infancy
stages[["s8"]] = c("2 yrs","3 yrs","4 yrs") # 8 19 months-5 yrs Early childhood
stages[["s9"]] = c("8 yrs","11 yrs") # 9 6-11 yrs Late childhood
stages[["s10"]] = c("13 yrs","15 yrs","18 yrs","19 yrs") # 10 12-19 yrs Adolescence
stages[["s11"]] = c("21 yrs", "23 yrs")
stages[["s12"]] = c("30 yrs", "36 yrs", "37 yrs")
stages[["s13"]] = c("40 yrs")


#stages[["s11"]] = c("21 yrs","23 yrs","30 yrs","36 yrs","37 yrs","40 yrs") # 11 20-60+ yrs Adulthood
order.stages <- c("s1", "s2a", "s2b", "s3a", "s3b", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12", "s13")

stages

################### Defining age intervals ####################

order.age <- c("8 pcw","9 pcw","12 pcw","13 pcw","16 pcw","17 pcw","19 pcw","21 pcw","24 pcw","25 pcw","26 pcw","35 pcw","37 pcw",
               "4 mos","10 mos",
               "1 yrs","2 yrs","3 yrs","4 yrs","8 yrs",
               "11 yrs","13 yrs","15 yrs","18 yrs","19 yrs",
               "21 yrs","23 yrs","30 yrs","36 yrs","37 yrs","40 yrs")


age_intervals = list()
#age_intervals[["8-9pcw"]] = c() # 1 4-7 pcw Embryonic
age_intervals[["1-3pcw"]] = c(paste0(c(1:3), " pcw"),
                              paste("Carnegie Stage", c(9)))

age_intervals[["4-7pcw"]] = c(paste0(c(4:7), " pcw"),
                              paste("Carnegie Stage", c(10:19)))

age_intervals[["8-9pcw"]] = c(paste0(c(8:9), " pcw"),
                              paste("Carnegie Stage", c(20:23)),
                              paste(c(8:9), "post conception weeks"),
                              "Late 8 post conception weeks") # 2A 8-9 pcw Early prenatal

age_intervals[["10-12pcw"]] = c(paste0(c(10:12), " pcw"),
                                paste(c(10:12), "post conception weeks")) # 2B 10-12 pcw Early prenatal

age_intervals[["13-15pcw"]] = c(paste0(c(13:15), " pcw"),
                                paste(c(13:15), "post conception weeks")) # 3A 13-15 pcw Early mid-prenatal

age_intervals[["16-18pcw"]] = c(paste0(c(16:18), " pcw"),
                                paste(c(16:18), "post conception weeks")) # 3B 16-18 pcw Early mid-prenatal

age_intervals[["19-24pcw"]] = c(paste0(c(19:24), " pcw"),
                                paste(c(19:24), "post conception weeks")) # 4 19-24 pcw Late mid-prenatal

age_intervals[["25-38pcw"]] = c(paste0(c(25:38), " pcw"),
                                paste(c(25:38), "post conception weeks")) # 5 25-38 pcw Late prenatal

age_intervals[["39-40pcw"]] = c(paste0(c(39:40), " pcw"),
                                paste(c(39:40), "post conception weeks")) # 5 25-38 pcw Late prenatal


age_intervals[["0-5mos"]] = paste0(c(0:5), " mos") # 6 Birth-5 months Early infancy
age_intervals[["6-18mos"]] = c(paste0(c(6:18)," mos"), "1 yrs") # 7 6-18 months Late infancy
age_intervals[["19mos-5yrs"]] = c(paste0(c(19:20)," mos"), paste0(c(2:5), " yrs"))  # 8 19 months-5 yrs Early childhood
age_intervals[["6-11yrs"]] = paste0(c(6:11), " yrs") # 9 6-11 yrs Late childhood
age_intervals[["12-19yrs"]] = paste0(c(12:19), " yrs") # 10 12-19 yrs Adolescence
age_intervals[["20-29yrs"]] = paste0(c(20:29), " yrs")
age_intervals[["30-39yrs"]] = paste0(c(30:39), " yrs")
age_intervals[["40-49yrs"]] = paste0(c(40:49), " yrs")
age_intervals[["50-59yrs"]] = paste0(c(50:59), " yrs")
age_intervals[["60-69yrs"]] = paste0(c(60:69), " yrs")
age_intervals[["70-79yrs"]] = paste0(c(70:79), " yrs")
age_intervals[["80-89yrs"]] = paste0(c(80:89), " yrs")
age_intervals[["90-99yrs"]] = paste0(c(90:99), " yrs")


order.intervals = c("1-3pcw","4-7pcw", "8-9pcw", "10-12pcw", "13-15pcw", "16-18pcw",
                    "19-24pcw", "25-38pcw", "0-5mos", "6-18mos", "19mos-5yrs",
                    "6-11yrs", "12-19yrs", "20-29yrs", "30-39yrs", "40-49yrs")



################### Defining period ####################
period = list()
period[["Prenatal"]] = c("8-9pcw", "10-12pcw", "13-15pcw", "16-18pcw",
                         "19-24pcw", "25-38pcw")


period[["Postnatal"]] = c("0-5mos", "6-18mos", "19mos-5yrs",
                          "6-11yrs", "12-19yrs", "20-29yrs", "30-39yrs", "40- 49yrs")

order.period =c("Prenatal", "Postnatal")



############## Defining structures #####################
structure_acronym = list()

structure_acronym[["AMY"]] = c("Brain - Amygdala")
structure_acronym[["CB"]] = c("Brain - Cerebellum", "cerebellum")
structure_acronym[["HYP"]] = c("Brain - Hypothalamus")
structure_acronym[["SNA"]] = c("Brain - Substantia nigra")
structure_acronym[["ACC"]] = c("Brain - Anterior cingulate cortex (BA24)")
structure_acronym[["CTX"]] = c("Brain - Cortex", "cerebral cortex")
structure_acronym[["NAC"]] = c("Brain - Nucleus accumbens (basal ganglia)")
structure_acronym[["CAU"]] = c("Brain - Caudate (basal ganglia)", "basal ganglion")
structure_acronym[["DLPFC"]] = c("Brain - Frontal Cortex (BA9)")
structure_acronym[["PUT"]] = c("Brain - Putamen (basal ganglia)")
structure_acronym[["CBC"]] = c("Brain - Cerebellar Hemisphere")
structure_acronym[["HIP"]] = c("Brain - Hippocampus", "hippocampus")
structure_acronym[["SCI"]] = c("Brain - Spinal cord (cervical c-1)", "spinal cord")
structure_acronym[["TCx"]] = c("temporal lobe")

structure_acronym[["MEDU"]] = c("medulla oblongata")
structure_acronym[["PONS"]] = c("pons")
structure_acronym[["DIEN"]] = c("diencephalon")
structure_acronym[["BF"]] = c("brain fragment")
structure_acronym[["CP"]] = c("choroid plexus")
structure_acronym[["DIEN-MID"]] = c("diencephalon and midbrain")
structure_acronym[["FB"]] = c("forebrain")
structure_acronym[["FB-MID"]] = c("forebrain and midbrain")
structure_acronym[["FBF"]] = c("forebrain fragment")
structure_acronym[["HB"]] = c("hindbrain")
structure_acronym[["HBF"]] = c("hindbrain fragment")
structure_acronym[["HB/C"]] = c("hindbrain without cerebellum")
structure_acronym[["MB"]] = c("midbrain")
structure_acronym[["PIT-DIEN"]] =c("pituitary and diencephalon")
structure_acronym[["TEL"]] = c("telencephalon")


################### Defining regions ####################
regions = list()

regions[["Subcortex"]] = c("AMY", "CGE", "DTH", "HIP", "LGE", "MD", "CAU",
                           "STR", "SNA", "PUT", "HYP", "NAC")

regions[["Cortex"]] = c("A1C", "DLPFC", "IPC", "ITC", "M1C",
                        "M1C-S1C", "ACC", "MGE", "Ocx", "OFC",
                        "PCx", "S1C", "STC","TCx", "V1C", "VFC",
                        "CTX", "MTG", "M1lm", "M1ul","CgG",
                        "S1ul","S1lm")

regions[["Cerebellum"]] = c("CBC", "CB", "URL")

regions[["Spinal Cord"]] = c("SCI")



#regions[["Forebrain"]] = c("FB", "FBF", "DIEN", "PIT-DIEN", "TEL")
#regions[["Midbrain"]] =
#regions[["Hindbrain"]] =

### Regions for HDBR

regions_fetal = list()

regions_fetal[["Forebrain"]] = c("FB", "FBF", "DIEN", "PIT-DIEN", "TEL",
                                 "CTX", "TCx", "CGE", "HIP", "CAU")
regions_fetal[["Midbrain"]] = c("MB")
regions_fetal[["Hindbrain"]] = c("HB", "HBF", "HB/C",
                                 "CB", "MEDU", "PONS")
regions_fetal[["Brain"]] =c("BF",  "FB-MID", "DIEN-MID")
regions_fetal[["Chroid plexus"]] = c("CP")
regions_fetal[["Spinal Cord"]] = c("SCI")


### Death cause


death_cause=list()

death_cause[["Suicide"]] = c("SUIC:ASPHYXIA", "SUIC:HIT BY TRAIN", "SUIC:GSW",
                             "SUIC:JUMPED", "SUIC:OD", "Suicide", "SUIC:BURNED",
                             "SUIC:DROWNED", "SUIC:HANGING", "SUIC:INHALED HELIUM",
                             "SUIC:MVA", "SUIC:STABBED", "Suicide, hanging",
                             "Asphyxia by hanging", "SUIC:CO")
death_cause[["Unknown"]] =c("Unknown", "UNDETERMINED", "UNKNOWN", "", "Other", "Unresponsive in bed")

death_cause[["Cancer"]] = c("Cancer", "Cancer (lung)", "Cancer (colon)",
                            "throat cancer", "stomach cancer",
                            "ovarian cancer", "Pancreatic Cancer",
                            "lung cancer", "metastic bladder cancer",
                            "Non-brain cancer", "adenocarcinoma of right lung",
                            "endometrial cancer")

death_cause[["Accident"]] = c("TRAUMA--INTERNAL BLEEDING", "Sudden Unexpected Death",
                              "sudden accident/abdominal trauma", "Drowning",
                              "DROWNING", "Motorcycle accident", "Motor vehicle accident",
                              "Multiple injuries", "OD", "accident, multiple injuries ",
                              "STRANGULATION", "sudden artrial fibrillation/fatal collapse",
                              "Airway obstruction", "Anoxic Encephalopathy", "ASPHYXIA",
                              "Asphyxia", "Aspiration", "aspiration of gastral material",
                              "Blunt head injury, hit by a car while walking",
                              "Commotio Cordis", "Drowning", "DROWNING", "FALL", "Head Trauma", "hypoxic ishaemic damage",
                              "Toxic shock syndrome", "Sudural hemorrhage", "Seizure Suspected", "MVA", "Accident", "Homicide", "SUBARACHNOID HEMORRHAGE")

death_cause[["Illness"]] =c("ACUTE PANCREAT",
                            "Acute Hemorrhagic Tracheobronchitis",
                            "acute necrotic pancreatitis",
                            "acute pancreatitis", "Respiratory arrest",
                            "Seizure Disorder", "Severe obesity/Bronchopneumonia",
                            "pulmonary fibrosis", "Multisystem Failure", "Diabetic Ketoacidosis",
                            "bronchopneumonia", "Asthma", "ASTHMA", "bronchopneumonia",
                            "chronic obstructive pulmonary disease",
                            "CIRRHOSIS","Complications Of Pseuodmyxoma Peritonei","COPD",
                            "Diabetic Ketoacidosis", "epilepsy", "Gastrointestinal Bleeding",
                            "Infection and parasitic disease", "SLEEP APNEA", "PNEUMONIA", "Pneumonia",
                            "EXHAUSTIVE MANIA/NMS", "GI HEMORRHAGE", "status epilepticus and myocardial infarct",
                            "Obstruction Of Bowel Due To Adhesion", "rheumatoid arthritis/Bells palsy")

death_cause[["Cardiac"]] =c("cardiac arrest due to inhalation of volatile arrythmogenic substances","CARDIAC",
                            "Cardiac Arrest", "Cardiac Arrhythmia", "Cardiac arrest", "Cardiac arrythmia",
                            "Cardiac arrhythmia due to conduction system", "Cardiac arrhytmia",
                            "Cardiac Tamponade","Cardiopulmonary Arrest", "Cardiovascular",
                            "congestive cardiac failure", "Congestive Heart Failure", "Heart Attack", "MYOCARDITIS",
                            "Arteriosclerotic cardiovascular disease",
                            "Hypertensive atherosclerotic cardiovascular disease, fall down stairs",
                            "Lymphocytic myocarditis", "myocardial infarction", "probable MI", "PULM EMBOL",
                            "Abdominal aortic anerysm", "Anomalous left coronary artery with complications")

death_cause[["Natural"]] =c("Natural", "Natural/epilepsy")
