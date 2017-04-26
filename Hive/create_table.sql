-- Table Creation
CREATE TABLE h1b_applications(s_no int,case_status string, employer_name string, soc_name string, job_title string, full_time_position string,prevailing_wage int,year string, worksite string, longitute double, latitute double )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = "\""
) STORED AS TEXTFILE
TBLPROPERTIES('skip.header.line.count' = '1');
LOAD DATA LOCAL INPATH '/home/mohith/DatasetsandCodes/h1b_kaggle.csv' OVERWRITE INTO TABLE h1b_applications;

