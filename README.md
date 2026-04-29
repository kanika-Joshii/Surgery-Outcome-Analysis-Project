# Surgery Outcome Analysis
A data analytics project that examines surgical patient records to identify patterns in complications, outcomes, and risk factors — using Python, MySQL, and Power BI.

## Overview
This project analyzes a dataset of 300 surgical patients to answer a core question:
**What patient and procedural factors are associated with complicated surgery outcomes?**
The analysis covers the full data analytics pipeline — from raw data loading and cleaning, to SQL-based querying, to an interactive Power BI dashboard.

## Dataset

- **File:** `Anesthesia_Dataset.csv`
- **Records:** 300 patients
- **Features (12):** Age, Gender, BMI, Surgery Type, Anesthesia Type, Surgery Duration, Pain Level, Complications, Preoperative Notes, Postoperative Notes, Outcome
- **Outcome column:** Binary — `0` = Successful, `1` = Complicated
- **Balance:** Perfectly balanced — 150 successful, 150 complicated outcomes

## Project Steps

### 1. Data Loading
- Loaded `Anesthesia_Dataset.csv` using Pandas
- Performed initial inspection using `.info()`, `.describe()`, `.isnull().sum()`

### 2. Data Cleaning
- Standardized column names (stripped whitespace, lowercased)
- Filled null values in the `complications` column with `"No Complication"`
- Checked and confirmed zero duplicate rows

### 3. Exploratory Data Analysis (EDA)
- Analyzed distributions of Age, BMI, Gender, Pain Level, and Outcome
- Visualized relationships: Age vs Outcome, BMI vs Complications, Surgery Duration vs Pain Level
- Generated a correlation heatmap across all numeric features

**Key findings:**
- Patients with complications tend to be slightly older, but the difference is small
- No single feature strongly predicts outcome — results depend on a combination of factors
- BMI has no strong direct link to specific complication types
- Pain level does not scale cleanly with surgery duration

### 4. MySQL Integration
- Connected Python to a local MySQL database (`surgery_db`) using SQLAlchemy
- Ran 10 analytical SQL queries covering:
  - Patient counts and demographics
  - Anesthesia type distribution
  - Complication identification
  - Success vs failure percentage breakdown
  - Top 5 longest surgeries
  - Average pain level by surgery type
  - Most common preoperative condition

### 5. Power BI Dashboard
- Built an interactive dashboard using the cleaned dataset
- Visualizes key metrics across surgery types, outcomes, demographics, and complications

---

## Dashboard

The Power BI dashboard file is included as `surgery_dashboard.pbit`.

It covers:
- Overall outcome breakdown (success vs complicated)
- Complication distribution by surgery type
- Patient demographics (age, gender, BMI)
- Pain level and surgery duration trends

> Open the `.pbit` file in Power BI Desktop and connect to your local dataset to load the dashboard.

---

## Results

- **50% success rate, 50% complication rate** — balanced dataset, suitable for fair comparison
- **Age** is a weak but present risk signal — older patients show slightly more complications
- **Surgery type and anesthesia type** show variation in average BMI and pain levels
- **No dominant single predictor** — outcome is influenced by a combination of factors
- **Logical next step:** A machine learning classification model to predict outcomes

## Limitations

- Dataset is synthetic and small (300 rows) — findings are for learning purposes, not clinical use
- Text columns (PreoperativeNotes, PostoperativeNotes) were not analyzed
- No machine learning model built yet — classification is a clear next step


## Project Structure

```
surgery-outcome-analysis/
│
├── surgery_outcome_analysis.ipynb   # Main analysis notebook
├── anesthesia_sql_queries.sql       # All MySQL queries
├── surgery_dashboard.pbit           # Power BI dashboard
├── Anesthesia_Dataset.csv           # Source dataset
└── README.md                        # This file
```
