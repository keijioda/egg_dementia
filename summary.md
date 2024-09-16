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
  - For dairy, subjects were divided into 4 quartile groups.
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

|              | level  | None        | \<11 g/d    | 11-\<32 g/d | 32+ g/d     | p       | test |
|:-------------|:-------|:------------|:------------|:------------|:------------|:--------|:-----|
| n            |        | 18706       | 5798        | 5822        | 6044        |         |      |
| egg_freq (%) | Never  | 8126 (43.4) | 885 (15.3)  | 553 ( 9.5)  | 489 ( 8.1)  | \<0.001 |      |
|              | 1-3/mo | 4504 (24.1) | 1783 (30.8) | 1631 (28.0) | 1273 (21.1) |         |      |
|              | 1/wk   | 2627 (14.0) | 1210 (20.9) | 1258 (21.6) | 1231 (20.4) |         |      |
|              | 2+/wk  | 3449 (18.4) | 1920 (33.1) | 2380 (40.9) | 3051 (50.5) |         |      |

|                    | level       | Never       | 1-3/mo      | 1/wk        | 2+/wk       | p       | test |
|:-------------------|:------------|:------------|:------------|:------------|:------------|:--------|:-----|
| n                  |             | 10053       | 9191        | 6326        | 10800       |         |      |
| meat_gram_ea_4 (%) | None        | 8126 (80.8) | 4504 (49.0) | 2627 (41.5) | 3449 (31.9) | \<0.001 |      |
|                    | \<11 g/d    | 885 ( 8.8)  | 1783 (19.4) | 1210 (19.1) | 1920 (17.8) |         |      |
|                    | 11-\<32 g/d | 553 ( 5.5)  | 1631 (17.7) | 1258 (19.9) | 2380 (22.0) |         |      |
|                    | 32+ g/d     | 489 ( 4.9)  | 1273 (13.9) | 1231 (19.5) | 3051 (28.2) |         |      |

- Frequency tables of egg intake frequency and serving size are shown
  below:

|              | Overall      |
|:-------------|:-------------|
| n            | 36370        |
| eggbetrf (%) |              |
| Never        | 10053 (27.6) |
| 1-3x/mo      | 9191 (25.3)  |
| 1x/wk        | 6326 (17.4)  |
| 2-4x/wk      | 8702 (23.9)  |
| 5-6x/wk      | 1248 ( 3.4)  |
| 1x/day       | 545 ( 1.5)   |
| 2-3x/day     | 283 ( 0.8)   |
| 4-5x/day     | 15 ( 0.0)    |
| 6+x/day      | 7 ( 0.0)     |

|              | Overall      |
|:-------------|:-------------|
| n            | 36370        |
| eggbetra (%) |              |
| 1/2 serv     | 2644 ( 7.3)  |
| 1 serv       | 20630 (56.7) |
| 1.5+ serv    | 6501 (17.9)  |
| NA           | 6595 (18.1)  |

