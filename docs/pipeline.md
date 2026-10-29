# Neuroimaging Pipeline Workflow

1. **Orientation Alignment:** All raw structural T1 scans reoriented to ASL space via `mri_convert`.
2. **Segmentation:** Automated tissue classification and WMH synthesis maps generated using `mri_WMHsynthseg`.
3. **Modeling Split:** Machine learning optimization using a 70/30 stratified training split.
4. **Resampling:** Minority cohort balance correction handled via SMOTE.
5. **Classifiers:** Predictive execution evaluated across Logistic Regression, XGBoost, Random Forest, and Linear SVM models.
