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

- Among n = 44,159 subjects, there were n = 146 subjects who opted out
  from the study. Excluding these subjects yielded n = 44,013.

## Inclusion/exclusion criteria

- Medicare beneficiaries who did not reach the age of 65 between 2008
  and 2020 (e.g., younger beneficiaries with disabilities or end-stage
  renal disease) were excluded (n = 1537), resulting n = 42,476.

- n = 1302 subjects with missing BMI or extreme BMI (\<16 or \>60),
  according to AHS questionnaire, were excluded, resulting n = 41,174.

- n = 1030 subjects with extreme calorie intake (\<500 or \>4500 kcal)
  were excluded, resulting n = 40,149.

- Prevalent cases of dementia and/or Alzheimer’s disease

  - If the first diagnosis was made before AHS-2 enrollment or within 6
    months after the enrollment, consider it as a prevalent case
  - n = 388 such prevalent cases were excluded, resulting n = 39,761
    subjects

- Unverified dates of deaths

  - Medicare data include a variable (`VALID_DEATH_DT_SW`) indicating
    whether a beneficiary’s day of death has been verified by the Social
    Security Administration or the Railroad Retirement Board.
  - There were 21 unverified death dates. Excluding these resulted n =
    39,740.

- Missing values in covariates

  - There were n = 3370 subjects who has at least one missing value on
    covariates (such as marital status, education, exercise level, sleep
    hours, smoking and alcohol use, all of them come from AHS
    questionnaire). These subjects were excluded, resulting in n =
    36,370.

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
| None           | 18706 | 51.43 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<11 g/d       |  5798 | 15.94 |  5.80 |  3.97 |  5.74 |  7.58 |
| 11-\<32 g/d    |  5822 | 16.01 | 19.38 | 14.35 | 18.45 | 23.80 |
| 32+ g/d        |  6044 | 16.62 | 63.33 | 41.44 | 54.83 | 75.08 |

| fish_gram_ea_4 |     n |   pct |  mean |    p1 |    p2 |    p3 |
|:---------------|------:|------:|------:|------:|------:|------:|
| None           | 18497 | 50.86 |  0.00 |  0.00 |  0.00 |  0.00 |
| \<8.6 g/d      |  5931 | 16.31 |  5.24 |  3.51 |  5.40 |  6.90 |
| 8.6-\<17.2 g/d |  6003 | 16.51 | 12.54 | 10.36 | 12.34 | 14.57 |
| 17.2+ g/d      |  5939 | 16.33 | 35.69 | 20.84 | 27.13 | 41.79 |

| eggs_gram_ea_4 |    n | pct |  mean |    p1 |    p2 |    p3 |
|:---------------|-----:|----:|------:|------:|------:|------:|
| \<3.6 g/d      | 9093 |  25 |  1.74 |  0.79 |  1.74 |  2.67 |
| 3.6-7.5 g/d    | 9092 |  25 |  5.48 |  4.53 |  5.42 |  6.41 |
| 7.5-\<16 g/d   | 9092 |  25 | 10.85 |  8.78 | 10.40 | 12.68 |
| 16+ g/d        | 9093 |  25 | 28.50 | 19.62 | 23.61 | 30.30 |

| dairy_gram_ea_4 |    n | pct |   mean |     p1 |     p2 |     p3 |
|:----------------|-----:|----:|-------:|-------:|-------:|-------:|
| \<30 g/d        | 9093 |  25 |  12.29 |   5.12 |  10.42 |  19.14 |
| 30-100 g/d      | 9092 |  25 |  60.06 |  42.32 |  57.73 |  76.83 |
| 100-\<236 g/d   | 9092 |  25 | 161.25 | 126.39 | 158.29 | 194.22 |
| 236+ g/d        | 9093 |  25 | 432.70 | 290.58 | 364.73 | 498.39 |

- For egg intake and meat intake, a crosstab was produced:
  - The first table was stratified by meat intake (% of egg intake
    within each meat level)
  - The second table was stratified by egg intake (% of meat intake
    within each egg level)

