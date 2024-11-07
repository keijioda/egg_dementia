Egg dementia study
================

## Aim

- Association between egg intake and the incidence of Alzheimer’s
  disease in the AHS-2 cohort linked with Medicare data
- This summary focuses on the outcome of Alzheimer’s disease, not
  including other types of dementia

## Datasets

- Medicare data
  - For details regarding Medicare data, see [AHS-2 Medicare
    Linkage](https://github.com/keijioda/ahs_medicare_linkage/blob/main/summary.md)
    repository.

  - Master Beneficiary Summary File (MBSF), 2008-2020

    - Contains beneficiary characteristics and enrollment information

  - Chronic Conditions file (CC), 2008-2020

    - Contains the first occurrence date of 27 specific chronic
      conditions
    - Used to identify prevalent/incident cases of dementia and/or
      Alzheimer’s disease and
    - to identify comorbidities

  - Both files include n = 44,585 unique subjects across years, after
    excluding

    - Gender/DOB mismatch with AHS-2 data
    - Dupulicate beneficiary IDs and SSNs
- AHS-2 baseline data with imputations: n = 88,051
  - Among this, n = 383 subjects were excluded because they opted out of
    the study
  - After removing opt-outs, there were n = 87,668 subjects
- After merging Medicare and AHS-2 data, there were n = 41,099 subjects.

## Inclusion/exclusion criteria

- Medicare beneficiaries who did not reach the age of 65 between 2008
  and 2020 (e.g., younger beneficiaries with disabilities or end-stage
  renal disease) were excluded (n = 1336), resulting n = 39,763.

- n = 82 subjects with extreme BMI (\<16 or \>60), according to AHS
  questionnaire, were excluded, resulting n = 39,681.

- Prevalent cases of Alzheimer’s disease

  - If the first diagnosis was made before AHS-2 enrollment or within 6
    months after the enrollment, consider it as a prevalent case
  - n = 109 such prevalent cases were excluded, resulting n = 39,572
    subjects

- Unverified dates of deaths

  - Medicare data include a variable (`VALID_DEATH_DT_SW`) indicating
    whether a beneficiary’s day of death has been verified by the Social
    Security Administration or the Railroad Retirement Board.
  - There were 19 unverified death dates. Excluding these resulted n =
    39,553.

## Dietary variables

- Gram intakes of 3 food groups (meat, fish, and dairy) were calculated
  (gram/day) according to AHS-2 food frequency questionnaire.

- For each food group, its dietary intake was energy-adjusted by the
  residual method, while partitioning zero intake ([Jaceldo-Siegl et
  al., 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3433053/)).
  Due to its highly right-skewed distribution, non-zero intake was
  log-transformed before being regressed on the total energy intake.
  Residuals were added by the mean of log and then back-transformed to
  obtain energy-adjusted dietary intake. Energy-adjusted dietary intake
  was added with (unadjusted) supplement intake to form energy-adjuste
  total intake.

- Subjects were then divided into 4 intake levels.

  - For meat and fish, about 51% of subjects indicated zero intake and
    they were classified to a non-consumption group. The rest of the
    subjects were approximately equally allocated to 3 consumption
    groups according to their intake.
  - For other food group variables, subjects were divided into 4
    quartile groups (approximately).
  - For cut-off values of the four food groups, please see the
    descriptive table below.

- Mean and 25th, 50th, 75th percentiles of gram intake by intake group
  are shown below:

| meat_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 19842 | 50.17 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<11 g/d       |  6619 | 16.73 |  5.76 |  3.87 |  5.70 |  7.61 |
| 11-\<32 g/d    |  6451 | 16.31 | 19.37 | 14.31 | 18.35 | 23.79 |
| 32+ g/d        |  6641 | 16.79 | 63.43 | 41.44 | 54.76 | 75.73 |

| fish_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 19356 | 48.94 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<9 g/d        |  6623 | 16.74 |  5.56 |  4.13 |  5.50 |  7.05 |
| 9-\<18 g/d     |  6885 | 17.41 | 13.05 | 10.87 | 12.79 | 15.16 |
| 18+ g/d        |  6689 | 16.91 | 37.01 | 21.82 | 28.42 | 43.61 |

| nutsseeds_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:--------------------|------:|------:|------:|------:|------:|------:|
| \<9 g/d             | 10008 | 25.30 |  4.74 |  2.62 |  4.95 |  7.00 |
| 9-\<19 g/d          | 10343 | 26.15 | 13.78 | 11.30 | 13.61 | 16.24 |
| 19-\<33 g/d         |  9776 | 24.72 | 25.39 | 21.99 | 25.10 | 28.65 |
| 33+ g/d             |  9426 | 23.83 | 51.88 | 38.16 | 45.57 | 58.15 |

| totalveg_gram_ea_4 |     n |   pct |   mean |     p1 |     p2 |     p3 |
|:-------------------|------:|------:|-------:|-------:|-------:|-------:|
| \<185 g/d          | 10036 | 25.37 | 127.52 |  99.55 | 134.27 | 161.64 |
| 185-\<270 g/d      |  9787 | 24.74 | 226.91 | 205.87 | 226.31 | 247.67 |
| 270-\<380 g/d      |  9959 | 25.18 | 320.72 | 293.67 | 318.61 | 346.72 |
| 378+ g/d           |  9771 | 24.70 | 536.28 | 423.15 | 482.32 | 584.57 |

| fruits_gram_ea_4 |    n |   pct |   mean |     p1 |     p2 |     p3 |
|:-----------------|-----:|------:|-------:|-------:|-------:|-------:|
| \<170 g/d        | 9931 | 25.11 | 102.15 |  69.43 | 107.65 | 139.70 |
| 170-\<280 g/d    | 9840 | 24.88 | 225.04 | 198.07 | 224.82 | 252.18 |
| 280-\<420 g/d    | 9913 | 25.06 | 344.35 | 309.14 | 341.56 | 378.12 |
| 419+ g/d         | 9869 | 24.95 | 617.23 | 472.45 | 547.12 | 684.26 |

| legumes_gram_ea_4 |     n |   pct |   mean |     p1 |     p2 |     p3 |
|:------------------|------:|------:|-------:|-------:|-------:|-------:|
| (-Inf,33\]        |  9741 | 24.63 |  16.64 |   8.60 |  17.39 |  25.56 |
| (33,60\]          |  9660 | 24.42 |  46.58 |  39.90 |  46.66 |  53.23 |
| (60,100\]         | 10414 | 26.33 |  77.68 |  67.88 |  76.57 |  86.77 |
| (100, Inf\]       |  9738 | 24.62 | 168.31 | 116.65 | 143.08 | 193.10 |

| refgrains_gram_ea_4 |     n |   pct |   mean |     p1 |     p2 |     p3 |
|:--------------------|------:|------:|-------:|-------:|-------:|-------:|
| \<40 g/d            | 10331 | 26.12 |  21.22 |  12.98 |  21.87 |  30.65 |
| 40-\<83 g/d         |  9976 | 25.22 |  60.33 |  49.65 |  59.54 |  70.87 |
| 83-\<150 g/d        |  9794 | 24.76 | 112.68 |  96.00 | 111.03 | 128.27 |
| 150+ g/d            |  9452 | 23.90 | 271.25 | 178.28 | 223.97 | 312.15 |

| whole_mixed_grains_gram_ea_4 |     n |   pct |   mean |     p1 |     p2 |     p3 |
|:-----------------------------|------:|------:|-------:|-------:|-------:|-------:|
| \<120 g/d                    | 10198 | 25.78 |  71.27 |  48.68 |  75.39 |  98.29 |
| 120-\<210 g/d                |  9687 | 24.49 | 162.64 | 140.32 | 161.43 | 184.02 |
| 210-\<350 g/d                |  9687 | 24.49 | 273.95 | 238.47 | 270.91 | 307.71 |
| 350+ g/d                     |  9981 | 25.23 | 520.59 | 403.41 | 475.31 | 592.67 |

- For egg intake and meat intake, a crosstab was produced:
  - The first table was stratified by meat intake (% of egg intake
    within each meat level)
  - The second table was stratified by egg intake (% of meat intake
    within each egg level)

|  | level | None | \<11 g/d | 11-\<32 g/d | 32+ g/d | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 19842 | 6619 | 6451 | 6641 |  |  |
| egg_freq (%) | Never | 8548 (43.1) | 1005 (15.2) | 601 ( 9.3) | 485 ( 7.3) | \<0.001 |  |
|  | 1-3/mo | 4864 (24.5) | 2056 (31.1) | 1872 (29.0) | 1410 (21.2) |  |  |
|  | 1/wk | 2785 (14.0) | 1407 (21.3) | 1401 (21.7) | 1357 (20.4) |  |  |
|  | 2-4/wk | 3127 (15.8) | 1789 (27.0) | 2090 (32.4) | 2518 (37.9) |  |  |
|  | 5+/wk | 518 ( 2.6) | 362 ( 5.5) | 487 ( 7.5) | 871 (13.1) |  |  |

|  | level | Never | 1-3/mo | 1/wk | 2-4/wk | 5+/wk | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 10639 | 10202 | 6950 | 9524 | 2238 |  |  |
| meat_gram_ea_4 (%) | None | 8548 (80.3) | 4864 (47.7) | 2785 (40.1) | 3127 (32.8) | 518 (23.1) | \<0.001 |  |
|  | \<11 g/d | 1005 ( 9.4) | 2056 (20.2) | 1407 (20.2) | 1789 (18.8) | 362 (16.2) |  |  |
|  | 11-\<32 g/d | 601 ( 5.6) | 1872 (18.3) | 1401 (20.2) | 2090 (21.9) | 487 (21.8) |  |  |
|  | 32+ g/d | 485 ( 4.6) | 1410 (13.8) | 1357 (19.5) | 2518 (26.4) | 871 (38.9) |  |  |

## Descriptive table

- The descriptive table by case/non-case:
  - Age, gender, and race (RTI race code, recoded into
    White/Black/Other) were derived from Medicare MBSF data.
    - Age was calculated at the end of year 2020 (for the sake of
      comparison; some of the subjects may have died by then)
  - Other demographic and lifestyle variables were derived from AHS-2
    baseline questionnaire
    - Marital status (married, never married, widowed/divorced)
    - Education level (high school or less, some college, college
      graduate)
    - Dietary pattern (5 levels: vegan, lacto-ovo, semi, pesco and
      non-vegetarians)
    - BMI group
    - Exercise (none, low, moderate, vigorous)
    - Smoking (never/ever)
    - Alcohol use (never/ever)
    - Sleep hours
  - Comorbidity variables (yes/no) were derived from Medicare chronic
    condition data. Those who were diagnosed with the following
    conditions prior to study enrollment were flagged.
    - Cancer: breast, colorectal, lung, prostate, endometrial
    - CVD: Acute MI, atrial fibrillation, congestive heart failure,
      ischemic heart disease, stroke/TIA
    - Hypertension
    - hyperlipidemia
    - Respiratory diseases: COPD, asthma
    - Anemia
    - Diabetes
    - Chronic kidney diseases
    - Hypothyroidism
    - Depression
    - Functional disabilities: Cataract, glaucoma, hip/pelvic fracture,
      osteoporosis, rheumatoid arthritis/osteoarthritis
- For those diagnosed with dementia/AD, the mean age at diagnosis was
  83.3 years (median 84.0 years)

|  | level | Overall | Non-case | Case | p | test |
|:---|:---|:---|:---|:---|:---|:---|
| n |  | 39553 | 36687 | 2866 |  |  |
| agecat (%) | 65-69 | 6692 (16.9) | 6670 (18.2) | 22 ( 0.8) | \<0.001 |  |
|  | 70-74 | 6952 (17.6) | 6879 (18.8) | 73 ( 2.5) |  |  |
|  | 75-79 | 6301 (15.9) | 6113 (16.7) | 188 ( 6.6) |  |  |
|  | 80-84 | 5633 (14.2) | 5272 (14.4) | 361 (12.6) |  |  |
|  | 85-89 | 5044 (12.8) | 4474 (12.2) | 570 (19.9) |  |  |
|  | 90-94 | 4290 (10.8) | 3554 ( 9.7) | 736 (25.7) |  |  |
|  | 95+ | 4641 (11.7) | 3725 (10.2) | 916 (32.0) |  |  |
| bene_age_at_end_2020 (mean (SD)) |  | 81.14 (10.48) | 80.37 (10.25) | 91.03 (8.11) | \<0.001 |  |
| age_medicare_cat (%) | \<50 | 633 ( 1.6) | 598 ( 1.6) | 35 ( 1.2) | \<0.001 |  |
|  | 50-54 | 485 ( 1.2) | 448 ( 1.2) | 37 ( 1.3) |  |  |
|  | 55-59 | 934 ( 2.4) | 871 ( 2.4) | 63 ( 2.2) |  |  |
|  | 60-63 | 949 ( 2.4) | 876 ( 2.4) | 73 ( 2.5) |  |  |
|  | 64 | 33600 (84.9) | 31132 (84.9) | 2468 (86.1) |  |  |
|  | 65 | 1687 ( 4.3) | 1600 ( 4.4) | 87 ( 3.0) |  |  |
|  | 66-69 | 1065 ( 2.7) | 989 ( 2.7) | 76 ( 2.7) |  |  |
|  | 70+ | 200 ( 0.5) | 173 ( 0.5) | 27 ( 0.9) |  |  |
| age_medicare_cont (mean (SD)) |  | 64.33 (3.55) | 64.32 (3.56) | 64.45 (3.36) | 0.065 |  |
| bene_sex_F (%) | M | 14350 (36.3) | 13404 (36.5) | 946 (33.0) | \<0.001 |  |
|  | F | 25203 (63.7) | 23283 (63.5) | 1920 (67.0) |  |  |
| rti_race3 (%) | NH White | 29375 (74.3) | 27041 (73.7) | 2334 (81.4) | \<0.001 |  |
|  | Black | 7512 (19.0) | 7073 (19.3) | 439 (15.3) |  |  |
|  | Other | 2666 ( 6.7) | 2573 ( 7.0) | 93 ( 3.2) |  |  |
| marital (%) | Married | 28950 (73.2) | 27077 (73.8) | 1873 (65.4) | \<0.001 |  |
|  | Never | 1355 ( 3.4) | 1268 ( 3.5) | 87 ( 3.0) |  |  |
|  | Div/Wid | 9248 (23.4) | 8342 (22.7) | 906 (31.6) |  |  |
| educyou (%) | HSch & below | 8526 (21.6) | 7712 (21.0) | 814 (28.4) | \<0.001 |  |
|  | Some College | 15605 (39.5) | 14510 (39.6) | 1095 (38.2) |  |  |
|  | Bachelors + | 15422 (39.0) | 14465 (39.4) | 957 (33.4) |  |  |
| vegstat (%) | Vegan | 3266 ( 8.3) | 2994 ( 8.2) | 272 ( 9.5) | \<0.001 |  |
|  | Lacto-ovo | 12771 (32.3) | 11750 (32.0) | 1021 (35.6) |  |  |
|  | Semi | 2247 ( 5.7) | 2098 ( 5.7) | 149 ( 5.2) |  |  |
|  | Pesco | 3821 ( 9.7) | 3545 ( 9.7) | 276 ( 9.6) |  |  |
|  | Non-veg | 17448 (44.1) | 16300 (44.4) | 1148 (40.1) |  |  |
| bmicat (%) | Normal | 15311 (38.7) | 14018 (38.2) | 1293 (45.1) | \<0.001 |  |
|  | Overweight | 14390 (36.4) | 13369 (36.4) | 1021 (35.6) |  |  |
|  | Obese | 9852 (24.9) | 9300 (25.3) | 552 (19.3) |  |  |
| bmi (mean (SD)) |  | 27.20 (5.46) | 27.27 (5.48) | 26.39 (5.18) | \<0.001 |  |
| exercise (%) | None | 8793 (22.2) | 7962 (21.7) | 831 (29.0) | \<0.001 |  |
|  | ≤0.5 hrs/wk | 9623 (24.3) | 9057 (24.7) | 566 (19.7) |  |  |
|  | 0.5\<-2 hrs/wk | 10379 (26.2) | 9687 (26.4) | 692 (24.1) |  |  |
|  | \>2 hrs/wk | 10758 (27.2) | 9981 (27.2) | 777 (27.1) |  |  |
| sleephrs (%) | \<= 5 hrs | 3919 ( 9.9) | 3677 (10.0) | 242 ( 8.4) | \<0.001 |  |
|  | 6 hrs | 8608 (21.8) | 8041 (21.9) | 567 (19.8) |  |  |
|  | 7 hrs | 14289 (36.1) | 13345 (36.4) | 944 (32.9) |  |  |
|  | 8 hrs | 10464 (26.5) | 9586 (26.1) | 878 (30.6) |  |  |
|  | \>= 9 hrs | 2273 ( 5.7) | 2038 ( 5.6) | 235 ( 8.2) |  |  |
| smokecat (%) | Never | 31454 (79.5) | 29138 (79.4) | 2316 (80.8) | 0.081 |  |
|  | Ever | 8099 (20.5) | 7549 (20.6) | 550 (19.2) |  |  |
| alccat (%) | Never | 27916 (70.6) | 25742 (70.2) | 2174 (75.9) | \<0.001 |  |
|  | Ever | 11637 (29.4) | 10945 (29.8) | 692 (24.1) |  |  |
| como_depress (%) | No | 37991 (96.1) | 35450 (96.6) | 2541 (88.7) | \<0.001 |  |
|  | Yes | 1562 ( 3.9) | 1237 ( 3.4) | 325 (11.3) |  |  |
| como_disab (%) | No | 29797 (75.3) | 28662 (78.1) | 1135 (39.6) | \<0.001 |  |
|  | Yes | 9756 (24.7) | 8025 (21.9) | 1731 (60.4) |  |  |
| como_diabetes (%) | No | 37180 (94.0) | 34697 (94.6) | 2483 (86.6) | \<0.001 |  |
|  | Yes | 2373 ( 6.0) | 1990 ( 5.4) | 383 (13.4) |  |  |
| como_cvd (%) | No | 34503 (87.2) | 32526 (88.7) | 1977 (69.0) | \<0.001 |  |
|  | Yes | 5050 (12.8) | 4161 (11.3) | 889 (31.0) |  |  |
| como_hypert (%) | No | 32595 (82.4) | 30893 (84.2) | 1702 (59.4) | \<0.001 |  |
|  | Yes | 6958 (17.6) | 5794 (15.8) | 1164 (40.6) |  |  |
| como_hyperl (%) | No | 33328 (84.3) | 31479 (85.8) | 1849 (64.5) | \<0.001 |  |
|  | Yes | 6225 (15.7) | 5208 (14.2) | 1017 (35.5) |  |  |
| como_resp (%) | No | 37908 (95.8) | 35307 (96.2) | 2601 (90.8) | \<0.001 |  |
|  | Yes | 1645 ( 4.2) | 1380 ( 3.8) | 265 ( 9.2) |  |  |
| como_anemia (%) | No | 35796 (90.5) | 33638 (91.7) | 2158 (75.3) | \<0.001 |  |
|  | Yes | 3757 ( 9.5) | 3049 ( 8.3) | 708 (24.7) |  |  |
| como_kidney (%) | No | 39037 (98.7) | 36246 (98.8) | 2791 (97.4) | \<0.001 |  |
|  | Yes | 516 ( 1.3) | 441 ( 1.2) | 75 ( 2.6) |  |  |
| como_hypoth (%) | No | 36983 (93.5) | 34604 (94.3) | 2379 (83.0) | \<0.001 |  |
|  | Yes | 2570 ( 6.5) | 2083 ( 5.7) | 487 (17.0) |  |  |
| como_cancers (%) | No | 38159 (96.5) | 35509 (96.8) | 2650 (92.5) | \<0.001 |  |
|  | Yes | 1394 ( 3.5) | 1178 ( 3.2) | 216 ( 7.5) |  |  |
| egg_freq (%) | Never | 10639 (26.9) | 9728 (26.5) | 911 (31.8) | \<0.001 |  |
|  | 1-3/mo | 10202 (25.8) | 9513 (25.9) | 689 (24.0) |  |  |
|  | 1/wk | 6950 (17.6) | 6478 (17.7) | 472 (16.5) |  |  |
|  | 2-4/wk | 9524 (24.1) | 8861 (24.2) | 663 (23.1) |  |  |
|  | 5+/wk | 2238 ( 5.7) | 2107 ( 5.7) | 131 ( 4.6) |  |  |
| meat_gram_ea_4 (%) | None | 19842 (50.2) | 18273 (49.8) | 1569 (54.7) | \<0.001 |  |
|  | \<11 g/d | 6619 (16.7) | 6098 (16.6) | 521 (18.2) |  |  |
|  | 11-\<32 g/d | 6451 (16.3) | 6040 (16.5) | 411 (14.3) |  |  |
|  | 32+ g/d | 6641 (16.8) | 6276 (17.1) | 365 (12.7) |  |  |
| fish_gram_ea_4 (%) | None | 19356 (48.9) | 17837 (48.6) | 1519 (53.0) | \<0.001 |  |
|  | \<9 g/d | 6623 (16.7) | 6112 (16.7) | 511 (17.8) |  |  |
|  | 9-\<18 g/d | 6885 (17.4) | 6414 (17.5) | 471 (16.4) |  |  |
|  | 18+ g/d | 6689 (16.9) | 6324 (17.2) | 365 (12.7) |  |  |
| totalveg_gram_ea_4 (%) | \<185 g/d | 10036 (25.4) | 9322 (25.4) | 714 (24.9) | 0.392 |  |
|  | 185-\<270 g/d | 9787 (24.7) | 9086 (24.8) | 701 (24.5) |  |  |
|  | 270-\<380 g/d | 9959 (25.2) | 9199 (25.1) | 760 (26.5) |  |  |
|  | 378+ g/d | 9771 (24.7) | 9080 (24.7) | 691 (24.1) |  |  |
| fruits_gram_ea_4 (%) | \<170 g/d | 9931 (25.1) | 9349 (25.5) | 582 (20.3) | \<0.001 |  |
|  | 170-\<280 g/d | 9840 (24.9) | 9171 (25.0) | 669 (23.3) |  |  |
|  | 280-\<420 g/d | 9913 (25.1) | 9092 (24.8) | 821 (28.6) |  |  |
|  | 419+ g/d | 9869 (25.0) | 9075 (24.7) | 794 (27.7) |  |  |
| refgrains_gram_ea_4 (%) | \<40 g/d | 10331 (26.1) | 9395 (25.6) | 936 (32.7) | \<0.001 |  |
|  | 40-\<83 g/d | 9976 (25.2) | 9229 (25.2) | 747 (26.1) |  |  |
|  | 83-\<150 g/d | 9794 (24.8) | 9172 (25.0) | 622 (21.7) |  |  |
|  | 150+ g/d | 9452 (23.9) | 8891 (24.2) | 561 (19.6) |  |  |
| whole_mixed_grains_gram_ea_4 (%) | \<120 g/d | 10198 (25.8) | 9594 (26.2) | 604 (21.1) | \<0.001 |  |
|  | 120-\<210 g/d | 9687 (24.5) | 8989 (24.5) | 698 (24.4) |  |  |
|  | 210-\<350 g/d | 9687 (24.5) | 8932 (24.3) | 755 (26.3) |  |  |
|  | 350+ g/d | 9981 (25.2) | 9172 (25.0) | 809 (28.2) |  |  |
| nutsseeds_gram_ea_4 (%) | \<9 g/d | 10008 (25.3) | 9369 (25.5) | 639 (22.3) | \<0.001 |  |
|  | 9-\<19 g/d | 10343 (26.1) | 9653 (26.3) | 690 (24.1) |  |  |
|  | 19-\<33 g/d | 9776 (24.7) | 9067 (24.7) | 709 (24.7) |  |  |
|  | 33+ g/d | 9426 (23.8) | 8598 (23.4) | 828 (28.9) |  |  |
| legumes_gram_ea_4 (%) | (-Inf,33\] | 9741 (24.6) | 9015 (24.6) | 726 (25.3) | 0.001 |  |
|  | (33,60\] | 9660 (24.4) | 8887 (24.2) | 773 (27.0) |  |  |
|  | (60,100\] | 10414 (26.3) | 9687 (26.4) | 727 (25.4) |  |  |
|  | (100, Inf\] | 9738 (24.6) | 9098 (24.8) | 640 (22.3) |  |  |

## Descriptive table by egg intake

|  | level | Overall | Never | 1-3/mo | 1/wk | 2-4/wk | 5+/wk | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 39553 | 10639 | 10202 | 6950 | 9524 | 2238 |  |  |
| ALZH_YN2 (%) | Non-case | 36687 (92.8) | 9728 (91.4) | 9513 (93.2) | 6478 (93.2) | 8861 (93.0) | 2107 (94.1) | \<0.001 |  |
|  | Case | 2866 ( 7.2) | 911 ( 8.6) | 689 ( 6.8) | 472 ( 6.8) | 663 ( 7.0) | 131 ( 5.9) |  |  |
| agecat (%) | 65-69 | 6692 (16.9) | 1647 (15.5) | 1821 (17.8) | 1203 (17.3) | 1629 (17.1) | 392 (17.5) | \<0.001 |  |
|  | 70-74 | 6952 (17.6) | 1798 (16.9) | 1837 (18.0) | 1259 (18.1) | 1660 (17.4) | 398 (17.8) |  |  |
|  | 75-79 | 6301 (15.9) | 1674 (15.7) | 1674 (16.4) | 1089 (15.7) | 1466 (15.4) | 398 (17.8) |  |  |
|  | 80-84 | 5633 (14.2) | 1530 (14.4) | 1416 (13.9) | 965 (13.9) | 1394 (14.6) | 328 (14.7) |  |  |
|  | 85-89 | 5044 (12.8) | 1385 (13.0) | 1267 (12.4) | 915 (13.2) | 1203 (12.6) | 274 (12.2) |  |  |
|  | 90-94 | 4290 (10.8) | 1239 (11.6) | 1047 (10.3) | 724 (10.4) | 1046 (11.0) | 234 (10.5) |  |  |
|  | 95+ | 4641 (11.7) | 1366 (12.8) | 1140 (11.2) | 795 (11.4) | 1126 (11.8) | 214 ( 9.6) |  |  |
| bene_age_at_end_2020 (mean (SD)) |  | 81.14 (10.48) | 81.74 (10.57) | 80.74 (10.42) | 80.96 (10.45) | 81.19 (10.52) | 80.47 (10.09) | \<0.001 |  |
| bene_sex_F (%) | M | 14350 (36.3) | 3778 (35.5) | 3370 (33.0) | 2745 (39.5) | 3522 (37.0) | 935 (41.8) | \<0.001 |  |
|  | F | 25203 (63.7) | 6861 (64.5) | 6832 (67.0) | 4205 (60.5) | 6002 (63.0) | 1303 (58.2) |  |  |
| rti_race3 (%) | NH White | 29375 (74.3) | 7781 (73.1) | 7220 (70.8) | 5320 (76.5) | 7250 (76.1) | 1804 (80.6) | \<0.001 |  |
|  | Black | 7512 (19.0) | 2205 (20.7) | 2259 (22.1) | 1102 (15.9) | 1628 (17.1) | 318 (14.2) |  |  |
|  | Other | 2666 ( 6.7) | 653 ( 6.1) | 723 ( 7.1) | 528 ( 7.6) | 646 ( 6.8) | 116 ( 5.2) |  |  |
| marital (%) | Married | 28950 (73.2) | 7713 (72.5) | 7217 (70.7) | 5368 (77.2) | 7028 (73.8) | 1624 (72.6) | \<0.001 |  |
|  | Never | 1355 ( 3.4) | 426 ( 4.0) | 388 ( 3.8) | 181 ( 2.6) | 298 ( 3.1) | 62 ( 2.8) |  |  |
|  | Div/Wid | 9248 (23.4) | 2500 (23.5) | 2597 (25.5) | 1401 (20.2) | 2198 (23.1) | 552 (24.7) |  |  |
| educyou (%) | HSch & below | 8526 (21.6) | 2136 (20.1) | 2341 (22.9) | 1402 (20.2) | 2098 (22.0) | 549 (24.5) | \<0.001 |  |
|  | Some College | 15605 (39.5) | 4054 (38.1) | 3989 (39.1) | 2692 (38.7) | 3903 (41.0) | 967 (43.2) |  |  |
|  | Bachelors + | 15422 (39.0) | 4449 (41.8) | 3872 (38.0) | 2856 (41.1) | 3523 (37.0) | 722 (32.3) |  |  |
| vegstat (%) | Vegan | 3266 ( 8.3) | 3266 (30.7) | 0 ( 0.0) | 0 ( 0.0) | 0 ( 0.0) | 0 ( 0.0) | \<0.001 |  |
|  | Lacto-ovo | 12771 (32.3) | 4196 (39.4) | 3791 (37.2) | 2124 (30.6) | 2280 (23.9) | 380 (17.0) |  |  |
|  | Semi | 2247 ( 5.7) | 404 ( 3.8) | 738 ( 7.2) | 470 ( 6.8) | 542 ( 5.7) | 93 ( 4.2) |  |  |
|  | Pesco | 3821 ( 9.7) | 1090 (10.2) | 1077 (10.6) | 664 ( 9.6) | 850 ( 8.9) | 140 ( 6.3) |  |  |
|  | Non-veg | 17448 (44.1) | 1683 (15.8) | 4596 (45.0) | 3692 (53.1) | 5852 (61.4) | 1625 (72.6) |  |  |
| bmicat (%) | Normal | 15311 (38.7) | 5598 (52.6) | 3867 (37.9) | 2497 (35.9) | 2830 (29.7) | 519 (23.2) | \<0.001 |  |
|  | Overweight | 14390 (36.4) | 3345 (31.4) | 3845 (37.7) | 2712 (39.0) | 3688 (38.7) | 800 (35.7) |  |  |
|  | Obese | 9852 (24.9) | 1696 (15.9) | 2490 (24.4) | 1741 (25.1) | 3006 (31.6) | 919 (41.1) |  |  |
| bmi (mean (SD)) |  | 27.20 (5.46) | 25.58 (4.95) | 27.24 (5.37) | 27.41 (5.31) | 28.31 (5.61) | 29.44 (5.97) | \<0.001 |  |
| exercise (%) | None | 8793 (22.2) | 2101 (19.7) | 2320 (22.7) | 1471 (21.2) | 2266 (23.8) | 635 (28.4) | \<0.001 |  |
|  | ≤0.5 hrs/wk | 9623 (24.3) | 2217 (20.8) | 2513 (24.6) | 1844 (26.5) | 2500 (26.2) | 549 (24.5) |  |  |
|  | 0.5\<-2 hrs/wk | 10379 (26.2) | 2849 (26.8) | 2670 (26.2) | 1842 (26.5) | 2494 (26.2) | 524 (23.4) |  |  |
|  | \>2 hrs/wk | 10758 (27.2) | 3472 (32.6) | 2699 (26.5) | 1793 (25.8) | 2264 (23.8) | 530 (23.7) |  |  |
| sleephrs (%) | \<= 5 hrs | 3919 ( 9.9) | 1002 ( 9.4) | 1085 (10.6) | 632 ( 9.1) | 966 (10.1) | 234 (10.5) | \<0.001 |  |
|  | 6 hrs | 8608 (21.8) | 2246 (21.1) | 2385 (23.4) | 1449 (20.8) | 2030 (21.3) | 498 (22.3) |  |  |
|  | 7 hrs | 14289 (36.1) | 3873 (36.4) | 3582 (35.1) | 2628 (37.8) | 3454 (36.3) | 752 (33.6) |  |  |
|  | 8 hrs | 10464 (26.5) | 2922 (27.5) | 2575 (25.2) | 1863 (26.8) | 2501 (26.3) | 603 (26.9) |  |  |
|  | \>= 9 hrs | 2273 ( 5.7) | 596 ( 5.6) | 575 ( 5.6) | 378 ( 5.4) | 573 ( 6.0) | 151 ( 6.7) |  |  |
| smokecat (%) | Never | 31454 (79.5) | 8765 (82.4) | 8169 (80.1) | 5580 (80.3) | 7343 (77.1) | 1597 (71.4) | \<0.001 |  |
|  | Ever | 8099 (20.5) | 1874 (17.6) | 2033 (19.9) | 1370 (19.7) | 2181 (22.9) | 641 (28.6) |  |  |
| alccat (%) | Never | 27916 (70.6) | 7989 (75.1) | 7294 (71.5) | 4869 (70.1) | 6420 (67.4) | 1344 (60.1) | \<0.001 |  |
|  | Ever | 11637 (29.4) | 2650 (24.9) | 2908 (28.5) | 2081 (29.9) | 3104 (32.6) | 894 (39.9) |  |  |
| como_depress (%) | No | 37991 (96.1) | 10242 (96.3) | 9801 (96.1) | 6700 (96.4) | 9111 (95.7) | 2137 (95.5) | 0.055 |  |
|  | Yes | 1562 ( 3.9) | 397 ( 3.7) | 401 ( 3.9) | 250 ( 3.6) | 413 ( 4.3) | 101 ( 4.5) |  |  |
| como_disab (%) | No | 29797 (75.3) | 7870 (74.0) | 7794 (76.4) | 5294 (76.2) | 7140 (75.0) | 1699 (75.9) | \<0.001 |  |
|  | Yes | 9756 (24.7) | 2769 (26.0) | 2408 (23.6) | 1656 (23.8) | 2384 (25.0) | 539 (24.1) |  |  |
| como_diabetes (%) | No | 37180 (94.0) | 10150 (95.4) | 9635 (94.4) | 6521 (93.8) | 8827 (92.7) | 2047 (91.5) | \<0.001 |  |
|  | Yes | 2373 ( 6.0) | 489 ( 4.6) | 567 ( 5.6) | 429 ( 6.2) | 697 ( 7.3) | 191 ( 8.5) |  |  |
| como_cvd (%) | No | 34503 (87.2) | 9280 (87.2) | 8923 (87.5) | 6080 (87.5) | 8278 (86.9) | 1942 (86.8) | 0.708 |  |
|  | Yes | 5050 (12.8) | 1359 (12.8) | 1279 (12.5) | 870 (12.5) | 1246 (13.1) | 296 (13.2) |  |  |
| como_hypert (%) | No | 32595 (82.4) | 8989 (84.5) | 8410 (82.4) | 5731 (82.5) | 7658 (80.4) | 1807 (80.7) | \<0.001 |  |
|  | Yes | 6958 (17.6) | 1650 (15.5) | 1792 (17.6) | 1219 (17.5) | 1866 (19.6) | 431 (19.3) |  |  |
| como_hyperl (%) | No | 33328 (84.3) | 9045 (85.0) | 8593 (84.2) | 5849 (84.2) | 7948 (83.5) | 1893 (84.6) | 0.049 |  |
|  | Yes | 6225 (15.7) | 1594 (15.0) | 1609 (15.8) | 1101 (15.8) | 1576 (16.5) | 345 (15.4) |  |  |
| como_resp (%) | No | 37908 (95.8) | 10251 (96.4) | 9816 (96.2) | 6656 (95.8) | 9066 (95.2) | 2119 (94.7) | \<0.001 |  |
|  | Yes | 1645 ( 4.2) | 388 ( 3.6) | 386 ( 3.8) | 294 ( 4.2) | 458 ( 4.8) | 119 ( 5.3) |  |  |
| como_anemia (%) | No | 35796 (90.5) | 9588 (90.1) | 9269 (90.9) | 6328 (91.1) | 8578 (90.1) | 2033 (90.8) | 0.088 |  |
|  | Yes | 3757 ( 9.5) | 1051 ( 9.9) | 933 ( 9.1) | 622 ( 8.9) | 946 ( 9.9) | 205 ( 9.2) |  |  |
| como_kidney (%) | No | 39037 (98.7) | 10527 (98.9) | 10078 (98.8) | 6865 (98.8) | 9369 (98.4) | 2198 (98.2) | 0.001 |  |
|  | Yes | 516 ( 1.3) | 112 ( 1.1) | 124 ( 1.2) | 85 ( 1.2) | 155 ( 1.6) | 40 ( 1.8) |  |  |
| como_hypoth (%) | No | 36983 (93.5) | 9968 (93.7) | 9552 (93.6) | 6496 (93.5) | 8868 (93.1) | 2099 (93.8) | 0.462 |  |
|  | Yes | 2570 ( 6.5) | 671 ( 6.3) | 650 ( 6.4) | 454 ( 6.5) | 656 ( 6.9) | 139 ( 6.2) |  |  |
| como_cancers (%) | No | 38159 (96.5) | 10250 (96.3) | 9843 (96.5) | 6736 (96.9) | 9165 (96.2) | 2165 (96.7) | 0.151 |  |
|  | Yes | 1394 ( 3.5) | 389 ( 3.7) | 359 ( 3.5) | 214 ( 3.1) | 359 ( 3.8) | 73 ( 3.3) |  |  |
| meat_gram_ea_4 (%) | None | 19842 (50.2) | 8548 (80.3) | 4864 (47.7) | 2785 (40.1) | 3127 (32.8) | 518 (23.1) | \<0.001 |  |
|  | \<11 g/d | 6619 (16.7) | 1005 ( 9.4) | 2056 (20.2) | 1407 (20.2) | 1789 (18.8) | 362 (16.2) |  |  |
|  | 11-\<32 g/d | 6451 (16.3) | 601 ( 5.6) | 1872 (18.3) | 1401 (20.2) | 2090 (21.9) | 487 (21.8) |  |  |
|  | 32+ g/d | 6641 (16.8) | 485 ( 4.6) | 1410 (13.8) | 1357 (19.5) | 2518 (26.4) | 871 (38.9) |  |  |
| fish_gram_ea_4 (%) | None | 19356 (48.9) | 8001 (75.2) | 4799 (47.0) | 2751 (39.6) | 3198 (33.6) | 607 (27.1) | \<0.001 |  |
|  | \<9 g/d | 6623 (16.7) | 1026 ( 9.6) | 1903 (18.7) | 1306 (18.8) | 1870 (19.6) | 518 (23.1) |  |  |
|  | 9-\<18 g/d | 6885 (17.4) | 809 ( 7.6) | 1870 (18.3) | 1462 (21.0) | 2200 (23.1) | 544 (24.3) |  |  |
|  | 18+ g/d | 6689 (16.9) | 803 ( 7.5) | 1630 (16.0) | 1431 (20.6) | 2256 (23.7) | 569 (25.4) |  |  |
| totalveg_gram_ea_4 (%) | \<185 g/d | 10036 (25.4) | 2098 (19.7) | 2780 (27.2) | 1782 (25.6) | 2627 (27.6) | 749 (33.5) | \<0.001 |  |
|  | 185-\<270 g/d | 9787 (24.7) | 2364 (22.2) | 2480 (24.3) | 1834 (26.4) | 2560 (26.9) | 549 (24.5) |  |  |
|  | 270-\<380 g/d | 9959 (25.2) | 2706 (25.4) | 2570 (25.2) | 1780 (25.6) | 2405 (25.3) | 498 (22.3) |  |  |
|  | 378+ g/d | 9771 (24.7) | 3471 (32.6) | 2372 (23.3) | 1554 (22.4) | 1932 (20.3) | 442 (19.7) |  |  |
| fruits_gram_ea_4 (%) | \<170 g/d | 9931 (25.1) | 1562 (14.7) | 2526 (24.8) | 1830 (26.3) | 3039 (31.9) | 974 (43.5) | \<0.001 |  |
|  | 170-\<280 g/d | 9840 (24.9) | 2114 (19.9) | 2497 (24.5) | 1883 (27.1) | 2778 (29.2) | 568 (25.4) |  |  |
|  | 280-\<420 g/d | 9913 (25.1) | 2946 (27.7) | 2543 (24.9) | 1808 (26.0) | 2194 (23.0) | 422 (18.9) |  |  |
|  | 419+ g/d | 9869 (25.0) | 4017 (37.8) | 2636 (25.8) | 1429 (20.6) | 1513 (15.9) | 274 (12.2) |  |  |
| refgrains_gram_ea_4 (%) | \<40 g/d | 10331 (26.1) | 3936 (37.0) | 2484 (24.3) | 1408 (20.3) | 1952 (20.5) | 551 (24.6) | \<0.001 |  |
|  | 40-\<83 g/d | 9976 (25.2) | 2483 (23.3) | 2607 (25.6) | 1836 (26.4) | 2448 (25.7) | 602 (26.9) |  |  |
|  | 83-\<150 g/d | 9794 (24.8) | 2126 (20.0) | 2655 (26.0) | 1905 (27.4) | 2547 (26.7) | 561 (25.1) |  |  |
|  | 150+ g/d | 9452 (23.9) | 2094 (19.7) | 2456 (24.1) | 1801 (25.9) | 2577 (27.1) | 524 (23.4) |  |  |
| whole_mixed_grains_gram_ea_4 (%) | \<120 g/d | 10198 (25.8) | 1583 (14.9) | 2670 (26.2) | 1963 (28.2) | 3007 (31.6) | 975 (43.6) | \<0.001 |  |
|  | 120-\<210 g/d | 9687 (24.5) | 1963 (18.5) | 2561 (25.1) | 1900 (27.3) | 2688 (28.2) | 575 (25.7) |  |  |
|  | 210-\<350 g/d | 9687 (24.5) | 2913 (27.4) | 2387 (23.4) | 1654 (23.8) | 2298 (24.1) | 435 (19.4) |  |  |
|  | 350+ g/d | 9981 (25.2) | 4180 (39.3) | 2584 (25.3) | 1433 (20.6) | 1531 (16.1) | 253 (11.3) |  |  |
| nutsseeds_gram_ea_4 (%) | \<9 g/d | 10008 (25.3) | 2023 (19.0) | 2774 (27.2) | 1765 (25.4) | 2665 (28.0) | 781 (34.9) | \<0.001 |  |
|  | 9-\<19 g/d | 10343 (26.1) | 2263 (21.3) | 2740 (26.9) | 1918 (27.6) | 2811 (29.5) | 611 (27.3) |  |  |
|  | 19-\<33 g/d | 9776 (24.7) | 2783 (26.2) | 2386 (23.4) | 1818 (26.2) | 2313 (24.3) | 476 (21.3) |  |  |
|  | 33+ g/d | 9426 (23.8) | 3570 (33.6) | 2302 (22.6) | 1449 (20.8) | 1735 (18.2) | 370 (16.5) |  |  |
| legumes_gram_ea_4 (%) | (-Inf,33\] | 9741 (24.6) | 1898 (17.8) | 2548 (25.0) | 1688 (24.3) | 2767 (29.1) | 840 (37.5) | \<0.001 |  |
|  | (33,60\] | 9660 (24.4) | 2238 (21.0) | 2517 (24.7) | 1787 (25.7) | 2513 (26.4) | 605 (27.0) |  |  |
|  | (60,100\] | 10414 (26.3) | 2974 (28.0) | 2692 (26.4) | 1949 (28.0) | 2339 (24.6) | 460 (20.6) |  |  |
|  | (100, Inf\] | 9738 (24.6) | 3529 (33.2) | 2445 (24.0) | 1526 (22.0) | 1905 (20.0) | 333 (14.9) |  |  |

- A descriptive table of age at diagnosis by egg intake among cases is
  shown below:

|  | level | Overall | Never | 1-3/mo | 1/wk | 2-4/wk | 5+/wk | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 2866 | 911 | 689 | 472 | 663 | 131 |  |  |
| age_at_dx (mean (SD)) |  | 83.77 (7.80) | 83.71 (7.97) | 83.66 (7.75) | 84.02 (7.32) | 83.69 (8.05) | 84.17 (7.37) | 0.896 |  |

## Cox models

- To examine risk factors associated with incident Alzheimer’s disease,
  we employed the Cox proportional hazards model with attained age as
  the time scale
  - Age at entry was calculated based on the return date of AHS-2
    questionnaire
  - Those who died during the follow-up were censored at the date of
    death verified in Medicare data
  - Those who were diagnosed with Alzheimer’s disease after 6 months
    following study enrollment were identified as incident cases and
    their age at diagnosis was calculated.
    - The mean follow-up years was 15.2 years (median 16.7 years)
  - The main exposure variable of interest was the frequency of egg
    intake.
    - In the AHS-2 baseline questionnaire, the frequency of egg intake
      was measured in 9 categories, as shown in “Dietary variables”
      section above.
    - Based on its distribution, egg frequency was re-categorized into 5
      groups (see the “Descriptive table” section)
  - Other food group variables were categorized into 4 intake group, as
    descrived in “Dietary variable.” section.
- Table XX:
  - Unadjusted hazard ratio (HR) is shown in the first column of Table
    XX for each covariate
  - ~~Multivariable model 1 includes all covariates except for total
    energy intake (Unit: per 100 kcal/day) and 4 food group vairables~~
  - ~~In Multivariable model 2, dietary pattern was removed and all 4
    food group variables were added, while also adjusting for total
    energy intake.~~
- Trend p-values were displayed for ordinal variables (education, BMI
  categories, exercise, sleep hours and food group intakes) in
  multivariable models.
- The proportional hazards assumption was assessed with visual
  inspection of plots of the scaled Schoenfeld residuals for each
  covariate. None of the covariates showed severe violation of the
  assumption.

## Cox models with cubic spline terms for food group variables

- In the Cox models above:
  - Five categories of egg frequency were used.
  - Other food group variables were categorized into 4 intake groups.
- Instead of using these dietary variables as categorical,
  energy-adjusted gram weights of intake were entered into the models as
  continuous. Since the previous Cox models suggest a non-linear
  association between egg intake and our disease outcome, restricted
  cubic spline of energy-adjusted egg intake (gram/day) was used to
  model the nonlinearity. For other food groups, restricted cubic
  splines were employed if there is a statistically significant
  non-linear term; otherwise only the linear term was entered into the
  model.
  - The number of knots in the cubic splines was set to 4 knots.
- Among dietary variables, only the egg intake indicated a non-linear
  association
  - A plot of adjusted hazard ratio was produced to visualize how HR
    changes over a range of egg intake.
  - For eggs, an intake of 10 gram/day was chosen to be its reference
    value of the HR plot.

![](summary_Alzheimer_files/figure-gfm/cubic_spline-1.png)<!-- -->

- Tables below shows adjusted HR for some representative values of egg
  gram intake (reference = 10 gram/day).

| eggs_gram_ea |   HR | lower | upper |
|-------------:|-----:|------:|------:|
|            0 | 1.22 |  1.11 |  1.34 |
|           20 | 0.97 |  0.92 |  1.02 |
|           30 | 0.95 |  0.88 |  1.02 |
|           40 | 0.94 |  0.86 |  1.04 |
|           50 | 0.94 |  0.82 |  1.07 |

## Supplementary analysis

### Comparison of egg intake at baseline and at HHF6 questionnaire

- Frequency of egg intake was compared between the baseline
  questionnaire and HHF version 6
  - In HHF6, the frequency of egg intake was asked in the same format as
    in the baseline questionnaire (9 options)
  - Among our analytic sample, there are n = 23,906 subjects (60.4%) who
    returned HHF6 questionnaire
  - After excluding n = 743 invalid responses on egg frequency, there
    were n = 23,163 in the crosstab below
  - (Columns are egg frequency at baseline; Rows are from HHF6)
- The percentage of exact agreement (# in the main diagonals / total)
  was 39%. The percent of adjacent agreement (including those one
  above/below the main diagonals as agreement) was 74%. The Fleiss-Cohen
  weighted Kappa was 0.46.

|          | Never | 1-3x/mo | 1x/wk | 2-4x/wk | 5-6x/wk | 1x/day | 2-3x/day | 4-5x/day | 6+x/day |
|:---------|------:|--------:|------:|--------:|--------:|-------:|---------:|---------:|--------:|
| Never    |  3136 |     834 |   315 |     299 |      37 |     21 |        8 |        0 |       1 |
| 1-3x/mo  |  1431 |    1802 |   774 |     660 |      64 |     36 |       10 |        0 |       0 |
| 1x/wk    |   783 |    1422 |  1188 |    1076 |      77 |     32 |       15 |        1 |       0 |
| 2-4x/wk  |   710 |    1518 |  1570 |    2657 |     329 |    108 |       50 |        4 |       0 |
| 5-6x/wk  |    90 |     167 |   210 |     473 |     110 |     40 |       16 |        1 |       0 |
| 1x/day   |    79 |     116 |   111 |     278 |      69 |     66 |       23 |        0 |       0 |
| 2-3x/day |    29 |      36 |    47 |     102 |      36 |     24 |       41 |        1 |       3 |
| 4-5x/day |     3 |       3 |     3 |       3 |       2 |      1 |        0 |        1 |       0 |
| 6+x/day  |     2 |       1 |     1 |       4 |       1 |      2 |        0 |        0 |       0 |

## Notes for additional analyses

- ~~Combine semi- and non-vegetarians into one group and make this as
  reference – Done.~~

- Run the following models:

  - ~~MV1 + egg (retain dietary groups) – Done. HRs very similar to
    those in Model 1 or 2.~~
  - ~~Separate meat into two food group variables, beef and poultry,
    while excluding pork from the model – Still waiting for data from
    DS.~~
  - Explore interactions between meat (as a whole) and egg intake – The
    interaction term was not significant at all (p = 0.69).

- TO DO

  - ~~Get meat sub-group variables (both gram and kcal intake) from
    Lars? – see below~~
  - ~~Incorporate VB12, omega-3, and folate from lupus data – For a
    separate paper~~
  - Get data with correct dairy intake
  - Get all imputed datasets and run analysis for pooled HR estimates
  - Get HHF6 data to compare egg intake with baseline – Done
  - Exclude those subjects who live outside the US for some time during
    follow-up – Done, none found in the data

- Concerns:

  - ~~RTI Race – see the [definition of RTI
    race](https://resdac.org/cms-data/variables/research-triangle-institute-rti-race-code):
    what to do with others? Exclude them?~~
  - Egg eaters among vegans? – misclassification
  - ~~Definition of physical activity: Look for Vichuda’s paper –
    Changed exercise min/wk~~
  - ~~Separate hypertension and hyperlipidemia – Done~~
  - ~~Include anemia as a comorbidity variable – Done~~
  - ~~Semi-veg: exclude them entirely, or keep it combined with
    non-veg?~~

- Plans

  - Two papers:
    - Egg intake and dementia (1st paper)
    - Dietary pattern and dementia (2nd paper)
  - For the first paper;
    - \~~For egg intake, use its frequency – need to collapse~
    - ~~Need other food groups: vegetables, fruits, grains, nuts/seeds,
      legumes – get data from GF (along with meat as food group)~~
    - ~~Need nutrient variables: Carotenoids (LYCO, LUTE, LZ, ZEA)? – JO
      to think about~~
    - ~~Crosstab b/w egg and meat intake – Done~~
    - ~~Mean/percentiles by egg intake group – Done~~
    - ~~Re-label egg intake groups~~
    - Model with and without comobidity
      - Model 1a: Demographics and lifestyle + Egg
      - Model 1b: Add comorbidity
      - ~~Model 2a: Model 1a + other food groups~~
      - Model 2b: Model 1b + other food groups
  - For the second paper:
    - Keep semi-veg together with non-veg for now
