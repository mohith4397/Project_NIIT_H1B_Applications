--9) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?

REGISTER '/home/mohith/BigData/external_jars/piggybank-0.13.0.jar';	--Register external jar 'Piggy Bank.jar'
DEFINE CSVExcelStorage org.apache.pig.piggybank.storage.CSVExcelStorage;	 -- within the jar define a function CSVExcelStorage()   
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
latitute:double);

noheader= filter data by $0>=1; --Remove header

cleansed= filter noheader by $1 is not null and $1!='NA';
temp= group cleansed by $2;
total= foreach temp generate group,COUNT(cleansed.$1); --Group by employername and count the case statuses as a whole

certified= filter noheader by $1 == 'CERTIFIED';
temp1= group certified by $2;
totalcertified= foreach temp1 generate group,COUNT(certified.$1); --Group by employername and count the case status = 'CERTIFIED'

certified= filter noheader by $1 == 'CERTIFIED-WITHDRAWN';
temp2= group certified by $2;
totalcertifiedwithdrawn= foreach temp2 generate group,COUNT(certified.$1); --Group by employername and count the case status = 'CERTIFIED-WITHDRAWN'


joined= join totalcertified by $0,totalcertifiedwithdrawn by $0,total by $0;
--dump joined;
joined= foreach joined generate $0,$1,$3,$5;
intermediateoutput= foreach joined generate $0,(float)($1+$2)*100/($3),$3;
intermediateoutput2= filter intermediateoutput by $1>70 and $2>1000;	--Filter by success-rate greater than 70% and petition count above 1000
finaloutput= order intermediateoutput2 by $1 DESC;
dump finaloutput;
