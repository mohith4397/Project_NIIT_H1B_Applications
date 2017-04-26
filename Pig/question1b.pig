 --1 b) Find top 5 job titles who are having highest growth in applications.

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

cleansed= filter noheader  by $7 matches '2011'; --filtering dataset by year
a= group cleansed by $4;								--grouping by job
step_a= foreach a generate group,COUNT($1);				--generate year,job,count


cleansed= filter noheader  by $7 matches '2012'; --filtering dataset by year
a= group cleansed by $4;								--grouping by job
step_b= foreach a generate group,COUNT($1);				--generate year,job,count


cleansed= filter noheader  by $7 matches '2013'; --filtering dataset by year
a= group cleansed by $4;								--grouping by job
step_c= foreach a generate group,COUNT($1);				--generate year,job,count


cleansed= filter noheader  by $7 matches '2014'; --filtering dataset by year
a= group cleansed by $4;								--grouping by job
step_d= foreach a generate group,COUNT($1);				--generate year,job,count

cleansed= filter noheader  by $7 matches '2015'; --filtering dataset by year
a= group cleansed by $4;								--grouping by job
step_e= foreach a generate group,COUNT($1);				--generate year,job,count


cleansed= filter noheader  by $7 matches '2016'; --filtering dataset by year
a= group cleansed by $4;								--grouping by job
step_f= foreach a generate group,COUNT($1);				--generate year,job,count


joined= join step_a by $0,step_b by $0,step_c by $0,step_d by $0,step_e by $0,step_f by $0;
yearwiseapplications= foreach joined generate $0,$1,$3,$5,$7,$9,$11;


--generate progressive growth
progressivegrowth= foreach yearwiseapplications  generate $0,
(float)($6-$5)*100/$5,(float)($5-$4)*100/$4,
(float)($4-$3)*100/$3,(float)($3-$2)*100/$2,
(float)($2-$1)*100/$1;

--average progressive growth
avgprogressivegrowth= foreach progressivegrowth generate $0,($1+$2+$3+$4+$5)/5;
---ordered progressive growth
orderedavggrowth= order avgprogressivegrowth by $1 desc;
--display top5 only
answer = limit orderedavggrowth  5;
dump answer;






