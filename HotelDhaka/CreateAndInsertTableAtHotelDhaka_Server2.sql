clear screen;

DROP TABLE staff CASCADE CONSTRAINTS;
DROP TABLE job CASCADE CONSTRAINTS;
DROP TABLE paymentMethod CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE guest CASCADE CONSTRAINTS;
DROP TABLE booking CASCADE CONSTRAINTS;
DROP TABLE branch CASCADE CONSTRAINTS;
DROP TABLE room CASCADE CONSTRAINTS;
DROP TABLE roomType CASCADE CONSTRAINTS;
DROP TABLE salary CASCADE CONSTRAINTS;



create table staff
(staffId number(20),
 branchId number(20),
 jobId number(20),
 firstName varchar2(20),
 lastName varchar2(20),
 address varchar2(100),
 bookingId number(20));


create table job
(jobId number(20),
jobType varchar2(100));


create table paymentMethod
(methodId number(20),
methodName varchar2(100));

create table payment
(paymentId number(20),
 methodId number(20),
 dateofpay DATE,
 bookingId number(20));

 create table guest
 (guestId number(20),
 firstName varchar2(20),
  lastName varchar2(20),
  address varchar2(100),
  occupation varchar2(100),
  telephone number(20));


  create table booking
  (bookingId number(20),
  guestId number(20),
  staffId number(20),
  roomNo number(20),
  numberofGuest number(20),
  bookingDate DATE,
   checkedin varchar2(100),
   checkout varchar2(100),
   telephone number(20),
   branchId number(20));

   create table branch
   (branchId number(20),
   district varchar2(20));

   create table room
   (branchId number(20),
   roomNo number(20),
    roomtypeId number(20),
    available varchar2(100));
    
    create table roomBooked(
        branchId number(20),
        roomNoCheckInDate Date,
        roomNoCheckOutDate Date
    );

    create table roomType
    (roomtypeId number(20),
     roomType varchar2(100),
     price number (20),
     details varchar2(100));

create table salary
(jobId number(5),
 amount number(7));

insert into branch (branchId, district) values (1, 'dhk');
insert into branch (branchId, district) values (2, 'ctg');
insert into branch (branchId, district) values (3, 'nhk');


insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (1,  1, 'sarwar', 'saif', 'dhaka', 1);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (2,  2, 'samiur', 'rahman', 'dhaka', 2);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (3,  3, 'shurid', 'sohom', 'dhaka', 3);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (4,  4, 'amit', 'niloy', 'dhaka', 4);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (5,  5, 'murad', 'hossain', 'dhaka', 5);

insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (6,  1, 'rahman', 'rahman', 'dhaka', 1);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (7,  2, 'ahmed', 'ahmed', 'dhaka', 2);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (8,  3, 'sohom', 'sohom', 'dhaka', 3);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (9,  4, 'niloy', 'niloy', 'dhaka', 4);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (10,  5, 'hossain', 'hossain', 'dhaka', 5);

insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (11,  1, 'sarwar', 'sarwar', 'dhaka', 1);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (12,  2, 'samiur', 'samiur', 'dhaka', 2);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (13,  3, 'shurid', 'shurid', 'dhaka', 3);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (14,  4, 'amit', 'amit', 'dhaka', 4);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (15,  5, 'murad', 'murad', 'dhaka', 5);


insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (1, 'abdullah-al', 'nasim', 'cumilla','student', 01765448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (2, 'abdullah-al', 'hady', 'dhaka','student', 01865548962);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (3, 'protty', 'mushfiq', 'cumilla','student', 01965648932);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (4, 'shamit', 'ahmed', 'chattagram','student', 01765444523);


insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (5, 'zahid', 'zahid', 'noakhali','student', 01555448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (6, 'nasim-al', 'nasim', 'cumilla','student', 01765448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (7, 'hady-al', 'hady', 'dhaka','student', 01865548962);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (8, 'mushfiq', 'mushfiq', 'cumilla','student', 01965648932);

insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (9, 'shamit', 'shamit', 'chattagram','student', 01765444523);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (10, 'tanim', 'tanim', 'noakhali','student', 01555448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (11, 'tanim', 'ahmed', 'chattagram','student', 01765444523);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (12, 'ahmed', 'zahid', 'noakhali','student', 01555448952);


insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (1, 1, 1, 1102, 2,'12-dec-2017','2:30pm','11:00am', 01765448952,1);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (2, 2, 2, 1202, 3,'10-nov-2017','2:00pm','12:00am', 01865548962,1);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (3, 3, 3, 1206, 2,'11-dec-2017','2:30pm','12:00am', 01965648932,1);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (4, 4, 4, 1302, 4,'12-dec-2017','2:30pm','11:00am', 01555448952,1);

insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (5, 5, 5, 2102, 2,'12-dec-2017','2:30pm','11:00am', 01765448952,2);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (6, 6, 6, 2202, 3,'10-nov-2017','2:00pm','12:00am', 01865548962,2);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (7, 7, 7, 2206, 2,'11-dec-2017','2:30pm','12:00am', 01965648932,2);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (8, 8, 8, 2302, 4,'12-dec-2017','2:30pm','11:00am', 01555448952,2);

insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (9, 9, 9, 3102, 2,'12-dec-2017','2:30pm','11:00am', 01765448952,3);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (10, 10, 10, 3202, 3,'10-nov-2017','2:00pm','12:00am', 01865548962,3);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (11, 11, 11, 3206, 2,'11-dec-2017','2:30pm','12:00am', 01965648932,3);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (12, 12, 12, 3302, 4,'12-dec-2017','2:30pm','11:00am', 01555448952,3);




insert into paymentMethod (methodId, methodName) values (1, 'cash');
insert into paymentMethod (methodId, methodName) values (2, 'creditcard');
insert into paymentMethod (methodId, methodName) values (3, 'bikash');
insert into paymentMethod (methodId, methodName) values (4, 'paypal');


insert into payment (paymentId, methodId, dateofpay,  bookingId) values (1, 1, '12-oct-2017', 1);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (2, 1, '12-may-2017', 2);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (3, 2, '10-oct-2017', 3);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (4, 2, '12-oct-2017', 4);

insert into payment (paymentId, methodId, dateofpay,  bookingId) values (5, 1, '12-oct-2017', 5);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (6, 1, '12-may-2017', 6);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (7, 2, '10-oct-2017', 7);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (8, 2, '12-oct-2017', 8);

insert into payment (paymentId, methodId, dateofpay,  bookingId) values (9, 1, '12-oct-2017', 9);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (10, 1, '12-may-2017', 10);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (11, 2, '10-oct-2017', 11);
insert into payment (paymentId, methodId, dateofpay,  bookingId) values (12, 2, '12-oct-2017', 12);


insert into room (branchId,roomNo,  roomtypeId, available) values (1,102, 1, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (1,202, 2, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (1,206, 1, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (1,302, 3, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (1,406, 1, 'yes');
insert into room (branchId,roomNo,  roomtypeId, available) values (1,407, 1, 'yes');
insert into room (branchId,roomNo,  roomtypeId, available) values (1,502, 3, 'yes');


insert into room (branchId,roomNo,  roomtypeId, available) values (2,102, 1, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (2,202, 2, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (2,206, 1, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (2,302, 3, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (2,402, 3, 'yes');

insert into room (branchId,roomNo,  roomtypeId, available) values (3,102, 1, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (3,202, 2, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (3,206, 1, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (3,302, 3, 'no');
insert into room (branchId,roomNo,  roomtypeId, available) values (3,402, 1, 'yes');


insert into roomType (roomtypeId,  roomType, price, details) values (1, 'single', 500, 'normal');
insert into roomType (roomtypeId,  roomType, price, details) values (2, 'double', 900, 'normal');
insert into roomType (roomtypeId,  roomType, price, details) values (3, 'doubleAc', 1200, 'ac');
insert into roomType (roomtypeId,  roomType, price, details) values (1, 'single', 700, 'ac');


insert into job (jobId, jobType) values (1, 'receiptionist');
insert into job (jobId, jobType) values (2, 'vallet');
insert into job (jobId, jobType) values (3, 'manager');
insert into job (jobId, jobType) values (4, 'chef');
insert into job (jobId, jobType) values (5, 'driver');



insert into salary (jobId, amount) values (1, 35000);
insert into salary (jobId, amount) values (2, 30000);
insert into salary (jobId, amount) values (3, 25000);
insert into salary (jobId, amount) values (4, 20000);
insert into salary (jobId, amount) values (5, 15000);

commit;

