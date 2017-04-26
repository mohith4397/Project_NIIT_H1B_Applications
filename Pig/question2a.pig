--2 a) Which part of the US has the most Data Engineer jobs for each year?

REGISTER '/home/mohith/BigData/external_jars/piggybank-0.13.0.jar'; --Register external jar 'Piggy Bank.jar'
DEFINE CSVExcelStorage org.apache.pig.piggybank.storage.CSVExcelStorage;  -- within the jar define a function CSVExcelStorage()  
data = LOAD '/home/mohith/DatasetsandCodes/h1b_kaggle.csv' USING CSVExcelStorage() as 
(s_no:int,
case_status:chararray,
employer_name:chararray,
soc_name:chararray,
job_title:chararray,
full_time_position:chararray,
prevailing_wage:int,
year:chararray,
worksite:chararray,
longitute:double,
latitute:double);			--Load data

noheader= filter data by $0>=1;		--Remove header 

cleansed= filter noheader by $4 matches '.*DATA ENGINEER.*' and $7 matches '2011'; --filtering dataset which contains 'DATA ENGINEER' .
a= group cleansed by $8;								--grouping by worksite
step_a= foreach a generate '2011',group,COUNT($1);				--generate year,worksite,count
step_b= order step_a by $2 desc;
answer_2011= limit step_b 1;

cleansed= filter noheader by $4 matches '.*DATA ENGINEER.*' and $7 matches '2012'; --filtering dataset which contains 'DATA ENGINEER' .
a= group cleansed by $8;								--grouping by worksite
step_a= foreach a generate '2012',group,COUNT($1);				--generate year,worksite,count
step_b= order step_a by $2 desc;
answer_2012= limit step_b 1;

cleansed= filter noheader by $4 matches '.*DATA ENGINEER.*' and $7 matches '2013'; 
a= group cleansed by $8;
step_a= foreach a generate '2013',group,COUNT($1);
step_b= order step_a by $2 desc;
answer_2013= limit step_b 1;

cleansed= filter noheader by $4 matches '.*DATA ENGINEER.*' and $7 matches '2014'; 
a= group cleansed by $8;
step_a= foreach a generate '2014',group,COUNT($1);
step_b= order step_a by $2 desc;
answer_2014= limit step_b 1;

cleansed= filter noheader by $4 matches '.*DATA ENGINEER.*' and $7 matches '2015'; 
a= group cleansed by $8;
step_a= foreach a generate '2015',group,COUNT($1);
step_b= order step_a by $2 desc;
answer_2015= limit step_b 1;

cleansed= filter noheader by $4 matches '.*DATA ENGINEER.*' and $7 matches '2016'; 
a= group cleansed by $8;
step_a= foreach a generate '2016',group,COUNT($1);
step_b= order step_a by $2 desc;
answer_2016= limit step_b 1;

dump answer_2011;			--display answers for every year
dump answer_2012;
dump answer_2013;
dump answer_2014;
dump answer_2015;
dump answer_2016;
