
# Required libraries
pacs <- c("tidyverse", "readxl", "lubridate", "tableone", "gridExtra", "survival")
sapply(pacs, require, character.only = TRUE)

# Medicare crosswalk ------------------------------------------------------

# Read crosswalk file: n = 70.968
crosswalk <- read_fwf("./Data/12172/2022/ssn_bene_xwalk_res000058038_req012172_2022.dat",
                      fwf_widths(c(9, 15, 1, 1, 1), c("ORIG_SSN", "BENE_ID", "SSN_MATCH", "SEX_MATCH", "DOB_MATCH")))

# # How many matches? -- 52,704 subjects (74%)
# # There were 115 invalid SSN
# crosswalk %>% 
#   group_by(SSN_MATCH) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # Gender mismatch -- 824 subjects (1.6%)
# crosswalk %>% 
#   filter(SSN_MATCH == 1) %>% 
#   group_by(SEX_MATCH) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # DOB mismatch -- 3331 subjects (6.3%)
# crosswalk %>% 
#   filter(SSN_MATCH == 1) %>% 
#   group_by(DOB_MATCH) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # How many have both gender and DOB mismatch -- 787 subjects (1.5%)
# crosswalk %>% 
#   filter(SSN_MATCH == 1, SEX_MATCH == 0, DOB_MATCH == 0) %>%
#   nrow()
# 
# # How many have either gender OR DOB mismatch -- 3368 subjects (6.4%)
# crosswalk %>% 
#   filter(SSN_MATCH == 1 & (SEX_MATCH == 0 | DOB_MATCH == 0)) %>%
#   nrow()

# Extract matched BENE_IDs
all_matched_bene_ids <- crosswalk %>% 
  filter(SSN_MATCH == 1)

# BENE_IDs of gender or DOB mismatch (to be removed)
mismatches <- crosswalk %>% 
  filter(SSN_MATCH == 1 & (SEX_MATCH == 0 | DOB_MATCH == 0)) %>%
  select(BENE_ID)
  
# # There are two duplicates in BENE_IDs...
# all_matched_bene_ids %>% 
#   summarize(n = n_distinct(BENE_ID))

dup_BENE_IDs <- all_matched_bene_ids %>% 
  group_by(BENE_ID) %>% 
  summarize(n = sum(n())) %>% 
  filter(n > 1)

# all_matched_bene_ids %>% 
#   filter(BENE_ID %in% dup_BENE_IDs$BENE_ID)
# 
# # There are 106 SSN duplicates ???
# all_matched_bene_ids %>% 
#   summarize(n = n_distinct(ORIG_SSN))

dup_SSNs <- all_matched_bene_ids %>% 
  group_by(ORIG_SSN) %>% 
  summarize(n = sum(n())) %>% 
  filter(n > 1)

# all_matched_bene_ids %>% 
#   filter(ORIG_SSN %in% dup_SSNs$ORIG_SSN)

# BENE_IDs that need to be removed:
# Gender/DOB mismatch
# SSN/BENE_ID duplicates
exclude_BENE_IDs <- dup_BENE_IDs %>% 
  select(BENE_ID) %>% 
  union(all_matched_bene_ids %>% 
          filter(ORIG_SSN %in% dup_SSNs$ORIG_SSN) %>% 
          select(BENE_ID)
  ) %>% 
  union(mismatches)

# 3571 BENE_IDs to be removed
length(unique(exclude_BENE_IDs$BENE_ID))


# Medicare MSBF file ------------------------------------------------------

# Read MBSF Summary data on each year
# Data specification of MSBF files
fts_msbf <- read_excel("./Data/mbsf_format.xlsx")

# Create file names
year <- 2008:2020
fname <- paste0("./Data/12172/", year, "/mbsf_abcd_summary_res000058038_req012172_", year, ".dat")

# Read all MSBF files of 13 years
all_msbf <- fname %>% 
  lapply(\(x) read_fwf(x, fwf_widths(fts_msbf$length, fts_msbf$long_name))) %>% 
  lapply(\(x) anti_join(x, exclude_BENE_IDs)) %>% 
  setNames(year)

# all_msbf %>% sapply(nrow)

# Long format over years
all_msbf_long <- all_msbf %>% 
  do.call(rbind, .) %>% 
  arrange(BENE_ID, BENE_ENROLLMT_REF_YR)

# # Num of beneficiaries each year
# all_msbf_long %>% 
#   group_by(BENE_ENROLLMT_REF_YR) %>% 
#   tally()

# Unique beneficiaries across years: n = 44,585
all_msbf_bene_ids <- all_msbf_long %>% 
  select(BENE_ID) %>% 
  distinct()

# nrow(all_msbf_bene_ids)
# 
# all_msbf_bene_ids %>% 
#   left_join(crosswalk, by = "BENE_ID")

# 4546 matched beneficiaries were never appeared in MSBF files
bene_ids_no_show <- all_matched_bene_ids %>% 
  anti_join(exclude_BENE_IDs) %>% 
  anti_join(all_msbf_bene_ids)

nrow(bene_ids_no_show)

# # Age at the last year of appearance
# all_msbf_long %>% 
#   group_by(BENE_ID) %>% 
#   slice(n()) %>% 
#   mutate(AgeCat = cut(AGE_AT_END_REF_YR, breaks = c(0, 3:12 * 10), right = FALSE)) %>% 
#   group_by(AgeCat) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # Young medicare beneficiaries: What is the reason for entitlement?
# # Mostly due to disability (~95%)
# all_msbf_long %>% 
#   group_by(BENE_ID) %>% 
#   slice(n()) %>% 
#   filter(AGE_AT_END_REF_YR < 65) %>% 
#   select(BENE_ID, BENE_ENROLLMT_REF_YR, AGE_AT_END_REF_YR, ENTLMT_RSN_CURR) %>% 
#   group_by(ENTLMT_RSN_CURR) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # Current Reason for Entitlement Code
# all_msbf_long %>% 
#   group_by(BENE_ID) %>% 
#   slice(n()) %>% 
#   mutate(ENTLMT_RSN_CURR = factor(ENTLMT_RSN_CURR, levels = 0:3, labels = c("OASI", "DIB", "ESRD", "DIB & ESRD"))) %>% 
#   group_by(ENTLMT_RSN_CURR) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # Sex/race at the last year of appearance
# all_msbf_long %>% 
#   group_by(BENE_ID) %>% 
#   slice(n()) %>% 
#   group_by(SEX_IDENT_CD) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)
# 
# # How many died during 2008-2020
# # 13,218 (29.6%) died
# all_msbf_long %>%
#   group_by(BENE_ID) %>% 
#   slice(n()) %>% 
#   mutate(Dead = ifelse(is.na(BENE_DEATH_DT), 0, 1),
#          Dead = factor(Dead, levels = 0:1, labels = c("Alive", "Dead"))) %>% 
#   group_by(Dead) %>% 
#   tally() %>% 
#   mutate(pct = n / sum(n) * 100)

# N deaths = 13,218
n_deaths <- all_msbf_long %>%
  group_by(BENE_ID) %>% 
  slice(n()) %>% 
  filter(!is.na(BENE_DEATH_DT)) %>% nrow()

# Medicare chronic condition file -----------------------------------------

# Read chronic conditions data on each year
# Data specification of CC files
fts_cc <- read_excel("./Data/mbsf_cc_format.xlsx")

# Create file names
year <- 2008:2020
fname <- paste0("./Data/12172/", year, "/mbsf_cc_summary_res000058038_req012172_", year, ".dat")

# Read all MSBF files of 13 years
all_cc <- fname %>% 
  lapply(\(x) read_fwf(x, fwf_widths(fts_cc$length, fts_cc$long_name))) %>% 
  lapply(\(x) anti_join(x, exclude_BENE_IDs)) %>% 
  setNames(year)

# Long format over years
all_cc_long <- all_cc %>% 
  do.call(rbind, .) %>% 
  arrange(BENE_ID, BENE_ENROLLMT_REF_YR)

# # Num of beneficiaries each year
# all_cc_long %>% 
#   group_by(BENE_ENROLLMT_REF_YR) %>% 
#   tally()

# Unique beneficiaries across years: n = 44,585
all_cc_bene_ids <- all_cc_long %>% 
  select(BENE_ID) %>% 
  distinct()

nrow(all_cc_bene_ids)

# AHS-2 Medicare link file ------------------------------------------------

# AHS-2 analysis ID: N = 51,917
ahs <- read_csv("./Data/MedicareMatches2022.csv")

