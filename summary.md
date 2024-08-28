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
  - Dietary data: n = 95,344
- After merging Medicare and AHS-2 data, there were n = 44,159 subjects.

## Inclusion/exclusion criteria

- Medicare beneficiaries who did not reach the age of 65 between 2008
  and 2020 (e.g., younger beneficiaries with disabilities or end-stage
  renal disease) were excluded (n = 1538), resulting n = 42,621.

- n = 1304 subjects with missing BMI or extreme BMI (\<16 or \>60),
  according to AHS questionnaire, were excluded, resulting n = 41,317.

- n = 1032 subjects with extreme calorie intake (\<500 or \>4500 kcal)
  were excluded, resulting n = 40,285.

- Prevalent cases of dementia and/or Alzheimer’s disease

  - If the first diagnosis was made before AHS-2 enrollment or within 6
    months after the enrollment, consider it as a prevalent case
  - n = 388 such prevalent cases were excluded, resulting n = 39,897
    subjects

- Unverified dates of deaths

  - Medicare data include a variable (`VALID_DEATH_DT_SW`) indicating
    whether a beneficiary’s day of death has been verified by the Social
    Security Administration or the Railroad Retirement Board.
  - There were 21 unverified death dates. Excluding these resulted n =
    39,876.

- Missing values in covariates

  - There were n = 3376 subjects who has at least one missing value on
    covariates (such as marital status, education, exercise level, sleep
    hours, smoking and alcohol use, all of them come from AHS
    questionnaire). These subjects were excluded, resulting in n =
    36,500.

## Dietary variables

- Gram intakes of 4 food groups (meat, fish, egg, and dairy) were
  calculated (gram/day) according to AHS-2 food frequency questionnaire.

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
  - For egg and dairy, subjects were divided into 4 quartile groups.
  - For cut-off values of the four food groups, please see the
    descriptive table below.

- Mean and 25th, 50th, 75th percentiles of gram intake by intake group
  are shown below:

| meat_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 18772 | 51.43 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<11 g/d       |  5825 | 15.96 |  5.80 |  3.97 |  5.74 |  7.58 |
| 11-\<32 g/d    |  5840 | 16.00 | 19.39 | 14.35 | 18.44 | 23.83 |
| 32+ g/d        |  6063 | 16.61 | 63.32 | 41.43 | 54.82 | 75.11 |

| fish_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 18560 | 50.85 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<8.6 g/d      |  5958 | 16.32 |  5.24 |  3.51 |  5.40 |  6.90 |
| 8.6-\<17.2 g/d |  6030 | 16.52 | 12.54 | 10.36 | 12.34 | 14.57 |
| 17.2+ g/d      |  5952 | 16.31 | 35.72 | 20.85 | 27.14 | 41.81 |

| eggs_gram_ea_4 |    n | pct |  mean |    p1 |    p2 |    p3 |
|:---------------|-----:|----:|------:|------:|------:|------:|
| \<3.6 g/d      | 9125 |  25 |  1.74 |  0.79 |  1.74 |  2.67 |
| 3.6-7.5 g/d    | 9125 |  25 |  5.48 |  4.53 |  5.42 |  6.41 |
| 7.5-\<16 g/d   | 9125 |  25 | 10.84 |  8.77 | 10.39 | 12.67 |
| 16+ g/d        | 9125 |  25 | 28.50 | 19.60 | 23.61 | 30.30 |

| dairy_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:----------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<30 g/d        | 9125 |  25 |  12.28 |   5.12 |  10.40 |  19.13 |
| 30-100 g/d      | 9125 |  25 |  60.02 |  42.30 |  57.70 |  76.77 |
| 100-\<236 g/d   | 9125 |  25 | 161.18 | 126.33 | 158.26 | 194.16 |
| 236+ g/d        | 9125 |  25 | 432.58 | 290.49 | 364.60 | 498.07 |

- For egg intake and meat intake, a crosstab was produced:
  - The first table was stratified by meat intake (% of egg intake
    within each meat level)
  - The second table was stratified by egg intake (% of meat intake
    within each egg level)

