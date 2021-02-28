--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-tds-insert.sql
--Student ID: 31009751
--Student Name: Sai Ram Gitte
--Tutorial No: 13

SET SERVEROUTPUT ON;


/* Comments for your marker:

Due to my limited knowledge on the locations here in Australia I might have used the Street name and Town interchangeably while inserting data into offence table.  



*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

-- Inserting driver details

-- Inserting data to offense table
insert into offence values(1, to_date('2-Jan-2016','DD-MON-YYYY'), 'Mulgrave', 108, 10000001, '100234', 'WAUZZZF15KD038432');
commit;
insert into offence values(2, to_date('10-Apr-2016','DD-MON-YYYY'), 'Clayton', 99, 10000002, '100235', 'ZHWEF4ZF2LLA13803');
commit;
insert into offence values(3, to_date('15-Aug-2016','DD-MON-YYYY'), 'St. Kilda', 100, 10000003, '100236', 'WAUZZZF1XKD037356');
commit;
insert into offence values(4, to_date('19-Dec-2016','DD-MON-YYYY'), 'Southbank', 131, 10000004, '100237', 'ZHWES4ZF8KLA12259');
commit;
insert into offence values(5, to_date('11-Feb-2017','DD-MON-YYYY'), 'Williamstown', 125, 10000005, '100238', '5TDBK3FH50S049497');
commit;
insert into offence values(6, to_date('21-May-2017','DD-MON-YYYY'), 'Yarraville', 118, 10000006, '100239', 'JM0ER10L200236251');
commit;
insert into offence values(7, to_date('29-Sep-2017','DD-MON-YYYY'), 'Footscray', 110, 10000007, '100240', 'MPATFS85JDT005836');
commit;
insert into offence values(8, to_date('1-Dec-2017','DD-MON-YYYY'), 'Brooklyn', 120, 10000008, '100241', 'JT4RN55D1J7027072');
commit;
insert into offence values(9, to_date('9-Mar-2018','DD-MON-YYYY'), 'Caulfield', 101, 10000009, '100242', 'YV449MRS0G2864142');
commit;
insert into offence values(10, to_date('13-Jun-2018','DD-MON-YYYY'), 'Toorak', 107, 10000010, '100243', 'JACUBS26G17100401');
commit;
insert into offence values(11, to_date('25-Oct-2018','DD-MON-YYYY'), 'Pankratz Street', 123, 10000011, '100244', '3VWRR31C56M424400');
commit;
insert into offence values(12, to_date('15-Dec-2018','DD-MON-YYYY'), 'Cordelia Court', 113, 10000012, '100245', 'WBAAM333XYKC67114');
commit;

insert into offence values(13, to_date('12-Mar-2016','DD-MON-YYYY'), 'Summit Way', 103, 10000013, '100234', 'WAUZZZF15KD038432');
commit;
insert into offence values(14, to_date('2-May-2016','DD-MON-YYYY'), 'Shopko Point', 99, 10000021, '100234', 'WAUZZZF15KD038432');
commit;
insert into offence values(15, to_date('2-Nov-2016','DD-MON-YYYY'), 'Toorak', 124, 10000009, '100234', 'WAUZZZF15KD038432');
commit;

insert into offence values(16, to_date('10-Mar-2017','DD-MON-YYYY'), 'Clayton', 100, 10000015, '100235', 'ZHWEF4ZF2LLA13803');
commit;
insert into offence values(17, to_date('17-Jun-2017','DD-MON-YYYY'), 'Clayton', 102, 10000019, '100235', 'ZHWEF4ZF2LLA13803');
commit;

insert into offence values(18, to_date('30-Jan-2019','DD-MON-YYYY'), 'Mulgrave', 112, 10000020, '100245', 'WBAAM333XYKC67114');
commit;
insert into offence values(19, to_date('17-Apr-2019','DD-MON-YYYY'), 'Caulfield', 111, 10000016, '100245', 'WBAAM333XYKC67114');
commit;
insert into offence values(20, to_date('11-May-2019','DD-MON-YYYY'), 'Belgrave Heights', 129, 10000006, '100245', 'WBAAM333XYKC67114');
commit;
insert into offence values(21, to_date('29-Jun-2019','DD-MON-YYYY'), 'Lysterfield', 122, 10000011, '100245', 'WBAAM333XYKC67114');

commit;

-- Inserting data to suspension table
insert into suspension values(100234, to_date('2-Nov-2016','DD-MON-YYYY'), add_months(to_date('2-Nov-2016','DD-MON-YYYY'), 6));
commit;
insert into suspension values(100235, to_date('17-Jun-2017','DD-MON-YYYY'), add_months(to_date('17-Jun-2017','DD-MON-YYYY'), 6));
commit;
insert into suspension values(100245, to_date('29-Jun-2019','DD-MON-YYYY'), add_months(to_date('29-Jun-2019','DD-MON-YYYY'), 6));
commit;

--Inserting few more test data in offence
insert into offence values(22, to_date('10-Nov-2016','DD-MON-YYYY'), 'Yarra', 99, 10000020, '100250', '5N1ED28T08C631303');
commit;
insert into offence values(23, to_date('29-Jun-2017','DD-MON-YYYY'), 'Parkville', 100, 10000020, '100250', '5N1ED28T08C631303');
commit;
insert into offence values(24, to_date('2-Jun-2019','DD-MON-YYYY'), 'Clayton', 101, 10000020, '100250', '5N1ED28T08C631303');
commit;

-- Inserting few more test data into offence
insert into offence values(25, to_date('1-Jan-2016','DD-MON-YYYY'), 'Yarra', 99, 10000011, '100011', '1N6ND12Y1HC385546');
commit;
insert into offence values(26, to_date('12-May-2017','DD-MON-YYYY'), 'Parkville', 100, 10000011, '100011', '1N6ND12Y1HC385546');
commit;
insert into offence values(27, to_date('2-mar-2019','DD-MON-YYYY'), 'Clayton', 101, 10000011, '100011', '1N6ND12Y1HC385546');
commit;
insert into offence values(28, to_date('9-mar-2019','DD-MON-YYYY'), 'Clayton', 101, 10000011, '100011', '1N6ND12Y1HC385546');
commit;
insert into offence values(29, to_date('11-mar-2019','DD-MON-YYYY'), 'Clayton', 101, 10000011, '100011', '1N6ND12Y1HC385546');
commit;


