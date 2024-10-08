Egg dementia study
================

## Aim

- Association between egg intake and the incidence of
  dementia/Alzheimer’s disease in the AHS-2 cohort linked with Medicare
  data

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

- AHS-2

  - Baseline data: n = 96,144
  - Dietary data: n = 87,891

- After merging Medicare and AHS-2 data, there were n = 41,172 subjects.

- Among n = 41,172 subjects, there were n = 143 subjects who opted out
  from the study. Excluding these subjects yielded n = 41,029.

## Inclusion/exclusion criteria

- Medicare beneficiaries who did not reach the age of 65 between 2008
  and 2020 (e.g., younger beneficiaries with disabilities or end-stage
  renal disease) were excluded (n = 1339), resulting n = 39,690.

- n = 1106 subjects with missing BMI or extreme BMI (\<16 or \>60),
  according to AHS questionnaire, were excluded, resulting n = 38,584.

- n = 108 subjects with extreme calorie intake (\<500 or \>4500 kcal)
  were excluded, resulting n = 38,476.

- Prevalent cases of dementia and/or Alzheimer’s disease

  - If the first diagnosis was made before AHS-2 enrollment or within 6
    months after the enrollment, consider it as a prevalent case
  - n = 363 such prevalent cases were excluded, resulting n = 38,113
    subjects

- Unverified dates of deaths

  - Medicare data include a variable (`VALID_DEATH_DT_SW`) indicating
    whether a beneficiary’s day of death has been verified by the Social
    Security Administration or the Railroad Retirement Board.
  - There were 18 unverified death dates. Excluding these resulted n =
    38,095.

- Missing values in covariates

  - There were n = 3061 subjects who has at least one missing value on
    covariates (such as marital status, education, exercise level, sleep
    hours, smoking and alcohol use, all of them come from AHS
    questionnaire). These subjects were excluded, resulting in n =
    35,034.

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
    quartile groups.
  - For cut-off values of the four food groups, please see the
    descriptive table below.

- Mean and 25th, 50th, 75th percentiles of gram intake by intake group
  are shown below:

| meat_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 18113 | 51.70 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<11 g/d       |  5584 | 15.94 |  5.79 |  3.95 |  5.72 |  7.58 |
| 11-\<32 g/d    |  5608 | 16.01 | 19.38 | 14.36 | 18.43 | 23.81 |
| 32+ g/d        |  5729 | 16.35 | 63.17 | 41.46 | 54.69 | 74.88 |

| fish_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 17923 | 51.16 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<8.6 g/d      |  5692 | 16.25 |  5.24 |  3.50 |  5.40 |  6.90 |
| 8.6-\<17.2 g/d |  5796 | 16.54 | 12.54 | 10.39 | 12.36 | 14.57 |
| 17.2+ g/d      |  5623 | 16.05 | 35.59 | 20.82 | 27.10 | 41.60 |

| dairy_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:----------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<30 g/d        | 8759 |  25 |  12.32 |   5.15 |  10.45 |  19.10 |
| 30-100 g/d      | 8758 |  25 |  59.91 |  42.30 |  57.61 |  76.47 |
| 100-\<236 g/d   | 8758 |  25 | 160.59 | 125.91 | 157.60 | 193.40 |
| 236+ g/d        | 8759 |  25 | 430.11 | 289.36 | 363.09 | 496.21 |

| nutsseeds_gram_ea_4 |    n | pct |  mean |    p1 |    p2 |    p3 |
|:--------------------|-----:|----:|------:|------:|------:|------:|
| \<9.54 g/d          | 8759 |  25 |  5.03 |  2.80 |  5.27 |  7.43 |
| 9.54-\<19 g/d       | 8758 |  25 | 14.11 | 11.77 | 13.98 | 16.45 |
| 19-\<33 g/d         | 8758 |  25 | 25.40 | 22.02 | 25.16 | 28.65 |
| 33+ g/d             | 8759 |  25 | 51.17 | 38.26 | 45.44 | 57.61 |

| totalveg_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:-------------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<182 g/d          | 8759 |  25 | 125.58 |  98.30 | 132.07 | 159.40 |
| 182-\<269 g/d      | 8758 |  25 | 225.17 | 203.77 | 225.16 | 246.66 |
| 269-\<379 g/d      | 8758 |  25 | 319.27 | 291.97 | 316.75 | 345.47 |
| 379+ g/d           | 8759 |  25 | 540.49 | 421.34 | 482.93 | 587.00 |

| fruits_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:-----------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<168 g/d        | 8759 |  25 | 101.22 |  68.94 | 107.23 | 138.33 |
| 168-\<279 g/d    | 8758 |  25 | 223.43 | 196.35 | 222.79 | 250.87 |
| 279-\<418 g/d    | 8758 |  25 | 343.31 | 308.46 | 341.15 | 376.39 |
| 418+ g/d         | 8759 |  25 | 618.87 | 472.00 | 547.65 | 687.45 |

| legumes_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:------------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<33.6 g/d        | 8759 |  25 |  17.02 |   8.73 |  17.73 |  25.95 |
| 33.6-\<61.0 g/d   | 8758 |  25 |  47.34 |  40.61 |  47.32 |  54.06 |
| 61.0-\<99.2 g/d   | 8758 |  25 |  77.84 |  68.63 |  76.88 |  86.46 |
| 99.2+ g/d         | 8759 |  25 | 169.85 | 116.14 | 142.86 | 194.98 |

| refgrains_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:--------------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<37.8 g/d          | 8759 |  25 |  20.43 |  12.79 |  21.20 |  29.47 |
| 37.8-\<79.1 g/d     | 8758 |  25 |  57.46 |  47.18 |  56.93 |  67.55 |
| 79.1-\<144 g/d      | 8758 |  25 | 108.06 |  91.87 | 106.47 | 123.29 |
| 144+ g/d            | 8759 |  25 | 273.35 | 172.24 | 219.27 | 314.25 |

| whole_mixed_grains_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:-----------------------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<144 g/d                    | 8759 |  25 |  68.59 |  47.41 |  72.52 |  94.57 |
| 144-\<208 g/d                | 8758 |  25 | 158.08 | 134.22 | 156.78 | 180.55 |
| 208-\<358 g/d                | 8758 |  25 | 276.34 | 239.04 | 273.28 | 311.98 |
| 358+ g/d                     | 8759 |  25 | 545.90 | 414.18 | 492.08 | 626.06 |