# # There are 103 analysis IDs that appears twice
# # There are 226 NULL values on analysis ID
# ahs %>% 
#   group_by(AnalysisID) %>%
#   tally() %>% 
#   filter(n > 1) %>% 
#   print(n = Inf)
# 
# ahs %>% filter(AnalysisID == "NULL")
# 
# # Remove NULL and those appears twice
# ahs %>% 
#   group_by(AnalysisID) %>%
#   tally() %>% 
#   filter(n > 1) %>% 
#   summarize(sum = sum(n))
# 
# ahs %>% 
#   group_by(AnalysisID) %>%
#   tally() %>% 
#   filter(n > 1) %>% 
#   print(n = Inf)
 
# 104 analysis IDs (103 duplicates + NAs) to be removed
exclude_analysisIDs <- ahs %>% 
  group_by(AnalysisID) %>%
  tally() %>% 
  filter(n > 1) %>%
  select(AnalysisID)

exclude_analysisIDs %>% print(n = Inf)

# 432 rows removed (103 * 2 + 226)
# yielding 51,485 unique analysis ID (and unique Bene_IDs)
ahs_dup_removed <- ahs %>% anti_join(exclude_analysisIDs)
ahs_dup_removed %>% distinct(Bene_ID) %>% nrow() 


# AHS-2 data --------------------------------------------------------------

# N = 96,144
ahsdata <- read.csv("./Data/BaselineDataForMedicare20190531.csv", header=TRUE)
names(ahsdata) <- tolower(names(ahsdata))

# Imputed data # 1
# n = 88,051
temp <- read_csv("./Data/File_1_2024-10-16.csv")
nrow(temp)

ahsdata2 <- temp %>%
  rename(agein = calc_baseline_age) %>% 
  
  # Get qreturndate from ahsdata and convert to date
  inner_join(ahsdata %>% select(analysisid, qreturndate), by = "analysisid") %>% 
  mutate(qreturndate = as.Date(qreturndate),
         
  # Demographic/lifestyle variables
         bmicat    = cut(bmi, breaks = c(0, 25, 30, Inf), right = FALSE),
         bmicat    = factor(bmicat, labels = c("Normal", "Overweight", "Obese")),
         marital   = recode(marital, "Never", "Married", "Married", "Married", "Div/Wid", "Div/Wid", "Div/Wid"),
         marital   = factor(marital, levels = c("Married", "Never", "Div/Wid")),
         educyou   = factor(educat3, levels = c("HSch & below", "Some College", "Bachelors +")),
         educyou2  = relevel(educyou, ref = "Bachelors +"),
         sleephrs  = recode(sleephrs, "<= 5 hrs", "<= 5 hrs", "<= 5 hrs", "6 hrs", "7 hrs",  
                                      "8 hrs", ">= 9 hrs", ">= 9 hrs", ">= 9 hrs"),
         sleephrs  = factor(sleephrs, levels = c("<= 5 hrs", "6 hrs", "7 hrs", "8 hrs", ">= 9 hrs")),
         sleephrs2 = relevel(sleephrs, ref = "7 hrs"),
         vegstat   = 1 * vegan + 2 * lacto + 3 * semi + 4 * pesco + 5 * nonveg,
         vegstat   = factor(vegstat, labels=c("Vegan", "Lacto-ovo",  "Semi", "Pesco", "Non-veg")),
         vegstat2  = relevel(vegstat, ref = "Non-veg"),
         exercise  = cut(exermin_week, breaks = c(-Inf, 0, 30, 120, Inf), right = TRUE),
         exercise  = factor(exercise, labels = c("None", "≤0.5 hrs/wk", "0.5<-2 hrs/wk", ">2 hrs/wk")),
         smokecat  = factor(smokecat6, labels = c("Never", rep("Ever", 5))),
         alccat    = ifelse(wine2cat == "1no" & beerliq2 == "1no", "Never", "Ever"),
         alccat    = factor(alccat, levels = c("Never", "Ever")), 
  
  # Dietary variables
         egg_freq  = recode(eggbetrf, 1, 2, 3, 4, 5, 5, 5, 5, 5),
         egg_freq  = factor(egg_freq, labels = c("Never", "1-3/mo", "1/wk", "2-4/wk", "5+/wk")),
         kcal      = kcaldiet + kcalsupp,
         meat_gramdiet = procredmeat_gramdiet + unprocredmeat_gramdiet + procpoultry_gramdiet + unprocpoultry_gramdiet +  pork_gramdiet,
         fish_gramdiet = fattyfish_gramdiet + otherfish_gramdiet,
         grains_gramdiet = wholegrains_gramdiet + mixedgrains_gramdiet + refgrains_gramdiet,
         whole_mixed_grains_gramdiet = wholegrains_gramdiet + mixedgrains_gramdiet)

# Opt-outs: n = 395
optout <- read_csv("./Data/OptOutAnalysisIDs.csv") %>% setNames("analysisid")

# n = 383 to be excluded
ahsdata2 %>% semi_join(optout) %>% nrow()

# Those who live outside US
# None found in the AHS data above 
outside_us <- read_csv("./Data/outside_us.csv")
ahsdata2 %>% semi_join(outside_us, by = "analysisid") %>% nrow()

# Remove opt-outs, yielding n = 87,668
ahsdata3 <- ahsdata2 %>% 
  anti_join(optout, by = "analysisid")

nrow(ahsdata3)

# Merge AHS data with Medicare --------------------------------------------

# Extract data of the last seen: MSBF and CC files  
msbf_last_seen <- all_msbf_long %>%
  group_by(BENE_ID) %>% 
  slice(n())

cc_last_seen <- all_cc_long %>%
  group_by(BENE_ID) %>% 
  slice(n())

# Merge AHS data with Medicare
# Results in n = 41,099 subjects
ahs_medic <- msbf_last_seen %>% 
  inner_join(cc_last_seen %>% select(-BENE_ENROLLMT_REF_YR), by = "BENE_ID") %>%
  inner_join(ahs_dup_removed %>% 
               rename(BENE_ID = Bene_ID) %>% 
               mutate(analysisid = parse_number(AnalysisID)), by = "BENE_ID") %>% 
  inner_join(ahsdata3, by = "analysisid") %>% 
  ungroup()

nrow(ahs_medic)

# Apply inclusion/exclusion criteria --------------------------------------

# Remove if AGE_AT_END_REF_YR < 65 (n = 1336)
# Results in n = 39,763
ahs_medic %>% 
  filter(AGE_AT_END_REF_YR < 65) %>% 
  nrow()
 
ahs_medic <- ahs_medic %>% 
  filter(AGE_AT_END_REF_YR >= 65)

# Remove if BMI is extreme (n = 82)
# Resuts in n = 39,681
ahs_medic %>% filter(bmi < 16 | bmi > 60) %>% tally()
ahs_medic %>% filter(bmi < 16 | bmi > 60 | is.na(bmi)) %>% tally()
ahs_medic <- ahs_medic %>% 
  filter(bmi >= 16, bmi <= 60)

# Identify alzheimer/dementia cases
ahs_medic <- ahs_medic %>% 
  mutate(ALZH_YN = ifelse(is.na(ALZH_EVER), 0, 1),
         ALZH_YN = factor(ALZH_YN, label = c("No", "Yes")))   

# There are 2978 alzheimer cases (7.5%)
ahs_medic %>%
  group_by(ALZH_YN) %>% 
  tally() %>% 
  mutate(pct = n / sum(n) * 100)

# Find prevalent cases
ahs_medic %>% 
  filter(ALZH_YN == "Yes") %>% 
  mutate(ALZH_EVER = ymd(ALZH_EVER)) %>%
  filter(ALZH_EVER <= qreturndate) %>% 
  select(analysisid, ALZH_YN, qreturndate, ALZH_EVER)

alz_diag_date <- ahs_medic %>% 
  filter(ALZH_YN == "Yes") %>% 
  mutate(ALZH_EVER = ymd(ALZH_EVER)) %>%
  mutate(DateDiff = interval(qreturndate, ALZH_EVER),
         DateDiff_days = as.numeric(DateDiff, 'days'), 
         DateDiff_months = as.numeric(DateDiff, 'months'), 
         DateDiff_years = as.numeric(DateDiff, 'years')) 

# How many cases in which qreturndate > diagnosis date?
# 88 such cases
alz_diag_date %>% 
  filter(DateDiff_days < 0) %>% 
  select(ALZH_YN, ALZH_EVER, qreturndate, DateDiff_days, DateDiff_months, DateDiff_years)

# How many cases who were diagnosed within 6 months after qreturndate?
# 21 cases
alz_diag_date %>% 
  filter(between(DateDiff_months, 0, 6)) %>% 
  select(ALZH_YN, qreturndate, ALZH_EVER, DateDiff_days, DateDiff_months, DateDiff_years)