|                    | level        | None        | \<11 g/d    | 11-\<32 g/d | 32+ g/d     | p       | test |
|:-------------------|:-------------|:------------|:------------|:------------|:------------|:--------|:-----|
| n                  |              | 18772       | 5825        | 5840        | 6063        |         |      |
| eggs_gram_ea_4 (%) | \<3.6 g/d    | 6993 (37.3) | 993 (17.0)  | 590 (10.1)  | 549 ( 9.1)  | \<0.001 |      |
|                    | 3.6-7.5 g/d  | 4942 (26.3) | 1599 (27.5) | 1438 (24.6) | 1146 (18.9) |         |      |
|                    | 7.5-\<16 g/d | 3919 (20.9) | 1692 (29.0) | 1770 (30.3) | 1744 (28.8) |         |      |
|                    | 16+ g/d      | 2918 (15.5) | 1541 (26.5) | 2042 (35.0) | 2624 (43.3) |         |      |

|                    | level       | \<3.6 g/d   | 3.6-7.5 g/d | 7.5-\<16 g/d | 16+ g/d     | p       | test |
|:-------------------|:------------|:------------|:------------|:-------------|:------------|:--------|:-----|
| n                  |             | 9125        | 9125        | 9125         | 9125        |         |      |
| meat_gram_ea_4 (%) | None        | 6993 (76.6) | 4942 (54.2) | 3919 (42.9)  | 2918 (32.0) | \<0.001 |      |
|                    | \<11 g/d    | 993 (10.9)  | 1599 (17.5) | 1692 (18.5)  | 1541 (16.9) |         |      |
|                    | 11-\<32 g/d | 590 ( 6.5)  | 1438 (15.8) | 1770 (19.4)  | 2042 (22.4) |         |      |
|                    | 32+ g/d     | 549 ( 6.0)  | 1146 (12.6) | 1744 (19.1)  | 2624 (28.8) |         |      |

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