- For egg intake and meat intake, a crosstab was produced:
  - The first table was stratified by meat intake (% of egg intake
    within each meat level)
  - The second table was stratified by egg intake (% of meat intake
    within each egg level)

|  | level | None | \<11 g/d | 11-\<32 g/d | 32+ g/d | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 18113 | 5584 | 5608 | 5729 |  |  |
| egg_freq (%) | Never | 7831 (43.2) | 829 (14.8) | 515 ( 9.2) | 446 ( 7.8) | \<0.001 |  |
|  | 1-3/mo | 4381 (24.2) | 1727 (30.9) | 1586 (28.3) | 1225 (21.4) |  |  |
|  | 1/wk | 2564 (14.2) | 1175 (21.0) | 1222 (21.8) | 1183 (20.6) |  |  |
|  | 2-4/wk | 2864 (15.8) | 1523 (27.3) | 1855 (33.1) | 2138 (37.3) |  |  |
|  | 5+/wk | 473 ( 2.6) | 330 ( 5.9) | 430 ( 7.7) | 737 (12.9) |  |  |

|  | level | Never | 1-3/mo | 1/wk | 2-4/wk | 5+/wk | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 9621 | 8919 | 6144 | 8380 | 1970 |  |  |
| meat_gram_ea_4 (%) | None | 7831 (81.4) | 4381 (49.1) | 2564 (41.7) | 2864 (34.2) | 473 (24.0) | \<0.001 |  |
|  | \<11 g/d | 829 ( 8.6) | 1727 (19.4) | 1175 (19.1) | 1523 (18.2) | 330 (16.8) |  |  |
|  | 11-\<32 g/d | 515 ( 5.4) | 1586 (17.8) | 1222 (19.9) | 1855 (22.1) | 430 (21.8) |  |  |
|  | 32+ g/d | 446 ( 4.6) | 1225 (13.7) | 1183 (19.3) | 2138 (25.5) | 737 (37.4) |  |  |

- Frequency tables of egg intake frequency and serving size are shown
  below:

|              | Overall     |
|:-------------|:------------|
| n            | 35034       |
| eggbetrf (%) |             |
| Never        | 9621 (27.5) |
| 1-3x/mo      | 8919 (25.5) |
| 1x/wk        | 6144 (17.5) |
| 2-4x/wk      | 8380 (23.9) |
| 5-6x/wk      | 1176 ( 3.4) |
| 1x/day       | 511 ( 1.5)  |
| 2-3x/day     | 264 ( 0.8)  |
| 4-5x/day     | 14 ( 0.0)   |
| 6+x/day      | 5 ( 0.0)    |

|              | Overall      |
|:-------------|:-------------|
| n            | 35034        |
| eggbetra (%) |              |
| 1/2 serv     | 2535 ( 7.2)  |
| 1 serv       | 19944 (56.9) |
| 1.5+ serv    | 6279 (17.9)  |
| NA           | 6276 (17.9)  |

|              | 1/2 serv    | 1 serv      | 1.5+ serv   | missing      | p       | test |
|:-------------|:------------|:------------|:------------|:-------------|:--------|:-----|
| n            | 2535        | 19944       | 6279        | 6276         |         |      |
| eggbetrf (%) |             |             |             |              | \<0.001 |      |
| Never        | 1203 (47.5) | 1927 ( 9.7) | 215 ( 3.4)  | 6276 (100.0) |         |      |
| 1-3x/mo      | 782 (30.8)  | 6582 (33.0) | 1555 (24.8) | 0 ( 0.0)     |         |      |
| 1x/wk        | 249 ( 9.8)  | 4389 (22.0) | 1506 (24.0) | 0 ( 0.0)     |         |      |
| 2-4x/wk      | 255 (10.1)  | 5740 (28.8) | 2385 (38.0) | 0 ( 0.0)     |         |      |
| 5-6x/wk      | 26 ( 1.0)   | 769 ( 3.9)  | 381 ( 6.1)  | 0 ( 0.0)     |         |      |
| 1x/day       | 14 ( 0.6)   | 381 ( 1.9)  | 116 ( 1.8)  | 0 ( 0.0)     |         |      |
| 2-3x/day     | 4 ( 0.2)    | 147 ( 0.7)  | 113 ( 1.8)  | 0 ( 0.0)     |         |      |
| 4-5x/day     | 2 ( 0.1)    | 7 ( 0.0)    | 5 ( 0.1)    | 0 ( 0.0)     |         |      |
| 6+x/day      | 0 ( 0.0)    | 2 ( 0.0)    | 3 ( 0.0)    | 0 ( 0.0)     |         |      |

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
  83.2 years (median 84.0 years)

