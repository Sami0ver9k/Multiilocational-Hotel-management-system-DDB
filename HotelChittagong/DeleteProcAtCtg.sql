set serveroutput on;
clear screen;
create or replace package deleteProcAtCTG as
    function getGuestId(
        bkId in booking.bookingId%TYPE
    )return number;
	procedure deleteGuestInfo(
        gstId in guest.guestId%TYPE
    );
    procedure deleteBookingInfo(
        bkId in booking.bookingId%TYPE
    );
    function getGuestRoomNo (
        bkId in booking.bookingId%TYPE
    )return number;
    function makeRoomAvailable(
        rmNo in booking.roomNo%TYPE
    )return number;
    function sustractPaymentMethod(
        bokId in booking.bookingId%TYPE
    )return number;	
    function checkRemainingDay(
        bkId2 in booking.bookingId%TYPE
    )return number;
    
end deleteProcAtCTG;
/

create or replace package body deleteProcAtCTG as

    function getGuestId(
        bkId in booking.bookingId%TYPE
    )return number
    is
    gID number;
    begin
        select guestId into gID 
        From booking 
        where bookingId=bkId and branchId=2;
    
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
        bkId in booking.bookingId%TYPE
    )
	is
        
	begin
       
           DELETE booking 
           WHERE bookingID=bkId;	
       
	end deleteBookingInfo;
    
    
    function getGuestRoomNo (
        bkId in booking.bookingId%TYPE
    )return number
    is
    guRmNo number;
    Begin
       select roomNo into guRmNo
       from booking 
       where bookingId=bkId and branchId=2;
        return guRmNo;
    end getGuestRoomNo;
    
    function makeRoomAvailable(
        rmNo in booking.roomNo%TYPE
    )return number
    is
    n int;
    begin
       n:=0;
       
           UPDATE room 
           SET available='yes'
           where roomNo=rmNo and branchId=2;
           n:=1;
       
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
    
end deleteProcAtCTG;	
/