|                                  | level          | Overall       | Non-case     | Case         | p       | test |
|:---------------------------------|:---------------|:--------------|:-------------|:-------------|:--------|:-----|
| n                                |                | 36500         | 30378        | 6122         |         |      |
| agecat (%)                       | 65-69          | 6402 (17.5)   | 6307 (20.8)  | 95 ( 1.6)    | \<0.001 |      |
|                                  | 70-74          | 6603 (18.1)   | 6341 (20.9)  | 262 ( 4.3)   |         |      |
|                                  | 75-79          | 5863 (16.1)   | 5376 (17.7)  | 487 ( 8.0)   |         |      |
|                                  | 80-84          | 5176 (14.2)   | 4370 (14.4)  | 806 (13.2)   |         |      |
|                                  | 85-89          | 4587 (12.6)   | 3427 (11.3)  | 1160 (18.9)  |         |      |
|                                  | 90-94          | 3850 (10.5)   | 2424 ( 8.0)  | 1426 (23.3)  |         |      |
|                                  | 95+            | 4019 (11.0)   | 2133 ( 7.0)  | 1886 (30.8)  |         |      |
| bene_age_at_end_2020 (mean (SD)) |                | 80.81 (10.38) | 78.93 (9.63) | 90.16 (8.78) | \<0.001 |      |
| bene_sex_F (%)                   | M              | 13213 (36.2)  | 11093 (36.5) | 2120 (34.6)  | 0.005   |      |
|                                  | F              | 23287 (63.8)  | 19285 (63.5) | 4002 (65.4)  |         |      |
| rti_race3 (%)                    | NH White       | 27234 (74.6)  | 22189 (73.0) | 5045 (82.4)  | \<0.001 |      |
|                                  | Black          | 6820 (18.7)   | 5951 (19.6)  | 869 (14.2)   |         |      |
|                                  | Other          | 2446 ( 6.7)   | 2238 ( 7.4)  | 208 ( 3.4)   |         |      |
| marital (%)                      | Married        | 26876 (73.6)  | 22828 (75.1) | 4048 (66.1)  | \<0.001 |      |
|                                  | Never          | 1228 ( 3.4)   | 1053 ( 3.5)  | 175 ( 2.9)   |         |      |
|                                  | Div/Wid        | 8396 (23.0)   | 6497 (21.4)  | 1899 (31.0)  |         |      |
| educyou (%)                      | HS or less     | 7628 (20.9)   | 6008 (19.8)  | 1620 (26.5)  | \<0.001 |      |
|                                  | Some college   | 14362 (39.3)  | 11996 (39.5) | 2366 (38.6)  |         |      |
|                                  | Col grad+      | 14510 (39.8)  | 12374 (40.7) | 2136 (34.9)  |         |      |
| vegstat (%)                      | Vegan          | 3285 ( 9.0)   | 2631 ( 8.7)  | 654 (10.7)   | \<0.001 |      |
|                                  | Lacto-ovo      | 12265 (33.6)  | 9967 (32.8)  | 2298 (37.5)  |         |      |
|                                  | Semi           | 2072 ( 5.7)   | 1736 ( 5.7)  | 336 ( 5.5)   |         |      |
|                                  | Pesco          | 3378 ( 9.3)   | 2806 ( 9.2)  | 572 ( 9.3)   |         |      |
|                                  | Non-veg        | 15500 (42.5)  | 13238 (43.6) | 2262 (36.9)  |         |      |
| bmicat (%)                       | Normal         | 14267 (39.1)  | 11646 (38.3) | 2621 (42.8)  | \<0.001 |      |
|                                  | Overweight     | 13130 (36.0)  | 10960 (36.1) | 2170 (35.4)  |         |      |
|                                  | Obese          | 9103 (24.9)   | 7772 (25.6)  | 1331 (21.7)  |         |      |
| bmi (mean (SD))                  |                | 27.28 (5.73)  | 27.39 (5.77) | 26.74 (5.54) | \<0.001 |      |
| exercise (%)                     | None           | 8678 (23.8)   | 7095 (23.4)  | 1583 (25.9)  | \<0.001 |      |
|                                  | Low            | 8247 (22.6)   | 6881 (22.7)  | 1366 (22.3)  |         |      |
|                                  | Moderate       | 12106 (33.2)  | 10157 (33.4) | 1949 (31.8)  |         |      |
|                                  | Vigorous       | 7469 (20.5)   | 6245 (20.6)  | 1224 (20.0)  |         |      |
| sleephrs (%)                     | \<= 5 hrs      | 3497 ( 9.6)   | 2932 ( 9.7)  | 565 ( 9.2)   | \<0.001 |      |
|                                  | 6 hrs          | 7935 (21.7)   | 6723 (22.1)  | 1212 (19.8)  |         |      |
|                                  | 7 hrs          | 13306 (36.5)  | 11328 (37.3) | 1978 (32.3)  |         |      |
|                                  | 8 hrs          | 9719 (26.6)   | 7842 (25.8)  | 1877 (30.7)  |         |      |
|                                  | \>= 9 hrs      | 2043 ( 5.6)   | 1553 ( 5.1)  | 490 ( 8.0)   |         |      |
| smokecat (%)                     | Never          | 29118 (79.8)  | 24138 (79.5) | 4980 (81.3)  | 0.001   |      |
|                                  | Ever           | 7382 (20.2)   | 6240 (20.5)  | 1142 (18.7)  |         |      |
| alccat (%)                       | Never          | 22565 (61.8)  | 18282 (60.2) | 4283 (70.0)  | \<0.001 |      |
|                                  | Ever           | 13935 (38.2)  | 12096 (39.8) | 1839 (30.0)  |         |      |
| como_depress (%)                 | No             | 35142 (96.3)  | 29599 (97.4) | 5543 (90.5)  | \<0.001 |      |
|                                  | Yes            | 1358 ( 3.7)   | 779 ( 2.6)   | 579 ( 9.5)   |         |      |
| como_disab (%)                   | No             | 27825 (76.2)  | 25159 (82.8) | 2666 (43.5)  | \<0.001 |      |
|                                  | Yes            | 8675 (23.8)   | 5219 (17.2)  | 3456 (56.5)  |         |      |
| como_diabetes (%)                | No             | 34371 (94.2)  | 29049 (95.6) | 5322 (86.9)  | \<0.001 |      |
|                                  | Yes            | 2129 ( 5.8)   | 1329 ( 4.4)  | 800 (13.1)   |         |      |
| como_cvd (%)                     | No             | 32040 (87.8)  | 27754 (91.4) | 4286 (70.0)  | \<0.001 |      |
|                                  | Yes            | 4460 (12.2)   | 2624 ( 8.6)  | 1836 (30.0)  |         |      |
| como_hypert (%)                  | No             | 30297 (83.0)  | 26636 (87.7) | 3661 (59.8)  | \<0.001 |      |
|                                  | Yes            | 6203 (17.0)   | 3742 (12.3)  | 2461 (40.2)  |         |      |
| como_hyperl (%)                  | No             | 30916 (84.7)  | 26887 (88.5) | 4029 (65.8)  | \<0.001 |      |
|                                  | Yes            | 5584 (15.3)   | 3491 (11.5)  | 2093 (34.2)  |         |      |
| como_resp (%)                    | No             | 35068 (96.1)  | 29501 (97.1) | 5567 (90.9)  | \<0.001 |      |
|                                  | Yes            | 1432 ( 3.9)   | 877 ( 2.9)   | 555 ( 9.1)   |         |      |
| como_anemia (%)                  | No             | 33177 (90.9)  | 28434 (93.6) | 4743 (77.5)  | \<0.001 |      |
|                                  | Yes            | 3323 ( 9.1)   | 1944 ( 6.4)  | 1379 (22.5)  |         |      |
| como_kidney (%)                  | No             | 36026 (98.7)  | 30095 (99.1) | 5931 (96.9)  | \<0.001 |      |
|                                  | Yes            | 474 ( 1.3)    | 283 ( 0.9)   | 191 ( 3.1)   |         |      |
| como_hypoth (%)                  | No             | 34203 (93.7)  | 29032 (95.6) | 5171 (84.5)  | \<0.001 |      |
|                                  | Yes            | 2297 ( 6.3)   | 1346 ( 4.4)  | 951 (15.5)   |         |      |
| como_cancers (%)                 | No             | 35218 (96.5)  | 29588 (97.4) | 5630 (92.0)  | \<0.001 |      |
|                                  | Yes            | 1282 ( 3.5)   | 790 ( 2.6)   | 492 ( 8.0)   |         |      |
| meat_gram_ea_4 (%)               | None           | 18772 (51.4)  | 15280 (50.3) | 3492 (57.0)  | \<0.001 |      |
|                                  | \<11 g/d       | 5825 (16.0)   | 4849 (16.0)  | 976 (15.9)   |         |      |
|                                  | 11-\<32 g/d    | 5840 (16.0)   | 4959 (16.3)  | 881 (14.4)   |         |      |
|                                  | 32+ g/d        | 6063 (16.6)   | 5290 (17.4)  | 773 (12.6)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18560 (50.8)  | 15132 (49.8) | 3428 (56.0)  | \<0.001 |      |
|                                  | \<8.6 g/d      | 5958 (16.3)   | 4914 (16.2)  | 1044 (17.1)  |         |      |
|                                  | 8.6-\<17.2 g/d | 6030 (16.5)   | 5156 (17.0)  | 874 (14.3)   |         |      |
|                                  | 17.2+ g/d      | 5952 (16.3)   | 5176 (17.0)  | 776 (12.7)   |         |      |
| eggs_gram_ea_4 (%)               | \<3.6 g/d      | 9125 (25.0)   | 7367 (24.3)  | 1758 (28.7)  | \<0.001 |      |
|                                  | 3.6-7.5 g/d    | 9125 (25.0)   | 7577 (24.9)  | 1548 (25.3)  |         |      |
|                                  | 7.5-\<16 g/d   | 9125 (25.0)   | 7741 (25.5)  | 1384 (22.6)  |         |      |
|                                  | 16+ g/d        | 9125 (25.0)   | 7693 (25.3)  | 1432 (23.4)  |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9125 (25.0)   | 7473 (24.6)  | 1652 (27.0)  | \<0.001 |      |
|                                  | 30-100 g/d     | 9125 (25.0)   | 7704 (25.4)  | 1421 (23.2)  |         |      |
|                                  | 100-\<236 g/d  | 9125 (25.0)   | 7650 (25.2)  | 1475 (24.1)  |         |      |
|                                  | 236+ g/d       | 9125 (25.0)   | 7551 (24.9)  | 1574 (25.7)  |         |      |