# Considering 6 months as a cut-off, there are 109 prevalent cases
prev_cases <- alz_diag_date %>% 
  filter(DateDiff_months< 6) %>% 
  select(BENE_ID, analysisid, ALZH_YN, qreturndate, ALZH_EVER, DateDiff_days, DateDiff_months, DateDiff_years)

prev_cases

# Exclude prevalent cases
# Yields n = 39,572 subjects
ahs_medic_inc <- ahs_medic %>% 
  anti_join(prev_cases, by = "analysisid") %>% 
  mutate(BENE_BIRTH_DT = ymd(BENE_BIRTH_DT),
         BENE_DEATH_DT = ymd(BENE_DEATH_DT),
         ALZH_EVER = ymd(ALZH_EVER))

nrow(ahs_medic_inc)

# Now we have 2869 incident cases (7.25%) out of 39,572 subjects
ahs_medic_inc %>% 
  group_by(ALZH_YN) %>% 
  tally() %>% 
  mutate(pct = n / sum(n) * 100)

# Need to exclude unverified deaths
# There are 19 unverified deaths
ahs_medic_inc %>% 
  filter(!is.na(BENE_DEATH_DT)) %>% 
  group_by(VALID_DEATH_DT_SW) %>% 
  tally()

unverified_deaths <- ahs_medic_inc %>% 
  filter(!is.na(BENE_DEATH_DT)) %>%
  filter(is.na(VALID_DEATH_DT_SW)) %>% 
  select(analysisid)

# Exclude unverified deaths
# Yields n = 39,553
ahs_medic_inc <- ahs_medic_inc %>% 
  anti_join(unverified_deaths, by = "analysisid") 

nrow(ahs_medic_inc)

# Define variables for models ---------------------------------------------

# Define ageout
# If ALZH_EVER exists (incident cases), the use this diag date
# If non-case and BENE_DEATH_DT exists, then use this date died (censored)
# Otherwise, use the end of BENE_ENROLLMT_REF_YR (year last seen)
# Factor gender, categorize age into age groups, recode RTI race
ahs_medic_inc2 <- ahs_medic_inc %>% 
  mutate(
    age_last_seen = time_length(interval(BENE_BIRTH_DT, make_date(BENE_ENROLLMT_REF_YR, 12, 31)), "year"),
    ageout = case_when(
              ALZH_YN == "Yes" ~ time_length(interval(BENE_BIRTH_DT, ALZH_EVER), "year"),
              ALZH_YN == "No" & !is.na(BENE_DEATH_DT)  ~ time_length(interval(BENE_BIRTH_DT, BENE_DEATH_DT), "year"),
              ALZH_YN == "No" &  is.na(BENE_DEATH_DT)  ~ age_last_seen),
    fuyear = ageout - agein,
    
    bene_sex_F = factor(SEX_IDENT_CD, labels = c("M", "F")),
    bene_age_at_end_2020 = time_length(interval(BENE_BIRTH_DT, make_date(2020, 12, 31)), "year"),
    agecat     = cut(bene_age_at_end_2020, breaks = c(65, 70, 75, 80, 85, 90, 95, 130), right = FALSE),
    agecat     = factor(agecat, labels = c("65-69", "70-74", "75-79", "80-84", "85-89", "90-94", "95+")),
    rti_race3  = recode(RTI_RACE_CD + 1, 3, 1, 2, 3, 3, 3, 3),
    rti_race3  = factor(rti_race3, labels = c("NH White", "Black", "Other"))
  )

# Mean/median follow-up years: Mean 15.2 years, Median 16.7 years
summary(ahs_medic_inc2$fuyear) %>% round(2)

# Age at diagnosis: Mean 83.8 years, Median 84.5 years
ahs_medic_inc2 %>% 
  filter(ALZH_YN == "Yes") %>% 
  select(ageout) %>% 
  summary()


# Co-morbidity ------------------------------------------------------------

# Prevalent comorbidity according to CMS
dzvars <- c("ami", "atrial_fib", "cataract", "chronickidney", "copd", "chf", "diabetes", "glaucoma",
            "hip_fracture", "ischemicheart", "depression", "osteoporosis", "ra_oa", "stroke_tia", 
            "cancer_breast", "cancer_colorectal", "cancer_prostate", "cancer_lung", "cancer_endometrial",
            "asthma", "hyperl", "hypert", "hypoth", "anemia")
dzvars <- paste0(toupper(dzvars), "_EVER")

# Convert all comodidity ever variables to date
test <- ahs_medic_inc2 %>% 
  mutate(across(all_of(dzvars), ymd)) 

find_prevalence <- function(var, data, start){
  cc_var <- data[[var]]
  strtdt  <- data[[start]]
  out <- ifelse(cc_var <= strtdt, 1, 0)
  out <- ifelse(is.na(cc_var), 0, out)
  return(out)
}

dzdf <- as.data.frame(lapply(dzvars, find_prevalence, data = test, start = "qreturndate"))
names(dzdf) <- paste0(dzvars, "_YN")
dzdf <- as_tibble(dzdf)

dzdf <- dzdf %>% 
  mutate(como_depress  = DEPRESSION_EVER_YN,
         como_diabetes = DIABETES_EVER_YN,
         como_kidney   = CHRONICKIDNEY_EVER_YN,
         como_hypoth   = HYPOTH_EVER_YN,
         como_anemia   = ANEMIA_EVER_YN,
         como_hypert   = HYPERT_EVER_YN,
         como_hyperl   = HYPERL_EVER_YN,
         como_cancers  = ifelse(rowSums(.[grep("CANCER_", names(.))]) > 0, 1, 0),
         como_cvd      = ifelse(rowSums(.[grep("AMI|ATRIAL|CHF|ISCHEMIC|STROKE", names(.))]) > 0, 1, 0),
         como_disab    = ifelse(rowSums(.[grep("CATARACT|GLAU|HIP|OSTEO|RA_OA", names(.))]) > 0, 1, 0),
         como_hthl     = ifelse(rowSums(.[grep("HYPERT|HYPERL",  names(.))]) > 0, 1, 0),
         como_resp     = ifelse(rowSums(.[grep("COPD|ASTHMA",  names(.))]) > 0, 1, 0)) %>% 
  mutate_at(vars(starts_with("como_")), factor, labels = c("No", "Yes")) %>% 
  select(starts_with("como_"))

ahs_medic_inc2 <- ahs_medic_inc2 %>% 
  bind_cols(dzdf)


# dietary variables -------------------------------------------------------

# List of dietary variables
# names(ahsdiet)

# Food group variables
# Energy-adjust with zero partition
# By default, variables are log-transformed (excluding zeros)
kcal_adjust <- function(data, var, energy, log=TRUE){
  if (missing(var))
    stop("Need to specify variable for energy-adjustment.")
  if (missing(energy))
    stop("Need to specify energy intake.")
  if (missing(data))
    stop("Need to specify a data frame.")
  df <- eval(substitute(data.frame(y = data$var, ea_y = data$var, kcal = data$energy)))
  count_negative <- sum(df$y < 0, na.rm=TRUE)
  if (count_negative > 0)
    warning("There are negative values in variable.")
  if(log) df$y[df$y > 0 & !is.na(df$y)] <- log(df$y[df$y > 0 & !is.na(df$y)])
  mod <- lm(y ~ kcal, data=df[df$y != 0, ])
  if(log){
    ea <- exp(resid(mod) + mean(df$y[df$y != 0], na.rm=TRUE))
    df$ea_y[!is.na(df$y) & df$y != 0] <- ea
  }
  else{
    ea <- resid(mod) + mean(df$y[df$y != 0], na.rm=TRUE)
    df$ea_y[!is.na(df$y) & df$y != 0] <- ea
  }
  return(df$ea_y)
}

# ahs_medic_inc2$meat_gram_ea      <- kcal_adjust(meat_gram,  kcal, data = ahs_medic_inc2, log = TRUE)
# ahs_medic_inc2$fish_gram_ea      <- kcal_adjust(fish_gram,  kcal, data = ahs_medic_inc2, log = TRUE)
# ahs_medic_inc2$eggs_gram_ea      <- kcal_adjust(eggs_gram,  kcal, data = ahs_medic_inc2, log = TRUE)
# ahs_medic_inc2$dairy_gram_ea     <- kcal_adjust(dairy_gram, kcal, data = ahs_medic_inc2, log = TRUE)

