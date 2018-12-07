SET SERVEROUTPUT ON;
clear screen;
Declare
    
        bkId booking.bookingId%TYPE;
        gNum number;
        rmNo number;
        reDay number;
        needToGive number;
 
Begin

    DBMS_OUTPUT.put_line('Press  1. for Dhaka site  2. for Chittagong site  3. for Noakhali site.');
    site := &Press_1_for_Dhaka_2_for_Chittagong_3_for_Noakhali;
    --ASK for bookingId
    bkId:= &Enter_BookingId;
    --Check for remaining days
    reDay:=deleteProcAtDhaka.checkRemainingDay(bkId);
    if reDay!=0 then
    --Get the guest Id using Above information
    gNum:=deleteProcAtDhaka.getGuestId(bkId,site);
    --deleteGuestInfo
    deleteProcAtDhaka.deleteGuestInfo(gNum);
    --Get room no
    rmNo:=deleteProcAtDhaka.getGuestRoomNo(bkId,site);
    --MakeRoomAvailable
    if( deleteProcAtDhaka.makeRoomAvailable(rmNo,site)) then
        DBMS_OUTPUT.put_line('Room no' || to_char(rmNo) ||'is available now!');
    end if;
    
    --Delete payment Info
    needToGive:=deleteProcAtDhaka.sustractPaymentMethod(bkId,reDay);
    DBMS_OUTPUT.put_line('You have to pay total '|| to_char(needToGive) || 'Taka only!');
    --Delete booking Info
    deleteProcAtDhaka.deleteBookingInfo(bkId,site);
    DBMS_OUTPUT.put_line('Your booking has been canceled successfully!');
    else
    DBMS_OUTPUT.put_line('You cant cancel your booking now!');
    end if;
    
End;
/



