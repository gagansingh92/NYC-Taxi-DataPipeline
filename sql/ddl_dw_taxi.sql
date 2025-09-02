CREATE SCHEMA `taxi_dw` ;

use taxi_dw ; 

-- Creating Dimension table
-- ======================================
-- rate_code_dim
-- ======================================
CREATE  TABLE rate_code_dim ( 
	rc_id                INT  AUTO_INCREMENT NOT NULL,
	rate_code_id         VARCHAR(10)  NOT NULL,
	rate_code_name     VARCHAR(100)  NOT NULL,
    PRIMARY KEY(rc_id)
 ) ;

ALTER TABLE rate_code_dim COMMENT 'The final rate code in effect at the end of the trip.';
ALTER TABLE rate_code_dim MODIFY rc_id INT  NOT NULL   COMMENT 'The final rate code in effect at the end of the trip.';
ALTER TABLE rate_code_dim MODIFY rate_code_id VARCHAR(10)  NOT NULL   COMMENT 'Rate Code';
ALTER TABLE rate_code_dim MODIFY rate_code_name VARCHAR(100)  NOT NULL   COMMENT 'rate code area';

-- select * from rate_code_dim;

-- ==================================
-- passenger_count_dim
-- ==================================
CREATE  TABLE passenger_count_dim ( 
	passenger_count_id   INT  AUTO_INCREMENT NOT NULL,
	passenger_count      varchar(10)  NOT NULL,
    PRIMARY KEY(passenger_count_id)
 );

ALTER TABLE passenger_count_dim COMMENT 'The number of passengers in the vehicle';
ALTER TABLE passenger_count_dim MODIFY passenger_count_id INT  NOT NULL   COMMENT 'The number of passengers in the vehicle';
ALTER TABLE passenger_count_dim MODIFY passenger_count INT  NOT NULL   COMMENT 'The number of passengers in the vehicle';

-- select * from passenger_count_dim;

-- 

-- ==================================
-- vendor_dim
-- ==================================

CREATE  TABLE vendor_dim ( 
	vc_id                INT AUTO_INCREMENT NOT NULL ,
	vendor_id            VARCHAR(10)  NOT NULL,
	vendor_name          VARCHAR(100)  NOT NULL,
	PRIMARY KEY(vc_id)
 );

ALTER TABLE vendor_dim COMMENT 'A code indicating the TPEP provider that provided the record.';
ALTER TABLE vendor_dim MODIFY vc_id INT  NOT NULL   COMMENT 'A code indicating the TPEP provider that provided the record.';
ALTER TABLE vendor_dim MODIFY vendor_id VARCHAR(10)  NOT NULL   COMMENT 'vendor_code 1, 2';
ALTER TABLE vendor_dim MODIFY vendor_name VARCHAR(100)  NOT NULL   COMMENT 'Name of the TPEP provider that provided the record.';

-- select * from vendor_dim;


-- ==================================
-- payment_type_dim
-- ==================================

CREATE  TABLE payment_type_dim ( 
	payment_type_id      INT  AUTO_INCREMENT NOT NULL ,
	payment_type         VARCHAR(1)  NOT NULL,
	payment_type_name    VARCHAR(100)  NOT NULL,
    PRIMARY KEY(payment_type_id)
 );

ALTER TABLE payment_type_dim COMMENT 'A numeric code signifying how the passenger paid for the trip.';
ALTER TABLE payment_type_dim MODIFY payment_type_id INT  NOT NULL   COMMENT 'A numeric code signifying how the passenger paid for the trip.';
ALTER TABLE payment_type_dim MODIFY payment_type VARCHAR(10)  NOT NULL   COMMENT 'payment type code\n1 to 6';
ALTER TABLE payment_type_dim MODIFY payment_type_name VARCHAR(100)  NOT NULL   COMMENT 'How the passenger paid for the trip.\nPayment type name';

-- select * from payment_type_dim;


-- ==================================
-- store_and_fwd_flag_dim
-- ==================================

