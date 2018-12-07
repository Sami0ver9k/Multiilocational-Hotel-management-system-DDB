clear screen;

DROP TABLE staff CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE guest CASCADE CONSTRAINTS;
DROP TABLE booking CASCADE CONSTRAINTS;
DROP TABLE room CASCADE CONSTRAINTS;



create table staff
(staffId number(20),
 branchId number(20),
 jobId number(20),
 firstName varchar2(20),
 lastName varchar2(20),
 address varchar2(100),
 bookingId number(20));


create table payment
(paymentId number(20),
 methodId number(20),
 dateofpay DATE,
 bookingId number(20),
 totalPaid number(20));

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

   create table room
   (roomNo number(20),
    roomtypeId number(20),
    available varchar2(100));
    
    create table roomType
    (roomtypeId number(20),
     roomType varchar2(100),
     price number (20),
     details varchar2(100));
    

insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (6,  1, 'rahman', 'rahman', 'dhaka', 1);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (7,  2, 'ahmed', 'ahmed', 'dhaka', 2);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (8,  3, 'sohom', 'sohom', 'dhaka', 3);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (9,  4, 'niloy', 'niloy', 'dhaka', 4);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (10,  5, 'hossain', 'hossain', 'dhaka', 5);


insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (5, 'zahid', 'zahid', 'noakhali','student', 01555448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (6, 'nasim-al', 'nasim', 'cumilla','student', 01765448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (7, 'hady-al', 'hady', 'dhaka','student', 01865548962);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (8, 'mushfiq', 'mushfiq', 'cumilla','student', 01965648932);


insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (1, 5, 5, 2102, 2,'12-dec-2017','2:30pm','11:00am', 01765448952,2);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (2, 6, 6, 2202, 3,'10-nov-2017','2:00pm','12:00am', 01865548962,2);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (3, 7, 7, 2206, 2,'11-dec-2017','2:30pm','12:00am', 01965648932,2);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (4, 8, 8, 2302, 4,'12-dec-2017','2:30pm','11:00am', 01555448952,2);



insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (5, 1, '12-oct-2017', 5, 2000);
insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (6, 1, '12-may-2017', 6, 2000);
insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (7, 2, '10-oct-2017', 7, 2000);
insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (8, 2, '12-oct-2017', 8, 2000);


insert into room (roomNo,  roomtypeId, available) values (102, 1, 'no');
insert into room (roomNo,  roomtypeId, available) values (202, 2, 'no');
insert into room (roomNo,  roomtypeId, available) values (206, 1, 'no');
insert into room (roomNo,  roomtypeId, available) values (302, 3, 'no');
insert into room (roomNo,  roomtypeId, available) values (402, 3, 'yes');


insert into roomType (roomtypeId,  roomType, price, details) values (1, 'single', 500, 'normal');
insert into roomType (roomtypeId,  roomType, price, details) values (2, 'double', 900, 'normal');
insert into roomType (roomtypeId,  roomType, price, details) values (3, 'doubleAc', 1200, 'ac');
insert into roomType (roomtypeId,  roomType, price, details) values (1, 'single', 700, 'ac');


commit;