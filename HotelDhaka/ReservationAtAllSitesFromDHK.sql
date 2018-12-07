set serveroutput on;
create or replace package reserveAtDHK as
	procedure takeGuestInfo(
		fName in guest.firstName%TYPE,
        lName in guest.lastName%TYPE,
        addR in guest.address%TYPE,
        occ in guest.occupation%TYPE,
        tel in guest.telephone%TYPE, 
        gNum out number,
        site in booking.branchId%Type
        );
	function roomAvaibility( rmType in roomType.roomType%TYPE,site in booking.branchId%Type
    ) return number;
	procedure reserveRoomAtSiteX(
    gID in booking.guestId%TYPE,
	stID in booking.staffId%TYPE,
	rmNo in booking.roomno%TYPE,
	noG in booking.numberOfGuest%TYPE, 
	bkDate in booking.bookingDate%TYPE, 
	ckIn in booking.checkedin%TYPE,
    ckOut in booking.checkout%TYPE,
	tel in booking.telephone%TYPE,
    site in booking.branchId%Type
        );
	
end reserveAtDHK;
/

create or replace package body reserveAtDHK as
	procedure takeGuestInfo(
		fName in guest.firstName%TYPE,
        lName in guest.lastName%TYPE,
        addR in guest.address%TYPE,
        occ in guest.occupation%TYPE,
        tel in guest.telephone%TYPE, 
        gNum out number,
        site in booking.branchId%Type
        )
	is
        
        cursor gCur is
            select guestId from guest;
        cursor gCur2 is
            select guestId from guest WHERE guestId IN 
                ( SELECT guestID from booking where branchID= 2
                );
        cursor gCur3 is
            select guestId from guest WHERE guestId IN 
                ( SELECT guestID from booking where branchID= 3
                );
        
        gNo guest.guestId%TYPE;
	
	begin
		
        
        if site = 1 then
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
        elsif site = 2 then
        
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
        
        open gCur2;
        gNum:=0;
        loop
          fetch gCur2 into gNo;
          exit when gCur2%notfound;
          gNum:=gNum+1;
        end loop;
        close gCur2;
        gNum:=gNum+1;
        insert into guest@site_ctg (guestId, firstName, lastName, address, occupation, telephone) 
            values (gNo+1, fName, lName, addR,occ, tel);
        commit;
        
        
        elsif site = 3 then
        
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
        
        open gCur3;
        gNum:=0;
        loop
          fetch gCur3 into gNo;
          exit when gCur3%notfound;
          gNum:=gNum+1;
        end loop;
        close gCur3;
        gNum:=gNum+1;
        insert into guest@site_nhk (guestId, firstName, lastName, address, occupation, telephone) 
            values (gNo+1, fName, lName, addR,occ, tel);
        commit;
        
        end if;
	--exception
		
	
	end takeGuestInfo;
    
    
    function roomAvaibility( rmType in roomType.roomType%TYPE,site in booking.branchId%Type) 
    return number 
    is avRmNum number;
    rCount number;
    cursor cur 
    is 
    select room.roomno --into avRmNum 
        from room
        where room.branchId=site and room.available='yes' and 
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
	tel in booking.telephone%TYPE,
    site in booking.branchId%Type)
    is 
    cursor bCur is
            select bookingId from booking;
    cursor bCur2 is
            select bookingId from booking where branchID=2;
    cursor bCur3 is
            select bookingId from booking where branchID=3;
        
        bNo booking.bookingId%TYPE;
        bNum booking.bookingId%TYPE;
	begin
		
        
        if site = 1 then
        
        open bCur;
        loop
          fetch bCur into bNo;
          exit when bCur%notfound;
        end loop;
        close bCur;
        bNum:=bNo+1;
            insert into booking (bookingID, guestID, staffId, roomNo, numberofGuest, bookingDate, checkedIN,checkOut, telephone,branchId) 
                values (bNum,gID, stID, rmNo, noG,bkDate, ckIn, ckOut, tel, site);
            commit;
            update room set room.available ='no' where room.roomNo = rmNo; 
            commit;
            
            
        elsif site = 2 then
        open bCur;
        loop
          fetch bCur into bNo;
          exit when bCur%notfound;
        end loop;
        close bCur;
        bNum:=bNo+1;
            insert into booking (bookingID, guestID, staffId, roomNo, numberofGuest, bookingDate, checkedIN,checkOut, telephone,branchId) 
                values (bNum,gID, stID, rmNo, noG,bkDate, ckIn, ckOut, tel, site);
            commit;
        open bCur2;
        bNum:=0;
        loop
          fetch bCur2 into bNo;
          exit when bCur2%notfound;
          bNum:=bNum+1;
        end loop;
        close bCur2;
        bNum:=bNum+1;
            insert into booking@site_ctg (bookingID, guestID, staffId, roomNo, numberofGuest, bookingDate, checkedIN,checkOut, telephone,branchId) 
                values (bNum,gID, stID, rmNo, noG,bkDate, ckIn, ckOut, tel, site);  
            commit;
            update room set room.available ='no' where room.roomNo = rmNo;
            commit;
            update room@site_ctg set room.available ='no' where room.roomNo = rmNo; 
            commit;
            
            
        elsif site = 3 then
        open bCur;
        loop
          fetch bCur into bNo;
          exit when bCur%notfound;
        end loop;
        close bCur;
        bNum:=bNo+1;
            insert into booking (bookingID, guestID, staffId, roomNo, numberofGuest, bookingDate, checkedIN,checkOut, telephone,branchId) 
                values (bNum,gID, stID, rmNo, noG,bkDate, ckIn, ckOut, tel, site);
            commit;
        
        open bCur3;
        bNum:=0;
        loop
          fetch bCur3 into bNo;
          exit when bCur3%notfound;
          bNum:=bNum+1;
        end loop;
        close bCur3;
        bNum:=bNum+1;
            insert into booking@site_nhk (bookingID, guestID, staffId, roomNo, numberofGuest, bookingDate, checkedIN,checkOut, telephone,branchId) 
                values (bNum,gID, stID, rmNo, noG,bkDate, ckIn, ckOut, tel, site);
            commit;
            update room set room.available ='no' where room.roomNo = rmNo; 
            commit;
            update room@site_nhk set room.available ='no' where room.roomNo = rmNo;
            commit;
            
        end if;
        
	--exception
    
    End reserveRoomAtSiteX;
    
	
end reserveAtDHK;	
/
