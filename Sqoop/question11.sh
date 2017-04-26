#11) Export result for question no 10 to MySql database.
#Create a Database in mysql and create a table in it
hadoop fs -rm -r -f /Pig/Question10
hadoop fs -mkdir -p /Pig/Question10
hadoop fs -put /home/mohith/Pig/question10/p* /Pig/Question10/
mysql -u root -p'4397' -e 'drop database question11;create database if not exists question11;use question11;create table question11(job_title varchar(100),success_rate float,petitions int);';
sqoop export --connect jdbc:mysql://localhost/question11 --username root --password '4397' --table question11 --update-mode allowinsert  --export-dir /Pig/Question10/p* --input-fields-terminated-by '\t' ;
echo -e '\n\nDisplay contents from MySQL Database.\n\n'
echo -e '\n10) Which are the top 10 job positions that have  success rate more than 70% in petitions and total petitions filed more than 1000?\n\n'
mysql -u root -p'4397' -e 'select * from question11.question11';