|                    | level        | None        | \<11 g/d    | 11-\<32 g/d | 32+ g/d     | p       | test |
|:-------------------|:-------------|:------------|:------------|:------------|:------------|:--------|:-----|
| n                  |              | 18706       | 5798        | 5822        | 6044        |         |      |
| eggs_gram_ea_4 (%) | \<3.6 g/d    | 6969 (37.3) | 989 (17.1)  | 587 (10.1)  | 548 ( 9.1)  | \<0.001 |      |
|                    | 3.6-7.5 g/d  | 4925 (26.3) | 1591 (27.4) | 1435 (24.6) | 1141 (18.9) |         |      |
|                    | 7.5-\<16 g/d | 3902 (20.9) | 1689 (29.1) | 1762 (30.3) | 1739 (28.8) |         |      |
|                    | 16+ g/d      | 2910 (15.6) | 1529 (26.4) | 2038 (35.0) | 2616 (43.3) |         |      |

|                    | level       | \<3.6 g/d   | 3.6-7.5 g/d | 7.5-\<16 g/d | 16+ g/d     | p       | test |
|:-------------------|:------------|:------------|:------------|:-------------|:------------|:--------|:-----|
| n                  |             | 9093        | 9092        | 9092         | 9093        |         |      |
| meat_gram_ea_4 (%) | None        | 6969 (76.6) | 4925 (54.2) | 3902 (42.9)  | 2910 (32.0) | \<0.001 |      |
|                    | \<11 g/d    | 989 (10.9)  | 1591 (17.5) | 1689 (18.6)  | 1529 (16.8) |         |      |
|                    | 11-\<32 g/d | 587 ( 6.5)  | 1435 (15.8) | 1762 (19.4)  | 2038 (22.4) |         |      |
|                    | 32+ g/d     | 548 ( 6.0)  | 1141 (12.5) | 1739 (19.1)  | 2616 (28.8) |         |      |

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
| n                                |                | 36370         | 30258        | 6112         |         |      |
| agecat (%)                       | 65-69          | 6363 (17.5)   | 6268 (20.7)  | 95 ( 1.6)    | \<0.001 |      |
|                                  | 70-74          | 6564 (18.0)   | 6303 (20.8)  | 261 ( 4.3)   |         |      |
|                                  | 75-79          | 5843 (16.1)   | 5359 (17.7)  | 484 ( 7.9)   |         |      |
|                                  | 80-84          | 5160 (14.2)   | 4357 (14.4)  | 803 (13.1)   |         |      |
|                                  | 85-89          | 4578 (12.6)   | 3419 (11.3)  | 1159 (19.0)  |         |      |
|                                  | 90-94          | 3846 (10.6)   | 2421 ( 8.0)  | 1425 (23.3)  |         |      |
|                                  | 95+            | 4016 (11.0)   | 2131 ( 7.0)  | 1885 (30.8)  |         |      |
| bene_age_at_end_2020 (mean (SD)) |                | 80.83 (10.38) | 78.94 (9.63) | 90.17 (8.78) | \<0.001 |      |
| bene_sex_F (%)                   | M              | 13168 (36.2)  | 11054 (36.5) | 2114 (34.6)  | 0.004   |      |
|                                  | F              | 23202 (63.8)  | 19204 (63.5) | 3998 (65.4)  |         |      |
| rti_race3 (%)                    | NH White       | 27129 (74.6)  | 22093 (73.0) | 5036 (82.4)  | \<0.001 |      |
|                                  | Black          | 6809 (18.7)   | 5940 (19.6)  | 869 (14.2)   |         |      |
|                                  | Other          | 2432 ( 6.7)   | 2225 ( 7.4)  | 207 ( 3.4)   |         |      |
| marital (%)                      | Married        | 26767 (73.6)  | 22729 (75.1) | 4038 (66.1)  | \<0.001 |      |
|                                  | Never          | 1224 ( 3.4)   | 1049 ( 3.5)  | 175 ( 2.9)   |         |      |
|                                  | Div/Wid        | 8379 (23.0)   | 6480 (21.4)  | 1899 (31.1)  |         |      |
| educyou (%)                      | HS or less     | 7614 (20.9)   | 5995 (19.8)  | 1619 (26.5)  | \<0.001 |      |
|                                  | Some college   | 14324 (39.4)  | 11959 (39.5) | 2365 (38.7)  |         |      |
|                                  | Col grad+      | 14432 (39.7)  | 12304 (40.7) | 2128 (34.8)  |         |      |
| vegstat (%)                      | Vegan          | 3273 ( 9.0)   | 2619 ( 8.7)  | 654 (10.7)   | \<0.001 |      |
|                                  | Lacto-ovo      | 12225 (33.6)  | 9929 (32.8)  | 2296 (37.6)  |         |      |
|                                  | Semi           | 2064 ( 5.7)   | 1729 ( 5.7)  | 335 ( 5.5)   |         |      |
|                                  | Pesco          | 3364 ( 9.2)   | 2794 ( 9.2)  | 570 ( 9.3)   |         |      |
|                                  | Non-veg        | 15444 (42.5)  | 13187 (43.6) | 2257 (36.9)  |         |      |
| bmicat (%)                       | Normal         | 14202 (39.0)  | 11586 (38.3) | 2616 (42.8)  | \<0.001 |      |
|                                  | Overweight     | 13081 (36.0)  | 10916 (36.1) | 2165 (35.4)  |         |      |
|                                  | Obese          | 9087 (25.0)   | 7756 (25.6)  | 1331 (21.8)  |         |      |
| bmi (mean (SD))                  |                | 27.29 (5.74)  | 27.40 (5.77) | 26.74 (5.55) | \<0.001 |      |
| exercise (%)                     | None           | 8656 (23.8)   | 7076 (23.4)  | 1580 (25.9)  | \<0.001 |      |
|                                  | Low            | 8222 (22.6)   | 6857 (22.7)  | 1365 (22.3)  |         |      |
|                                  | Moderate       | 12056 (33.1)  | 10110 (33.4) | 1946 (31.8)  |         |      |
|                                  | Vigorous       | 7436 (20.4)   | 6215 (20.5)  | 1221 (20.0)  |         |      |
| sleephrs (%)                     | \<= 5 hrs      | 3493 ( 9.6)   | 2928 ( 9.7)  | 565 ( 9.2)   | \<0.001 |      |
|                                  | 6 hrs          | 7908 (21.7)   | 6697 (22.1)  | 1211 (19.8)  |         |      |
|                                  | 7 hrs          | 13253 (36.4)  | 11277 (37.3) | 1976 (32.3)  |         |      |
|                                  | 8 hrs          | 9682 (26.6)   | 7809 (25.8)  | 1873 (30.6)  |         |      |
|                                  | \>= 9 hrs      | 2034 ( 5.6)   | 1547 ( 5.1)  | 487 ( 8.0)   |         |      |
| smokecat (%)                     | Never          | 29006 (79.8)  | 24035 (79.4) | 4971 (81.3)  | 0.001   |      |
|                                  | Ever           | 7364 (20.2)   | 6223 (20.6)  | 1141 (18.7)  |         |      |
| alccat (%)                       | Never          | 22495 (61.9)  | 18219 (60.2) | 4276 (70.0)  | \<0.001 |      |
|                                  | Ever           | 13875 (38.1)  | 12039 (39.8) | 1836 (30.0)  |         |      |
| como_depress (%)                 | No             | 35015 (96.3)  | 29481 (97.4) | 5534 (90.5)  | \<0.001 |      |
|                                  | Yes            | 1355 ( 3.7)   | 777 ( 2.6)   | 578 ( 9.5)   |         |      |
| como_disab (%)                   | No             | 27705 (76.2)  | 25045 (82.8) | 2660 (43.5)  | \<0.001 |      |
|                                  | Yes            | 8665 (23.8)   | 5213 (17.2)  | 3452 (56.5)  |         |      |
| como_diabetes (%)                | No             | 34243 (94.2)  | 28930 (95.6) | 5313 (86.9)  | \<0.001 |      |
|                                  | Yes            | 2127 ( 5.8)   | 1328 ( 4.4)  | 799 (13.1)   |         |      |
| como_cvd (%)                     | No             | 31914 (87.7)  | 27637 (91.3) | 4277 (70.0)  | \<0.001 |      |
|                                  | Yes            | 4456 (12.3)   | 2621 ( 8.7)  | 1835 (30.0)  |         |      |
| como_hypert (%)                  | No             | 30174 (83.0)  | 26520 (87.6) | 3654 (59.8)  | \<0.001 |      |
|                                  | Yes            | 6196 (17.0)   | 3738 (12.4)  | 2458 (40.2)  |         |      |
| como_hyperl (%)                  | No             | 30794 (84.7)  | 26775 (88.5) | 4019 (65.8)  | \<0.001 |      |
|                                  | Yes            | 5576 (15.3)   | 3483 (11.5)  | 2093 (34.2)  |         |      |
| como_resp (%)                    | No             | 34939 (96.1)  | 29382 (97.1) | 5557 (90.9)  | \<0.001 |      |
|                                  | Yes            | 1431 ( 3.9)   | 876 ( 2.9)   | 555 ( 9.1)   |         |      |
| como_anemia (%)                  | No             | 33052 (90.9)  | 28317 (93.6) | 4735 (77.5)  | \<0.001 |      |
|                                  | Yes            | 3318 ( 9.1)   | 1941 ( 6.4)  | 1377 (22.5)  |         |      |
| como_kidney (%)                  | No             | 35898 (98.7)  | 29976 (99.1) | 5922 (96.9)  | \<0.001 |      |
|                                  | Yes            | 472 ( 1.3)    | 282 ( 0.9)   | 190 ( 3.1)   |         |      |
| como_hypoth (%)                  | No             | 34075 (93.7)  | 28914 (95.6) | 5161 (84.4)  | \<0.001 |      |
|                                  | Yes            | 2295 ( 6.3)   | 1344 ( 4.4)  | 951 (15.6)   |         |      |
| como_cancers (%)                 | No             | 35090 (96.5)  | 29470 (97.4) | 5620 (92.0)  | \<0.001 |      |
|                                  | Yes            | 1280 ( 3.5)   | 788 ( 2.6)   | 492 ( 8.0)   |         |      |
| meat_gram_ea_4 (%)               | None           | 18706 (51.4)  | 15218 (50.3) | 3488 (57.1)  | \<0.001 |      |
|                                  | \<11 g/d       | 5798 (15.9)   | 4824 (15.9)  | 974 (15.9)   |         |      |
|                                  | 11-\<32 g/d    | 5822 (16.0)   | 4941 (16.3)  | 881 (14.4)   |         |      |
|                                  | 32+ g/d        | 6044 (16.6)   | 5275 (17.4)  | 769 (12.6)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18497 (50.9)  | 15072 (49.8) | 3425 (56.0)  | \<0.001 |      |
|                                  | \<8.6 g/d      | 5931 (16.3)   | 4890 (16.2)  | 1041 (17.0)  |         |      |
|                                  | 8.6-\<17.2 g/d | 6003 (16.5)   | 5131 (17.0)  | 872 (14.3)   |         |      |
|                                  | 17.2+ g/d      | 5939 (16.3)   | 5165 (17.1)  | 774 (12.7)   |         |      |
| eggs_gram_ea_4 (%)               | \<3.6 g/d      | 9093 (25.0)   | 7335 (24.2)  | 1758 (28.8)  | \<0.001 |      |
|                                  | 3.6-7.5 g/d    | 9092 (25.0)   | 7549 (24.9)  | 1543 (25.2)  |         |      |
|                                  | 7.5-\<16 g/d   | 9092 (25.0)   | 7710 (25.5)  | 1382 (22.6)  |         |      |
|                                  | 16+ g/d        | 9093 (25.0)   | 7664 (25.3)  | 1429 (23.4)  |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9093 (25.0)   | 7441 (24.6)  | 1652 (27.0)  | \<0.001 |      |
|                                  | 30-100 g/d     | 9092 (25.0)   | 7678 (25.4)  | 1414 (23.1)  |         |      |
|                                  | 100-\<236 g/d  | 9092 (25.0)   | 7619 (25.2)  | 1473 (24.1)  |         |      |
|                                  | 236+ g/d       | 9093 (25.0)   | 7520 (24.9)  | 1573 (25.7)  |         |      |