|  | level | Overall | Non-case | Case | p | test |
|:---|:---|:---|:---|:---|:---|:---|
| n |  | 35034 | 29234 | 5800 |  |  |
| agecat (%) | 65-69 | 6213 (17.7) | 6122 (20.9) | 91 ( 1.6) | \<0.001 |  |
|  | 70-74 | 6351 (18.1) | 6104 (20.9) | 247 ( 4.3) |  |  |
|  | 75-79 | 5648 (16.1) | 5195 (17.8) | 453 ( 7.8) |  |  |
|  | 80-84 | 4997 (14.3) | 4224 (14.4) | 773 (13.3) |  |  |
|  | 85-89 | 4398 (12.6) | 3281 (11.2) | 1117 (19.3) |  |  |
|  | 90-94 | 3675 (10.5) | 2316 ( 7.9) | 1359 (23.4) |  |  |
|  | 95+ | 3752 (10.7) | 1992 ( 6.8) | 1760 (30.3) |  |  |
| bene_age_at_end_2020 (mean (SD)) |  | 80.71 (10.33) | 78.85 (9.58) | 90.11 (8.74) | \<0.001 |  |
| age_medicare_cat (%) | \<50 | 524 ( 1.5) | 440 ( 1.5) | 84 ( 1.4) | \<0.001 |  |
|  | 50-54 | 414 ( 1.2) | 341 ( 1.2) | 73 ( 1.3) |  |  |
|  | 55-59 | 799 ( 2.3) | 650 ( 2.2) | 149 ( 2.6) |  |  |
|  | 60-63 | 818 ( 2.3) | 664 ( 2.3) | 154 ( 2.7) |  |  |
|  | 64 | 29907 (85.4) | 24967 (85.4) | 4940 (85.2) |  |  |
|  | 65 | 1486 ( 4.2) | 1312 ( 4.5) | 174 ( 3.0) |  |  |
|  | 66-69 | 923 ( 2.6) | 745 ( 2.5) | 178 ( 3.1) |  |  |
|  | 70+ | 163 ( 0.5) | 115 ( 0.4) | 48 ( 0.8) |  |  |
| age_medicare_cont (mean (SD)) |  | 64.36 (3.47) | 64.36 (3.43) | 64.37 (3.65) | 0.729 |  |
| bene_sex_F (%) | M | 12684 (36.2) | 10684 (36.5) | 2000 (34.5) | 0.003 |  |
|  | F | 22350 (63.8) | 18550 (63.5) | 3800 (65.5) |  |  |
| rti_race3 (%) | NH White | 26347 (75.2) | 21517 (73.6) | 4830 (83.3) | \<0.001 |  |
|  | Black | 6371 (18.2) | 5589 (19.1) | 782 (13.5) |  |  |
|  | Other | 2316 ( 6.6) | 2128 ( 7.3) | 188 ( 3.2) |  |  |
| marital (%) | Married | 25969 (74.1) | 22092 (75.6) | 3877 (66.8) | \<0.001 |  |
|  | Never | 1156 ( 3.3) | 998 ( 3.4) | 158 ( 2.7) |  |  |
|  | Div/Wid | 7909 (22.6) | 6144 (21.0) | 1765 (30.4) |  |  |
| educyou (%) | HS or less | 7159 (20.4) | 5662 (19.4) | 1497 (25.8) | \<0.001 |  |
|  | Some college | 13824 (39.5) | 11580 (39.6) | 2244 (38.7) |  |  |
|  | Col grad+ | 14051 (40.1) | 11992 (41.0) | 2059 (35.5) |  |  |
| vegstat (%) | Vegan | 3155 ( 9.0) | 2535 ( 8.7) | 620 (10.7) | \<0.001 |  |
|  | Lacto-ovo | 11892 (33.9) | 9681 (33.1) | 2211 (38.1) |  |  |
|  | Semi | 1994 ( 5.7) | 1671 ( 5.7) | 323 ( 5.6) |  |  |
|  | Pesco | 3216 ( 9.2) | 2687 ( 9.2) | 529 ( 9.1) |  |  |
|  | Non-veg | 14777 (42.2) | 12660 (43.3) | 2117 (36.5) |  |  |
| bmicat (%) | Normal | 13756 (39.3) | 11256 (38.5) | 2500 (43.1) | \<0.001 |  |
|  | Overweight | 12651 (36.1) | 10589 (36.2) | 2062 (35.6) |  |  |
|  | Obese | 8627 (24.6) | 7389 (25.3) | 1238 (21.3) |  |  |
| bmi (mean (SD)) |  | 27.17 (5.45) | 27.27 (5.48) | 26.63 (5.27) | \<0.001 |  |
| exercise (%) | None | 8291 (23.7) | 6787 (23.2) | 1504 (25.9) | \<0.001 |  |
|  | Low | 7877 (22.5) | 6596 (22.6) | 1281 (22.1) |  |  |
|  | Moderate | 11660 (33.3) | 9811 (33.6) | 1849 (31.9) |  |  |
|  | Vigorous | 7206 (20.6) | 6040 (20.7) | 1166 (20.1) |  |  |
| sleephrs (%) | \<= 5 hrs | 3268 ( 9.3) | 2752 ( 9.4) | 516 ( 8.9) | \<0.001 |  |
|  | 6 hrs | 7592 (21.7) | 6447 (22.1) | 1145 (19.7) |  |  |
|  | 7 hrs | 12875 (36.8) | 10992 (37.6) | 1883 (32.5) |  |  |
|  | 8 hrs | 9345 (26.7) | 7550 (25.8) | 1795 (30.9) |  |  |
|  | \>= 9 hrs | 1954 ( 5.6) | 1493 ( 5.1) | 461 ( 7.9) |  |  |
| smokecat (%) | Never | 27971 (79.8) | 23252 (79.5) | 4719 (81.4) | 0.002 |  |
|  | Ever | 7063 (20.2) | 5982 (20.5) | 1081 (18.6) |  |  |
| alccat (%) | Never | 21646 (61.8) | 17588 (60.2) | 4058 (70.0) | \<0.001 |  |
|  | Ever | 13388 (38.2) | 11646 (39.8) | 1742 (30.0) |  |  |
| como_depress (%) | No | 33771 (96.4) | 28513 (97.5) | 5258 (90.7) | \<0.001 |  |
|  | Yes | 1263 ( 3.6) | 721 ( 2.5) | 542 ( 9.3) |  |  |
| como_disab (%) | No | 26832 (76.6) | 24297 (83.1) | 2535 (43.7) | \<0.001 |  |
|  | Yes | 8202 (23.4) | 4937 (16.9) | 3265 (56.3) |  |  |
| como_diabetes (%) | No | 33077 (94.4) | 28005 (95.8) | 5072 (87.4) | \<0.001 |  |
|  | Yes | 1957 ( 5.6) | 1229 ( 4.2) | 728 (12.6) |  |  |
| como_cvd (%) | No | 30845 (88.0) | 26766 (91.6) | 4079 (70.3) | \<0.001 |  |
|  | Yes | 4189 (12.0) | 2468 ( 8.4) | 1721 (29.7) |  |  |
| como_hypert (%) | No | 29243 (83.5) | 25737 (88.0) | 3506 (60.4) | \<0.001 |  |
|  | Yes | 5791 (16.5) | 3497 (12.0) | 2294 (39.6) |  |  |
| como_hyperl (%) | No | 29746 (84.9) | 25921 (88.7) | 3825 (65.9) | \<0.001 |  |
|  | Yes | 5288 (15.1) | 3313 (11.3) | 1975 (34.1) |  |  |
| como_resp (%) | No | 33703 (96.2) | 28419 (97.2) | 5284 (91.1) | \<0.001 |  |
|  | Yes | 1331 ( 3.8) | 815 ( 2.8) | 516 ( 8.9) |  |  |
| como_anemia (%) | No | 31926 (91.1) | 27413 (93.8) | 4513 (77.8) | \<0.001 |  |
|  | Yes | 3108 ( 8.9) | 1821 ( 6.2) | 1287 (22.2) |  |  |
| como_kidney (%) | No | 34605 (98.8) | 28973 (99.1) | 5632 (97.1) | \<0.001 |  |
|  | Yes | 429 ( 1.2) | 261 ( 0.9) | 168 ( 2.9) |  |  |
| como_hypoth (%) | No | 32845 (93.8) | 27951 (95.6) | 4894 (84.4) | \<0.001 |  |
|  | Yes | 2189 ( 6.2) | 1283 ( 4.4) | 906 (15.6) |  |  |
| como_cancers (%) | No | 33829 (96.6) | 28492 (97.5) | 5337 (92.0) | \<0.001 |  |
|  | Yes | 1205 ( 3.4) | 742 ( 2.5) | 463 ( 8.0) |  |  |
| egg_freq (%) | Never | 9621 (27.5) | 7776 (26.6) | 1845 (31.8) | \<0.001 |  |
|  | 1-3/mo | 8919 (25.5) | 7529 (25.8) | 1390 (24.0) |  |  |
|  | 1/wk | 6144 (17.5) | 5231 (17.9) | 913 (15.7) |  |  |
|  | 2-4/wk | 8380 (23.9) | 7045 (24.1) | 1335 (23.0) |  |  |
|  | 5+/wk | 1970 ( 5.6) | 1653 ( 5.7) | 317 ( 5.5) |  |  |
| meat_gram_ea_4 (%) | None | 18113 (51.7) | 14784 (50.6) | 3329 (57.4) | \<0.001 |  |
|  | \<11 g/d | 5584 (15.9) | 4658 (15.9) | 926 (16.0) |  |  |
|  | 11-\<32 g/d | 5608 (16.0) | 4776 (16.3) | 832 (14.3) |  |  |
|  | 32+ g/d | 5729 (16.4) | 5016 (17.2) | 713 (12.3) |  |  |
| fish_gram_ea_4 (%) | None | 17923 (51.2) | 14639 (50.1) | 3284 (56.6) | \<0.001 |  |
|  | \<8.6 g/d | 5692 (16.2) | 4716 (16.1) | 976 (16.8) |  |  |
|  | 8.6-\<17.2 g/d | 5796 (16.5) | 4973 (17.0) | 823 (14.2) |  |  |
|  | 17.2+ g/d | 5623 (16.1) | 4906 (16.8) | 717 (12.4) |  |  |
| dairy_gram_ea_4 (%) | \<30 g/d | 8759 (25.0) | 7184 (24.6) | 1575 (27.2) | \<0.001 |  |
|  | 30-100 g/d | 8758 (25.0) | 7411 (25.4) | 1347 (23.2) |  |  |
|  | 100-\<236 g/d | 8758 (25.0) | 7363 (25.2) | 1395 (24.1) |  |  |
|  | 236+ g/d | 8759 (25.0) | 7276 (24.9) | 1483 (25.6) |  |  |
| totalveg_gram_ea_4 (%) | \<182 g/d | 8759 (25.0) | 7355 (25.2) | 1404 (24.2) | 0.043 |  |
|  | 182-\<269 g/d | 8758 (25.0) | 7345 (25.1) | 1413 (24.4) |  |  |
|  | 269-\<379 g/d | 8758 (25.0) | 7305 (25.0) | 1453 (25.1) |  |  |
|  | 379+ g/d | 8759 (25.0) | 7229 (24.7) | 1530 (26.4) |  |  |
| fruits_gram_ea_4 (%) | \<168 g/d | 8759 (25.0) | 7583 (25.9) | 1176 (20.3) | \<0.001 |  |
|  | 168-\<279 g/d | 8758 (25.0) | 7363 (25.2) | 1395 (24.1) |  |  |
|  | 279-\<418 g/d | 8758 (25.0) | 7173 (24.5) | 1585 (27.3) |  |  |
|  | 418+ g/d | 8759 (25.0) | 7115 (24.3) | 1644 (28.3) |  |  |
| refgrains_gram_ea_4 (%) | \<37.8 g/d | 8759 (25.0) | 6970 (23.8) | 1789 (30.8) | \<0.001 |  |
|  | 37.8-\<79.1 g/d | 8758 (25.0) | 7283 (24.9) | 1475 (25.4) |  |  |
|  | 79.1-\<144 g/d | 8758 (25.0) | 7450 (25.5) | 1308 (22.6) |  |  |
|  | 144+ g/d | 8759 (25.0) | 7531 (25.8) | 1228 (21.2) |  |  |
| whole_mixed_grains_gram_ea_4 (%) | \<144 g/d | 8759 (25.0) | 7569 (25.9) | 1190 (20.5) | \<0.001 |  |
|  | 144-\<208 g/d | 8758 (25.0) | 7355 (25.2) | 1403 (24.2) |  |  |
|  | 208-\<358 g/d | 8758 (25.0) | 7209 (24.7) | 1549 (26.7) |  |  |
|  | 358+ g/d | 8759 (25.0) | 7101 (24.3) | 1658 (28.6) |  |  |
| nutsseeds_gram_ea_4 (%) | \<9.54 g/d | 8759 (25.0) | 7497 (25.6) | 1262 (21.8) | \<0.001 |  |
|  | 9.54-\<19 g/d | 8758 (25.0) | 7399 (25.3) | 1359 (23.4) |  |  |
|  | 19-\<33 g/d | 8758 (25.0) | 7281 (24.9) | 1477 (25.5) |  |  |
|  | 33+ g/d | 8759 (25.0) | 7057 (24.1) | 1702 (29.3) |  |  |
| legumes_gram_ea_4 (%) | \<33.6 g/d | 8759 (25.0) | 7304 (25.0) | 1455 (25.1) | 0.014 |  |
|  | 33.6-\<61.0 g/d | 8758 (25.0) | 7218 (24.7) | 1540 (26.6) |  |  |
|  | 61.0-\<99.2 g/d | 8758 (25.0) | 7364 (25.2) | 1394 (24.0) |  |  |
|  | 99.2+ g/d | 8759 (25.0) | 7348 (25.1) | 1411 (24.3) |  |  |

