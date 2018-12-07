set serveroutput on;
clear screen;
create or replace package updateProcAtCTG as
	procedure changeDate(
        gstId in booking.guestId%TYPE,
        ckIn in booking.checkedin%TYPE,
        ckOut in booking.checkout%TYPE
    );
    function getGuestId (
        fname in guest.firstname%TYPE,
        lname in guest.lastname%TYPE,
        tel in guest.telephone%TYPE
    )return number;
    procedure changeRoom (
        rmNo in booking.roomno%TYPE,
        rmNo2 in booking.roomno%TYPE
    );
    function getGuestRoomNo (
        fname1 in guest.firstname%TYPE,
        lname1 in guest.lastname%TYPE,
        tel1 in guest.telephone%TYPE
    )return number;
    	
end updateProcAtCTG;
/

create or replace package body updateProcAtCTG as
	
    procedure changeDate(
        gstId in booking.guestId%TYPE,
        ckIn in booking.checkedin%TYPE,
        ckOut in booking.checkout%TYPE
    )
	is
        
	begin
        UPDATE BOOKING 
        SET checkedIn=ckIn , checkout=ckout
        where guestId=gstId;
	
	end changeDate;
    
    function getGuestId (
        fname in guest.firstname%TYPE,
        lname in guest.lastname%TYPE,
        tel in guest.telephone%TYPE
    )return number
    is
    guID number;
    cursor idCur is 
        select guestId from guest where guest.firstname=fname and guest.lastname=lname and guest.telephone=tel;
    Begin
       open idCur;
        loop
          fetch idCur into guID;
          exit ;
        end loop;
        close idCur; 
        return guID;   
    end getGuestId;
    
    procedure changeRoom (
        rmNo in booking.roomno%TYPE,
        rmNo2 in booking.roomno%TYPE
    )is
        
	begin
        UPDATE BOOKING 
        SET roomNo=rmNo2
        where roomNo=rmNo and branchId=2;
        Update Room
        Set available='yes'
        where roomNo=rmNo and branchId=2;
        Update Room
        Set available='no'
        where roomNo=rmNo2 and branchId=2;
	
	end changeRoom;
    
    function getGuestRoomNo (
        fname1 in guest.firstname%TYPE,
        lname1 in guest.lastname%TYPE,
        tel1 in guest.telephone%TYPE
    )return number
    is
    guRmNo number;
    cursor rmCur is 
        select booking.roomNo from booking
        INNER JOIN guest
        ON booking.guestId=guest.guestId
        where guest.firstname=fname1 and guest.lastname=lname1 and guest.telephone=tel1;
    Begin
       open rmCur;
        loop
          fetch rmCur into guRmNo;
          exit ;
        end loop;
        close rmCur; 
        return guRmNo;   
    end getGuestRoomNo;
	
end updateProcAtCTG;	
/
