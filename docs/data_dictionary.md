# Data Dictionary - Dementia Volumetric and Demographic Features

| Variable Name | Data Type | Units | Clinical / Study Description |
| :--- | :---: | :---: | :--- |
| subject_id | String | - | Unique OASIS cross-sectional dataset tracking identifier |
| GreyMatter_vol | Float | mm³ | Total segmented cortical and subcortical gray matter volume |
| WhiteMatter_vol | Float | mm³ | Total segmented cerebral white matter volume |
| CSF_vol | Float | mm³ | Total volume of Cerebrospinal Fluid in the subarachnoid space |
| TBV | Float | mm³ | Total Brain Volume (Sum of Grey Matter and White Matter) |
| M/F | Char | - | Biological sex of the participant (M = Male, F = Female) |
| Hand | Char | - | Handedness preference of the subject (R = Right, L = Left) |
| Age | Integer | Years | Chronological age of the patient at the time of the scan |
| Educ | Float | Years | Formal educational level represented by years of schooling completed |
| SES | Float | Score | Socioeconomic Status metric ranking score (Lower = Higher status) |
| MMSE | Float | Score | Mini-Mental State Examination cognitive state global screening baseline |
| CDR | Float | Label | Clinical Dementia Rating target metric (0.0 = Healthy, 1.0 = Dementia) |
| eTIV | Integer | mm³ | Estimated Total Intracranial Volume calculation |
| nWBV | Float | Ratio | Normalized Whole Brain Volume relative proportion index |
| ASF | Float | Scale | Atlas Scaling Factor spatial normalization multiplier |
| Delay | Float | Days | Time delay parameter tracking metric |
| Ventricular_vol | Float | mm³ | Total volumetric load of the lateral, 3rd, and 4th brain ventricles |
| SSS | Float | mm³ | Specific structural tissue or space tracking measurement volume |
| NAWM | Float | mm³ | Normal Appearing White Matter volumetric baseline calculation |
| WML_vol | Float | mm³ | White Matter Lesion load volume burden (Label 77 from SynthSeg) |