## Descriptive table by egg intake

|  | level | Overall | Never | 1-3/mo | 1/wk | 2-4/wk | 5+/wk | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 35034 | 9621 | 8919 | 6144 | 8380 | 1970 |  |  |
| ALZH_DEMEN_YN2 (%) | Non-case | 29234 (83.4) | 7776 (80.8) | 7529 (84.4) | 5231 (85.1) | 7045 (84.1) | 1653 (83.9) | \<0.001 |  |
|  | Case | 5800 (16.6) | 1845 (19.2) | 1390 (15.6) | 913 (14.9) | 1335 (15.9) | 317 (16.1) |  |  |
| agecat (%) | 65-69 | 6213 (17.7) | 1548 (16.1) | 1678 (18.8) | 1108 (18.0) | 1515 (18.1) | 364 (18.5) | \<0.001 |  |
|  | 70-74 | 6351 (18.1) | 1665 (17.3) | 1665 (18.7) | 1142 (18.6) | 1520 (18.1) | 359 (18.2) |  |  |
|  | 75-79 | 5648 (16.1) | 1539 (16.0) | 1457 (16.3) | 988 (16.1) | 1310 (15.6) | 354 (18.0) |  |  |
|  | 80-84 | 4997 (14.3) | 1388 (14.4) | 1249 (14.0) | 859 (14.0) | 1226 (14.6) | 275 (14.0) |  |  |
|  | 85-89 | 4398 (12.6) | 1252 (13.0) | 1080 (12.1) | 793 (12.9) | 1033 (12.3) | 240 (12.2) |  |  |
|  | 90-94 | 3675 (10.5) | 1084 (11.3) | 882 ( 9.9) | 628 (10.2) | 874 (10.4) | 207 (10.5) |  |  |
|  | 95+ | 3752 (10.7) | 1145 (11.9) | 908 (10.2) | 626 (10.2) | 902 (10.8) | 171 ( 8.7) |  |  |
| bene_age_at_end_2020 (mean (SD)) |  | 80.71 (10.33) | 81.38 (10.45) | 80.29 (10.26) | 80.52 (10.27) | 80.68 (10.37) | 80.10 (9.97) | \<0.001 |  |
| bene_sex_F (%) | M | 12684 (36.2) | 3420 (35.5) | 2944 (33.0) | 2443 (39.8) | 3059 (36.5) | 818 (41.5) | \<0.001 |  |
|  | F | 22350 (63.8) | 6201 (64.5) | 5975 (67.0) | 3701 (60.2) | 5321 (63.5) | 1152 (58.5) |  |  |
| rti_race3 (%) | NH White | 26347 (75.2) | 7103 (73.8) | 6411 (71.9) | 4784 (77.9) | 6452 (77.0) | 1597 (81.1) | \<0.001 |  |
|  | Black | 6371 (18.2) | 1932 (20.1) | 1878 (21.1) | 911 (14.8) | 1379 (16.5) | 271 (13.8) |  |  |
|  | Other | 2316 ( 6.6) | 586 ( 6.1) | 630 ( 7.1) | 449 ( 7.3) | 549 ( 6.6) | 102 ( 5.2) |  |  |
| marital (%) | Married | 25969 (74.1) | 7059 (73.4) | 6417 (71.9) | 4797 (78.1) | 6262 (74.7) | 1434 (72.8) | \<0.001 |  |
|  | Never | 1156 ( 3.3) | 378 ( 3.9) | 319 ( 3.6) | 157 ( 2.6) | 253 ( 3.0) | 49 ( 2.5) |  |  |
|  | Div/Wid | 7909 (22.6) | 2184 (22.7) | 2183 (24.5) | 1190 (19.4) | 1865 (22.3) | 487 (24.7) |  |  |
| educyou (%) | HS or less | 7159 (20.4) | 1828 (19.0) | 1915 (21.5) | 1196 (19.5) | 1762 (21.0) | 458 (23.2) | \<0.001 |  |
|  | Some college | 13824 (39.5) | 3664 (38.1) | 3495 (39.2) | 2359 (38.4) | 3448 (41.1) | 858 (43.6) |  |  |
|  | Col grad+ | 14051 (40.1) | 4129 (42.9) | 3509 (39.3) | 2589 (42.1) | 3170 (37.8) | 654 (33.2) |  |  |
| vegstat (%) | Vegan | 3155 ( 9.0) | 3155 (32.8) | 0 ( 0.0) | 0 ( 0.0) | 0 ( 0.0) | 0 ( 0.0) | \<0.001 |  |
|  | Lacto-ovo | 11892 (33.9) | 3841 (39.9) | 3517 (39.4) | 2023 (32.9) | 2161 (25.8) | 350 (17.8) |  |  |
|  | Semi | 1994 ( 5.7) | 333 ( 3.5) | 668 ( 7.5) | 409 ( 6.7) | 496 ( 5.9) | 88 ( 4.5) |  |  |
|  | Pesco | 3216 ( 9.2) | 890 ( 9.3) | 899 (10.1) | 571 ( 9.3) | 727 ( 8.7) | 129 ( 6.5) |  |  |
|  | Non-veg | 14777 (42.2) | 1402 (14.6) | 3835 (43.0) | 3141 (51.1) | 4996 (59.6) | 1403 (71.2) |  |  |
| bmicat (%) | Normal | 13756 (39.3) | 5103 (53.0) | 3438 (38.5) | 2240 (36.5) | 2509 (29.9) | 466 (23.7) | \<0.001 |  |
|  | Overweight | 12651 (36.1) | 2978 (31.0) | 3357 (37.6) | 2396 (39.0) | 3220 (38.4) | 700 (35.5) |  |  |
|  | Obese | 8627 (24.6) | 1540 (16.0) | 2124 (23.8) | 1508 (24.5) | 2651 (31.6) | 804 (40.8) |  |  |
| bmi (mean (SD)) |  | 27.17 (5.45) | 25.56 (4.95) | 27.16 (5.34) | 27.38 (5.29) | 28.33 (5.61) | 29.41 (5.99) | \<0.001 |  |
| exercise (%) | None | 8291 (23.7) | 1760 (18.3) | 2245 (25.2) | 1473 (24.0) | 2192 (26.2) | 621 (31.5) | \<0.001 |  |
|  | Low | 7877 (22.5) | 1937 (20.1) | 1975 (22.1) | 1454 (23.7) | 2056 (24.5) | 455 (23.1) |  |  |
|  | Moderate | 11660 (33.3) | 3399 (35.3) | 2912 (32.6) | 2052 (33.4) | 2722 (32.5) | 575 (29.2) |  |  |
|  | Vigorous | 7206 (20.6) | 2525 (26.2) | 1787 (20.0) | 1165 (19.0) | 1410 (16.8) | 319 (16.2) |  |  |
| sleephrs (%) | \<= 5 hrs | 3268 ( 9.3) | 857 ( 8.9) | 907 (10.2) | 515 ( 8.4) | 785 ( 9.4) | 204 (10.4) | \<0.001 |  |
|  | 6 hrs | 7592 (21.7) | 1981 (20.6) | 2079 (23.3) | 1284 (20.9) | 1811 (21.6) | 437 (22.2) |  |  |
|  | 7 hrs | 12875 (36.8) | 3577 (37.2) | 3170 (35.5) | 2366 (38.5) | 3095 (36.9) | 667 (33.9) |  |  |
|  | 8 hrs | 9345 (26.7) | 2691 (28.0) | 2272 (25.5) | 1649 (26.8) | 2204 (26.3) | 529 (26.9) |  |  |
|  | \>= 9 hrs | 1954 ( 5.6) | 515 ( 5.4) | 491 ( 5.5) | 330 ( 5.4) | 485 ( 5.8) | 133 ( 6.8) |  |  |
| smokecat (%) | Never | 27971 (79.8) | 7927 (82.4) | 7145 (80.1) | 4971 (80.9) | 6509 (77.7) | 1419 (72.0) | \<0.001 |  |
|  | Ever | 7063 (20.2) | 1694 (17.6) | 1774 (19.9) | 1173 (19.1) | 1871 (22.3) | 551 (28.0) |  |  |
| alccat (%) | Never | 21646 (61.8) | 6504 (67.6) | 5518 (61.9) | 3779 (61.5) | 4870 (58.1) | 975 (49.5) | \<0.001 |  |
|  | Ever | 13388 (38.2) | 3117 (32.4) | 3401 (38.1) | 2365 (38.5) | 3510 (41.9) | 995 (50.5) |  |  |
| como_depress (%) | No | 33771 (96.4) | 9293 (96.6) | 8600 (96.4) | 5944 (96.7) | 8043 (96.0) | 1891 (96.0) | 0.079 |  |
|  | Yes | 1263 ( 3.6) | 328 ( 3.4) | 319 ( 3.6) | 200 ( 3.3) | 337 ( 4.0) | 79 ( 4.0) |  |  |
| como_disab (%) | No | 26832 (76.6) | 7208 (74.9) | 6931 (77.7) | 4764 (77.5) | 6417 (76.6) | 1512 (76.8) | \<0.001 |  |
|  | Yes | 8202 (23.4) | 2413 (25.1) | 1988 (22.3) | 1380 (22.5) | 1963 (23.4) | 458 (23.2) |  |  |
| como_diabetes (%) | No | 33077 (94.4) | 9209 (95.7) | 8456 (94.8) | 5777 (94.0) | 7825 (93.4) | 1810 (91.9) | \<0.001 |  |
|  | Yes | 1957 ( 5.6) | 412 ( 4.3) | 463 ( 5.2) | 367 ( 6.0) | 555 ( 6.6) | 160 ( 8.1) |  |  |
| como_cvd (%) | No | 30845 (88.0) | 8449 (87.8) | 7872 (88.3) | 5438 (88.5) | 7364 (87.9) | 1722 (87.4) | 0.541 |  |
|  | Yes | 4189 (12.0) | 1172 (12.2) | 1047 (11.7) | 706 (11.5) | 1016 (12.1) | 248 (12.6) |  |  |
| como_hypert (%) | No | 29243 (83.5) | 8209 (85.3) | 7449 (83.5) | 5139 (83.6) | 6835 (81.6) | 1611 (81.8) | \<0.001 |  |
|  | Yes | 5791 (16.5) | 1412 (14.7) | 1470 (16.5) | 1005 (16.4) | 1545 (18.4) | 359 (18.2) |  |  |
| como_hyperl (%) | No | 29746 (84.9) | 8231 (85.6) | 7559 (84.8) | 5220 (85.0) | 7056 (84.2) | 1680 (85.3) | 0.148 |  |
|  | Yes | 5288 (15.1) | 1390 (14.4) | 1360 (15.2) | 924 (15.0) | 1324 (15.8) | 290 (14.7) |  |  |
| como_resp (%) | No | 33703 (96.2) | 9284 (96.5) | 8623 (96.7) | 5917 (96.3) | 8008 (95.6) | 1871 (95.0) | \<0.001 |  |
|  | Yes | 1331 ( 3.8) | 337 ( 3.5) | 296 ( 3.3) | 227 ( 3.7) | 372 ( 4.4) | 99 ( 5.0) |  |  |
| como_anemia (%) | No | 31926 (91.1) | 8724 (90.7) | 8154 (91.4) | 5640 (91.8) | 7604 (90.7) | 1804 (91.6) | 0.066 |  |
|  | Yes | 3108 ( 8.9) | 897 ( 9.3) | 765 ( 8.6) | 504 ( 8.2) | 776 ( 9.3) | 166 ( 8.4) |  |  |
| como_kidney (%) | No | 34605 (98.8) | 9530 (99.1) | 8813 (98.8) | 6072 (98.8) | 8250 (98.4) | 1940 (98.5) | 0.004 |  |
|  | Yes | 429 ( 1.2) | 91 ( 0.9) | 106 ( 1.2) | 72 ( 1.2) | 130 ( 1.6) | 30 ( 1.5) |  |  |
| como_hypoth (%) | No | 32845 (93.8) | 9029 (93.8) | 8369 (93.8) | 5771 (93.9) | 7827 (93.4) | 1849 (93.9) | 0.667 |  |
|  | Yes | 2189 ( 6.2) | 592 ( 6.2) | 550 ( 6.2) | 373 ( 6.1) | 553 ( 6.6) | 121 ( 6.1) |  |  |
| como_cancers (%) | No | 33829 (96.6) | 9273 (96.4) | 8615 (96.6) | 5955 (96.9) | 8078 (96.4) | 1908 (96.9) | 0.334 |  |
|  | Yes | 1205 ( 3.4) | 348 ( 3.6) | 304 ( 3.4) | 189 ( 3.1) | 302 ( 3.6) | 62 ( 3.1) |  |  |
| meat_gram_ea_4 (%) | None | 18113 (51.7) | 7831 (81.4) | 4381 (49.1) | 2564 (41.7) | 2864 (34.2) | 473 (24.0) | \<0.001 |  |
|  | \<11 g/d | 5584 (15.9) | 829 ( 8.6) | 1727 (19.4) | 1175 (19.1) | 1523 (18.2) | 330 (16.8) |  |  |
|  | 11-\<32 g/d | 5608 (16.0) | 515 ( 5.4) | 1586 (17.8) | 1222 (19.9) | 1855 (22.1) | 430 (21.8) |  |  |
|  | 32+ g/d | 5729 (16.4) | 446 ( 4.6) | 1225 (13.7) | 1183 (19.3) | 2138 (25.5) | 737 (37.4) |  |  |
| fish_gram_ea_4 (%) | None | 17923 (51.2) | 7418 (77.1) | 4396 (49.3) | 2581 (42.0) | 2967 (35.4) | 561 (28.5) | \<0.001 |  |
|  | \<8.6 g/d | 5692 (16.2) | 843 ( 8.8) | 1608 (18.0) | 1135 (18.5) | 1652 (19.7) | 454 (23.0) |  |  |
|  | 8.6-\<17.2 g/d | 5796 (16.5) | 671 ( 7.0) | 1534 (17.2) | 1232 (20.1) | 1883 (22.5) | 476 (24.2) |  |  |
|  | 17.2+ g/d | 5623 (16.1) | 689 ( 7.2) | 1381 (15.5) | 1196 (19.5) | 1878 (22.4) | 479 (24.3) |  |  |
| dairy_gram_ea_4 (%) | \<30 g/d | 8759 (25.0) | 5591 (58.1) | 1666 (18.7) | 678 (11.0) | 681 ( 8.1) | 143 ( 7.3) | \<0.001 |  |
|  | 30-100 g/d | 8758 (25.0) | 2000 (20.8) | 2720 (30.5) | 1552 (25.3) | 2011 (24.0) | 475 (24.1) |  |  |
|  | 100-\<236 g/d | 8758 (25.0) | 1093 (11.4) | 2246 (25.2) | 1888 (30.7) | 2855 (34.1) | 676 (34.3) |  |  |
|  | 236+ g/d | 8759 (25.0) | 937 ( 9.7) | 2287 (25.6) | 2026 (33.0) | 2833 (33.8) | 676 (34.3) |  |  |
| totalveg_gram_ea_4 (%) | \<182 g/d | 8759 (25.0) | 1833 (19.1) | 2412 (27.0) | 1585 (25.8) | 2283 (27.2) | 646 (32.8) | \<0.001 |  |
|  | 182-\<269 g/d | 8758 (25.0) | 2194 (22.8) | 2211 (24.8) | 1623 (26.4) | 2249 (26.8) | 481 (24.4) |  |  |
|  | 269-\<379 g/d | 8758 (25.0) | 2446 (25.4) | 2197 (24.6) | 1557 (25.3) | 2110 (25.2) | 448 (22.7) |  |  |
|  | 379+ g/d | 8759 (25.0) | 3148 (32.7) | 2099 (23.5) | 1379 (22.4) | 1738 (20.7) | 395 (20.1) |  |  |
| fruits_gram_ea_4 (%) | \<168 g/d | 8759 (25.0) | 1389 (14.4) | 2216 (24.8) | 1623 (26.4) | 2679 (32.0) | 852 (43.2) | \<0.001 |  |
|  | 168-\<279 g/d | 8758 (25.0) | 1947 (20.2) | 2171 (24.3) | 1685 (27.4) | 2440 (29.1) | 515 (26.1) |  |  |
|  | 279-\<418 g/d | 8758 (25.0) | 2651 (27.6) | 2279 (25.6) | 1563 (25.4) | 1914 (22.8) | 351 (17.8) |  |  |
|  | 418+ g/d | 8759 (25.0) | 3634 (37.8) | 2253 (25.3) | 1273 (20.7) | 1347 (16.1) | 252 (12.8) |  |  |
| refgrains_gram_ea_4 (%) | \<37.8 g/d | 8759 (25.0) | 3373 (35.1) | 2100 (23.5) | 1178 (19.2) | 1638 (19.5) | 470 (23.9) | \<0.001 |  |
|  | 37.8-\<79.1 g/d | 8758 (25.0) | 2237 (23.3) | 2291 (25.7) | 1629 (26.5) | 2083 (24.9) | 518 (26.3) |  |  |
|  | 79.1-\<144 g/d | 8758 (25.0) | 1981 (20.6) | 2325 (26.1) | 1704 (27.7) | 2248 (26.8) | 500 (25.4) |  |  |
|  | 144+ g/d | 8759 (25.0) | 2030 (21.1) | 2203 (24.7) | 1633 (26.6) | 2411 (28.8) | 482 (24.5) |  |  |
| whole_mixed_grains_gram_ea_4 (%) | \<144 g/d | 8759 (25.0) | 1390 (14.4) | 2318 (26.0) | 1687 (27.5) | 2531 (30.2) | 833 (42.3) | \<0.001 |  |
|  | 144-\<208 g/d | 8758 (25.0) | 1832 (19.0) | 2287 (25.6) | 1719 (28.0) | 2423 (28.9) | 497 (25.2) |  |  |
|  | 208-\<358 g/d | 8758 (25.0) | 2651 (27.6) | 2112 (23.7) | 1488 (24.2) | 2097 (25.0) | 410 (20.8) |  |  |
|  | 358+ g/d | 8759 (25.0) | 3748 (39.0) | 2202 (24.7) | 1250 (20.3) | 1329 (15.9) | 230 (11.7) |  |  |
| nutsseeds_gram_ea_4 (%) | \<9.54 g/d | 8759 (25.0) | 1809 (18.8) | 2373 (26.6) | 1518 (24.7) | 2356 (28.1) | 703 (35.7) | \<0.001 |  |
|  | 9.54-\<19 g/d | 8758 (25.0) | 1932 (20.1) | 2241 (25.1) | 1665 (27.1) | 2391 (28.5) | 529 (26.9) |  |  |
|  | 19-\<33 g/d | 8758 (25.0) | 2446 (25.4) | 2215 (24.8) | 1612 (26.2) | 2070 (24.7) | 415 (21.1) |  |  |
|  | 33+ g/d | 8759 (25.0) | 3434 (35.7) | 2090 (23.4) | 1349 (22.0) | 1563 (18.7) | 323 (16.4) |  |  |
| legumes_gram_ea_4 (%) | \<33.6 g/d | 8759 (25.0) | 1747 (18.2) | 2261 (25.4) | 1535 (25.0) | 2465 (29.4) | 751 (38.1) | \<0.001 |  |
|  | 33.6-\<61.0 g/d | 8758 (25.0) | 2090 (21.7) | 2247 (25.2) | 1600 (26.0) | 2273 (27.1) | 548 (27.8) |  |  |
|  | 61.0-\<99.2 g/d | 8758 (25.0) | 2548 (26.5) | 2238 (25.1) | 1623 (26.4) | 1967 (23.5) | 382 (19.4) |  |  |
|  | 99.2+ g/d | 8759 (25.0) | 3236 (33.6) | 2173 (24.4) | 1386 (22.6) | 1675 (20.0) | 289 (14.7) |  |  |

