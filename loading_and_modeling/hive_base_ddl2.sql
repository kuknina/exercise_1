LOAD DATA LOCAL INPATH '/user/kuknina/hospital_compare/effective_care.csv'
OVERWRITE INTO TABLE effective_care;

CREATE EXTERNAL TABLE effective_care ('Provider_ID', 'Hospital_Name', 'Address', 'City', 'State', 'ZIP_Code', 'County_Name', 'Phone_Number', 'Condition', 'Measure_ID', 'Measure_Name', 'Score', 'Sample', 'Footnote')
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ‘,’ 
STORED AS TEXTFILE 
LOCATION ‘/user/kuknina/hospital_compare’;

LOAD DATA LOCAL INPATH '/user/kuknina/hospital_compare/hospital_compare.csv'
OVERWRITE INTO TABLE hospital_compare;

CREATE EXTERNAL TABLE hospitals ('Provider_ID', 'Hospital_Name', 'Address', 'City', 'State', 'ZIP_Code', 'County_Name', 'Phone_Number', 'Hospital_Type', 'Hospital_Ownership', 'Emergency_Services')
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ‘,’ 
STORED AS TEXTFILE 
LOCATION ‘/user/kuknina/hospital_compare’;

LOAD DATA LOCAL INPATH '/user/kuknina/hospital_compare/readmissions.csv'
OVERWRITE INTO TABLE readmissions;

CREATE EXTERNAL TABLE readmissions ('Provider_ID', 'Hospital_Name', 'Address', 'City', 'State', 'ZIP_Code', 'County_Name', 'Phone_Number', 'Measure_Name', 'Measure_ID', 'Compared_to_National', 'Score', 'Lower_Estimate', 'Higher_Estimate', 'Footnote', 'Measure_Start_Date', 'Measure_End_Date')
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ‘,’ 
STORED AS TEXTFILE 
LOCATION ‘/user/kuknina/hospital_compare’;

LOAD DATA LOCAL INPATH '/user/kuknina/hospital_compare/surveys_responses.csv'
OVERWRITE INTO TABLE surveys_responses;

CREATE EXTERNAL TABLE surveys_responses ('Provider_ID', 'Hospital_Name', 'Address', 'City', 'State', 'ZIP_Code', 'County_Name', 'Phone_Number', 'Condition', 'Measure_ID', 'Measure_Name', 'Score', 'Sample', 'Footnote', 'Measure_Start_Date', 'Measure_End_Date')
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ‘,’ 
STORED AS TEXTFILE 
LOCATION ‘/user/kuknina/hospital_compare’;
