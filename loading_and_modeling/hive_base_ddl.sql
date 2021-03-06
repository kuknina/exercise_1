DROP TABLE effective_care;

CREATE EXTERNAL TABLE effective_care (Provider_ID varchar(500), Hospital_Name varchar(500), Address varchar(500), City varchar(500), State varchar(500), ZIP_Code varchar(500), County_Name varchar(500), Phone_Number varchar(500), Condition varchar(500), Measure_ID varchar(500), Measure_Name varchar(500), Score varchar(500), Sample varchar(500), Footnote varchar(500))
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE
LOCATION '/user/kuknina/hospital_compare';

LOAD DATA LOCAL INPATH 'effective_care.csv.2'
OVERWRITE INTO TABLE effective_care;

DROP TABLE hospital_compare;

CREATE EXTERNAL TABLE hospital_compare (Provider_ID varchar(500), Hospital_Name varchar(500), Address varchar(500), City varchar(500), State varchar(500), ZIP_Code varchar(500), County_Name varchar(500), Phone_Number varchar(500), Hospital_Type varchar(500),  Hospital_Ownership varchar(500), Emergency_Services varchar(500))
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE
LOCATION '/user/kuknina/hospital_compare';

LOAD DATA LOCAL INPATH 'hospitals.csv'
OVERWRITE INTO TABLE hospital_compare;


DROP TABLE readmissions;

CREATE EXTERNAL TABLE readmissions (Provider_ID varchar(500), Hospital_Name varchar(500), Address varchar(500), City varchar(500), State varchar(500), ZIP_Code varchar(500), County_Name varchar(500), Phone_Number varchar(500), Measure_Name varchar(500), Measure_ID varchar(500), Compared_to_National varchar(500), Score varchar(500), Lower_Estimate varchar(500), Higher_Estimate varchar(500), Footnote varchar(500), Measure_Start_Date varchar(500), Measure_End_Date varchar(500))
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE
LOCATION '/user/kuknina/hospital_compare';

LOAD DATA LOCAL INPATH 'readmissions.csv'
OVERWRITE INTO TABLE readmissions;

DROP TABLE surveys_responses;

CREATE EXTERNAL TABLE surveys_responses (Provider_ID varchar(500), Hospital_Name varchar(500), Address varchar(500), City varchar(500), State varchar(500), ZIP_Code varchar(500), County_Name varchar(500), Phone_Number varchar(500), Condition varchar(500), Measure_ID varchar(500), Measure_Name varchar(500), Score varchar(500), Sample varchar(500), Footnote varchar(500), Measure_Start_Date varchar(500), Measure_End_Date varchar(500))
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE
LOCATION '/user/kuknina/hospital_compare';

LOAD DATA LOCAL INPATH 'surveys_responses.csv'
OVERWRITE INTO TABLE surveys_responses;
