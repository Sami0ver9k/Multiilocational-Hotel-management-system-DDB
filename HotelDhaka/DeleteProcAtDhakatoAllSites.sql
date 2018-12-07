set serveroutput on;
clear screen;
create or replace package deleteProcAtDhaka as
    function getGuestId(
        bkId in booking.bookingId%TYPE,
        site3 in int
    )return number;
	procedure deleteGuestInfo(
        gstId in guest.guestId%TYPE
    );
    procedure deleteBookingInfo(
        bkId in booking.bookingId%TYPE,
        site in int
    );
    function getGuestRoomNo (
        bkId in booking.bookingId%TYPE,
        site4 in int
    )return number;
    function makeRoomAvailable(
        rmNo in booking.roomNo%TYPE,
        site2 in int
    )return number;
    function sustractPaymentMethod(
        bokId in booking.bookingId%TYPE,
        rmDay in int 
    )return number;	
    function checkRemainingDay(
        bkId2 in booking.bookingId%TYPE
    )return number;
    
end deleteProcAtDhaka;
/

create or replace package body updateProcAtDhaka as

    function getGuestId(
        bkId in booking.bookingId%TYPE,
        site3 in int
    )return number
    is
    gID number;
    begin
        select guestId into gID 
        From booking 
        where bookingId=bkId and branchId=site3;
    
        return gID;
    end getGuestId;
    
	procedure deleteGuestInfo(
        gstId in guest.guestId%TYPE
    )
	is
        
	begin
       DELETE guest 
       WHERE guestID=gstId;	
	end deleteGuestInfo;
    
    
    procedure deleteBookingInfo(
        bkId in booking.bookingId%TYPE,
        site in int
    )
	is
        
	begin
       if site=1 then
           DELETE booking 
           WHERE bookingID=bkId;	
       elsif site =2 then
           DELETE booking@site_ctg 
           WHERE bookingID=bkId;
       elsif site =3 then
           DELETE booking@site_nhk 
           WHERE bookingID=bkId;
       end if;
	end deleteBookingInfo;
    
    
    function getGuestRoomNo (
        bkId in booking.bookingId%TYPE,
        site4 in int
    )return number
    is
    guRmNo number;
    Begin
       select roomNo into guRmNo
       from booking 
       where bookingId=bkId and branchId=site4;
        return guRmNo;
    end getGuestRoomNo;
    
    function makeRoomAvailable(
        rmNo in booking.roomNo%TYPE,
        site2 in int
    )return number
    is
    n int;
    begin
       n:=0;
       if site2=1 then
           UPDATE room 
           SET available='yes'
           where roomNo=rmNo and branchId=1;
           n:=1;
       elsif site2 =2 then
           UPDATE room 
           SET available='yes'
           where roomNo=rmNo and branchId=2;
           UPDATE room@site_ctg 
           SET available='yes'
           where roomNo=rmNo;
           n:=1;
       elsif site2 =3 then
           UPDATE room 
           SET available='yes'
           where roomNo=rmNo and branchId=2;
           UPDATE room@site_nhk 
           SET available='yes'
           where roomNo=rmNo;
           n:=1;
       end if;
       return n;
    end makeRoomAvailable;
    
    
    function sustractPaymentMethod(
        bokId in booking.bookingId%TYPE,
        rmDay in int 
    )return number
    is
    totalPayment number;
    totalGiven number;
    begin
       totalPayment:=0;
       totalGiven:=0;
       if rmDay>3 then
            select totalpaid*.10 into totalPayment from payment where bookingId=bokId;
            totalGiven:=totalPayment/.10;
        elsif rmDay=3 then
            select totalpaid*.20 into totalPayment from payment where bookingId=bokId;
            totalGiven:=totalPayment/.20;
        elsif rmDay=2 then
            select totalpaid*.30 into totalPayment from payment where bookingId=bokId;
            totalGiven:=totalPayment/.30;
        elsif rmDay=1 then
            select totalpaid*.50 into totalPayment from payment where bookingId=bokId;
            totalGiven:=totalPayment/.50;
       end if;
       
       if rmDay!= 0 then
       Update payment
       Set totalPaid=totalPayment
       Where bookingId=bokId;
       end if;
       return totalGiven;
    end sustractPaymentMethod;
    
    
    function checkRemainingDay(
        bkId2 in booking.bookingId%TYPE
    )return number
    is
    ckInDate  DATE;
    ckOutDate  DATE;
    reday int;
    begin
        Select checkedIn,checkOut into ckInDate,ckOutDate
        From booking
        where bookingId=bkId2;
        ckInDate := TO_DATE(ckInDate);
        ckOutDate := TO_DATE(ckOutDate);
        reDay:=to_number( TRUNC(ckInDate,'DD')- TRUNC(sysdate,'DD') );
    end checkRemainingDay;
    
end deleteProcAtDhaka;	
/