ahs_medic_inc2$meat_gram_ea      <- kcal_adjust(meat_gramdiet,  kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$fish_gram_ea      <- kcal_adjust(fish_gramdiet,  kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$eggs_gram_ea      <- kcal_adjust(eggs_gramdiet,  kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$dairy_gram_ea     <- kcal_adjust(dairy_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)

ahs_medic_inc2$nutsseeds_gram_ea <- kcal_adjust(nutsseeds_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$totalveg_gram_ea  <- kcal_adjust(totalveg_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$fruits_gram_ea    <- kcal_adjust(fruits_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$legumes_gram_ea   <- kcal_adjust(legumes_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)

ahs_medic_inc2$refgrains_gram_ea    <- kcal_adjust(refgrains_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)
ahs_medic_inc2$whole_mixed_grains_gram_ea    <- kcal_adjust(whole_mixed_grains_gramdiet, kcal, data = ahs_medic_inc2, log = TRUE)

# diet_plot <- function(var, diet_label){
#   var <- enquo(var)
#   p1 <- ahs_medic_inc2 %>% 
#     filter(!is.na(!!var)) %>% 
#     ggplot(aes(x = !!var)) + 
#     geom_histogram(bins = 50) +
#     labs(title = paste("Histogram of", diet_label, "intake (g/d, energy-adjusted)"))
#   
#   p2 <- ahs_medic_inc2 %>% 
#     filter(!is.na(!!var)) %>% 
#     ggplot(aes(x = log(!!var + 1))) + 
#     geom_histogram(bins = 50) +
#     labs(title = "Log transformed")
#   
#   grid.arrange(p1, p2, ncol = 2)
# }
# 
# diet_plot(eggs_gram_ea,      "egg")
# diet_plot(dairy_gram_ea,     "dairy")
# diet_plot(nutsseeds_gram_ea, "nuts/seeds")
# diet_plot(meat_gram_ea,      "meat")
# diet_plot(fish_gram_ea,      "fish")
# diet_plot(totalveg_gram_ea,  "vegetables")
# diet_plot(fruits_gram_ea,    "fruits")
# diet_plot(legumes_gram_ea,   "legumes")
# diet_plot(refgrains_gram_ea,    "refined grains")
# diet_plot(whole_mixed_grains_gram_ea,    "whole/mixed grains")

# # Create quantile groups
# # Specify p for other percentile groups
# cutQ <- function(x, p=0:4/4, na.rm=FALSE) cut(x, quantile(x, p, na.rm=na.rm), include.lowest=TRUE)
# 
# # Quartiles for egg, dairy and nuts/seeds
# # ea_diet_vars <- c("eggs_gram_ea", "dairy_gram_ea", "nutsseeds_gram_ea", "totalveg_gram_ea", "fruits_gram_ea", 
# ea_diet_vars <- c("dairy_gram_ea", "nutsseeds_gram_ea", "totalveg_gram_ea", "fruits_gram_ea", 
#                   "refgrains_gram_ea", "whole_mixed_grains_gram_ea", "legumes_gram_ea")
# get_percentile <- function(var, data = ahs_medic_inc2) cutQ(data[[var]], na.rm = TRUE, p = 0:4/4)
# test <- lapply(ea_diet_vars, get_percentile)
# 
# names(test) <- paste0(ea_diet_vars, "_4")
# ahs_medic_inc2 <- cbind(ahs_medic_inc2, test)
# rm(test)

# # There are many zeros in meat/fish intake
# table(cutQ(ahs_medic_inc2$meat_gram_ea[ahs_medic_inc2$meat_gram_ea > 0], na.rm = TRUE, p = 0:3/3))
# table(cut(ahs_medic_inc2$meat_gram_ea, breaks = c(-Inf, 0, 11, 32, Inf), right = TRUE)) %>% prop.table
# 
# table(cutQ(ahs_medic_inc2$fish_gram_ea[ahs_medic_inc2$fish_gram_ea > 0], na.rm = TRUE, p = 0:3/3))
# table(cut(ahs_medic_inc2$fish_gram_ea, breaks = c(-Inf, 0, 8.6, 17.2, Inf), right = TRUE)) %>% prop.table

ahs_medic_inc2 <- ahs_medic_inc2 %>% 
  mutate(meat_gram_ea_4 = cut(meat_gram_ea, breaks = c(-Inf, 0, 11, 32, Inf), right = TRUE), 
         fish_gram_ea_4 = cut(fish_gram_ea, breaks = c(-Inf, 0,  9, 18, Inf), right = TRUE),
         totalveg_gram_ea_4 = cut(totalveg_gram_ea, breaks = c(-Inf, 185, 270, 380, Inf), right = TRUE), 
         fruits_gram_ea_4 = cut(fruits_gram_ea, breaks = c(-Inf, 170, 280, 420, Inf), right = TRUE), 
         nutsseeds_gram_ea_4 = cut(nutsseeds_gram_ea, breaks = c(-Inf, 9, 19, 33, Inf), right = TRUE),
         legumes_gram_ea_4 = cut(legumes_gram_ea, breaks = c(-Inf, 33, 60, 100, Inf), right = TRUE),
         refgrains_gram_ea_4 = cut(refgrains_gram_ea, breaks = c(-Inf, 40, 83, 150, Inf), right = TRUE),
         whole_mixed_grains_gram_ea_4 = cut(whole_mixed_grains_gram_ea, breaks = c(-Inf, 120, 210, 350, Inf), right = TRUE)) 

levels(ahs_medic_inc2$meat_gram_ea_4)               <- c("None",     "<11 g/d",      "11-<32 g/d",   "32+ g/d")
levels(ahs_medic_inc2$fish_gram_ea_4)               <- c("None",     "<9 g/d",       "9-<18 g/d",    "18+ g/d")
# levels(ahs_medic_inc2$dairy_gram_ea_4)              <- c("<2150 g/d", "2150-2990 g/d", "2990-<3450 g/d", "3450+ g/d")
levels(ahs_medic_inc2$totalveg_gram_ea_4)           <- c("<185 g/d", "185-<270 g/d", "270-<380 g/d", "378+ g/d")
levels(ahs_medic_inc2$fruits_gram_ea_4)             <- c("<170 g/d", "170-<280 g/d", "280-<420 g/d", "419+ g/d")
levels(ahs_medic_inc2$nutsseeds_gram_ea_4)          <- c("<9 g/d",   "9-<19 g/d",    "19-<33 g/d",   "33+ g/d")
levels(ahs_medic_inc2$refgrains_gram_ea_4)          <- c("<40 g/d",  "40-<83 g/d",   "83-<150 g/d",  "150+ g/d")
levels(ahs_medic_inc2$whole_mixed_grains_gram_ea_4) <- c("<120 g/d", "120-<210 g/d", "210-<350 g/d", "350+ g/d")


# Tables for dietary variables
ahs_medic_inc2 %>% 
  select(egg_freq, ends_with("gram_ea_4")) %>% 
  CreateCatTable(names(.), data = .)

# Mean and percentiles by egg intake group
ahs_medic_inc2 %>% 
  group_by(meat_gram_ea_4) %>% 
  summarize(n    = n(),
            pct  = n() / nrow(ahs_medic_inc2) * 100,
            mean = mean(meat_gram_ea),
            p1   = quantile(meat_gram_ea, probs= 0.25),
            p2   = quantile(meat_gram_ea, probs= 0.5),
            p3   = quantile(meat_gram_ea, probs= 0.75))

ahs_medic_inc2 %>% 
  group_by(fish_gram_ea_4) %>% 
  summarize(n    = n(),
            pct  = n() / nrow(ahs_medic_inc2) * 100,
            mean = mean(fish_gram_ea),
            p1   = quantile(fish_gram_ea, probs= 0.25),
            p2   = quantile(fish_gram_ea, probs= 0.5),
            p3   = quantile(fish_gram_ea, probs= 0.75))

# ahs_medic_inc2 %>% 
#   group_by(dairy_gram_ea_4) %>% 
#   summarize(n    = n(),
#             pct  = n() / nrow(ahs_medic_inc2) * 100,
#             mean = mean(dairy_gram_ea),
#             p1   = quantile(dairy_gram_ea, probs= 0.25),
#             p2   = quantile(dairy_gram_ea, probs= 0.5),
#             p3   = quantile(dairy_gram_ea, probs= 0.75))

# egg and meat intake, 4x4 table
ahs_medic_inc2 %>% 
  # CreateTableOne("eggs_gram_ea_4", strata = "meat_gram_ea_4", data = .) %>% 
  CreateTableOne("egg_freq", strata = "meat_gram_ea_4", data = .) %>% 
  print(showAllLevels = TRUE)

ahs_medic_inc2 %>% 
  # CreateTableOne("meat_gram_ea_4", strata = "eggs_gram_ea_4", data = .) %>% 
  CreateTableOne("meat_gram_ea_4", strata = "egg_freq", data = .) %>% 
  print(showAllLevels = TRUE)

# Age at diagnosis: Mean 83.8 years, Median 84.5 years
ahs_medic_inc2 %>% 
  filter(ALZH_YN == "Yes") %>% 
  select(ageout) %>% 
  summary()

# Age at medicare enrollment

age_medicare_labels <- c("<50", "50-54", "55-59", "60-63", "64", "65", "66-69", "70+")

ahs_medic_inc2 <- ahs_medic_inc2 %>% 
  mutate(COVSTART = ymd(COVSTART)) %>% 
  mutate(age_medicare_cont = interval(BENE_BIRTH_DT, COVSTART) / years(1)) %>% 
  mutate(age_medicare_cat = cut(age_medicare_cont, 
                                breaks = c(-Inf, 50, 55, 60, 64, 65, 66, 70, Inf),
                                labels = age_medicare_labels,
                                include.lowest = TRUE, 
                                right = FALSE))

# Table 1 -----------------------------------------------------------------

# Variables to be included
tablevars <- c("agecat", 
               # "bene_age_at_end_2008", 
               "bene_age_at_end_2020",
               "age_medicare_cat", 
               "age_medicare_cont",
               "bene_sex_F", 
               "rti_race3", 
               "marital", 
               "educyou", 
               "vegstat", 
               "bmicat", 
               "bmi", 
               "exercise", 
               "sleephrs", 
               "smokecat", 
               "alccat", 
               "como_depress",
               "como_disab", 
               "como_diabetes", 
               "como_cvd", 
               # "como_hthl", 
               "como_hypert", 
               "como_hyperl", 
               "como_resp", 
               "como_anemia", 
               "como_kidney", 
               "como_hypoth", 
               "como_cancers",
               "egg_freq",
               "meat_gram_ea_4",
               "fish_gram_ea_4",
               # "eggs_gram_ea_4",
               # "dairy_gram_ea_4",
               "totalveg_gram_ea_4",
               "fruits_gram_ea_4",
               # "grains_gram_ea_4",
               "refgrains_gram_ea_4",
               "whole_mixed_grains_gram_ea_4",
               "nutsseeds_gram_ea_4",
               "legumes_gram_ea_4"
               )

summary(ahs_medic_inc2$ALZH_YN)

out <- ahs_medic_inc2 %>% 
  mutate(ALZH_YN2 = fct_recode(ALZH_YN, "Non-case" = "No", "Case" = "Yes")) %>% 
  CreateTableOne(tablevars, strata = "ALZH_YN2", data = ., addOverall = TRUE)
print(out, showAllLevels = TRUE)

# Table 1 by egg intake ---------------------------------------------------

# Variables to be included
tablevars <- c("ALZH_YN2",
               "agecat", 
               # "bene_age_at_end_2008", 
               "bene_age_at_end_2020", 
               "age_at_dx",
               "bene_sex_F", 
               "rti_race3", 
               "marital", 
               "educyou", 
               "vegstat", 
               "bmicat", 
               "bmi", 
               "exercise", 
               "sleephrs", 
               "smokecat", 
               "alccat", 
               "como_depress",
               "como_disab", 
               "como_diabetes", 
               "como_cvd", 
               # "como_hthl", 
               "como_hypert", 
               "como_hyperl", 
               "como_resp", 
               "como_anemia", 
               "como_kidney", 
               "como_hypoth", 
               "como_cancers",
               "meat_gram_ea_4",
               "fish_gram_ea_4",
               # "eggs_gram_ea_4",
               # "dairy_gram_ea_4",
               "totalveg_gram_ea_4",
               "fruits_gram_ea_4",
               # "grains_gram_ea_4",
               "refgrains_gram_ea_4",
               "whole_mixed_grains_gram_ea_4",
               "nutsseeds_gram_ea_4",
               "legumes_gram_ea_4"
               )

out <- ahs_medic_inc2 %>% 
  mutate(ALZH_YN2 = fct_recode(ALZH_YN, "Non-case" = "No", "Case" = "Yes")) %>% 
  mutate(age_at_dx = ifelse(ALZH_YN == "Yes", ageout, NA)) %>% 
  CreateTableOne(tablevars, strata = "egg_freq", data = ., addOverall = TRUE)
print(out, showAllLevels = TRUE)

out <- ahs_medic_inc2 %>% 
  filter(ALZH_YN == "Yes") %>% 
  mutate(ALZH_YN2 = fct_recode(ALZH_YN, "Non-case" = "No", "Case" = "Yes")) %>% 
  mutate(age_at_dx = ifelse(ALZH_YN == "Yes", ageout, NA)) %>% 
  CreateTableOne("age_at_dx", strata = "egg_freq", data = ., addOverall = TRUE)

print(out, showAllLevels = TRUE)

# Cox models --------------------------------------------------------------

# Indep vars (will be age-adjusted)
vars <- c("bene_sex_F", "rti_race3", "marital", "educyou2", "bmicat", "exercise", "sleephrs2", "smokecat", "alccat",
          "como_depress", "como_disab", "como_diabetes", "como_cvd", "como_hypert", "como_hyperl", "como_resp", 
          "como_anemia", "como_kidney", "como_hypoth", "como_cancers", 
          # "kcal100", "egg_freq", "meat_gram_ea_4", "fish_gram_ea_4", "dairy_gram_ea_4",
          "kcal100", "egg_freq", "meat_gram_ea_4", "fish_gram_ea_4", 
          "totalveg_gram_ea_4", "fruits_gram_ea_4", "refgrains_gram_ea_4", "whole_mixed_grains_gram_ea_4",
          "nutsseeds_gram_ea_4", "legumes_gram_ea_4"
)

ahs_medic_inc2 <- ahs_medic_inc2 %>% 
  mutate(bene_sex_F = relevel(bene_sex_F, ref="F"),
         bmicat     = relevel(bmicat, ref="Normal"),
         inc_demen  = ifelse(ALZH_YN == "Yes", 1, 0),
         kcal100    = kcal / 100)

# Cox proportinal hazards model
coxm <- function(var, dsn = ahs_medic_inc2){
  fm <- formula(Surv(agein, ageout, inc_demen) ~ var)
  mod <- coxph(fm, data = dsn, method = "efron")
  return(mod)
}

getHR <- function(coxph, digits = 2){
  hrci <- cbind(uniHR = exp(coef(coxph)), exp(confint(coxph))) %>% round(digits)
  return(hrci)
}
replace_var <- function(x, varname) gsub("var", varname, names(coef(x[1])))

# Unadjusted HRs
cox_out <- lapply(ahs_medic_inc2[vars], coxm)
out <- do.call(rbind, lapply(cox_out, getHR))
rownames(out) <- unlist(mapply(replace_var, cox_out, varname = names(cox_out)))
out

# Multivariable Cox model

# Model 1a: Demog + Lifestyle + Egg
mv1a_mod <- coxph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 +  
                    # bmicat + exercise + sleephrs2 + smokecat + alccat + kcal100 + eggs_gram_ea_4, data = ahs_medic_inc2, method = "efron")
                    bmicat + exercise + sleephrs2 + smokecat + alccat + kcal100 + egg_freq, data = ahs_medic_inc2, method = "efron")

mv1a_out  <- summary(mv1a_mod)
mv1a_out2 <- cbind(mvHR = coef(mv1a_out)[, "exp(coef)"], exp(confint(mv1a_mod))) %>% round(2)

# Model 1a Trend p-value
mv_mod_tmp <- update(mv1a_mod, .~. - educyou2 + as.numeric(educyou))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1a_mod, .~. - bmicat + as.numeric(bmicat))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1a_mod, .~. - exercise + as.numeric(exercise))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1a_mod, .~. - sleephrs2 + as.numeric(sleephrs))
summary(mv_mod_tmp)
# mv_mod_tmp <- update(mv1a_mod, .~. - eggs_gram_ea_4 + as.numeric(eggs_gram_ea_4))
mv_mod_tmp <- update(mv1a_mod, .~. - egg_freq + as.numeric(egg_freq))
summary(mv_mod_tmp)

# Model 1b: Demog + Lifestyle + Comorbidity + Egg
mv1b_mod <- coxph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 +
                  bmicat + exercise + sleephrs2 + smokecat + alccat + 
                  como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
                  como_anemia + como_kidney + como_hypoth + como_cancers +
                  # kcal100 + eggs_gram_ea_4, data = ahs_medic_inc2, method = "efron")
                  kcal100 + egg_freq, data = ahs_medic_inc2, method = "efron")

mv1b_out  <- summary(mv1b_mod)
mv1b_out2 <- cbind(mvHR = coef(mv1b_out)[, "exp(coef)"], exp(confint(mv1b_mod))) %>% round(2)

# Model 1b Trend p-value
mv_mod_tmp <- update(mv1b_mod, .~. - educyou2 + as.numeric(educyou))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1b_mod, .~. - bmicat + as.numeric(bmicat))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1b_mod, .~. - exercise + as.numeric(exercise))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1b_mod, .~. - sleephrs2 + as.numeric(sleephrs))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv1b_mod, .~. - egg_freq + as.numeric(egg_freq))
summary(mv_mod_tmp)

