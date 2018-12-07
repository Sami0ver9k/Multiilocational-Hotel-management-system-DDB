SET SERVEROUTPUT ON;
clear screen;
Declare
    
        bkId booking.bookingId%TYPE;
        gNum number;
        rmNo number;
        reDay number;
        needToGive number;
 
Begin

    
    --ASK for bookingId
    bkId:= &Enter_BookingId;
    --Check for remaining days
    reDay:=deleteProcAtDhaka.checkRemainingDay(bkId);
    if reDay!=0 then
    --Get the guest Id using Above information
    gNum:=deleteProcAtDhaka.getGuestId(bkId);
    --deleteGuestInfo
    deleteProcAtDhaka.deleteGuestInfo(gNum);
    --Get room no
    rmNo:=deleteProcAtDhaka.getGuestRoomNo(bkId);
    --MakeRoomAvailable
    if( deleteProcAtDhaka.makeRoomAvailable(rmNo)) then
        DBMS_OUTPUT.put_line('Room no' || to_char(rmNo) ||'is available now!');
    end if;
    
    --Delete payment Info
    needToGive:=deleteProcAtDhaka.sustractPaymentMethod(bkId,reDay);
    DBMS_OUTPUT.put_line('You have to pay total '|| to_char(needToGive) || 'Taka only!');
    --Delete booking Info
    deleteProcAtDhaka.deleteBookingInfo(bkId);
    DBMS_OUTPUT.put_line('Your booking has been canceled successfully!');
    else
    DBMS_OUTPUT.put_line('You cant cancel your booking now!');
    end if;
    
End;
/



