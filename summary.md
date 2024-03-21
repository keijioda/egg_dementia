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
- AHS-2, n = 96,144
  - Baseline data
  - Dietary data
- After merging Medicare and AHS-2 data, there were n = 44,359 subjects.

## Inclusion/exclusion criteria

- Medicare beneficiaries who did not reach the age of 65 between 2008
  and 2020 (e.g., younger beneficiaries with disabilities or end-stage
  renal disease) were excluded (n = 1545), resulting n = 42,814.

- n = 1322 subjects with missing BMI or extreme BMI (\<16 or \>60),
  according to AHS questionnaire, were excluded, resulting n = 41,492.

- n = 1136 subjects with extreme calorie intake (\<500 or \>4500 kcal)
  were excluded, resulting n = 40,356.

- Prevalent cases of dementia and/or Alzheimer’s disease

  - If the first diagnosis was made before AHS-2 enrollment or within 6
    months after the enrollment, consider it as a prevalent case
  - n = 388 such prevalent cases were excluded, resulting n = 39,968
    subjects

- Unverified dates of deaths

  - Medicare data include a variable (`VALID_DEATH_DT_SW`) indicating
    whether a beneficiary’s day of death has been verified by the Social
    Security Administration or the Railroad Retirement Board.
  - There were 21 unverified death dates. Excluding these resulted n =
    39,947.