# Model 1c: Demog + Lifestyle + some Comorbidity + Egg
mv1c_mod <- coxph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 +
                  bmicat + exercise + sleephrs2 + smokecat + alccat + 
                  # como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
                  como_cvd + como_hypert + como_hyperl + como_resp + 
                  como_anemia + como_kidney + como_hypoth + como_cancers +
                  # kcal100 + eggs_gram_ea_4, data = ahs_medic_inc2, method = "efron")
                  kcal100 + egg_freq, data = ahs_medic_inc2, method = "efron")

mv1c_out  <- summary(mv1c_mod)
mv1c_out2 <- cbind(mvHR = coef(mv1c_out)[, "exp(coef)"], exp(confint(mv1c_mod))) %>% round(2)

# Model 2a: Demog + Lifestyle + Egg + Meat + Fish + Dairy
mv2a_mod <- coxph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 +
                    # bmicat + exercise + sleephrs2 + smokecat + alccat + kcal100 + eggs_gram_ea_4 + 
                    bmicat + exercise + sleephrs2 + smokecat + alccat + kcal100 + egg_freq + 
                    # meat_gram_ea_4 + fish_gram_ea_4 + dairy_gram_ea_4 +
                    meat_gram_ea_4 + fish_gram_ea_4 + 
                    totalveg_gram_ea_4 + fruits_gram_ea_4 + refgrains_gram_ea_4 + whole_mixed_grains_gram_ea_4 +
                    nutsseeds_gram_ea_4 + legumes_gram_ea_4, data = ahs_medic_inc2, method = "efron")