- A descriptive table of age at diagnosis by egg intake among cases is
  shown below:

|  | level | Overall | Never | 1-3/mo | 1/wk | 2-4/wk | 5+/wk | p | test |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| n |  | 5800 | 1845 | 1390 | 913 | 1335 | 317 |  |  |
| age_at_dx (mean (SD)) |  | 83.17 (8.17) | 83.41 (8.13) | 83.10 (8.11) | 83.18 (8.10) | 83.15 (8.37) | 82.14 (7.95) | 0.154 |  |

## Cox models

- To examine risk factors associated with incident dementia/AD, we
  employed the Cox proportional hazards model with attained age as the
  time scale
  - Age at entry was calculated based on the return date of AHS-2
    questionnaire
  - Those who died during the follow-up were censored at the date of
    death verified in Medicare data
  - Those who were diagnosed with dementia or Alzheimer’s disease after
    6 months following study enrollment were identified as incident
    cases and their age at diagnosis was calculated.
    - The mean follow-up years was 14.8 years (median 16.5 years)
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
  - The number of knots in the cubic splines was set to 5 knots.
- For each those dietary variables that indicate a non-linear
  association, a plot of adjusted hazard ratio was produced to visualize
  how HR changes over a range of intake.
  - For eggs, an intake of 10 gram/day was chosen to be its reference
    value of the HR plot.
  - Total vegetable intake was another dietary variable showing a
    significant non-linearity. Its reference value was set to 300
    gram/day.
  - HR plots from the final model were shown below:

