--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-tds-dm.sql
--Student ID: 31009751
--Student Name: Sai Ram Gitte
--Tutorial No: 13

SET SERVEROUTPUT ON;
drop sequence offence_num_seq;

/* Comments for your marker:


Due to my limited knowledge on the locations here in Australia I might have used the Street name and Town interchangeably while inserting data into offence table.


*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
create sequence offence_num_seq start with 100 increment by 1;





/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

insert into offence values(offence_num_seq.nextval, to_date('10-Aug-2019 8:04 AM','DD-MON-YYYY hh:mi AM'), 'Haas Crossing', (select dem_code from demerit where dem_description = 'Blood alcohol charge'), 10000011, '100389', 'JYA3HHE05RA070562');
commit;
insert into offence values(offence_num_seq.nextval, to_date('16-Oct-2019 9:00 PM','DD-MON-YYYY hh:mi PM'), 'Cody Park', (select dem_code from demerit where dem_description = 'Level crossing offence'), 10000015, '100389', 'JYA3HHE05RA070562');
commit;
insert into offence values(offence_num_seq.nextval, to_date('7-Jan-2020 7:07 AM','DD-MON-YYYY hh:mi AM'), 'Pine View Pass', (select dem_code from demerit where dem_description = 'Exceeding the speed limit by 25 km/h or more'), 10000015, '100389', 'JYA3HHE05RA070562');
commit;
/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
update offence set dem_code = (select dem_code from demerit where dem_description = 'Exceeding the speed limit by 10 km/h or more but less than 25 km/h') where lic_no = '100389' and dem_code = (select dem_code from demerit where dem_description = 'Exceeding the speed limit by 25 km/h or more');
commit;