- Missing values in covariates

  - There were n = 3398 subjects who has at least one missing value on
    covariates (such as marital status, education, exercise level, sleep
    hours, smoking and alcohol use, all of them come from AHS
    questionnaire). These subjects were excluded, resulting in n =
    36,549.

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
    conditions prior to dementia/Alzheimer’s disease were flagged.
    - Cancer: breast, colorectal, lung, prostate, endometrial
    - CVD: Acute MI, atrial fibrillation, congestive heart failure,
      ischemic heart disease, stroke/TIA
    - Hypertension or hyperlipidemia
    - Respiratory diseases: COPD, asthma
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
| n                                |                | 36549         | 30413        | 6136         |         |      |
| agecat (%)                       | 65-69          | 6408 (17.5)   | 6312 (20.8)  | 96 ( 1.6)    | \<0.001 |      |
|                                  | 70-74          | 6612 (18.1)   | 6350 (20.9)  | 262 ( 4.3)   |         |      |
|                                  | 75-79          | 5872 (16.1)   | 5383 (17.7)  | 489 ( 8.0)   |         |      |
|                                  | 80-84          | 5179 (14.2)   | 4372 (14.4)  | 807 (13.2)   |         |      |
|                                  | 85-89          | 4593 (12.6)   | 3431 (11.3)  | 1162 (18.9)  |         |      |
|                                  | 90-94          | 3859 (10.6)   | 2428 ( 8.0)  | 1431 (23.3)  |         |      |
|                                  | 95+            | 4026 (11.0)   | 2137 ( 7.0)  | 1889 (30.8)  |         |      |
| bene_age_at_end_2020 (mean (SD)) |                | 80.81 (10.38) | 78.93 (9.63) | 90.16 (8.78) | \<0.001 |      |
| bene_sex_F (%)                   | M              | 13233 (36.2)  | 11108 (36.5) | 2125 (34.6)  | 0.005   |      |
|                                  | F              | 23316 (63.8)  | 19305 (63.5) | 4011 (65.4)  |         |      |
| rti_race3 (%)                    | NH White       | 27257 (74.6)  | 22206 (73.0) | 5051 (82.3)  | \<0.001 |      |
|                                  | Black          | 6840 (18.7)   | 5964 (19.6)  | 876 (14.3)   |         |      |
|                                  | Other          | 2452 ( 6.7)   | 2243 ( 7.4)  | 209 ( 3.4)   |         |      |
| marital (%)                      | Married        | 26899 (73.6)  | 22845 (75.1) | 4054 (66.1)  | \<0.001 |      |
|                                  | Never          | 1234 ( 3.4)   | 1058 ( 3.5)  | 176 ( 2.9)   |         |      |
|                                  | Div/Wid        | 8416 (23.0)   | 6510 (21.4)  | 1906 (31.1)  |         |      |
| educyou (%)                      | HS or less     | 7650 (20.9)   | 6021 (19.8)  | 1629 (26.5)  | \<0.001 |      |
|                                  | Some college   | 14378 (39.3)  | 12010 (39.5) | 2368 (38.6)  |         |      |
|                                  | Col grad+      | 14521 (39.7)  | 12382 (40.7) | 2139 (34.9)  |         |      |
| vegstat (%)                      | Vegan          | 3288 ( 9.0)   | 2633 ( 8.7)  | 655 (10.7)   | \<0.001 |      |
|                                  | Lacto-ovo      | 12276 (33.6)  | 9973 (32.8)  | 2303 (37.5)  |         |      |
|                                  | Semi           | 2073 ( 5.7)   | 1737 ( 5.7)  | 336 ( 5.5)   |         |      |
|                                  | Pesco          | 3386 ( 9.3)   | 2813 ( 9.2)  | 573 ( 9.3)   |         |      |
|                                  | Non-veg        | 15526 (42.5)  | 13257 (43.6) | 2269 (37.0)  |         |      |
| bmicat (%)                       | Normal         | 14279 (39.1)  | 11654 (38.3) | 2625 (42.8)  | \<0.001 |      |
|                                  | Overweight     | 13149 (36.0)  | 10975 (36.1) | 2174 (35.4)  |         |      |
|                                  | Obese          | 9121 (25.0)   | 7784 (25.6)  | 1337 (21.8)  |         |      |
| bmi (mean (SD))                  |                | 27.29 (5.74)  | 27.39 (5.77) | 26.75 (5.55) | \<0.001 |      |
| exercise (%)                     | None           | 8690 (23.8)   | 7102 (23.4)  | 1588 (25.9)  | \<0.001 |      |
|                                  | Low            | 8258 (22.6)   | 6889 (22.7)  | 1369 (22.3)  |         |      |
|                                  | Moderate       | 12118 (33.2)  | 10165 (33.4) | 1953 (31.8)  |         |      |
|                                  | Vigorous       | 7483 (20.5)   | 6257 (20.6)  | 1226 (20.0)  |         |      |
| sleephrs (%)                     | \<= 5 hrs      | 3503 ( 9.6)   | 2936 ( 9.7)  | 567 ( 9.2)   | \<0.001 |      |
|                                  | 6 hrs          | 7943 (21.7)   | 6730 (22.1)  | 1213 (19.8)  |         |      |
|                                  | 7 hrs          | 13325 (36.5)  | 11340 (37.3) | 1985 (32.4)  |         |      |
|                                  | 8 hrs          | 9735 (26.6)   | 7854 (25.8)  | 1881 (30.7)  |         |      |
|                                  | \>= 9 hrs      | 2043 ( 5.6)   | 1553 ( 5.1)  | 490 ( 8.0)   |         |      |
| smokecat (%)                     | Never          | 29153 (79.8)  | 24164 (79.5) | 4989 (81.3)  | 0.001   |      |
|                                  | Ever           | 7396 (20.2)   | 6249 (20.5)  | 1147 (18.7)  |         |      |
| alccat (%)                       | Never          | 22597 (61.8)  | 18304 (60.2) | 4293 (70.0)  | \<0.001 |      |
|                                  | Ever           | 13952 (38.2)  | 12109 (39.8) | 1843 (30.0)  |         |      |
| como_depress (%)                 | No             | 35191 (96.3)  | 29634 (97.4) | 5557 (90.6)  | \<0.001 |      |
|                                  | Yes            | 1358 ( 3.7)   | 779 ( 2.6)   | 579 ( 9.4)   |         |      |
| como_disab (%)                   | No             | 27859 (76.2)  | 25185 (82.8) | 2674 (43.6)  | \<0.001 |      |
|                                  | Yes            | 8690 (23.8)   | 5228 (17.2)  | 3462 (56.4)  |         |      |
| como_diabetes (%)                | No             | 34416 (94.2)  | 29081 (95.6) | 5335 (86.9)  | \<0.001 |      |
|                                  | Yes            | 2133 ( 5.8)   | 1332 ( 4.4)  | 801 (13.1)   |         |      |
| como_cvd (%)                     | No             | 32081 (87.8)  | 27784 (91.4) | 4297 (70.0)  | \<0.001 |      |
|                                  | Yes            | 4468 (12.2)   | 2629 ( 8.6)  | 1839 (30.0)  |         |      |
| como_hthl (%)                    | No             | 28532 (78.1)  | 25466 (83.7) | 3066 (50.0)  | \<0.001 |      |
|                                  | Yes            | 8017 (21.9)   | 4947 (16.3)  | 3070 (50.0)  |         |      |
| como_resp (%)                    | No             | 35113 (96.1)  | 29534 (97.1) | 5579 (90.9)  | \<0.001 |      |
|                                  | Yes            | 1436 ( 3.9)   | 879 ( 2.9)   | 557 ( 9.1)   |         |      |
| como_kidney (%)                  | No             | 36072 (98.7)  | 30128 (99.1) | 5944 (96.9)  | \<0.001 |      |
|                                  | Yes            | 477 ( 1.3)    | 285 ( 0.9)   | 192 ( 3.1)   |         |      |
| como_hypoth (%)                  | No             | 34247 (93.7)  | 29065 (95.6) | 5182 (84.5)  | \<0.001 |      |
|                                  | Yes            | 2302 ( 6.3)   | 1348 ( 4.4)  | 954 (15.5)   |         |      |
| como_cancers (%)                 | No             | 35266 (96.5)  | 29622 (97.4) | 5644 (92.0)  | \<0.001 |      |
|                                  | Yes            | 1283 ( 3.5)   | 791 ( 2.6)   | 492 ( 8.0)   |         |      |
| meat_gram_ea_4 (%)               | None           | 18794 (51.4)  | 15295 (50.3) | 3499 (57.0)  | \<0.001 |      |
|                                  | \<11 g/d       | 5833 (16.0)   | 4856 (16.0)  | 977 (15.9)   |         |      |
|                                  | 11-\<32 g/d    | 5855 (16.0)   | 4969 (16.3)  | 886 (14.4)   |         |      |
|                                  | 32+ g/d        | 6067 (16.6)   | 5293 (17.4)  | 774 (12.6)   |         |      |
| fish_gram_ea_4 (%)               | None           | 18577 (50.8)  | 15141 (49.8) | 3436 (56.0)  | \<0.001 |      |
|                                  | \<8.6 g/d      | 5966 (16.3)   | 4922 (16.2)  | 1044 (17.0)  |         |      |
|                                  | 8.6-\<17.2 g/d | 6037 (16.5)   | 5163 (17.0)  | 874 (14.2)   |         |      |
|                                  | 17.2+ g/d      | 5969 (16.3)   | 5187 (17.1)  | 782 (12.7)   |         |      |
| eggs_gram_ea_4 (%)               | \<3.6 g/d      | 9138 (25.0)   | 7377 (24.3)  | 1761 (28.7)  | \<0.001 |      |
|                                  | 3.6-7.5 g/d    | 9137 (25.0)   | 7587 (24.9)  | 1550 (25.3)  |         |      |
|                                  | 7.5-\<16 g/d   | 9137 (25.0)   | 7747 (25.5)  | 1390 (22.7)  |         |      |
|                                  | 16+ g/d        | 9137 (25.0)   | 7702 (25.3)  | 1435 (23.4)  |         |      |
| dairy_gram_ea_4 (%)              | \<30 g/d       | 9138 (25.0)   | 7481 (24.6)  | 1657 (27.0)  | \<0.001 |      |
|                                  | 30-100 g/d     | 9137 (25.0)   | 7715 (25.4)  | 1422 (23.2)  |         |      |
|                                  | 100-\<236 g/d  | 9137 (25.0)   | 7660 (25.2)  | 1477 (24.1)  |         |      |
|                                  | 236+ g/d       | 9137 (25.0)   | 7557 (24.8)  | 1580 (25.7)  |         |      |

## Cox models

- To be completed
- Cox model with attained age as the time scale
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
  - Multivariable model 1 includes all covariates except for total
    energy intake (Unit: per 100 kcal/day) and 4 food group vairables
  - In Multivariable model 2, dietary pattern was removed and all 4 food
    group variables were added, while also adjusting for total energy
    intake.
- Trend p-values were displayed for ordinal variables (education, BMI
  categories, exercise, sleep hours and food group intakes) in
  multivariable models.
