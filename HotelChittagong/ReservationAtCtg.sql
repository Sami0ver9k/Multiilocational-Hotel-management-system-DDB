set serveroutput on;
create or replace package reserveAtCTG as
	procedure takeGuestInfo(
		fName in guest.firstName%TYPE,
        lName in guest.lastName%TYPE,
        addR in guest.address%TYPE,
        occ in guest.occupation%TYPE,
        tel in guest.telephone%TYPE, 
        gNum out number
        );
	function roomAvaibility( 
        rmType in roomType.roomType%TYPE
    ) return number;
	procedure reserveRoomAtSiteX(
    gID in booking.guestId%TYPE,
	stID in booking.staffId%TYPE,
	rmNo in booking.roomno%TYPE,
	noG in booking.numberOfGuest%TYPE, 
	bkDate in booking.bookingDate%TYPE, 
	ckIn in booking.checkedin%TYPE,
    ckOut in booking.checkout%TYPE,
	tel in booking.telephone%TYPE
        );
	
end reserveAtCTG;
/

create or replace package body reserveAtCTG as
	
    procedure takeGuestInfo(
		fName in guest.firstName%TYPE,
        lName in guest.lastName%TYPE,
        addR in guest.address%TYPE,
        occ in guest.occupation%TYPE,
        tel in guest.telephone%TYPE, 
        gNum out number
        )
	is
        
        cursor gCur is
            select guestId from guest;
        
        gNo guest.guestId%TYPE;
	
	begin
		
        
        open gCur;
        loop
          fetch gCur into gNo;
          exit when gCur%notfound;
        end loop;
        close gCur;
        gNum:=gNo+1;
        insert into guest (guestId, firstName, lastName, address, occupation, telephone) 
            values (gNo+1, fName, lName, addR,occ, tel);
        commit;
        
	--exception
		
	
	end takeGuestInfo;
    
    
    function roomAvaibility( rmType in roomType.roomType%TYPE) 
    return number 
    is avRmNum number;
    rCount number;
    cursor cur 
    is 
    select room.roomno --into avRmNum 
        from room
        where room.available='yes' and 
        roomTypeId IN 
        ( select roomtype.roomTypeId from roomtype
            where room.roomTypeId=roomtype.roomTypeId 
                and roomType.roomType=rmType
        );
    Begin
        --rmType:='single';
        open cur;
        loop
          fetch cur into rCount;
          exit when cur%notfound;
        end loop;
        close cur;
    return rCount;
    
    end roomAvaibility;
    
    
    procedure reserveRoomAtSiteX(
    gID in booking.guestId%TYPE,
	stID in booking.staffId%TYPE,
	rmNo in booking.roomno%TYPE,
	noG in booking.numberOfGuest%TYPE, 
	bkDate in booking.bookingDate%TYPE, 
	ckIn in booking.checkedin%TYPE,
    ckOut in booking.checkout%TYPE,
	tel in booking.telephone%TYPE
    )
    is 
    cursor bCur is
            select bookingId from booking;
    
        bNo booking.bookingId%TYPE;
        bNum booking.bookingId%TYPE;
	begin
        
        open bCur;
        loop
          fetch bCur into bNo;
          exit when bCur%notfound;
        end loop;
        close bCur;
        bNum:=bNo+1;
            insert into booking (bookingID, guestID, staffId, roomNo, numberofGuest, bookingDate, checkedIN,checkOut, telephone,branchId) 
                values (bNum,gID, stID, rmNo, noG,bkDate, ckIn, ckOut, tel, 2);
            commit;
            update room set room.available ='no' where room.roomNo = rmNo; 
            commit;
            
        
	--exception
    
    End reserveRoomAtSiteX;
    
	
end reserveAtCTG;	
/
