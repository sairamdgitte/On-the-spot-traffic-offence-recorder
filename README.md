# On-the-spot-traffic-offence-recorder
To develop a database to record the details of "on-the-spot" traffic offences incurred by drivers. The system records the details of: Drivers, Police officers, offences, demerit points, Vehicle make, suspension of license Data Manipulation, SQL Queries and Design Modifications Tools used: Oracle SQL Developer 20.2, Git and Version Control Language: SQL


# TASK 1: Data Manipulation

# Adding my own test data that adheres to the following rules:
1. The primary key values for this data should be hardcoded values (i.e., NOT
make use of sequences) and must consist of values below 100.
2. Offences that you add must involve at least 12 different drivers.
3. You must not add any offences for the following driver:
● Lion Lawless of 72 Aberg Avenue Richmond South 3121 (Licence
no.: 100389)
4. Dates used must be chosen between the 1st January 2016 and 30th June
2019.
5. For each year from 2016 to 2019, you should add at least 4 offences.
6. The suspensions you add in the database should not be in just one year,
e.g., you should not add all the suspensions in 2018.
7. The suspensions you add in the database should not belong to just one
driver, e.g., you should not add all the suspensions for the driver with licence
number 100100.
8. A suspended driver cannot incur extra offences under this system while
suspended. If a driver commits a driving offence while suspended their
vehicle is impounded and they are sent before the court (this means you
must not add an offence to a suspended driver until their suspension period
has expired).
9. The supplied trigger shows the current total demerit points for a driver when
you insert a new offence. You will need to run your inserts one by one in
your offence date order, taking appropriate action if the drivers' accumulated
points pass the 12 demerit point threshold. Any offence that you add, and
any appropriate action that you may have to take as a result of the addition
of the new offence, must be managed as a single transaction.

# Task 2
For Task 2, SQL must correctly manage transactions and use sequences to generate new primary keys for numeric primary key values (under
no circumstances may a new primary key value be hardcoded as a number or value)

(i) Create a sequence which will allow entry of data into the OFFENCE table - the
sequence must begin at 100 and go up in steps of 1 (i.e., the first value is 100, the
next 101, etc.)

(ii) Lion Lawless of 72 Aberg Avenue Richmond South 3121 (Licence no.: 100389)
has been very inconsiderate of others on the road over the years and has
committed several offences that have been booked by highly vigilant TDS officers
at various different locations. Lion Lawless was riding the same motorbike, a 1994
Red Yamaha FZR600 (JYA3HHE05RA070562) at the time of committing these
offences. Lion Lawless has only committed the offences listed below. The details of
the bookings for Lion are as follows:
● 10-Aug-2019 08:04 AM booked for traffic offence “Blood alcohol charge” by
police officer Dolley Hedling (10000011)
● On 16-Oct-2019 9:00 PM booked for traffic offence “Level crossing offence”
by police officer Geoff Kilmartin (10000015)
● On 7-Jan-2020 7:07 AM booked for traffic offences “Exceeding the speed
limit by 25 km/h or more” by police officer Geoff Kilmartin (10000015)

(iii) Lion Lawless of 72 Aberg Avenue Richmond South 3121 (Licence no.: 100389)
had appealed against the “Exceeding the speed limit by 25 km/h or more” offence
he has been alleged to have committed on 07-Jan-2020 at 7:07 AM.

# Task 3 - ANSI JOINS (No Implicit joins performed)
(i) Showing the demerit points and demerit description for all the demerits that either contains
the word “heavy” or “Heavy” or start with the word “Exceed” in the description. The column
headings in your output should be renamed as Demerit Points and Demerit Description.
The output must be sorted in ascending format by demerit points and where two demerits
have the same points sort them in ascending format of demerit description.

(ii) For all “Range Rover” and “Range Rover Sport” models, show the main colour, VIN
and manufacture year for all the vehicles that were manufactured from 2012 to 2014. The
column headings in your output should be renamed as Main Colour, VIN and Year
Manufactured. The output must be sorted by manufacture year in descending format and
where more than one vehicle was manufactured in the same year sort them by colour in
ascending format.

(iii) Showing the driver licence number, full name (firstname and lastname together), date of
birth, full address (street, town and postcode together), suspension start date and
suspension end date for all the drivers who have had their licence suspended in the last 30
months. You need SQL to calculate 30 months from the day this query would be executed
by the user. The column headings in your output should be renamed as Licence No.,
Driver Fullname, DOB, Driver Address, Suspended On and Suspended Till. The output
must be sorted by licence number in ascending format and where there is one licence
number suspended more than once sort them by suspended date in descending format.
Your output must have the form shown below.

