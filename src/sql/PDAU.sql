
drop table if exists `post_details_automobile`;
CREATE TABLE `post_details_automobile` (
  `POST_ID` decimal(10,0) NOT NULL,
  `SUB_CATEGORY` varchar(8) default NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `MAKE` varchar(32) default NULL,
  `MODEL` varchar(32) default NULL,
  `COLOR` varchar(16) default NULL,
  `YEAR` decimal(4,0) default NULL,
  `NO_OF_OWNERS` decimal(2,0) default NULL,
  `FUEL_TYPE` varchar(1) default NULL,
  `KMS_DONE` decimal(9,0) default NULL,
  `MILEAGE` decimal(4,0) default NULL,
  `PRICE` decimal(9,3) default NULL,
  `PRICE_NEGOTIABLE` varchar(1) default NULL,
  `INSURANCE_AVAILABLE` varchar(1) default NULL,
  `REG_NO` varchar(32) default NULL,
  `REG_CITY` varchar(8) default NULL,
  `REG_STATE` varchar(8) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop view pdau;
create view pdau as select * from post_details_automobile;

