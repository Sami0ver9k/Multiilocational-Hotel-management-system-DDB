SET SERVEROUTPUT ON;
clear screen;
Declare
    
        bkId booking.bookingId%TYPE;
        gNum number;
        rmNo number;
        rmNo2 number;
        fname guest.firstname%TYPE;
        lname guest.lastname%TYPE;
        tel guest.telephone%TYPE;
        ckIn booking.checkedIn%TYPE;
        ckOut booking.checkOut%TYPE;
        flag number;
 
Begin

    DBMS_OUTPUT.put_line('Enter the following information.');
    --ASK for info
    fname:='&Enter_firstName';
    lname:='&Enter_lastName';
    tel:=&Enter_telephone_number;
    flag:=&Enter_1_to_ChangeDate_Or_2_to_Change_Room;
    if flag=1 then
    --get guest id
    gNum:=updateProcAtCTG.getGuestId(fname,lname,tel);
    --Get new date to update
    ckIn:='&Enter_new_date';
    ckOut:='&Enter_new_date';
    --Change date
    updateProcAtCTG.changeDate(gNum,ckIn,ckOut);
    else
    --Get room no
    rmNo:=updateProcAtCTG.getGuestRoomNo(fname,lname,tel);
    --ChangeRooms
    rmNo2:=&Enter_new_roomNo;
    updateProcAtCTG.changeRoom(rmNo,rmNo2);
    end if;
    
End;
/