CREATE  TABLE store_and_fwd_flag_dim ( 
	store_and_fwd_flag_id INT AUTO_INCREMENT NOT NULL,
	store_and_fwd_flag   VARCHAR(1)  NOT NULL,
	store_and_fwd_flag_name VARCHAR(100)  NOT NULL,
	PRIMARY KEY (store_and_fwd_flag_id)
 );

ALTER TABLE store_and_fwd_flag_dim COMMENT 'This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server.';
ALTER TABLE store_and_fwd_flag_dim MODIFY store_and_fwd_flag_id INT  NOT NULL   COMMENT 'This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server.';
ALTER TABLE store_and_fwd_flag_dim MODIFY store_and_fwd_flag VARCHAR(1)  NOT NULL   COMMENT 'This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server.';
ALTER TABLE store_and_fwd_flag_dim MODIFY store_and_fwd_flag_name VARCHAR(100)  NOT NULL   COMMENT 'Y	store and forward trip\nN	not a store and forward trip';

-- SELECT * FROM store_and_fwd_flag_dim;


-- ==================================
-- taxi_zone_dim
-- ==================================

CREATE  TABLE taxi_zone_dim ( 
	tz_id                INT AUTO_INCREMENT NOT NULL,
	shape_leng           FLOAT  NOT NULL     ,
	-- lng_lat              VARCHAR(10000)  NOT NULL     ,
	shape_area           FLOAT  NOT NULL     ,
	zone_name            VARCHAR(100)  NOT NULL     ,
	taxi_zone_location_id VARCHAR(10)  NOT NULL     ,
	taxi_zone_borough_name VARCHAR(100)  NOT NULL,
	PRIMARY KEY (tz_id)
 );

ALTER TABLE taxi_zone_dim COMMENT 'TLC Taxi Zone in which the taximeter was engaged and disengaged';
ALTER TABLE taxi_zone_dim MODIFY tz_id INT  NOT NULL   COMMENT 'taxi zone id PK';
ALTER TABLE taxi_zone_dim MODIFY shape_leng FLOAT  NOT NULL   COMMENT 'length of the area';
-- ALTER TABLE taxi_zone_dim MODIFY lng_lat VARCHAR(100)  NOT NULL   COMMENT 'longitude and latitude';
ALTER TABLE taxi_zone_dim MODIFY shape_area FLOAT  NOT NULL   COMMENT 'shape_area';
ALTER TABLE taxi_zone_dim MODIFY zone_name VARCHAR(100)  NOT NULL   COMMENT 'taxi zone name';
ALTER TABLE taxi_zone_dim MODIFY taxi_zone_location_id VARCHAR(10)  NOT NULL   COMMENT 'taxi_zone_location_id';
ALTER TABLE taxi_zone_dim MODIFY taxi_zone_borough_name VARCHAR(100)  NOT NULL   COMMENT 'taxi_zone_borough_name';

-- SELECT * FROM taxi_zone_dim;
-- 

-- ==================================
-- pickup_datetime_dim
-- ==================================

CREATE  TABLE pickup_datetime_dim ( 
	pu_datetime_id          INT  AUTO_INCREMENT NOT NULL,
	tpep_pickup_datetime VARCHAR(100)  NOT NULL   ,
	pickup_hour          INT  NOT NULL     ,
	pickup_day           VARCHAR(20)  NOT NULL     ,
	pickup_month         INT  NOT NULL     ,
	pickup_year          INT  NOT NULL     ,
	pickup_weekday       INT  NOT NULL     ,
	pickup_timeofday     VARCHAR(100)  NOT NULL     ,
	PRIMARY KEY(pu_datetime_id)  
 ) ;

