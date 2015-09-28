# GettingAndCleaningDataCourseProject
Github Link: https://github.com/ForLearningDataScience/GettingAndCleaningDataCourseProject

## Procedures 


#### Get the raw data
Obtain the raw data from the original set of data files: 
	`x_train`, `x_test`, `y_train`, `y_test`, `subject_train`, `subject_test`,
	 `activities`, `features`.


#### Clean the data
Combine the data from the raw data:
	`x`: combine `x_train` and `x_test`.
	`y`: combine `y_train` and `y_test`.
	`subject`: combine `subject_train` `subject_test`. 

Filter out the columns with average and standard deviation variables from the combined data:
	`mean_std_indexes`: filter out the keywords with `mean` and `std` from `features`, and return their indexes in the feature list.
	`x_mean_std`: obtain columns from `x` with indexes `mean_std_indexes`.


#### Make the data literally understandable
Replace the activity numbers with matched activity names in `y` column:
	`y`: update the contents of `y` with reference from `activities`.

Rename the columns of data to make literal senses and makes combination:
	`x_mean_std`: rename `x_mean_std` to according features from `features`.
	`y`: rename `y` to `Activity`.
	`subject`: rename `subject` to `Subject`.


#### Combine and output the data
Combine the filtered and literally understandable data together: 
	`data_mean_std`: combine `x_mean_std`, y, and `subject`.

Create an independent data set as an output:
	`tidy`: contain the average of each variable grouped by `Activity` and `Subject`.
			output it to `averages_Activity_Subject.txt` file.




© Jasmine Mou 2015 All Rights reserved