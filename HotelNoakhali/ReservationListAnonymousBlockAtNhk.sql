SET SERVEROUTPUT ON;
Declare

        opt int;
        rmNo booking.roomNo%TYPE;
    
        fName guest.firstName%TYPE;
        lName guest.lastName%TYPE;
        
        bkDate booking.bookingDate%TYPE; 
        
Begin

    --Ask for Name, Date or room no
    opt:=&Press_1_2_3_accordingly_to_getReservationList_By_Date_Name_Or_RoomNo;
    if opt=1 then
        bkDate:=&Enter_Booking_Date;
        reservationListAtCtg.reservationListByDate(bkDate);
    elsif opt=2 then
        fname:='&Enter_FirstName';
        lname:='&Enter_LastName';
        reservationListAtCtg.reservationListByName (fname,lname);
    elsif opt=3 then
        rmNo:=&Enter_Room_no;
        reservationListAtCtg.reservationListByRoom(rmNo);
    end if;
    
End;
/