mv2a_out  <- summary(mv2a_mod)
mv2a_out2 <- cbind(mvHR = coef(mv2a_out)[, "exp(coef)"], exp(confint(mv2a_mod))) %>% round(2)

# Model 2a Trend p-value
mv_mod_tmp <- update(mv2a_mod, .~. - educyou2 + as.numeric(educyou))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - bmicat + as.numeric(bmicat))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - exercise + as.numeric(exercise))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - sleephrs2 + as.numeric(sleephrs))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - egg_freq + as.numeric(egg_freq))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - meat_gram_ea_4 + as.numeric(meat_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - fish_gram_ea_4 + as.numeric(fish_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - dairy_gram_ea_4 + as.numeric(dairy_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - totalveg_gram_ea_4 + as.numeric(totalveg_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - fruits_gram_ea_4 + as.numeric(fruits_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - refgrains_gram_ea_4 + as.numeric(refgrains_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - whole_mixed_grains_gram_ea_4 + as.numeric(whole_mixed_grains_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - nutsseeds_gram_ea_4 + as.numeric(nutsseeds_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2a_mod, .~. - legumes_gram_ea_4 + as.numeric(legumes_gram_ea_4))
summary(mv_mod_tmp)

# Model 2b: Demog + Lifestyle + Comorbidity + Egg + Meat + Fish + Dairy
mv2b_mod <- coxph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 +
                    bmicat + exercise + sleephrs2 + smokecat + alccat + 
                    como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
                    como_anemia + como_kidney + como_hypoth + como_cancers +
                    # kcal100 + eggs_gram_ea_4 +
                    kcal100 + egg_freq +
                    # meat_gram_ea_4 + fish_gram_ea_4 + dairy_gram_ea_4, data = ahs_medic_inc2, method = "efron")
                    # meat_gram_ea_4 + fish_gram_ea_4 + dairy_gram_ea_4 +
                    meat_gram_ea_4 + fish_gram_ea_4 + 
                    totalveg_gram_ea_4 + fruits_gram_ea_4 + refgrains_gram_ea_4 + whole_mixed_grains_gram_ea_4 +
                    nutsseeds_gram_ea_4 + legumes_gram_ea_4, data = ahs_medic_inc2, method = "efron")

mv2b_out  <- summary(mv2b_mod)
mv2b_out2 <- cbind(mvHR = coef(mv2b_out)[, "exp(coef)"], exp(confint(mv2b_mod))) %>% round(2)

# Model 2b Trend p-value
mv_mod_tmp <- update(mv2b_mod, .~. - educyou2 + as.numeric(educyou))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - bmicat + as.numeric(bmicat))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - exercise + as.numeric(exercise))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - sleephrs2 + as.numeric(sleephrs))
summary(mv_mod_tmp)
# mv_mod_tmp <- update(mv2b_mod, .~. - eggs_gram_ea_4 + as.numeric(eggs_gram_ea_4))
mv_mod_tmp <- update(mv2b_mod, .~. - egg_freq + as.numeric(egg_freq))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - meat_gram_ea_4 + as.numeric(meat_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - fish_gram_ea_4 + as.numeric(fish_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - dairy_gram_ea_4 + as.numeric(dairy_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - totalveg_gram_ea_4 + as.numeric(totalveg_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - fruits_gram_ea_4 + as.numeric(fruits_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - refgrains_gram_ea_4 + as.numeric(refgrains_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - whole_mixed_grains_gram_ea_4 + as.numeric(whole_mixed_grains_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - nutsseeds_gram_ea_4 + as.numeric(nutsseeds_gram_ea_4))
summary(mv_mod_tmp)
mv_mod_tmp <- update(mv2b_mod, .~. - legumes_gram_ea_4 + as.numeric(legumes_gram_ea_4))
summary(mv_mod_tmp)

# Model 2c: Demog + Lifestyle + Comorbidity + Egg + Meat + Fish + Dairy
mv2c_mod <- coxph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 +
                    bmicat + exercise + sleephrs2 + smokecat + alccat + 
                    # como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
                    como_cvd + como_hypert + como_hyperl + como_resp + 
                    como_anemia + como_kidney + como_hypoth + como_cancers +
                    # kcal100 + eggs_gram_ea_4 +
                    kcal100 + egg_freq +
                    # meat_gram_ea_4 + fish_gram_ea_4 + dairy_gram_ea_4, data = ahs_medic_inc2, method = "efron")
                    # meat_gram_ea_4 + fish_gram_ea_4 + dairy_gram_ea_4 +
                    meat_gram_ea_4 + fish_gram_ea_4 + 
                    totalveg_gram_ea_4 + fruits_gram_ea_4 + refgrains_gram_ea_4 + whole_mixed_grains_gram_ea_4 +
                    nutsseeds_gram_ea_4 + legumes_gram_ea_4, data = ahs_medic_inc2, method = "efron")

mv2c_out  <- summary(mv2c_mod)
mv2c_out2 <- cbind(mvHR = coef(mv2c_out)[, "exp(coef)"], exp(confint(mv2c_mod))) %>% round(2)


# Output to excel ---------------------------------------------------------

# Output to excel
convert_to_df <- function(model, suffix){
  vnames <- c("HR", "lower", "upper")
  model %>% 
    as.data.frame() %>% 
    setNames(paste0(suffix, "_", vnames)) %>% 
    rownames_to_column()
}

out       <- convert_to_df(out, "Unadj")
mv1a_out2 <- convert_to_df(mv1a_out2, "mv1a")
mv1b_out2 <- convert_to_df(mv1b_out2, "mv1b")
mv2a_out2 <- convert_to_df(mv2a_out2, "mv2a")
mv2b_out2 <- convert_to_df(mv2b_out2, "mv2b")
mv2c_out2 <- convert_to_df(mv2c_out2, "mv2c")

# Read excel template
template <- read_excel("./Data/HR_table_template_categorical.xlsx", col_names = "rowname")

all_out <- template %>% 
  left_join(out) %>% 
  left_join(mv1a_out2) %>% 
  left_join(mv1b_out2) %>% 
  left_join(mv2a_out2) %>% 
  left_join(mv2b_out2) %>% 
  left_join(mv2c_out2) 

all_out %>% print(n = Inf)


# Models with cubic spline ------------------------------------------------

library(rms)

# Restricted cubic spline
dd <- datadist(ahs_medic_inc2)
options(datadist='dd')

# Model 1
# egg_gram_ea: Cubic spline with 5 knots
mv1 <- cph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 + 
           bmicat + exercise + sleephrs2 + smokecat + alccat + kcal100 + 
           rcs(eggs_gram_ea, parms = 4), data = ahs_medic_inc2)

# Model info
specs(mv1)

# Coefs
mv1
cbind(coef(mv1), confint(mv1)) %>% exp()
anova(mv1)

# Egg intake: basic statistics
summary(ahs_medic_inc2$eggs_gram_ea)

# Change the reference to 10 g/d
dd$limits$eggs_gram_ea[2] <- 10
mv1 <- update(mv1)
Predict(mv1, eggs_gram_ea = seq(0, 80, by = 1), fun = exp, ref.zero = TRUE) 

# pdf("RCS_egg_MV1.pdf", width = 6.5, height = 5)
Predict(mv1, eggs_gram_ea = seq(0, 50, by = 1), fun = exp, ref.zero = TRUE) %>% 
  ggplot() +
  geom_line(linewidth = 1.3) +
  # scale_x_continuous(limits = c(0, 100), transform = "pseudo_log")+
  scale_y_continuous(breaks = 9:14 / 10) +
  # geom_vline(xintercept = 10, linetype = 2) +
  geom_hline(yintercept =  1, linetype = 2) +
  coord_cartesian(ylim = c(0.85, 1.35)) +
  labs(x = "Egg intake (energy-adjusted, gram/day)",
       y = "Adjusted hazard ratio (95% CI)",
       caption = "",
       title = "Model 1: Cubic spline for egg intake") +
  theme(text=element_text(size = 14))
# dev.off()

# https://www.rdocumentation.org/packages/rms/versions/6.8-2/topics/ggplot.Predict

update(mv1, .~. - educyou2 + as.numeric(educyou))    %>% anova()
update(mv1, .~. - bmicat + as.numeric(bmicat))       %>% anova()
update(mv1, .~. - exercise + as.numeric(exercise))   %>% anova()
update(mv1, .~. - sleephrs2 + as.numeric(sleephrs2)) %>% anova()

# Model 2 
# egg_gram_ea: Cubic spline with 5 knots
mv2 <- cph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 + 
             bmicat + exercise + sleephrs2 + smokecat + alccat +
             como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
             como_anemia + como_kidney + como_hypoth + como_cancers +
             kcal100 + rcs(eggs_gram_ea, parms = 4), data = ahs_medic_inc2)

# Model info
specs(mv2)

# Coefs
mv2
cbind(coef(mv2), confint(mv2)) %>% exp()
anova(mv2)

# Egg intake: basic statistics
summary(ahs_medic_inc2$eggs_gram_ea)

# Change the reference to 10 g/d
dd$limits$eggs_gram_ea[2] <- 10
mv2 <- update(mv2)
Predict(mv2, eggs_gram_ea = seq(0, 80, by = 1), fun = exp, ref.zero = TRUE) 

# pdf("RCS_egg_MV2.pdf", width = 6.5, height = 5)
Predict(mv2, eggs_gram_ea = seq(0, 50, by = 1), fun = exp, ref.zero = TRUE) %>% 
  ggplot() +
  geom_line(linewidth = 1.3) +
  # scale_x_continuous(limits = c(0, 100), transform = "pseudo_log")+
  scale_y_continuous(breaks = 9:14 / 10) +
  # geom_vline(xintercept = 10, linetype = 2) +
  geom_hline(yintercept =  1, linetype = 2) +
  coord_cartesian(ylim = c(0.85, 1.35)) +
  labs(x = "Egg intake (energy-adjusted, gram/day)",
       y = "Adjusted hazard ratio (95% CI)",
       caption = "",
       title = "Model 2: Cubic spline for egg intake") +
  theme(text=element_text(size = 14))
# dev.off()

update(mv2, .~. - educyou2 + as.numeric(educyou))    %>% anova()
update(mv2, .~. - bmicat + as.numeric(bmicat))       %>% anova()
update(mv2, .~. - exercise + as.numeric(exercise))   %>% anova()
update(mv2, .~. - sleephrs2 + as.numeric(sleephrs2)) %>% anova()


# Model 3a: Examine non-linearity
mv3a <- cph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 + 
             bmicat + exercise + sleephrs2 + smokecat + alccat +
             como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
             como_anemia + como_kidney + como_hypoth + como_cancers +
             kcal100 + 
             rcs(eggs_gram_ea, parms = 4) +
             rcs(meat_gram_ea, parms = 4) +
             rcs(fish_gram_ea, parms = 4) +
             # rcs(dairy_gram_ea, parms = 4) + 
             rcs(totalveg_gram_ea, parms = 4) + 
             rcs(fruits_gram_ea, parms = 4) + 
             rcs(refgrains_gram_ea, parms = 4) + 
             rcs(whole_mixed_grains_gram_ea, parms = 4) + 
             rcs(nutsseeds_gram_ea, parms = 4) + 
             rcs(legumes_gram_ea, parms = 4), 
           data = ahs_medic_inc2)

anova(mv3a)

# Model 3b: Fit with linear terms if non-linearity non-sig
ahs_medic_inc3 <- ahs_medic_inc2 %>% 
        mutate(meat_gram_ea = meat_gram_ea / 100) %>% 
        mutate(fish_gram_ea = fish_gram_ea / 100) %>% 
        mutate(dairy_gram_ea = dairy_gram_ea / 100) %>% 
        mutate(fruits_gram_ea = fruits_gram_ea / 100) %>% 
        mutate(refgrains_gram_ea = refgrains_gram_ea / 100) %>% 
        mutate(whole_mixed_grains_gram_ea = whole_mixed_grains_gram_ea / 100) %>% 
        mutate(nutsseeds_gram_ea = nutsseeds_gram_ea / 100) %>% 
        mutate(legumes_gram_ea = legumes_gram_ea / 100)

mv3b <- cph(Surv(agein, ageout, inc_demen) ~ bene_sex_F + rti_race3 + marital + educyou2 + 
              bmicat + exercise + sleephrs2 + smokecat + alccat +
              como_depress + como_disab + como_diabetes + como_cvd + como_hypert + como_hyperl + como_resp + 
              como_anemia + como_kidney + como_hypoth + como_cancers +
              kcal100 + 
              rcs(eggs_gram_ea, parms = 4) +
              meat_gram_ea +
              fish_gram_ea +
              dairy_gram_ea +
              fruits_gram_ea +
              refgrains_gram_ea +
              whole_mixed_grains_gram_ea +
              nutsseeds_gram_ea +
              legumes_gram_ea, 
            data = ahs_medic_inc3)

# Model info
specs(mv3b)

# Coefs
mv3b
cbind(coef(mv3b), confint(mv3b)) %>% exp()
anova(mv3b)

# Egg intake: basic statistics
summary(ahs_medic_inc2$eggs_gram_ea)
summary(ahs_medic_inc2$refgrains_gram_ea)
summary(ahs_medic_inc2$whole_mixed_grains_gram_ea)
summary(ahs_medic_inc2$nutsseeds_gram_ea)

# Hazard ratio
Predict(mv3b, eggs_gram_ea = seq(0, 80, by = 1), fun = exp, ref.zero = TRUE) 
Predict(mv3b, eggs_gram_ea = c(0, 20, 30, 40, 50), fun = exp, ref.zero = TRUE) %>% 
  rename(HR = yhat) %>% 
  select(eggs_gram_ea, HR, lower, upper)

# pdf("RCS_egg_MV3.pdf", width = 6.5, height = 5)
Predict(mv3b, eggs_gram_ea = seq(0, 50, by = 1), fun = exp, ref.zero = TRUE) %>% 
  ggplot() +
  geom_line(linewidth = 1.3) +
  # scale_x_continuous(limits = c(0, 100), transform = "pseudo_log")+
  scale_y_continuous(breaks = 9:14 / 10) +
  # geom_vline(xintercept = 10, linetype = 2) +
  geom_hline(yintercept =  1, linetype = 2) +
  coord_cartesian(ylim = c(0.85, 1.35)) +
  labs(x = "Egg intake (energy-adjusted, gram/day)",
       y = "Adjusted hazard ratio (95% CI)",
       caption = "",
       title = "Model 3: Cubic spline for egg intake") +
  theme(text=element_text(size = 14))
# dev.off()

update(mv3b, .~. -educyou2 + as.numeric(educyou))     %>% anova()
update(mv3b, .~. - bmicat + as.numeric(bmicat))       %>% anova()
update(mv3b, .~. - exercise + as.numeric(exercise))   %>% anova()
update(mv3b, .~. - sleephrs2 + as.numeric(sleephrs2)) %>% anova()

# Output to excel ---------------------------------------------------------

# Output to excel
convert_to_df <- function(model, suffix){
  vnames <- c("HR", "lower", "upper")
  cbind(coef(model), confint(model)) %>% 
    exp() %>% 
    as.data.frame() %>% 
    setNames(paste0(suffix, "_", vnames)) %>% 
    rownames_to_column()
}

mv1_out <- convert_to_df(mv1, "mv1")
mv2_out <- convert_to_df(mv2, "mv2")
mv3_out <- convert_to_df(mv3b, "mv3")

# Read excel template
template <- read_excel("./Data/HR_table_template.xlsx", col_names = "rowname")

out <- template %>% 
  left_join(mv1_out) %>% 
  left_join(mv2_out) %>% 
  left_join(mv3_out) 

out %>% print(n = Inf)




# For models with food group (remove dietary pattern)
vars <- c("bene_sex_F", "rti_race3", "marital", "educyou2", "bmicat", "exercise", "sleephrs2", "smokecat", "alccat",
          "como_depress", "como_disab", "como_diabetes", "como_cvd", "como_hthl", "como_resp", "como_kidney", "como_hypoth", "como_cancers",
          "kcal100", "meat_gram_ea_4", "fish_gram_ea_4", "eggs_gram_ea_4", "dairy_gram_ea_4")

cox_out <- lapply(ahs_medic_inc2[vars], coxm)
out <- do.call(rbind, lapply(cox_out, getHR))
rownames(out) <- unlist(mapply(replace_var, cox_out, varname = names(cox_out)))
out

mv_mod2 <- update(mv_mod, .~. - vegstat2 + kcal100 + meat_gram_ea_4 + fish_gram_ea_4 + eggs_gram_ea_4 + dairy_gram_ea_4)
mv_out <- summary(mv_mod2)
mv_out2 <- cbind(mvHR = coef(mv_out)[, "exp(coef)"], exp(confint(mv_mod2))) %>% round(2)
cbind(out, mv_out2)

drop1(mv_mod2)
anova(mv_mod2, update(mv_mod2, .~. - meat_gram_ea_4))
anova(mv_mod2, update(mv_mod2, .~. - fish_gram_ea_4))
anova(mv_mod2, update(mv_mod2, .~. - eggs_gram_ea_4))
anova(mv_mod2, update(mv_mod2, .~. - dairy_gram_ea_4))

# Trend p-value
mv_mod4 <- update(mv_mod2, .~. - educyou2 + as.numeric(educyou))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - bmicat + as.numeric(bmicat))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - exercise + as.numeric(exercise))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - sleephrs2 + as.numeric(sleephrs))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - meat_gram_ea_4 + as.numeric(meat_gram_ea_4))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - fish_gram_ea_4 + as.numeric(fish_gram_ea_4))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - eggs_gram_ea_4 + as.numeric(eggs_gram_ea_4))
summary(mv_mod4)
mv_mod4 <- update(mv_mod2, .~. - dairy_gram_ea_4 + as.numeric(dairy_gram_ea_4))
summary(mv_mod4)