![](summary_files/figure-gfm/cubic_spline-1.png)<!-- -->![](summary_files/figure-gfm/cubic_spline-2.png)<!-- -->

- Tables below shows adjusted HR for some representative values of egg
  gram intake (reference = 10 gram/day).

| eggs_gram_ea |   HR | lower | upper |
|-------------:|-----:|------:|------:|
|            0 | 1.23 |  1.11 |  1.36 |
|           20 | 0.98 |  0.91 |  1.06 |
|           30 | 1.00 |  0.91 |  1.09 |
|           40 | 1.02 |  0.93 |  1.12 |
|           50 | 1.05 |  0.94 |  1.16 |

- Tables below shows adjusted HR for some representative values of
  vegetable gram intake (reference = 300 gram/day).

| totalveg_gram_ea |   HR | lower | upper |
|-----------------:|-----:|------:|------:|
|               50 | 1.26 |  1.11 |  1.42 |
|              100 | 1.12 |  1.03 |  1.22 |
|              200 | 0.96 |  0.90 |  1.03 |
|              400 | 1.04 |  0.98 |  1.10 |
|              800 | 1.01 |  0.91 |  1.13 |

## Notes for additional analyses

- Combine semi- and non-vegetarians into one group and make this as
  reference – Done.

- Run the following models:

  - MV1 + egg (retain dietary groups) – Done. HRs very similar to those
    in Model 1 or 2.
  - Separate meat into two food group variables, beef and poultry, while
    excluding pork from the model – Still waiting for data from DS.
  - Explore interactions between meat (as a whole) and egg intake – The
    interaction term was not significant at all (p = 0.69).