ALTER TABLE pickup_datetime_dim COMMENT 'Date & Time dimentsion table';
ALTER TABLE pickup_datetime_dim MODIFY pu_datetime_id INT  NOT NULL   COMMENT 'datetime_id';
ALTER TABLE pickup_datetime_dim MODIFY tpep_pickup_datetime DATE  NOT NULL   COMMENT 'date and time';
ALTER TABLE pickup_datetime_dim MODIFY pickup_hour INT  NOT NULL   COMMENT 'pickup hour';
ALTER TABLE pickup_datetime_dim MODIFY pickup_day VARCHAR(20)  NOT NULL   COMMENT 'Pickup day';
ALTER TABLE pickup_datetime_dim MODIFY pickup_month INT  NOT NULL   COMMENT 'Pickup Month';
ALTER TABLE pickup_datetime_dim MODIFY pickup_year INT  NOT NULL   COMMENT 'pickup year';
ALTER TABLE pickup_datetime_dim MODIFY pickup_weekday INT  NOT NULL   COMMENT 'pickup weekday';
ALTER TABLE pickup_datetime_dim MODIFY pickup_timeofday VARCHAR(100)  NOT NULL   COMMENT '6:00 am to 11:59 pm - Morning\n12 noon to 3:59 pm - Afternoon\n4:00 pm to 9:59 pm - Evening\n10:00 pm to 5:59 am - Late Night';

-- SELECT * FROM pickup_datetime_dim;
-- 


-- ==================================
-- dropoff_datetime_dim
-- ==================================

CREATE  TABLE dropoff_datetime_dim ( 
	do_datetime_id          INT  AUTO_INCREMENT NOT NULL,
	tpep_dropoff_datetime VARCHAR(100)  NOT NULL  ,
	dropoff_hour         INT  NOT NULL     ,
	dropoff_day          VARCHAR(20)  NOT NULL  ,
	dropoff_month        INT  NOT NULL     ,
	dropoff_year         INT  NOT NULL     ,
	dropoff_weekday      INT  NOT NULL     ,
	dropoff_timeofday    VARCHAR(100)  NOT NULL,
	PRIMARY KEY(do_datetime_id)  
 ) ;

ALTER TABLE dropoff_datetime_dim COMMENT 'Dropoff Date & Time dimentsion table';
ALTER TABLE dropoff_datetime_dim MODIFY tpep_dropoff_datetime DATE  NOT NULL   COMMENT 'tpep dropoff datetime';
ALTER TABLE dropoff_datetime_dim MODIFY dropoff_hour INT  NOT NULL   COMMENT 'dropoff hour';
ALTER TABLE dropoff_datetime_dim MODIFY dropoff_day INT  NOT NULL   COMMENT 'dropoff day';
ALTER TABLE dropoff_datetime_dim MODIFY dropoff_month INT  NOT NULL   COMMENT 'dropoff month';
ALTER TABLE dropoff_datetime_dim MODIFY dropoff_year INT  NOT NULL   COMMENT 'dropoff year';
ALTER TABLE dropoff_datetime_dim MODIFY dropoff_weekday DATE  NOT NULL   COMMENT 'dropoff weekday';
ALTER TABLE dropoff_datetime_dim MODIFY dropoff_timeofday VARCHAR(100)  NOT NULL   COMMENT '6:00 am to 11:59 pm - Morning\n12 noon to 3:59 pm - Afternoon\n4:00 pm to 9:59 pm - Evening\n10:00 pm to 5:59 am - Late Night';

-- SELECT * FROM dropoff_datetime_dim;