## Descriptive table by egg intake

|                                  | level          | Overall       | \<3.6 g/d     | 3.6-7.5 g/d   | 7.5-\<16 g/d  | 16+ g/d       | p       | test |
|:---------------------------------|:---------------|:--------------|:--------------|:--------------|:--------------|:--------------|:--------|:-----|
| n                                |                | 36370         | 9093          | 9092          | 9092          | 9093          |         |      |
| ALZH_DEMEN_YN2 (%)               | Non-case       | 30258 (83.2)  | 7335 (80.7)   | 7549 (83.0)   | 7710 (84.8)   | 7664 (84.3)   | \<0.001 |      |
|                                  | Case           | 6112 (16.8)   | 1758 (19.3)   | 1543 (17.0)   | 1382 (15.2)   | 1429 (15.7)   |         |      |
| agecat (%)                       | 65-69          | 6363 (17.5)   | 1403 (15.4)   | 1566 (17.2)   | 1728 (19.0)   | 1666 (18.3)   | \<0.001 |      |
|                                  | 70-74          | 6564 (18.0)   | 1513 (16.6)   | 1628 (17.9)   | 1753 (19.3)   | 1670 (18.4)   |         |      |
|                                  | 75-79          | 5843 (16.1)   | 1422 (15.6)   | 1493 (16.4)   | 1450 (15.9)   | 1478 (16.3)   |         |      |
|                                  | 80-84          | 5160 (14.2)   | 1337 (14.7)   | 1271 (14.0)   | 1245 (13.7)   | 1307 (14.4)   |         |      |
|                                  | 85-89          | 4578 (12.6)   | 1222 (13.4)   | 1122 (12.3)   | 1129 (12.4)   | 1105 (12.2)   |         |      |
|                                  | 90-94          | 3846 (10.6)   | 1017 (11.2)   | 999 (11.0)    | 878 ( 9.7)    | 952 (10.5)    |         |      |
|                                  | 95+            | 4016 (11.0)   | 1179 (13.0)   | 1013 (11.1)   | 909 (10.0)    | 915 (10.1)    |         |      |
| bene_age_at_end_2020 (mean (SD)) |                | 80.83 (10.38) | 81.77 (10.53) | 80.91 (10.38) | 80.19 (10.26) | 80.46 (10.28) | \<0.001 |      |
| bene_sex_F (%)                   | M              | 13168 (36.2)  | 3213 (35.3)   | 3054 (33.6)   | 3452 (38.0)   | 3449 (37.9)   | \<0.001 |      |
|                                  | F              | 23202 (63.8)  | 5880 (64.7)   | 6038 (66.4)   | 5640 (62.0)   | 5644 (62.1)   |         |      |
| rti_race3 (%)                    | NH White       | 27129 (74.6)  | 6911 (76.0)   | 6779 (74.6)   | 6526 (71.8)   | 6913 (76.0)   | \<0.001 |      |
|                                  | Black          | 6809 (18.7)   | 1471 (16.2)   | 1667 (18.3)   | 2006 (22.1)   | 1665 (18.3)   |         |      |
|                                  | Other          | 2432 ( 6.7)   | 711 ( 7.8)    | 646 ( 7.1)    | 560 ( 6.2)    | 515 ( 5.7)    |         |      |
| marital (%)                      | Married        | 26767 (73.6)  | 6639 (73.0)   | 6661 (73.3)   | 6813 (74.9)   | 6654 (73.2)   | 0.002   |      |
|                                  | Never          | 1224 ( 3.4)   | 354 ( 3.9)    | 303 ( 3.3)    | 283 ( 3.1)    | 284 ( 3.1)    |         |      |
|                                  | Div/Wid        | 8379 (23.0)   | 2100 (23.1)   | 2128 (23.4)   | 1996 (22.0)   | 2155 (23.7)   |         |      |
| educyou (%)                      | HS or less     | 7614 (20.9)   | 1679 (18.5)   | 1915 (21.1)   | 1942 (21.4)   | 2078 (22.9)   | \<0.001 |      |
|                                  | Some college   | 14324 (39.4)  | 3438 (37.8)   | 3515 (38.7)   | 3547 (39.0)   | 3824 (42.1)   |         |      |
|                                  | Col grad+      | 14432 (39.7)  | 3976 (43.7)   | 3662 (40.3)   | 3603 (39.6)   | 3191 (35.1)   |         |      |
| vegstat (%)                      | Vegan          | 3273 ( 9.0)   | 2703 (29.7)   | 394 ( 4.3)    | 150 ( 1.6)    | 26 ( 0.3)     | \<0.001 |      |
|                                  | Lacto-ovo      | 12225 (33.6)  | 3470 (38.2)   | 3638 (40.0)   | 2925 (32.2)   | 2192 (24.1)   |         |      |
|                                  | Semi           | 2064 ( 5.7)   | 359 ( 3.9)    | 575 ( 6.3)    | 614 ( 6.8)    | 516 ( 5.7)    |         |      |
|                                  | Pesco          | 3364 ( 9.2)   | 846 ( 9.3)    | 942 (10.4)    | 857 ( 9.4)    | 719 ( 7.9)    |         |      |
|                                  | Non-veg        | 15444 (42.5)  | 1715 (18.9)   | 3543 (39.0)   | 4546 (50.0)   | 5640 (62.0)   |         |      |
| bmicat (%)                       | Normal         | 14202 (39.0)  | 4934 (54.3)   | 3752 (41.3)   | 2973 (32.7)   | 2543 (28.0)   | \<0.001 |      |
|                                  | Overweight     | 13081 (36.0)  | 2817 (31.0)   | 3308 (36.4)   | 3582 (39.4)   | 3374 (37.1)   |         |      |
|                                  | Obese          | 9087 (25.0)   | 1342 (14.8)   | 2032 (22.3)   | 2537 (27.9)   | 3176 (34.9)   |         |      |
| bmi (mean (SD))                  |                | 27.29 (5.74)  | 25.46 (5.15)  | 26.91 (5.37)  | 27.92 (5.65)  | 28.87 (6.18)  | \<0.001 |      |
| exercise (%)                     | None           | 8656 (23.8)   | 1592 (17.5)   | 2093 (23.0)   | 2311 (25.4)   | 2660 (29.3)   | \<0.001 |      |
|                                  | Low            | 8222 (22.6)   | 1837 (20.2)   | 1972 (21.7)   | 2217 (24.4)   | 2196 (24.2)   |         |      |
|                                  | Moderate       | 12056 (33.1)  | 3200 (35.2)   | 3112 (34.2)   | 2922 (32.1)   | 2822 (31.0)   |         |      |
|                                  | Vigorous       | 7436 (20.4)   | 2464 (27.1)   | 1915 (21.1)   | 1642 (18.1)   | 1415 (15.6)   |         |      |
| sleephrs (%)                     | \<= 5 hrs      | 3493 ( 9.6)   | 808 ( 8.9)    | 827 ( 9.1)    | 949 (10.4)    | 909 (10.0)    | \<0.001 |      |
|                                  | 6 hrs          | 7908 (21.7)   | 1847 (20.3)   | 2005 (22.1)   | 2085 (22.9)   | 1971 (21.7)   |         |      |
|                                  | 7 hrs          | 13253 (36.4)  | 3312 (36.4)   | 3392 (37.3)   | 3259 (35.8)   | 3290 (36.2)   |         |      |
|                                  | 8 hrs          | 9682 (26.6)   | 2594 (28.5)   | 2418 (26.6)   | 2303 (25.3)   | 2367 (26.0)   |         |      |
|                                  | \>= 9 hrs      | 2034 ( 5.6)   | 532 ( 5.9)    | 450 ( 4.9)    | 496 ( 5.5)    | 556 ( 6.1)    |         |      |
| smokecat (%)                     | Never          | 29006 (79.8)  | 7547 (83.0)   | 7462 (82.1)   | 7180 (79.0)   | 6817 (75.0)   | \<0.001 |      |
|                                  | Ever           | 7364 (20.2)   | 1546 (17.0)   | 1630 (17.9)   | 1912 (21.0)   | 2276 (25.0)   |         |      |
| alccat (%)                       | Never          | 22495 (61.9)  | 6221 (68.4)   | 5843 (64.3)   | 5449 (59.9)   | 4982 (54.8)   | \<0.001 |      |
|                                  | Ever           | 13875 (38.1)  | 2872 (31.6)   | 3249 (35.7)   | 3643 (40.1)   | 4111 (45.2)   |         |      |
| como_depress (%)                 | No             | 35015 (96.3)  | 8774 (96.5)   | 8747 (96.2)   | 8768 (96.4)   | 8726 (96.0)   | 0.219   |      |
|                                  | Yes            | 1355 ( 3.7)   | 319 ( 3.5)    | 345 ( 3.8)    | 324 ( 3.6)    | 367 ( 4.0)    |         |      |
| como_disab (%)                   | No             | 27705 (76.2)  | 6763 (74.4)   | 6903 (75.9)   | 7075 (77.8)   | 6964 (76.6)   | \<0.001 |      |
|                                  | Yes            | 8665 (23.8)   | 2330 (25.6)   | 2189 (24.1)   | 2017 (22.2)   | 2129 (23.4)   |         |      |
| como_diabetes (%)                | No             | 34243 (94.2)  | 8666 (95.3)   | 8633 (95.0)   | 8516 (93.7)   | 8428 (92.7)   | \<0.001 |      |
|                                  | Yes            | 2127 ( 5.8)   | 427 ( 4.7)    | 459 ( 5.0)    | 576 ( 6.3)    | 665 ( 7.3)    |         |      |
| como_cvd (%)                     | No             | 31914 (87.7)  | 7919 (87.1)   | 7997 (88.0)   | 8026 (88.3)   | 7972 (87.7)   | 0.092   |      |
|                                  | Yes            | 4456 (12.3)   | 1174 (12.9)   | 1095 (12.0)   | 1066 (11.7)   | 1121 (12.3)   |         |      |
| como_hypert (%)                  | No             | 30174 (83.0)  | 7705 (84.7)   | 7556 (83.1)   | 7530 (82.8)   | 7383 (81.2)   | \<0.001 |      |
|                                  | Yes            | 6196 (17.0)   | 1388 (15.3)   | 1536 (16.9)   | 1562 (17.2)   | 1710 (18.8)   |         |      |
| como_hyperl (%)                  | No             | 30794 (84.7)  | 7751 (85.2)   | 7643 (84.1)   | 7721 (84.9)   | 7679 (84.4)   | 0.130   |      |
|                                  | Yes            | 5576 (15.3)   | 1342 (14.8)   | 1449 (15.9)   | 1371 (15.1)   | 1414 (15.6)   |         |      |
| como_resp (%)                    | No             | 34939 (96.1)  | 8750 (96.2)   | 8770 (96.5)   | 8762 (96.4)   | 8657 (95.2)   | \<0.001 |      |
|                                  | Yes            | 1431 ( 3.9)   | 343 ( 3.8)    | 322 ( 3.5)    | 330 ( 3.6)    | 436 ( 4.8)    |         |      |
| como_anemia (%)                  | No             | 33052 (90.9)  | 8237 (90.6)   | 8262 (90.9)   | 8291 (91.2)   | 8262 (90.9)   | 0.571   |      |
|                                  | Yes            | 3318 ( 9.1)   | 856 ( 9.4)    | 830 ( 9.1)    | 801 ( 8.8)    | 831 ( 9.1)    |         |      |
| como_kidney (%)                  | No             | 35898 (98.7)  | 8999 (99.0)   | 8990 (98.9)   | 8984 (98.8)   | 8925 (98.2)   | \<0.001 |      |
|                                  | Yes            | 472 ( 1.3)    | 94 ( 1.0)     | 102 ( 1.1)    | 108 ( 1.2)    | 168 ( 1.8)    |         |      |
| como_hypoth (%)                  | No             | 34075 (93.7)  | 8517 (93.7)   | 8463 (93.1)   | 8570 (94.3)   | 8525 (93.8)   | 0.013   |      |
|                                  | Yes            | 2295 ( 6.3)   | 576 ( 6.3)    | 629 ( 6.9)    | 522 ( 5.7)    | 568 ( 6.2)    |         |      |
| como_cancers (%)                 | No             | 35090 (96.5)  | 8753 (96.3)   | 8789 (96.7)   | 8783 (96.6)   | 8765 (96.4)   | 0.419   |      |
|                                  | Yes            | 1280 ( 3.5)   | 340 ( 3.7)    | 303 ( 3.3)    | 309 ( 3.4)    | 328 ( 3.6)    |         |      |
| meat_gram_ea_4 (%)               | None           | 18706 (51.4)  | 6969 (76.6)   | 4925 (54.2)   | 3902 (42.9)   | 2910 (32.0)   | \<0.001 |      |
|                                  | \<11 g/d       | 5798 (15.9)   | 989 (10.9)    | 1591 (17.5)   | 1689 (18.6)   | 1529 (16.8)   |         |      |
|                                  | 11-\<32 g/d    | 5822 (16.0)   | 587 ( 6.5)    | 1435 (15.8)   | 1762 (19.4)   | 2038 (22.4)   |         |      |
|                                  | 32+ g/d        | 6044 (16.6)   | 548 ( 6.0)    | 1141 (12.5)   | 1739 (19.1)   | 2616 (28.8)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18497 (50.9)  | 6622 (72.8)   | 4782 (52.6)   | 3916 (43.1)   | 3177 (34.9)   | \<0.001 |      |
|                                  | \<8.6 g/d      | 5931 (16.3)   | 964 (10.6)    | 1532 (16.8)   | 1635 (18.0)   | 1800 (19.8)   |         |      |
|                                  | 8.6-\<17.2 g/d | 6003 (16.5)   | 722 ( 7.9)    | 1434 (15.8)   | 1768 (19.4)   | 2079 (22.9)   |         |      |
|                                  | 17.2+ g/d      | 5939 (16.3)   | 785 ( 8.6)    | 1344 (14.8)   | 1773 (19.5)   | 2037 (22.4)   |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9093 (25.0)   | 5169 (56.8)   | 2112 (23.2)   | 1095 (12.0)   | 717 ( 7.9)    | \<0.001 |      |
|                                  | 30-100 g/d     | 9092 (25.0)   | 1697 (18.7)   | 2558 (28.1)   | 2587 (28.5)   | 2250 (24.7)   |         |      |
|                                  | 100-\<236 g/d  | 9092 (25.0)   | 1098 (12.1)   | 2188 (24.1)   | 2729 (30.0)   | 3077 (33.8)   |         |      |
|                                  | 236+ g/d       | 9093 (25.0)   | 1129 (12.4)   | 2234 (24.6)   | 2681 (29.5)   | 3049 (33.5)   |         |      |

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