(iv) TDS would like to find out if there is any correlation between different months of a year
and demerit codes so you have been assigned to generate a report that shows for ALL the
demerits, the code, description, total number of offences committed for the demerit code
so far in any month (of any year) and then the total of offences committed for the demerit
code in each month (of any year). The column headings in your output should be renamed
as Demerit Code, Demerit Description, Total Offences (All Months), and then the first three
letters of each month (with the first letter in uppercase). The output must be sorted by
Total Offences (All Months) column in descending format and where there is more than
one demerit code with the same total, sort them by demerit code in ascending format. Your
output must have the form shown below.

(v) Finding out which manufacturer's vehicles are involved in the highest number of offences
which incur 2 or more demerit points. Show the manufacturer name and the total number
of offences that the manufacturer’s vehicles are involved in. The column headings in your
output should be renamed as Manufacturer Name and Total No. of Offences. The output
must be sorted by Total No. of Offences column in descending format and where there is
more than one manufacturer with the same total, sort them by manufacturer name in
ascending format.

(vi) Finding out the drivers who have been booked more than once for the same offence by
an officer with the last name as that of their last name. Show the driver licence number,
driver full name (firstname and lastname together), officer number, officer full name
(firstname and lastname together). The column headings in your output should be
renamed as Licence No., Driver Name, Officer ID, Officer Name.

(vii) For each demerit code for which an offence has been recorded, finding out the driver/s
who has/have been booked the most number of times. Show the demerit code, demerit
description, driver licence number, driver full name (firstname and lastname together) and
the total number of times the driver has been booked in the output. The column headings
in your output should be renamed as Demerit Code, Demerit Description, Licence No.,
Driver Fullname and Total Times Booked. The output must be sorted by demerit code in
ascending format and where for one demerit there is more than one driver booked the
most number of times sort them by licence number in ascending format.

(viii) For each region, showing the number of vehicles manufactured in the region and the
percentage of vehicles manufactured in the region. The last row of the output shows the
totals - the second column which shows the total number of vehicles manufactured in all
regions (which is the total of all the individual totals in this column) and the third column of
which shows the total percentage of vehicles manufactured in all the regions (which is the
total of all the individual percentages in this column). The first character of the VIN
represents the region where the vehicle was manufactured.

# Task 4 - Design Modifications

(i) TDS would like to be able to easily determine the total number of times each police
officer has booked a driver for a traffic offence. Add a new attribute which will record the
number of times each officer has booked drivers.
This attribute must be initialised to the correct current number of times each officer has
booked drivers based on the data which is currently stored in the system.

(ii) The problem TDS might face with the current database is if an offence is revoked for
some valid reason, it is impossible for them to keep the offence information for the revoked
offence in the database. TDS would like to fix this problem such that they are able to keep
information about a revoked offence along with the other required information such as
when it was revoked, who revoked the offence and the reason for revocation. For quick
access, it has been decided that a column is also required to indicate Yes or No if an
offence has been revoked or not. There will always be only one reason that can be
associated with a revocation. TDS will not be able to add all the reasons for a revocation of
the offences initially and so your solution should allow them to add new reasons as and
when there is a need. At this stage, the only reasons for revocation of an offence TDS is
interested in recording are First offence exceeding the speed limit by less than 10km/h
(FOS), Faulty equipment used (FEU), Driver objection upheld (DOU), Court hearing (COH),
and Error in proceedings (EIP). Each reason code will have exactly 3 letters.
When providing the solution, you must consider the following:
a. only around 1% of offences recorded are revoked and there can be hundreds of
thousands of offences in the offence table,
b. all existing offences, after implementing this requirement, must automatically be
recorded as not revoked,
c. appeals are made by completing a paper form and sending the completed form to
TDS either by fax or mail and, at this stage, there is no need to record unsuccessful
appeals in the database.

(iii) TDS has found that having just the vehicle's main colour in the database, in some cases, is
inadequate in helping identify a vehicle that has been involved in a traffic offence. As a
consequence, they have decided to now also record if any outer part other than the body of the
vehicle is of a different colour. At this stage, the only other parts TDS is interested in recording the
colour of are the Spoiler (SP), Bumper (BM) and Grilles (GR) but this may change if the need
arises and so it should be able to be changed easily. Each outer part code will have exactly 2
letters. Where the colour of grilles, spoiler (if any) or Bumper is the same as that of the body
colour, there is no need to record anything in the database

TDS is also intending to find a solution such that new colours can be easily introduced when a
manufacturer releases a new colour. Each colour must be identified by a unique colour number
(which is auto-generated by the system) and has its colour description recorded.


