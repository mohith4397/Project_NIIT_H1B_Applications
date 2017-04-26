--6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All 
--the cases over the period of time.

REGISTER '/home/mohith/BigData/external_jars/piggybank-0.13.0.jar';			--Register external jar 'Piggy Bank.jar'
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
latitute:double);		--load data


noheader= filter data by $0>=1;   --remove header
cleansed= filter noheader by $1 is not null and $1!='NA';
temp= group cleansed  by $7;
total= foreach temp generate group,COUNT(cleansed.$1);
--describe total;dump total;


noheader= filter data by $0>=1;
cleansed= filter noheader by $7 is not null and $7!='NA';
temp= group cleansed by ($7,$1);
yearsoccount= foreach temp generate group,group.$0,COUNT($1);
dump yearsoccount;
joined= join yearsoccount by $1,total by $0;
ans= foreach joined generate FLATTEN($0),(float)($2*100)/$4,$2; --percent generation
dump ans;