## Descriptive table by egg intake

|                                  | level          | Overall       | \<3.6 g/d     | 3.6-7.5 g/d   | 7.5-\<16 g/d  | 16+ g/d       | p       | test |
|:---------------------------------|:---------------|:--------------|:--------------|:--------------|:--------------|:--------------|:--------|:-----|
| n                                |                | 36500         | 9125          | 9125          | 9125          | 9125          |         |      |
| ALZH_DEMEN_YN2 (%)               | Non-case       | 30378 (83.2)  | 7367 (80.7)   | 7577 (83.0)   | 7741 (84.8)   | 7693 (84.3)   | \<0.001 |      |
|                                  | Case           | 6122 (16.8)   | 1758 (19.3)   | 1548 (17.0)   | 1384 (15.2)   | 1432 (15.7)   |         |      |
| agecat (%)                       | 65-69          | 6402 (17.5)   | 1415 (15.5)   | 1576 (17.3)   | 1735 (19.0)   | 1676 (18.4)   | \<0.001 |      |
|                                  | 70-74          | 6603 (18.1)   | 1520 (16.7)   | 1637 (17.9)   | 1767 (19.4)   | 1679 (18.4)   |         |      |
|                                  | 75-79          | 5863 (16.1)   | 1425 (15.6)   | 1500 (16.4)   | 1456 (16.0)   | 1482 (16.2)   |         |      |
|                                  | 80-84          | 5176 (14.2)   | 1342 (14.7)   | 1276 (14.0)   | 1249 (13.7)   | 1309 (14.3)   |         |      |
|                                  | 85-89          | 4587 (12.6)   | 1223 (13.4)   | 1123 (12.3)   | 1132 (12.4)   | 1109 (12.2)   |         |      |
|                                  | 90-94          | 3850 (10.5)   | 1019 (11.2)   | 999 (10.9)    | 878 ( 9.6)    | 954 (10.5)    |         |      |
|                                  | 95+            | 4019 (11.0)   | 1181 (12.9)   | 1014 (11.1)   | 908 (10.0)    | 916 (10.0)    |         |      |
| bene_age_at_end_2020 (mean (SD)) |                | 80.81 (10.38) | 81.74 (10.53) | 80.89 (10.38) | 80.17 (10.25) | 80.44 (10.27) | \<0.001 |      |
| bene_sex_F (%)                   | M              | 13213 (36.2)  | 3225 (35.3)   | 3065 (33.6)   | 3464 (38.0)   | 3459 (37.9)   | \<0.001 |      |
|                                  | F              | 23287 (63.8)  | 5900 (64.7)   | 6060 (66.4)   | 5661 (62.0)   | 5666 (62.1)   |         |      |
| rti_race3 (%)                    | NH White       | 27234 (74.6)  | 6935 (76.0)   | 6806 (74.6)   | 6550 (71.8)   | 6943 (76.1)   | \<0.001 |      |
|                                  | Black          | 6820 (18.7)   | 1476 (16.2)   | 1670 (18.3)   | 2009 (22.0)   | 1665 (18.2)   |         |      |
|                                  | Other          | 2446 ( 6.7)   | 714 ( 7.8)    | 649 ( 7.1)    | 566 ( 6.2)    | 517 ( 5.7)    |         |      |
| marital (%)                      | Married        | 26876 (73.6)  | 6662 (73.0)   | 6689 (73.3)   | 6842 (75.0)   | 6683 (73.2)   | 0.002   |      |
|                                  | Never          | 1228 ( 3.4)   | 355 ( 3.9)    | 303 ( 3.3)    | 285 ( 3.1)    | 285 ( 3.1)    |         |      |
|                                  | Div/Wid        | 8396 (23.0)   | 2108 (23.1)   | 2133 (23.4)   | 1998 (21.9)   | 2157 (23.6)   |         |      |
| educyou (%)                      | HS or less     | 7628 (20.9)   | 1684 (18.5)   | 1920 (21.0)   | 1945 (21.3)   | 2079 (22.8)   | \<0.001 |      |
|                                  | Some college   | 14362 (39.3)  | 3447 (37.8)   | 3525 (38.6)   | 3555 (39.0)   | 3835 (42.0)   |         |      |
|                                  | Col grad+      | 14510 (39.8)  | 3994 (43.8)   | 3680 (40.3)   | 3625 (39.7)   | 3211 (35.2)   |         |      |
| vegstat (%)                      | Vegan          | 3285 ( 9.0)   | 2712 (29.7)   | 397 ( 4.4)    | 150 ( 1.6)    | 26 ( 0.3)     | \<0.001 |      |
|                                  | Lacto-ovo      | 12265 (33.6)  | 3479 (38.1)   | 3650 (40.0)   | 2937 (32.2)   | 2199 (24.1)   |         |      |
|                                  | Semi           | 2072 ( 5.7)   | 359 ( 3.9)    | 578 ( 6.3)    | 613 ( 6.7)    | 522 ( 5.7)    |         |      |
|                                  | Pesco          | 3378 ( 9.3)   | 852 ( 9.3)    | 944 (10.3)    | 862 ( 9.4)    | 720 ( 7.9)    |         |      |
|                                  | Non-veg        | 15500 (42.5)  | 1723 (18.9)   | 3556 (39.0)   | 4563 (50.0)   | 5658 (62.0)   |         |      |
| bmicat (%)                       | Normal         | 14267 (39.1)  | 4956 (54.3)   | 3770 (41.3)   | 2984 (32.7)   | 2557 (28.0)   | \<0.001 |      |
|                                  | Overweight     | 13130 (36.0)  | 2824 (30.9)   | 3319 (36.4)   | 3601 (39.5)   | 3386 (37.1)   |         |      |
|                                  | Obese          | 9103 (24.9)   | 1345 (14.7)   | 2036 (22.3)   | 2540 (27.8)   | 3182 (34.9)   |         |      |
| bmi (mean (SD))                  |                | 27.28 (5.73)  | 25.45 (5.14)  | 26.90 (5.37)  | 27.92 (5.64)  | 28.86 (6.17)  | \<0.001 |      |
| exercise (%)                     | None           | 8678 (23.8)   | 1597 (17.5)   | 2096 (23.0)   | 2318 (25.4)   | 2667 (29.2)   | \<0.001 |      |
|                                  | Low            | 8247 (22.6)   | 1840 (20.2)   | 1977 (21.7)   | 2226 (24.4)   | 2204 (24.2)   |         |      |
|                                  | Moderate       | 12106 (33.2)  | 3212 (35.2)   | 3129 (34.3)   | 2931 (32.1)   | 2834 (31.1)   |         |      |
|                                  | Vigorous       | 7469 (20.5)   | 2476 (27.1)   | 1923 (21.1)   | 1650 (18.1)   | 1420 (15.6)   |         |      |
| sleephrs (%)                     | \<= 5 hrs      | 3497 ( 9.6)   | 809 ( 8.9)    | 829 ( 9.1)    | 950 (10.4)    | 909 (10.0)    | \<0.001 |      |
|                                  | 6 hrs          | 7935 (21.7)   | 1854 (20.3)   | 2018 (22.1)   | 2089 (22.9)   | 1974 (21.6)   |         |      |
|                                  | 7 hrs          | 13306 (36.5)  | 3329 (36.5)   | 3403 (37.3)   | 3270 (35.8)   | 3304 (36.2)   |         |      |
|                                  | 8 hrs          | 9719 (26.6)   | 2599 (28.5)   | 2423 (26.6)   | 2317 (25.4)   | 2380 (26.1)   |         |      |
|                                  | \>= 9 hrs      | 2043 ( 5.6)   | 534 ( 5.9)    | 452 ( 5.0)    | 499 ( 5.5)    | 558 ( 6.1)    |         |      |
| smokecat (%)                     | Never          | 29118 (79.8)  | 7575 (83.0)   | 7492 (82.1)   | 7209 (79.0)   | 6842 (75.0)   | \<0.001 |      |
|                                  | Ever           | 7382 (20.2)   | 1550 (17.0)   | 1633 (17.9)   | 1916 (21.0)   | 2283 (25.0)   |         |      |
| alccat (%)                       | Never          | 22565 (61.8)  | 6241 (68.4)   | 5860 (64.2)   | 5466 (59.9)   | 4998 (54.8)   | \<0.001 |      |
|                                  | Ever           | 13935 (38.2)  | 2884 (31.6)   | 3265 (35.8)   | 3659 (40.1)   | 4127 (45.2)   |         |      |
| como_depress (%)                 | No             | 35142 (96.3)  | 8805 (96.5)   | 8779 (96.2)   | 8801 (96.4)   | 8757 (96.0)   | 0.211   |      |
|                                  | Yes            | 1358 ( 3.7)   | 320 ( 3.5)    | 346 ( 3.8)    | 324 ( 3.6)    | 368 ( 4.0)    |         |      |
| como_disab (%)                   | No             | 27825 (76.2)  | 6793 (74.4)   | 6934 (76.0)   | 7106 (77.9)   | 6992 (76.6)   | \<0.001 |      |
|                                  | Yes            | 8675 (23.8)   | 2332 (25.6)   | 2191 (24.0)   | 2019 (22.1)   | 2133 (23.4)   |         |      |
| como_diabetes (%)                | No             | 34371 (94.2)  | 8698 (95.3)   | 8666 (95.0)   | 8548 (93.7)   | 8459 (92.7)   | \<0.001 |      |
|                                  | Yes            | 2129 ( 5.8)   | 427 ( 4.7)    | 459 ( 5.0)    | 577 ( 6.3)    | 666 ( 7.3)    |         |      |
| como_cvd (%)                     | No             | 32040 (87.8)  | 7948 (87.1)   | 8030 (88.0)   | 8058 (88.3)   | 8004 (87.7)   | 0.081   |      |
|                                  | Yes            | 4460 (12.2)   | 1177 (12.9)   | 1095 (12.0)   | 1067 (11.7)   | 1121 (12.3)   |         |      |
| como_hypert (%)                  | No             | 30297 (83.0)  | 7735 (84.8)   | 7586 (83.1)   | 7563 (82.9)   | 7413 (81.2)   | \<0.001 |      |
|                                  | Yes            | 6203 (17.0)   | 1390 (15.2)   | 1539 (16.9)   | 1562 (17.1)   | 1712 (18.8)   |         |      |
| como_hyperl (%)                  | No             | 30916 (84.7)  | 7782 (85.3)   | 7674 (84.1)   | 7753 (85.0)   | 7707 (84.5)   | 0.120   |      |
|                                  | Yes            | 5584 (15.3)   | 1343 (14.7)   | 1451 (15.9)   | 1372 (15.0)   | 1418 (15.5)   |         |      |
| como_resp (%)                    | No             | 35068 (96.1)  | 8782 (96.2)   | 8803 (96.5)   | 8794 (96.4)   | 8689 (95.2)   | \<0.001 |      |
|                                  | Yes            | 1432 ( 3.9)   | 343 ( 3.8)    | 322 ( 3.5)    | 331 ( 3.6)    | 436 ( 4.8)    |         |      |
| como_anemia (%)                  | No             | 33177 (90.9)  | 8267 (90.6)   | 8294 (90.9)   | 8324 (91.2)   | 8292 (90.9)   | 0.539   |      |
|                                  | Yes            | 3323 ( 9.1)   | 858 ( 9.4)    | 831 ( 9.1)    | 801 ( 8.8)    | 833 ( 9.1)    |         |      |
| como_kidney (%)                  | No             | 36026 (98.7)  | 9030 (99.0)   | 9023 (98.9)   | 9017 (98.8)   | 8956 (98.1)   | \<0.001 |      |
|                                  | Yes            | 474 ( 1.3)    | 95 ( 1.0)     | 102 ( 1.1)    | 108 ( 1.2)    | 169 ( 1.9)    |         |      |
| como_hypoth (%)                  | No             | 34203 (93.7)  | 8549 (93.7)   | 8495 (93.1)   | 8603 (94.3)   | 8556 (93.8)   | 0.012   |      |
|                                  | Yes            | 2297 ( 6.3)   | 576 ( 6.3)    | 630 ( 6.9)    | 522 ( 5.7)    | 569 ( 6.2)    |         |      |
| como_cancers (%)                 | No             | 35218 (96.5)  | 8784 (96.3)   | 8822 (96.7)   | 8816 (96.6)   | 8796 (96.4)   | 0.390   |      |
|                                  | Yes            | 1282 ( 3.5)   | 341 ( 3.7)    | 303 ( 3.3)    | 309 ( 3.4)    | 329 ( 3.6)    |         |      |
| meat_gram_ea_4 (%)               | None           | 18772 (51.4)  | 6993 (76.6)   | 4942 (54.2)   | 3919 (42.9)   | 2918 (32.0)   | \<0.001 |      |
|                                  | \<11 g/d       | 5825 (16.0)   | 993 (10.9)    | 1599 (17.5)   | 1692 (18.5)   | 1541 (16.9)   |         |      |
|                                  | 11-\<32 g/d    | 5840 (16.0)   | 590 ( 6.5)    | 1438 (15.8)   | 1770 (19.4)   | 2042 (22.4)   |         |      |
|                                  | 32+ g/d        | 6063 (16.6)   | 549 ( 6.0)    | 1146 (12.6)   | 1744 (19.1)   | 2624 (28.8)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18560 (50.8)  | 6641 (72.8)   | 4799 (52.6)   | 3929 (43.1)   | 3191 (35.0)   | \<0.001 |      |
|                                  | \<8.6 g/d      | 5958 (16.3)   | 972 (10.7)    | 1537 (16.8)   | 1641 (18.0)   | 1808 (19.8)   |         |      |
|                                  | 8.6-\<17.2 g/d | 6030 (16.5)   | 725 ( 7.9)    | 1443 (15.8)   | 1777 (19.5)   | 2085 (22.8)   |         |      |
|                                  | 17.2+ g/d      | 5952 (16.3)   | 787 ( 8.6)    | 1346 (14.8)   | 1778 (19.5)   | 2041 (22.4)   |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9125 (25.0)   | 5186 (56.8)   | 2118 (23.2)   | 1099 (12.0)   | 722 ( 7.9)    | \<0.001 |      |
|                                  | 30-100 g/d     | 9125 (25.0)   | 1702 (18.7)   | 2571 (28.2)   | 2597 (28.5)   | 2255 (24.7)   |         |      |
|                                  | 100-\<236 g/d  | 9125 (25.0)   | 1104 (12.1)   | 2196 (24.1)   | 2739 (30.0)   | 3086 (33.8)   |         |      |
|                                  | 236+ g/d       | 9125 (25.0)   | 1133 (12.4)   | 2240 (24.5)   | 2690 (29.5)   | 3062 (33.6)   |         |      |

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
    - Need other food groups: vegetables and fruits – get data from GF
      (along with meat as food group)
    - Need nutrient variables: Carotenoids (LYCO, LUTE, LZ, ZEA)? – JO
      to think about
    - Crosstab b/w egg and meat intake
    - Mean/percentiles by egg intake group
    - Re-label egg intake groups
    - Model with and without comobidity
      - Model 1a: Demographics and lifestyle + Egg
      - Model 1b: Add comorbidity
      - Model 2a: Model 1a + other food groups
      - Model 2b: Model 1b + other food groups
  - For the second paper:
    - Keep semi-veg together with non-veg for now
