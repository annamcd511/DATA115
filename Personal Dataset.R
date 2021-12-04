require(data.table)
library(ggplot2)

df <- as.data.frame(fread("C:/Users/annam/OneDrive/Documents/Fall 2021/Data Analytics 115/brca_metabric_clinical_data.tsv"))

cancer_data <- data.frame(df$`Patient's Vital Status`)
cancer_data$`Patient's Vital Status` <- cancer_data$df..Patient.s.Vital.Status.
cancer_data$`Patient's Vital Status`[cancer_data$`Patient's Vital Status` == "Died of Other Causes"] <- "Living"
cancer_data$`Patient's Vital Status`[cancer_data$`Patient's Vital Status` == "Living"] <- "Lived"
cancer_data$`Patient's Vital Status` <- as.factor(cancer_data$`Patient's Vital Status`)
cancer_data <- cancer_data[2]

cancer_data$'Lymph Nodes' <- df$`Lymph nodes examined positive`
cancer_data$'Tumor Size' <- df$`Tumor Size`
cancer_data <- na.omit(cancer_data)

ggplot(cancer_data, aes(x = `Patient's Vital Status`, y = `Tumor Size`)) + geom_boxplot(aes(fill = `Patient's Vital Status`)) + 
  ggtitle("Distribution of Tumor Size in Patients who Lived vs Died") + theme(legend.position = "none")

ggplot(cancer_data, aes(x = `Patient's Vital Status`, y = `Lymph Nodes`)) + geom_boxplot(aes(fill = `Patient's Vital Status`)) + 
  ggtitle("Distribution of Positive Lymph Nodes Found in Patients who Lived vs Died") + theme(legend.position = "none")

logREG <- glm(formula = as.factor(`Patient's Vital Status`) ~ `Tumor Size` + `Lymph Nodes`, family = binomial, data = cancer_data)
summary(logREG)

cancer_data$fitted_values <- logREG$fitted.values
cancer_data$prediction <- ifelse(cancer_data$fitted_values < .5,"Died of Disease", "Lived")
mean(cancer_data$prediction == cancer_data$`Patient's Vital Status`)

ggplot(cancer_data, aes(x = `Patient's Vital Status`, y = fitted_values )) + geom_boxplot(aes(fill = `Patient's Vital Status`)) + 
  ggtitle("Comparison of the Model to the Actual Patient's Vital Status") + theme(legend.position = "none")