# Model with dietary pattern and egg
mv_mod1a <- update(mv_mod, .~. + kcal100 + eggs_gram_ea_4)
mv_out <- summary(mv_mod1a)
mv_out2 <- cbind(mvHR = coef(mv_out)[, "exp(coef)"], exp(confint(mv_mod1a))) %>% round(2)

# Model with meat x egg interaction
mv_mod3 <- update(mv_mod2, .~. + meat_gram_ea_4 * eggs_gram_ea_4)
mv_out3 <- summary(mv_mod3)
mv_out3 <- cbind(mvHR = coef(mv_out3)[, "exp(coef)"], exp(confint(mv_mod3))) %>% round(2)

# LR test for interaction
anova(mv_mod2, mv_mod3)

# Checking PH assumption
mv_mod_zph <- cox.zph(mv_mod, transform = "km", global = FALSE, terms = FALSE)
mv_mod_zph

# Variables violating PH assumptions
plot.zph <- function(var,...){
  plot(mv_mod_zph, var = var, resid = FALSE, col = c("red", "pink"), lwd = 2, cex.lab = 2, cex.axis = 2,...)
  abline(h = 0, lty = 2)
} 

par(mfrow=c(2, 4), mar=c(c(5.1, 5.1, 4.1, 2.1)))
  plot.zph("rti_race3Black",     ylim = c(-4, 4))
  plot.zph("maritalDiv/Wid",     ylim = c(-4, 4))
  plot.zph("educyou2HS or less", ylim = c(-4, 4))
  plot.zph("bmicatObese",        ylim = c(-4, 4))
  plot.zph("sleephrs2<= 5 hrs",  ylim = c(-4, 4))
  plot.zph("sleephrs2>= 9 hrs",  ylim = c(-4, 4))
  plot.zph("smokecatEver",       ylim = c(-4, 4))
  plot.zph("alccatEver",         ylim = c(-4, 4))
