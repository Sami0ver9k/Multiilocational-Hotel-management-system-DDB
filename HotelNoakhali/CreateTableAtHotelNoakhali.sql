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

    

insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (11,  1, 'sarwar', 'sarwar', 'dhaka', 1);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (12,  2, 'samiur', 'samiur', 'dhaka', 2);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (13,  3, 'shurid', 'shurid', 'dhaka', 3);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (14,  4, 'amit', 'amit', 'dhaka', 4);
insert into staff (staffId,  jobId, firstName, lastName, address,  bookingId) values (15,  5, 'murad', 'murad', 'dhaka', 5);


insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (9, 'shamit', 'shamit', 'chattagram','student', 01765444523);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (10, 'tanim', 'tanim', 'noakhali','student', 01555448952);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (11, 'tanim', 'ahmed', 'chattagram','student', 01765444523);
insert into guest (guestId, firstName, lastName, address, occupation, telephone) values (12, 'ahmed', 'zahid', 'noakhali','student', 01555448952);


insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (1, 9, 9, 3102, 2,'12-dec-2017','2:30pm','11:00am', 01765448952,3);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (2, 10, 10, 3202, 3,'10-nov-2017','2:00pm','12:00am', 01865548962,3);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (3, 11, 11, 3206, 2,'11-dec-2017','2:30pm','12:00am', 01965648932,3);
insert into booking (bookingId, guestId, staffId, roomNo,  numberofGuest, bookingDate, checkedin, checkout, telephone, branchId) values (4, 12, 12, 3302, 4,'12-dec-2017','2:30pm','11:00am', 01555448952,3);



insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (9, 1, '12-oct-2017', 9, 2000);
insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (10, 1, '12-may-2017', 10, 3000);
insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (11, 2, '10-oct-2017', 11, 4000);
insert into payment (paymentId, methodId, dateofpay,  bookingId, totalPaid) values (12, 2, '12-oct-2017', 12, 5000);


insert into room (roomNo,  roomtypeId, available) values (102, 1, 'no');
insert into room (roomNo,  roomtypeId, available) values (202, 2, 'no');
insert into room (roomNo,  roomtypeId, available) values (206, 1, 'no');
insert into room (roomNo,  roomtypeId, available) values (302, 3, 'no');
insert into room (roomNo,  roomtypeId, available) values (402, 1, 'yes');

commit;