- TO DO

  - Get meat sub-group variables (both gram and kcal intake) from Lars?
    – see below
  - Incorporate VB12, omega-3, and folate from lupus data
  - Need to rewrite datasets section

- Concerns:

  - ~~RTI Race – see the [definition of RTI
    race](https://resdac.org/cms-data/variables/research-triangle-institute-rti-race-code):
    what to do with others? Exclude them?~~
  - Egg eaters among vegans? – misclassification
  - Definition of physical activity: Look for Vichuda’s paper
  - Separate hypertension and hyperlipidemia – Done
  - Include anemia as a comorbidity variable – Done
  - ~~Semi-veg: exclude them entirely, or keep it combined with
    non-veg?~~

- Plans

  - Two papers:
    - Egg intake and dementia (1st paper)
    - Dietary pattern and dementia (2nd paper)
  - For the first paper;
    - For egg intake, use its frequency – need to collapse
    - Need other food groups: vegetables, fruits, grains, nuts/seeds,
      legumes – get data from GF (along with meat as food group)
    - ~~Need nutrient variables: Carotenoids (LYCO, LUTE, LZ, ZEA)? – JO
      to think about~~
    - Crosstab b/w egg and meat intake – Done
    - Mean/percentiles by egg intake group – Done
    - ~~Re-label egg intake groups~~
    - Model with and without comobidity
      - Model 1a: Demographics and lifestyle + Egg
      - Model 1b: Add comorbidity
      - ~~Model 2a: Model 1a + other food groups~~
      - Model 2b: Model 1b + other food groups
  - For the second paper:
    - Keep semi-veg together with non-veg for now
