drop table log_booking_insert;
create table log_booking_insert
(bookingid number(20) , log_date date);

drop table log_guest_insert;
create table log_guest_insert
(guestid number(20), log_date date);

drop table log_update_bookingbranch;
create table log_update_bookingbranch
(bookingid number(20), old_branchid number(20), new_branchid number(20), log_date date);

drop table log_insert_payment;
create table log_insert_payment
(bookingid number(20),amount(20), log_date date);

drop table log_checkout;
create table log_checkout
(bookingid number(20), checkin varchar2(100), checkout varchar2(100));