par(mfrow=c(1, 1))

par(mfrow=c(2, 4), mar=c(c(5.1, 5.1, 4.1, 2.1)))
  plot.zph("como_depressYes",    ylim = c(-4, 4))
  plot.zph("como_diabetesYes",   ylim = c(-4, 4))
  plot.zph("como_cvdYes",        ylim = c(-4, 4))
  plot.zph("como_respYes",       ylim = c(-4, 4))
  plot.zph("como_kidneyYes",     ylim = c(-4, 4))
  plot.zph("como_cancersYes",    ylim = c(-4, 4))
par(mfrow=c(1, 1))



# Misc analyses -----------------------------------------------------------

# Egg intake from HHF6: n = 49,447
hhf6 <- readRDS("./Data/raw-hhf6-20180418.rds")
names(hhf6)

hhf6 %>% select(QID)

# QID to analysis ID map: n = 96,247
QID_to_analysisID <- read_csv("./Data/AHS-data-SUBJECT_IDS-20201116(in).csv") %>% 
  select(qid, analysisid)

# Add analysis ID to HHF6
hhf6_v2 <- hhf6 %>%
  mutate(qid = as.numeric(QID)) %>% 
  left_join(QID_to_analysisID, by = "qid")

# HHF6 egg intake
egg_lab <- c("Never", "1-3x/mo", "1x/wk", "2-4x/wk", "5-6x/wk", "1x/day", "2-3x/day", "4-5x/day", "6+x/day")

hhf6 %>% 
  group_by(P3_Q8_EGGS) %>% 
  tally() %>% 
  mutate(pct = n / sum(n) * 100)

hhf6 %>% 
  filter(!P3_Q8_EGGS %in% c(" ", "*")) %>% 
  mutate(P3_Q8_EGGS = as.numeric(P3_Q8_EGGS)) %>%
  mutate(P3_Q8_EGGS = factor(P3_Q8_EGGS, labels =  egg_lab)) %>% 
  group_by(P3_Q8_EGGS) %>% 
  tally() %>% 
  mutate(pct = n / sum(n) * 100)

# Merge with AHS data; n = 23,906
hhf6_merged <- hhf6_v2 %>% 
  inner_join(ahs_medic_inc2, by = "analysisid") %>% 
  mutate(P3_Q8_EGGS = ifelse(!P3_Q8_EGGS %in% c(" ", "*"), as.numeric(P3_Q8_EGGS), NA)) %>%
  mutate(P3_Q8_EGGS = factor(P3_Q8_EGGS, labels =  egg_lab)) %>%  
  mutate(eggbetrf = factor(eggbetrf, labels = egg_lab))  

nrow(hhf6_merged)
nrow(hhf6_merged) / nrow(ahs_medic_inc2)

hhf6_merged %>% 
  # filter(!is.na(P3_Q8_EGGS)) %>%
  mutate(P3_Q8_EGGS = as.numeric(P3_Q8_EGGS)) %>%
  mutate(P3_Q8_EGGS = factor(P3_Q8_EGGS, labels =  egg_lab)) %>%
  group_by(P3_Q8_EGGS) %>% 
  tally() %>% 
  mutate(pct = n / sum(n) * 100)

hhf6_merged %>%
  group_by(eggbetrf) %>% 
  tally() %>% 
  mutate(pct = n / sum(n) * 100)

cr <- hhf6_merged %>%
  select(P3_Q8_EGGS, eggbetrf) %>% 
  table()
cr

# Percent agreement: Main diagonals only, 39%
sum(diag(cr)) / sum(cr)

# Percent agreement: Main diagonals plus one above and one below: 74%
sum(pracma::Diag(cr, k =  0), 
    pracma::Diag(cr, k =  1),
    pracma::Diag(cr, k = -1)
    ) / sum(cr)

# Fleiss-Cohen Kappa: 0.463
# vcd::Kappa(cr, weights = "Equal-Spacing")
vcd::Kappa(cr, weights = "Fleiss-Cohen")

# Spearman correlation: 0.498
hhf6_merged %>%
  select(P3_Q8_EGGS, eggbetrf) %>%
  mutate(P3_Q8_EGGS = as.numeric(P3_Q8_EGGS),
         eggbetrf   = as.numeric(eggbetrf)) %>% 
  cor(method = "spearman", use = "complete.obs")

# Kendall tau: 0.422
hhf6_merged %>%
  select(P3_Q8_EGGS, eggbetrf) %>%
  mutate(P3_Q8_EGGS = as.numeric(P3_Q8_EGGS),
         eggbetrf   = as.numeric(eggbetrf)) %>% 
  cor(method = "kendall", use = "complete.obs")
