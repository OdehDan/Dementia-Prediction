# Quantitative Machine Learning Evaluation Summary

## 🚨 Model Selection Context for Supervisors
While **Logistic Regression** yielded an exceptional overall area under the curve (**AUC = 98.75%**), its clinical utility for medical screening is compromised because it completely missed **38%** of active dementia cases (Class 1 Recall = 0.62). Similarly, the linear **Support Vector Machine (SVC)** drawn boundary left a massive blind spot, failing to detect half of the sick cohort (Recall = 0.50).

For deployment utility, **XGBoost Classifier is selected as the definitive operational pipeline**:
* **Class 1 (Dementia) Sensitivity (Recall): 88.00%** (Successfully captured 7 out of 8 dementia test instances, effectively minimizing hazardous false negatives).
* **Class 1 (Dementia) Precision: 88.00%**
* **Overall Accuracy Score: 96.00%**

## 🧠 Structural Brain Insights
The engineered tree boosting models show that **Mini-Mental State Examination (MMSE)** performance paired directly with the **Normalized Whole Brain Volume (nWBV)** ratio constitute the primary volumetric and behavioral pillars used to map and delineate neurodegenerative decline spaces across the 159 structural profiles.
