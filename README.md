# Personal Dataset

## Motivation

#### I am on the life sciences track for the data analytics major so I wanted to choose a biological dataset. With this dataset I had hoped to determine what variables are the most influential on whether a patient survives having breast cancer or not.

## Data Processing
```
http://www.cbioportal.org/study/clinicalData?id=brca_metabric
```
#### My dataset is from cBioPortal for Cancer Genomics. It consists of 2,509 samples and their data. Once uploading the data to R, I then created a new dataframe with only my variables of interest; Patient's Vital Status, Tumor Size, and Lymph nodes examined positive. The column, Patient's Vital Status, consisted of the categorical variables, Living, Died of Disease, and Died of Other Causes. However, I only wanted to know which samples had and had not survived breast cancer. I then replaced all occurances of Died of Disease with Living. Lastly, I removed all patients with any missing data (listed as NA). This brought the total number of samples down to 1884.

## Visualization
### Figure 1
![image](https://user-images.githubusercontent.com/67665228/144691795-eb627d8b-a4cf-4cd9-b57b-eeec1c27cbca.png)
#### Figure 1 shows the distribution of tumor size among the patients who lived and died. Although there is not too big of a divide between the two plots, samples that died of disease do appear to have bigger tumors.

### Figure 2
![image](https://user-images.githubusercontent.com/67665228/144691902-7b5aa928-5343-4f7f-a16a-4edb5f6d24f4.png)
#### Figure 2 shows the distribution of the number of positive lymph nodes among the patients who lived and died. Again, there is not a big divide between the plots, but the samples who died seem to have a higher count of lymph nodes. This plot shows there are a lot of outliers for this variable, which might skew the data right.

### Figure 3
![image](https://user-images.githubusercontent.com/67665228/144692038-fa94d9b3-fe31-47f9-b611-c76a674ef9fc.png)
#### Figure 3 shows the range of fitted values found for both of the categories for patient's vital status. A fitted value that is less than 0.5 suggests the patient died of disease whereas greater than 0.5 suggests they lived. 

## Analysis
#### I performed a multiple logistic regression to find a model to accurate predict the categorical variable, patient's vital status. I used two numerical values, tumor size and number of positive lymphnodes, to estimate this as they seemed to be valid factors after examining their boxplots (Figure 1 and Figure 2).

#### Refering back to Figure 3, the boxplot of the samples that lived appears to have a larger value for its median than the other had for its 75th percentile mark. This suggests that tumor size and positive lymph nodes create a somewhat usuable model for predicting patient's vital status. This agrees with my findings that the model correctly classifies 70% of the provided data.