-- ==================================
-- fact table : fact_table
-- ==================================
CREATE TABLE fact_table (
    trip_id INT AUTO_INCREMENT NOT NULL,
    vc_id INT NOT NULL,
    passenger_count_id INT NOT NULL,
    taxi_zone_location_id_pu INT NOT NULL,
    taxi_zone_location_id_do INT NOT NULL,
    payment_type_id INT NOT NULL,
    rc_id INT NOT NULL,
    store_and_fwd_flag_id INT NOT NULL,
    pu_datetime_id INT NOT NULL,
    do_datetime_id INT NOT NULL,
    fare_amount FLOAT NOT NULL,
    extra FLOAT NOT NULL,
    mta_tax FLOAT NOT NULL,
    tip_amount FLOAT NOT NULL,
    tolls_amount FLOAT NOT NULL,
    improvement_surcharge FLOAT NOT NULL,
    total_amount FLOAT NOT NULL,
    congestion_surcharge FLOAT NOT NULL,
    PRIMARY KEY(trip_id),
    CONSTRAINT fk_passenger_count FOREIGN KEY (passenger_count_id) REFERENCES passenger_count_dim(passenger_count_id),
    CONSTRAINT fk_fact_table_vendor_id_dim FOREIGN KEY (vc_id) REFERENCES vendor_dim(vc_id),
    CONSTRAINT fk__store_and_fwd_flag FOREIGN KEY (store_and_fwd_flag_id) REFERENCES store_and_fwd_flag_dim(store_and_fwd_flag_id),
    CONSTRAINT fk_loc_pickup_taxi_zone_id FOREIGN KEY (taxi_zone_location_id_pu) REFERENCES taxi_zone_dim(tz_id),
    CONSTRAINT fk_loc_drop_taxi_zone_id FOREIGN KEY (taxi_zone_location_id_do) REFERENCES taxi_zone_dim(tz_id),
    CONSTRAINT fk_payment_type_dim FOREIGN KEY (payment_type_id) REFERENCES payment_type_dim(payment_type_id),
    CONSTRAINT fk_rate_code_dim FOREIGN KEY (rc_id) REFERENCES rate_code_dim(rc_id),
    CONSTRAINT fk_pickup_datetime FOREIGN KEY (pu_datetime_id) REFERENCES pickup_datetime_dim(pu_datetime_id),
    CONSTRAINT fk_dropoff_datetime FOREIGN KEY (do_datetime_id) REFERENCES dropoff_datetime_dim(do_datetime_id)
);
 
ALTER TABLE fact_table COMMENT 'fact table';
ALTER TABLE fact_table MODIFY trip_id INT  NOT NULL   COMMENT 'Series Trip ID - Primary Key';
ALTER TABLE fact_table MODIFY vc_id INT  NOT NULL   COMMENT 'A code indicating the TPEP provider that provided the record.';
ALTER TABLE fact_table MODIFY taxi_zone_location_id_pu INT  NOT NULL   COMMENT 'Taxi Zone Pickup loaction ID';
ALTER TABLE fact_table MODIFY taxi_zone_location_id_do INT  NOT NULL   COMMENT 'Taxi Zone Drop loaction ID';
ALTER TABLE fact_table MODIFY payment_type_id INT  NOT NULL   COMMENT 'A numeric code signifying how the passenger paid for the trip.';
ALTER TABLE fact_table MODIFY store_and_fwd_flag_id INT  NOT NULL   COMMENT 'This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server.';
ALTER TABLE fact_table MODIFY pu_datetime_id INT  NOT NULL   COMMENT 'Pickup time zone id fk from time_zone_dim\n6:00 am to 11:59 pm - Morning\n12 noon to 3:59 pm - Afternoon\n4:00 pm to 9:59 pm - Evening\n10:00 pm to 5:59 am - Late Night';
ALTER TABLE fact_table MODIFY do_datetime_id INT  NOT NULL   COMMENT 'Dropoff time zone id fk from time_zone_dim\n6:00 am to 11:59 pm - Morning\n12 noon to 3:59 pm - Afternoon\n4:00 pm to 9:59 pm - Evening\n10:00 pm to 5:59 am - Late Night';
ALTER TABLE fact_table MODIFY fare_amount FLOAT  NOT NULL   COMMENT 'fare_amount';
ALTER TABLE fact_table MODIFY extra FLOAT  NOT NULL   COMMENT 'extra chargers';
ALTER TABLE fact_table MODIFY mta_tax FLOAT  NOT NULL   COMMENT 'mta_tax';
ALTER TABLE fact_table MODIFY tip_amount FLOAT  NOT NULL   COMMENT 'tip_amount';
ALTER TABLE fact_table MODIFY tolls_amount FLOAT  NOT NULL   COMMENT 'tolls_amount';
ALTER TABLE fact_table MODIFY improvement_surcharge FLOAT  NOT NULL   COMMENT 'improvement_surcharge';
ALTER TABLE fact_table MODIFY total_amount FLOAT  NOT NULL   COMMENT 'total_amount';
ALTER TABLE fact_table MODIFY congestion_surcharge FLOAT  NOT NULL   COMMENT 'congestion_surcharge';
 
-- SELECT * FROM fact_table;



