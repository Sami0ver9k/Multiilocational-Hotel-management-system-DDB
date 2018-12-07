Clear screen;
SET SERVEROUTPUT ON;
Declare

        opt int;
        rmNo booking.roomNo%TYPE;
    
        fName guest.firstName%TYPE;
        lName guest.lastName%TYPE;
        
        bkDate booking.bookingDate%TYPE; 
        
        site number;
 
Begin

    DBMS_OUTPUT.put_line('Press  1. for Dhaka site  2. for Chittagong site  3. for Noakhali site.');
    site := &Press_1_for_Dhaka_2_for_Chittagong_3_for_Noakhali;
    
    --Ask for Name, Date or room no
    opt:=&Press_1_2_3_accordingly_to_getReservationList_By_Date_Name_Or_RoomNo;
    if opt=1 then
        bkDate:='&Enter_Booking_Date';
        --bkDate:=to_date(bkDate);
        reservationListAtDhaka.reservationListByDate(bkDate,site);
    elsif opt=2 then
        fname:='&Enter_FirstName';
        lname:='&Enter_LastName';
        reservationListAtDhaka.reservationListByName (fname,lname,site);
    elsif opt=3 then
        rmNo:=&Enter_Room_no;
        reservationListAtDhaka.reservationListByRoom(rmNo);
    end if;
    
End;
/















