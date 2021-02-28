--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-tds-mods.sql
--Student ID: 31009751
--Student Name: Sai Ram Gitte
--Tutorial No: 13

/* Comments for your marker:




*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
alter table officer
add Number_Of_Times_Officer_Has_Booked_Drivers Number(3) ;

update officer o 
set 
Number_Of_Times_Officer_Has_Booked_Drivers = nvl((select count(officer_id) "Number of times officer has booked drivers" from offence where o.officer_id = officer_id group by officer_id) , 0);

commit;










/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
DROP TABLE revoking PURGE;
DROP TABLE reason PURGE;


CREATE TABLE reason (

reason_no NUMBER(3) NOT NULL,
reason_code char(3) NOT NULL, 
reason_description Varchar(50) NOT NULL,

CONSTRAINT pk_reason PRIMARY KEY (reason_no)

);

CREATE TABLE revoking (

off_no NUMBER(8) NOT NULL,
revoke_datetime DATE NOT NULL, 
officer_id NUMBER(8) NOT NULL,
reason_no NUMBER(3) NOT NULL,

CONSTRAINT pk_revoking PRIMARY KEY (off_no),
CONSTRAINT fk_offence_offence_id FOREIGN KEY (off_no) REFERENCES OFFENCE(off_no),
CONSTRAINT fk_reason_reason_no FOREIGN KEY (reason_no) REFERENCES REASON(reason_no)
);


alter table offence
add Revoked_Offence Char(3) ;

update offence set revoked_offence = 'No';
commit;

/*
3(iii) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE


drop table vehicle_description purge;
drop table colour purge;
drop table outer_part purge;
drop sequence colour_num_seq;

create table outer_part (

part_id NUMBER(3) NOT NULL,
part_code char(2) NOT NULL,
part_detail varchar(50) NOT NULL,

CONSTRAINT pk_parts PRIMARY KEY (part_id)

);

insert into outer_part values (1, 'SP', 'Spoiler');
commit;
insert into outer_part values (2, 'BM', 'Bumper');
commit;
insert into outer_part values (3, 'GR', 'Grilles');
commit;


create table colour (

colour_id NUMBER(3) NOT NULL,
colour_desc varchar(10) NOT NULL,

constraint pk_colour primary key (colour_id)

);

create sequence colour_num_seq start with 1 increment by 1;

insert into colour (colour_id, colour_desc)
select colour_num_seq.nextval, veh_maincolor from (select distinct veh_maincolor from vehicle);
commit;

insert into colour values(colour_num_seq.nextval, 'Magenta');
commit;

create table vehicle_description(

veh_vin char(17) NOT NULL,
part_id NUMBER(3) NOT NULL,
colour_id NUMBER(3) NOT NULL,

constraint pk_vehicle_description primary key (veh_vin, part_id), 
constraint fk_vehicle_vehicle_description foreign key (veh_vin) REFERENCES VEHICLE(veh_vin),

constraint fk_part_vehicle_description foreign key (part_id) REFERENCES outer_part(part_id),

constraint fk_colour_vehicle_description foreign key (colour_id) REFERENCES colour(colour_id)

);


insert into vehicle_description values((select veh_vin from vehicle where veh_manufname = 'Lamborghini' and veh_modname = 'Huracan EVO' and veh_maincolor = 'Grey'), (select part_id from outer_part where part_detail = 'Spoiler'), (select colour_id from colour where colour_desc = 'Black'));
commit;
insert into vehicle_description values((select veh_vin from vehicle where veh_manufname = 'Lamborghini' and veh_modname = 'Huracan EVO' and veh_maincolor = 'Grey'), (select part_id from outer_part where part_detail = 'Grilles'), (select colour_id from colour where colour_desc = 'Magenta'));
commit;

insert into vehicle_description values((select veh_vin from vehicle where veh_manufname = 'Lamborghini' and veh_modname = 'Huracan Performante' and veh_maincolor = 'Black'), (select part_id from outer_part where part_detail = 'Spoiler'), (select colour_id from colour where colour_desc = 'Yellow'));
commit;
insert into vehicle_description values((select veh_vin from vehicle where veh_manufname = 'Lamborghini' and veh_modname = 'Huracan Performante' and veh_maincolor = 'Black'), (select part_id from outer_part where part_detail = 'Bumper'), (select colour_id from colour where colour_desc = 'Blue'));
commit;


/*You can uncomment and run the following query to update the vehicle table's veh_maincolor column with the colour codes that are present in the Colour table */
--update vehicle v set veh_maincolor = (select colour_no from colour where colour_desc = (select veh_maincolor from vehicle v1 where v.veh_vin = v1.veh_vin));
--commit;
























