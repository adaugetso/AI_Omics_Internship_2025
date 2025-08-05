setwd("C:/Users/Getso/Documents/AI_Omics_Internship_2025/Module_I")

#Creating subfolders in the R directory

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("Tasks")
dir.create("Plots")

#Loading the data set

patient_info <- read.csv("patient_info.csv")

#Inspecting the structure of the data set

View(patient_info)
str(patient_info)

#Converting variables to appropriate data types where necessary

patient_info$gender <- as.factor(patient_info$gender)
patient_info$diagnosis <- as.factor(patient_info$diagnosis)
patient_info$smoker <- as.factor(patient_info$smoker)

#Creating a new variable for smoking status as a binary factor

patient_info$smoking_status <- factor(patient_info$smoker, 
                                         levels = c("Yes", "No"))

patient_info$smoking_status <- ifelse(patient_info$smoker == "Yes", 1, 0)

#saving the cleaned data set

write.csv(patient_info, file = "clean_data/patient_info_clean.csv")
