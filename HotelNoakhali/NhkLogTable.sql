clear screen;

 --payment trigger
set serveroutput on;
 create or replace trigger trigger_payment
 after insert on payment
 for each row

 begin
 	insert into log_insert_payment
 	values(:new.bookingid,:new.amount, sysdate);
     DBMS_OUTPUT.PUT_LINE('payment done');
 end;
 /

 --delete payment trigger
set serveroutput on;
 create or replace trigger trigger_payment
 after delete on payment
 for each row

 begin
 	
     DBMS_OUTPUT.PUT_LINE('payment removed');
 end;
 /

  
--INSERT TRIGGER
  create or replace trigger trigger_new_GUEST
  after insert on guest
  for each row

  begin
  	insert into log_guest_insert
  	values(:new.guestId, sysdate);
	DBMS_OUTPUT.PUT_LINE('guest info');
  end;
  /
--delte TRIGGER
  create or replace trigger trigger_new_GUEST
  after delete on guest
  for each row

  begin
  	
	DBMS_OUTPUT.PUT_LINE('guest deleted');
  end;
  /

--insert trigger
set serveroutput on;

create or replace trigger trigger_new_booking
after insert on booking
for each row

begin
	insert into log_booking_insert
	values(:new.bookingId, sysdate);
    DBMS_OUTPUT.PUT_LINE('A new guest has booked');
end;
/

--delete trigger
set serveroutput on;

create or replace trigger trigger_new_booking
after delete on booking
for each row

begin
	
    DBMS_OUTPUT.PUT_LINE('guest removed');
end;
/

--update branchId
create or replace trigger trigger_update_branch
after update on booking
for each row

begin
	insert into log_update_bookingbranch
	values(:new.bookingId, :old.branchId, :new.branchId, sysdate);
	DBMS_OUTPUT.PUT_LINE('updated branch id');
end;
/
--checkin/checkoyt trigggger



create or replace trigger trigger_checkout
after insert on booking
for each row

begin
	insert into log_checkout
	values(:new.bookingId,:new.checkedin,:new.checkout);

end;
/



commit;