|              | 1/2 serv    | 1 serv      | 1.5+ serv   | missing      | p       | test |
|:-------------|:------------|:------------|:------------|:-------------|:--------|:-----|
| n            | 2644        | 20630       | 6501        | 6595         |         |      |
| eggbetrf (%) |             |             |             |              | \<0.001 |      |
| Never        | 1245 (47.1) | 1985 ( 9.6) | 228 ( 3.5)  | 6595 (100.0) |         |      |
| 1-3x/mo      | 812 (30.7)  | 6786 (32.9) | 1593 (24.5) | 0 ( 0.0)     |         |      |
| 1x/wk        | 263 ( 9.9)  | 4522 (21.9) | 1541 (23.7) | 0 ( 0.0)     |         |      |
| 2-4x/wk      | 274 (10.4)  | 5956 (28.9) | 2472 (38.0) | 0 ( 0.0)     |         |      |
| 5-6x/wk      | 27 ( 1.0)   | 810 ( 3.9)  | 411 ( 6.3)  | 0 ( 0.0)     |         |      |
| 1x/day       | 16 ( 0.6)   | 404 ( 2.0)  | 125 ( 1.9)  | 0 ( 0.0)     |         |      |
| 2-3x/day     | 5 ( 0.2)    | 158 ( 0.8)  | 120 ( 1.8)  | 0 ( 0.0)     |         |      |
| 4-5x/day     | 2 ( 0.1)    | 7 ( 0.0)    | 6 ( 0.1)    | 0 ( 0.0)     |         |      |
| 6+x/day      | 0 ( 0.0)    | 2 ( 0.0)    | 5 ( 0.1)    | 0 ( 0.0)     |         |      |

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
| egg_freq (%)                     | Never          | 10053 (27.6)  | 8104 (26.8)  | 1949 (31.9)  | \<0.001 |      |
|                                  | 1-3/mo         | 9191 (25.3)   | 7745 (25.6)  | 1446 (23.7)  |         |      |
|                                  | 1/wk           | 6326 (17.4)   | 5373 (17.8)  | 953 (15.6)   |         |      |
|                                  | 2+/wk          | 10800 (29.7)  | 9036 (29.9)  | 1764 (28.9)  |         |      |
| meat_gram_ea_4 (%)               | None           | 18706 (51.4)  | 15218 (50.3) | 3488 (57.1)  | \<0.001 |      |
|                                  | \<11 g/d       | 5798 (15.9)   | 4824 (15.9)  | 974 (15.9)   |         |      |
|                                  | 11-\<32 g/d    | 5822 (16.0)   | 4941 (16.3)  | 881 (14.4)   |         |      |
|                                  | 32+ g/d        | 6044 (16.6)   | 5275 (17.4)  | 769 (12.6)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18497 (50.9)  | 15072 (49.8) | 3425 (56.0)  | \<0.001 |      |
|                                  | \<8.6 g/d      | 5931 (16.3)   | 4890 (16.2)  | 1041 (17.0)  |         |      |
|                                  | 8.6-\<17.2 g/d | 6003 (16.5)   | 5131 (17.0)  | 872 (14.3)   |         |      |
|                                  | 17.2+ g/d      | 5939 (16.3)   | 5165 (17.1)  | 774 (12.7)   |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9093 (25.0)   | 7441 (24.6)  | 1652 (27.0)  | \<0.001 |      |
|                                  | 30-100 g/d     | 9092 (25.0)   | 7678 (25.4)  | 1414 (23.1)  |         |      |
|                                  | 100-\<236 g/d  | 9092 (25.0)   | 7619 (25.2)  | 1473 (24.1)  |         |      |
|                                  | 236+ g/d       | 9093 (25.0)   | 7520 (24.9)  | 1573 (25.7)  |         |      |

## Descriptive table by egg intake

