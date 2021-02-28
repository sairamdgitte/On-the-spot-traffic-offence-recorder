--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-tds-queries.sql
--Student ID: 31009751
--Student Name: Sai Ram Gitte
--Tutorial No: 13

/* Comments for your marker:
No Comments



*/


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select dem_points "Demerit Points", dem_description "Demerit Description" from demerit where lower(dem_description) like '%heavy%' or dem_description like 'Exceed%' order by dem_points, dem_description;





/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select veh_maincolor "Main Colour", veh_vin "VIN", to_char(veh_yrmanuf,'YYYY') "Year Manufactured" from vehicle where veh_modname like 'Range Rover%' and extract(year from veh_yrmanuf) between 2012 and 2014 order by veh_yrmanuf desc, veh_maincolor;




/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select s.lic_no "License No.", d.lic_fname || ' ' || d.lic_lname "Driver Fullname", to_char(d.lic_dob,'dd-Mon-yyyy') "DOB", d.lic_street || ' ' || d.lic_town  "Driver Address", to_char(s.sus_date,'dd/MON/yy') "Suspended on", to_char(s.sus_enddate,'dd/MON/yy') "Suspended Till" from driver d join suspension s on d.lic_no = s.lic_no where s.sus_date between add_months(sysdate,-30) and sysdate order by "License No.", "Suspended on" desc ;




/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select dem_code "Demerit Code", dem_description "Demerit Description",
(select count(*) from offence where demerit.dem_code = offence.dem_code) "Total Offences (All Months)",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Jan' and demerit.dem_code = offence.dem_code) "Jan",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Feb' and demerit.dem_code = offence.dem_code) "Feb",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Mar' and demerit.dem_code = offence.dem_code) "Mar",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Apr' and demerit.dem_code = offence.dem_code) "Apr",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'May' and demerit.dem_code = offence.dem_code) "May",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Jun' and demerit.dem_code = offence.dem_code) "Jun",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Jul' and demerit.dem_code = offence.dem_code) "Jul",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Aug' and demerit.dem_code = offence.dem_code) "Aug",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Sep' and demerit.dem_code = offence.dem_code) "Sep",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Oct' and demerit.dem_code = offence.dem_code) "Oct",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Nov' and demerit.dem_code = offence.dem_code) "Nov",
(select count(*) from offence where to_char(off_datetime,'Mon') = 'Dec' and demerit.dem_code = offence.dem_code) "Dec"
from demerit order by "Total Offences (All Months)" desc, dem_code ;

/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select v.veh_manufname "Manufacturer Name", count(*) "Total No. of Offences" from offence o join vehicle v on o.veh_vin = v.veh_vin where dem_code in (select dem_code from demerit where dem_points >= 2) group by v.veh_manufname having count(*) = (select max(count(*)) from offence natural join vehicle group by veh_manufname) order by count(*) desc, v.veh_manufname;



/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE


select d.lic_no "License No.", d.lic_fname||' '||d.lic_lname "Driver Name", o1.officer_id "Officer ID", o1.officer_fname||' '||o1.officer_lname "Officer Name" from offence o join officer o1 on o.officer_id = o1.officer_id join driver d on o.lic_no = d.lic_no where o1.officer_lname = d.lic_lname group by d.lic_no, d.lic_fname||' '||d.lic_lname, o1.officer_id, o1.officer_fname||' '||o1.officer_lname, o.dem_code  having count(*) > 1 order by "License No.";

/*
2(vii) Query 7
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE


select o.dem_code "Demerit Code", d.dem_description "Demerit Description", o.lic_no "License No.", d1.lic_fname||' '||d1.lic_lname "Driver Fullname", count(*) "Total Times Booked" from demerit d join offence o on d.dem_code = o.dem_code join driver d1 on d1.lic_no= o.lic_no group by o.dem_code, d.dem_description, o.lic_no, d1.lic_fname||' '||d1.lic_lname having count(*) = (select max(count(*)) from offence where o.dem_code = offence.dem_code group by lic_no, dem_code) order by o.dem_code, "License No.";



/*
2(viii) Query 8
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select
case 
    when substr(veh_vin, 1, 1) between '1' and '5' then 
        'North America'
    when substr(veh_vin, 1, 1) between '6' and '7' then 
        'Oceania'
    when substr(veh_vin, 1, 1) between '8' and '9' then 
        'South America'
    when lower(substr(veh_vin, 1, 1)) between 'a' and 'c'  then 
        'Africa'
    when lower(substr(veh_vin, 1, 1)) between 'j' and 'r'  then
        'Asia'
    when lower(substr(veh_vin, 1, 1)) between 's' and 'z'  then
        'Europe'
    else 'unknown'
end as Region, count(*) "Total Vehicles Manufactured", lpad(to_char(round(100*count(*) / (select count(*) from vehicle),2), '90.99') || '%', 27, ' ')  "Percentage of Vehicles Manufactured"

from vehicle group by case 
    when substr(veh_vin, 1, 1) between '1' and '5' then 
        'North America'
    when substr(veh_vin, 1, 1) between '6' and '7' then 
        'Oceania'
    when substr(veh_vin, 1, 1) between '8' and '9' then 
        'South America'
    when lower(substr(veh_vin, 1, 1)) between 'a' and 'c'  then 
        'Africa'
    when lower(substr(veh_vin, 1, 1)) between 'j' and 'r'  then
        'Asia'
    when lower(substr(veh_vin, 1, 1)) between 's' and 'z'  then
        'Europe'
    else 'unknown'
end 

union

select
lpad('TOTAL', 13), sum(count(veh_vin)), lpad(to_char(sum(round(100*count(*) / (select count(*) from vehicle), 2)), '90.99') || '%', 27, ' ') from vehicle group by case 
    when substr(veh_vin, 1, 1) between '1' and '5' then 
        'North America'
    when substr(veh_vin, 1, 1) between '6' and '7' then 
        'Oceania'
    when substr(veh_vin, 1, 1) between '8' and '9' then 
        'South America'
    when lower(substr(veh_vin, 1, 1)) between 'a' and 'c'  then 
        'Africa'
    when lower(substr(veh_vin, 1, 1)) between 'j' and 'r'  then
        'Asia'
    when lower(substr(veh_vin, 1, 1)) between 's' and 'z'  then
        'Europe'
    else 'unknown'
end order by "Total Vehicles Manufactured";






















