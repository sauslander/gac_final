## Load read in the data sets

gac_subject_test <- read.table("Get_Clean_project/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
gac_subject_train <- read.table("Get_Clean_project/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)

gac_x_train <- read.table("Get_Clean_project/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
gac_y_train <- read.table("Get_Clean_project/y_train.txt", header = FALSE, stringsAsFactors = FALSE)

gac_x_test <- read.table("Get_Clean_project/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
gac_y_test <- read.table("Get_Clean_project/y_test.txt", header = FALSE, stringsAsFactors = FALSE)

gac_active_labels <- read.table("Get_Clean_project/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)

## start labeling
colnames(gac_subject_test) <- "user_id"
colnames(gac_subject_train) <- "user_id"
colnames(gac_y_test) <- "activity_id"
colnames(gac_y_train) <- "activity_id"
colnames(gac_active_labels) <- c("activity_id","activity")

## Merge all by group
gac_test <- cbind(gac_subject_test, gac_y_test, gac_x_test)
gac_train <- cbind(gac_subject_train, gac_y_train, gac_x_train)

## Merge rows
gac_merged <- rbind(gac_test, gac_train)

## Add in descriptions of activities
gac_merged_activity <- merge(gac_merged, gac_active_labels, by.x = "activity_id" , by.y = "activity_id")

## Set descriptive names for rest of columns
gac_col_names <- read.table("Get_Clean_project/features.txt", header = FALSE, stringsAsFactors = FALSE, sep = " ")
list_col_names <- as.list(gac_col_names$V2)
colnames(gac_merged_activity) <- c("activity_id", "user_id", list_col_names, "activity")

#### Extract only the measurements of the columns that conatain mean/st dev

gac_merged_final <- cbind(gac_merged_activity[, grepl("user_id|activity_id|activity|Mean|mean|std", names(gac_merged_activity))])
gac_merged_final <- cbind(gac_merged_final$activity, gac_merged_final[,2:88])

#### Tidy data

gac_final <- gather(gac_merged_final, key = "measures", "values", -(1:2))
colnames(gac_final) <- c("activity", "user_id", "measures", "values")

#### Use group by and summarize to extract the average of each column for every unique combination of subject and activity

gac_final_tidy <- summarise(group_by(gac_final, activity, user_id, measures), mean = mean(values))

write.table(gac_final_tidy, file = "gac_tiday_sa.txt", row.names = FALSE)
