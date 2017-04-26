## Project_NIIT_H1B_Applications
Data set link <br>
https://drive.google.com/file/d/0B-UpSievtnlkellOUURTT0xpMmM/view?usp=<br>
<u><b>H1-B Case Study</b></u><br>
The H1B is an employment-based, non-immigrant visa category for temporary foreign workers in the United States. For a foreign national to apply for H1B visa, an US employer must offer a job and petition for H1B visa with the US immigration department. This is the most common visa status applied for and held by international students once they complete college/ higher education (Masters, Ph.D.) and work in a full-time position.
We will be performing analysis on the H1B visa applicants between the years 2011-2016. After analyzing the data, we can derive the following facts.
~~~
1 a) Is the number of petitions with Data Engineer job title increasing over time?
  b) Find top 5 job titles who are having highest growth in applications.
2 a) Which part of the US has the most Data Engineer jobs for each year?
  b) find top 5 locations in the US who have got certified visa for each year.
3)Which industry has the most number of Data Scientist positions?
4)Which top 5 employers file the most petitions each year?
5) Find the most popular top 10 job positions for H1B visa applications for each year?
6) Find the percentage and the count of each case status on total applications for each year. 
Create a graph depicting the pattern of all the cases over the period of time.
7) Create a bar graph to depict the number of applications for each year
8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate).
Arrange the output in descending order.
9) Which are  employers along with the number of petitions who have the success rate more than 70% 
in petitions and total petitions filed more than 1000?
10) Which are the  job positions along with the number of petitions which have the success rate more than 70%
in petitions and total petitions filed more than 1000?
11) Export result for question no 10 to MySql database.
~~~
<b>SUCCESS RATE % = (Certified + Certified Withdrawn)/Total x 100</b><br>
The dataset has nearly 3 million records. 
The dataset description is as follows:
The columns in the dataset include:<br>
<b>CASE_STATUS:</b> <br>Status associated with the last significant event or decision.<br> Valid values include <b>"Certified"</b>,<b>"Certified-Withdrawn"</b>,<b>"Denied"</b>and<b>"Withdrawn"</b>.<br>
<b>Certified</b>: Employer filed the LCA, which was approved by DOL<br>
<b>Certified Withdrawn</b>: LCA was approved but later withdrawn by employer<br>
<b>Withdrawn</b>: LCA was withdrawn by employer before <br>
<b>Denied</b>: LCA was denied by DOL<br>
<br><b>EMPLOYER_NAME</b>: Name of employer submitting labour condition application.<br>
<b>SOC_NAME</b>: the Occupational name associated with the SOC_CODE. SOC_CODE is the occupational code associated with the job being requested for temporary labour condition, as classified by the Standard Occupational Classification (SOC) System.<br>
<b>JOB_TITLE</b>: Title of the job<br>
<b>FULL_TIME_POSITION:</b> <br><b>Y</b> = Full Time Position;<br><b>N</b> = Part Time Position<br>
<b>PREVAILING_WAGE:</b> Prevailing Wage for the job being requested for temporary labour condition. The wage is listed at annual scale in USD. The prevailing wage for a job position is defined as the average wage paid to similarly employed workers in the requested occupation in the area of intended employment. The prevailing wage is based on the employer’s minimum requirements for the position.
<br>
<b>YEAR:</b> Year in which the H1B visa petition was filed<br>
<b>WORKSITE:</b> City and State information of the foreign worker’s intended area of employment<br>
<b>lon:</b> longitude of the Worksite<br>
<b>lat:</b> latitude of the Worksite<br>

In the data, few columns are enclosed by double quotes and also we have comma’s in a single column and the column is enclosed by double quotes. So we have used hive csv serve to load the data. In the quoteChar, we have given “(double quote). So this will take the column value in between the double quotes.
Use all the following tools <br>

<b>MapReduce</b> - any 4 programs<br>
<b>Hive</b> - any 4 programs<br>
<b>Pig</b> - any 4 programs<br>

<b>Case Status</b><br>
1.certified<br>
2.certified withdrawn<br>
3.denied<br>
4.withdrawn<br>
5.pending quality and compliance review<br>
6.invalidated <br>
7.rejected<br>
8.NA<br>
