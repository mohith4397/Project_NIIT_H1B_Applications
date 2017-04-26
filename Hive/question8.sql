--8) Find the average Prevailing Wage for each job for each year (take part time and full time separate). Arrange output in descending order

select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='Y' and year='2011' group by job_title,full_time_position,year order by average desc;
select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='N' and year='2011' group by job_title,full_time_position,year order by average desc;

select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='Y' and year='2012' group by job_title,full_time_position,year order by average desc;
select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='N' and year='2012' group by job_title,full_time_position,year order by average desc;

select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='Y' and year='2013' group by job_title,full_time_position,year order by average desc;
select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='N' and year='2013' group by job_title,full_time_position,year order by average desc;

select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='Y' and year='2014' group by job_title,full_time_position,year order by average desc;
select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='N' and year='2014' group by job_title,full_time_position,year order by average desc;

select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='Y' and year='2015' group by job_title,full_time_position,year order by average desc;
select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='N' and year='2015' group by job_title,full_time_position,year order by average desc;

select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='Y' and year='2016' group by job_title,full_time_position,year order by average desc;
select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position ='N' and year='2016' group by job_title,full_time_position,year order by average desc;
