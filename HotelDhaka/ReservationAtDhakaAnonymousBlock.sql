SET SERVEROUTPUT ON;
Declare
    --TakeGuestInfo
        fName guest.firstName%TYPE;
        lName guest.lastName%TYPE;
        addR guest.address%TYPE;
        occ guest.occupation%TYPE;
        tel guest.telephone%TYPE;
        gNum number;
     --Room Avaibility
        rmtype roomType.roomType%TYPE;
        rAv number;
        
    --Reservation
        stID booking.staffId%TYPE;
        noG booking.numberOfGuest%TYPE; 
        bkDate booking.bookingDate%TYPE; 
        ckIn booking.checkedin%TYPE;
        ckOut booking.checkout%TYPE;
        site number;
 v varchar2(50);
Begin

    DBMS_OUTPUT.put_line('Press  1. for Dhaka site  2. for Chittagong site  3. for Noakhali site.');
    site := &Press_1_for_Dhaka_2_for_Chittagong_3_for_Noakhali;
    
    --Check for Room Avaibility
    DBMS_OUTPUT.put_line('What type of room you want?');
    rmtype := '&roomType';
    rAv := reserveAtDHK.roomAvaibility(rmtype,site);
    if rAv > 0 then 
        DBMS_OUTPUT.put_line('Now you can start your booking at room no. ' || rAv||' !!'); 
    else
        DBMS_OUTPUT.put_line('Room of this type is not available!');
    
     
        
    end if;
    
    if rAv > 0 then 
    DBMS_OUTPUT.put_line('Please enter guest information before reservation!!');
    fname := '&firstName';
    lName := '&lastName';
    addR := '&address';
    occ := '&occupation';
    tel := &telephoneNumber;
    reserveAtDHK.takeGuestInfo(fname, lName, addR, occ, tel, gNum,site);
    DBMS_OUTPUT.put_line(gNum);
    
    
     
        --Start Reservervation
        DBMS_OUTPUT.put_line('Please Enter the following information for reservation!');
        stID := &staff_ID;
        noG := &numberOfGuest;
        bkDate := '&bookingDate';
        ckIn := '&checkedIn';
        ckOut := '&checkedOut';
        reserveAtDHK.reserveRoomAtSiteX(gNum, stID, rAv, noG, bkDate, ckIn,ckOut, tel,site);
        DBMS_OUTPUT.put_line('Thanks! Your reservation is complete.');
    end if;
    
End;
/