|                                  | level          | Overall       | Never         | 1-3/mo        | 1/wk          | 2+/wk         | p       | test |
|:---------------------------------|:---------------|:--------------|:--------------|:--------------|:--------------|:--------------|:--------|:-----|
| n                                |                | 36370         | 10053         | 9191          | 6326          | 10800         |         |      |
| ALZH_DEMEN_YN2 (%)               | Non-case       | 30258 (83.2)  | 8104 (80.6)   | 7745 (84.3)   | 5373 (84.9)   | 9036 (83.7)   | \<0.001 |      |
|                                  | Case           | 6112 (16.8)   | 1949 (19.4)   | 1446 (15.7)   | 953 (15.1)    | 1764 (16.3)   |         |      |
| agecat (%)                       | 65-69          | 6363 (17.5)   | 1593 (15.8)   | 1713 (18.6)   | 1129 (17.8)   | 1928 (17.9)   | \<0.001 |      |
|                                  | 70-74          | 6564 (18.0)   | 1732 (17.2)   | 1703 (18.5)   | 1169 (18.5)   | 1960 (18.1)   |         |      |
|                                  | 75-79          | 5843 (16.1)   | 1584 (15.8)   | 1513 (16.5)   | 1023 (16.2)   | 1723 (16.0)   |         |      |
|                                  | 80-84          | 5160 (14.2)   | 1447 (14.4)   | 1269 (13.8)   | 883 (14.0)    | 1561 (14.5)   |         |      |
|                                  | 85-89          | 4578 (12.6)   | 1321 (13.1)   | 1112 (12.1)   | 811 (12.8)    | 1334 (12.4)   |         |      |
|                                  | 90-94          | 3846 (10.6)   | 1144 (11.4)   | 922 (10.0)    | 647 (10.2)    | 1133 (10.5)   |         |      |
|                                  | 95+            | 4016 (11.0)   | 1232 (12.3)   | 959 (10.4)    | 664 (10.5)    | 1161 (10.8)   |         |      |
| bene_age_at_end_2020 (mean (SD)) |                | 80.83 (10.38) | 81.52 (10.49) | 80.38 (10.29) | 80.61 (10.31) | 80.70 (10.36) | \<0.001 |      |
| bene_sex_F (%)                   | M              | 13168 (36.2)  | 3566 (35.5)   | 3042 (33.1)   | 2511 (39.7)   | 4049 (37.5)   | \<0.001 |      |
|                                  | F              | 23202 (63.8)  | 6487 (64.5)   | 6149 (66.9)   | 3815 (60.3)   | 6751 (62.5)   |         |      |
| rti_race3 (%)                    | NH White       | 27129 (74.6)  | 7329 (72.9)   | 6580 (71.6)   | 4888 (77.3)   | 8332 (77.1)   | \<0.001 |      |
|                                  | Black          | 6809 (18.7)   | 2105 (20.9)   | 1961 (21.3)   | 967 (15.3)    | 1776 (16.4)   |         |      |
|                                  | Other          | 2432 ( 6.7)   | 619 ( 6.2)    | 650 ( 7.1)    | 471 ( 7.4)    | 692 ( 6.4)    |         |      |
| marital (%)                      | Married        | 26767 (73.6)  | 7308 (72.7)   | 6579 (71.6)   | 4909 (77.6)   | 7971 (73.8)   | \<0.001 |      |
|                                  | Never          | 1224 ( 3.4)   | 404 ( 4.0)    | 331 ( 3.6)    | 165 ( 2.6)    | 324 ( 3.0)    |         |      |
|                                  | Div/Wid        | 8379 (23.0)   | 2341 (23.3)   | 2281 (24.8)   | 1252 (19.8)   | 2505 (23.2)   |         |      |
| educyou (%)                      | HS or less     | 7614 (20.9)   | 1983 (19.7)   | 2014 (21.9)   | 1262 (19.9)   | 2355 (21.8)   | \<0.001 |      |
|                                  | Some college   | 14324 (39.4)  | 3824 (38.0)   | 3586 (39.0)   | 2414 (38.2)   | 4500 (41.7)   |         |      |
|                                  | Col grad+      | 14432 (39.7)  | 4246 (42.2)   | 3591 (39.1)   | 2650 (41.9)   | 3945 (36.5)   |         |      |
| vegstat (%)                      | Vegan          | 3273 ( 9.0)   | 3273 (32.6)   | 0 ( 0.0)      | 0 ( 0.0)      | 0 ( 0.0)      | \<0.001 |      |
|                                  | Lacto-ovo      | 12225 (33.6)  | 3958 (39.4)   | 3611 (39.3)   | 2062 (32.6)   | 2594 (24.0)   |         |      |
|                                  | Semi           | 2064 ( 5.7)   | 355 ( 3.5)    | 689 ( 7.5)    | 417 ( 6.6)    | 603 ( 5.6)    |         |      |
|                                  | Pesco          | 3364 ( 9.2)   | 952 ( 9.5)    | 931 (10.1)    | 596 ( 9.4)    | 885 ( 8.2)    |         |      |
|                                  | Non-veg        | 15444 (42.5)  | 1515 (15.1)   | 3960 (43.1)   | 3251 (51.4)   | 6718 (62.2)   |         |      |
| bmicat (%)                       | Normal         | 14202 (39.0)  | 5293 (52.7)   | 3528 (38.4)   | 2308 (36.5)   | 3073 (28.5)   | \<0.001 |      |
|                                  | Overweight     | 13081 (36.0)  | 3119 (31.0)   | 3451 (37.5)   | 2449 (38.7)   | 4062 (37.6)   |         |      |
|                                  | Obese          | 9087 (25.0)   | 1641 (16.3)   | 2212 (24.1)   | 1569 (24.8)   | 3665 (33.9)   |         |      |
| bmi (mean (SD))                  |                | 27.29 (5.74)  | 25.66 (5.19)  | 27.25 (5.54)  | 27.45 (5.49)  | 28.75 (6.12)  | \<0.001 |      |
| exercise (%)                     | None           | 8656 (23.8)   | 1850 (18.4)   | 2325 (25.3)   | 1520 (24.0)   | 2961 (27.4)   | \<0.001 |      |
|                                  | Low            | 8222 (22.6)   | 2050 (20.4)   | 2038 (22.2)   | 1505 (23.8)   | 2629 (24.3)   |         |      |
|                                  | Moderate       | 12056 (33.1)  | 3535 (35.2)   | 3008 (32.7)   | 2096 (33.1)   | 3417 (31.6)   |         |      |
|                                  | Vigorous       | 7436 (20.4)   | 2618 (26.0)   | 1820 (19.8)   | 1205 (19.0)   | 1793 (16.6)   |         |      |
| sleephrs (%)                     | \<= 5 hrs      | 3493 ( 9.6)   | 929 ( 9.2)    | 950 (10.3)    | 548 ( 8.7)    | 1066 ( 9.9)   | \<0.001 |      |
|                                  | 6 hrs          | 7908 (21.7)   | 2090 (20.8)   | 2149 (23.4)   | 1321 (20.9)   | 2348 (21.7)   |         |      |
|                                  | 7 hrs          | 13253 (36.4)  | 3696 (36.8)   | 3253 (35.4)   | 2416 (38.2)   | 3888 (36.0)   |         |      |
|                                  | 8 hrs          | 9682 (26.6)   | 2801 (27.9)   | 2332 (25.4)   | 1698 (26.8)   | 2851 (26.4)   |         |      |
|                                  | \>= 9 hrs      | 2034 ( 5.6)   | 537 ( 5.3)    | 507 ( 5.5)    | 343 ( 5.4)    | 647 ( 6.0)    |         |      |
| smokecat (%)                     | Never          | 29006 (79.8)  | 8280 (82.4)   | 7357 (80.0)   | 5118 (80.9)   | 8251 (76.4)   | \<0.001 |      |
|                                  | Ever           | 7364 (20.2)   | 1773 (17.6)   | 1834 (20.0)   | 1208 (19.1)   | 2549 (23.6)   |         |      |
| alccat (%)                       | Never          | 22495 (61.9)  | 6795 (67.6)   | 5689 (61.9)   | 3901 (61.7)   | 6110 (56.6)   | \<0.001 |      |
|                                  | Ever           | 13875 (38.1)  | 3258 (32.4)   | 3502 (38.1)   | 2425 (38.3)   | 4690 (43.4)   |         |      |
| como_depress (%)                 | No             | 35015 (96.3)  | 9697 (96.5)   | 8854 (96.3)   | 6112 (96.6)   | 10352 (95.9)  | 0.037   |      |
|                                  | Yes            | 1355 ( 3.7)   | 356 ( 3.5)    | 337 ( 3.7)    | 214 ( 3.4)    | 448 ( 4.1)    |         |      |
| como_disab (%)                   | No             | 27705 (76.2)  | 7493 (74.5)   | 7108 (77.3)   | 4888 (77.3)   | 8216 (76.1)   | \<0.001 |      |
|                                  | Yes            | 8665 (23.8)   | 2560 (25.5)   | 2083 (22.7)   | 1438 (22.7)   | 2584 (23.9)   |         |      |
| como_diabetes (%)                | No             | 34243 (94.2)  | 9600 (95.5)   | 8702 (94.7)   | 5935 (93.8)   | 10006 (92.6)  | \<0.001 |      |
|                                  | Yes            | 2127 ( 5.8)   | 453 ( 4.5)    | 489 ( 5.3)    | 391 ( 6.2)    | 794 ( 7.4)    |         |      |
| como_cvd (%)                     | No             | 31914 (87.7)  | 8799 (87.5)   | 8087 (88.0)   | 5587 (88.3)   | 9441 (87.4)   | 0.265   |      |
|                                  | Yes            | 4456 (12.3)   | 1254 (12.5)   | 1104 (12.0)   | 739 (11.7)    | 1359 (12.6)   |         |      |
| como_hypert (%)                  | No             | 30174 (83.0)  | 8526 (84.8)   | 7638 (83.1)   | 5266 (83.2)   | 8744 (81.0)   | \<0.001 |      |
|                                  | Yes            | 6196 (17.0)   | 1527 (15.2)   | 1553 (16.9)   | 1060 (16.8)   | 2056 (19.0)   |         |      |
| como_hyperl (%)                  | No             | 30794 (84.7)  | 8582 (85.4)   | 7765 (84.5)   | 5359 (84.7)   | 9088 (84.1)   | 0.098   |      |
|                                  | Yes            | 5576 (15.3)   | 1471 (14.6)   | 1426 (15.5)   | 967 (15.3)    | 1712 (15.9)   |         |      |
| como_resp (%)                    | No             | 34939 (96.1)  | 9684 (96.3)   | 8874 (96.6)   | 6090 (96.3)   | 10291 (95.3)  | \<0.001 |      |
|                                  | Yes            | 1431 ( 3.9)   | 369 ( 3.7)    | 317 ( 3.4)    | 236 ( 3.7)    | 509 ( 4.7)    |         |      |
| como_anemia (%)                  | No             | 33052 (90.9)  | 9086 (90.4)   | 8388 (91.3)   | 5795 (91.6)   | 9783 (90.6)   | 0.020   |      |
|                                  | Yes            | 3318 ( 9.1)   | 967 ( 9.6)    | 803 ( 8.7)    | 531 ( 8.4)    | 1017 ( 9.4)   |         |      |
| como_kidney (%)                  | No             | 35898 (98.7)  | 9953 (99.0)   | 9078 (98.8)   | 6248 (98.8)   | 10619 (98.3)  | \<0.001 |      |
|                                  | Yes            | 472 ( 1.3)    | 100 ( 1.0)    | 113 ( 1.2)    | 78 ( 1.2)     | 181 ( 1.7)    |         |      |
| como_hypoth (%)                  | No             | 34075 (93.7)  | 9428 (93.8)   | 8619 (93.8)   | 5933 (93.8)   | 10095 (93.5)  | 0.745   |      |
|                                  | Yes            | 2295 ( 6.3)   | 625 ( 6.2)    | 572 ( 6.2)    | 393 ( 6.2)    | 705 ( 6.5)    |         |      |
| como_cancers (%)                 | No             | 35090 (96.5)  | 9680 (96.3)   | 8869 (96.5)   | 6129 (96.9)   | 10412 (96.4)  | 0.229   |      |
|                                  | Yes            | 1280 ( 3.5)   | 373 ( 3.7)    | 322 ( 3.5)    | 197 ( 3.1)    | 388 ( 3.6)    |         |      |
| meat_gram_ea_4 (%)               | None           | 18706 (51.4)  | 8126 (80.8)   | 4504 (49.0)   | 2627 (41.5)   | 3449 (31.9)   | \<0.001 |      |
|                                  | \<11 g/d       | 5798 (15.9)   | 885 ( 8.8)    | 1783 (19.4)   | 1210 (19.1)   | 1920 (17.8)   |         |      |
|                                  | 11-\<32 g/d    | 5822 (16.0)   | 553 ( 5.5)    | 1631 (17.7)   | 1258 (19.9)   | 2380 (22.0)   |         |      |
|                                  | 32+ g/d        | 6044 (16.6)   | 489 ( 4.9)    | 1273 (13.9)   | 1231 (19.5)   | 3051 (28.2)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18497 (50.9)  | 7684 (76.4)   | 4513 (49.1)   | 2637 (41.7)   | 3663 (33.9)   | \<0.001 |      |
|                                  | \<8.6 g/d      | 5931 (16.3)   | 900 ( 9.0)    | 1665 (18.1)   | 1163 (18.4)   | 2203 (20.4)   |         |      |
|                                  | 8.6-\<17.2 g/d | 6003 (16.5)   | 715 ( 7.1)    | 1584 (17.2)   | 1270 (20.1)   | 2434 (22.5)   |         |      |
|                                  | 17.2+ g/d      | 5939 (16.3)   | 754 ( 7.5)    | 1429 (15.5)   | 1256 (19.9)   | 2500 (23.1)   |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9093 (25.0)   | 5802 (57.7)   | 1723 (18.7)   | 707 (11.2)    | 861 ( 8.0)    | \<0.001 |      |
|                                  | 30-100 g/d     | 9092 (25.0)   | 2107 (21.0)   | 2803 (30.5)   | 1596 (25.2)   | 2586 (23.9)   |         |      |
|                                  | 100-\<236 g/d  | 9092 (25.0)   | 1149 (11.4)   | 2313 (25.2)   | 1932 (30.5)   | 3698 (34.2)   |         |      |
|                                  | 236+ g/d       | 9093 (25.0)   | 995 ( 9.9)    | 2352 (25.6)   | 2091 (33.1)   | 3655 (33.8)   |         |      |

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
