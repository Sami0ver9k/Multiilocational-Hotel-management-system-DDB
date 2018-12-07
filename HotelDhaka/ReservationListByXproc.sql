set serveroutput on;
create or replace package reservationListAtDhaka as
	procedure reservationListByDate(
        ckIn in booking.checkedin%TYPE,
        site in int 
    );
    procedure reservationListByName (
        fname in guest.firstname%TYPE,
        lname in guest.lastname%TYPE,
        site1 in int 
    );
    procedure reservationListByRoom (
        rmNo in booking.roomno%TYPE
    );
    	
end reservationListAtDhaka;
/

create or replace package body reservationListAtDhaka as
	
    procedure reservationListByDate(
        ckIn in booking.checkedin%TYPE,
        site in int 
    )
	is
        
        cursor gCur2 is
            select guestId,staffId,roomNo,numberOfGuest,bookingDate,checkout,telephone from booking where booking.checkedin=ckin and booking.branchid=1;
        cursor gCur3 is
            select guestId,staffId,roomNo,numberOfGuest,bookingDate,checkout,telephone from booking where booking.checkedin=ckin and booking.branchid=2;
        cursor gCur4 is
            select guestId,staffId,roomNo,numberOfGuest,bookingDate,checkout,telephone from booking where booking.checkedin=ckin and booking.branchid=3;
        
        
            gID booking.guestId%TYPE;
            stID booking.staffId%TYPE;
            rmNo booking.roomno%TYPE;
            noG booking.numberOfGuest%TYPE; 
            bkDate booking.bookingDate%TYPE; 
            ckOut booking.checkout%TYPE;
            tel booking.telephone%TYPE;
        
	begin
        if site=1 then
            open gCur2;
            DBMS_OUTPUT.put_line('Guest Id' || ' ' || 'Staff Id' || ' ' || 'Room No' || ' ' || 'No. of Guest' || ' ' || 
                        'Booking Date' || ' ' || 'ChekedOut' || ' ' || 'Telephone No.');
            loop
                fetch gCur2 into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when gCur2%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close gCur2;
        elsif site=2 then
            open gCur3;
            DBMS_OUTPUT.put_line('Guest Id' || ' ' || 'Staff Id' || ' ' || 'Room No' || ' ' || 'No. of Guest' || ' ' || 
                        'Booking Date' || ' ' || 'ChekedOut' || ' ' || 'Telephone No.');
            loop
                fetch gCur3 into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when gCur3%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close gCur3;
        elsif site=3 then
            open gCur4;
            DBMS_OUTPUT.put_line('Guest Id' || ' ' || 'Staff Id' || ' ' || 'Room No' || ' ' || 'No. of Guest' || ' ' || 
                        'Booking Date' || ' ' || 'ChekedOut' || ' ' || 'Telephone No.');
            loop
                fetch gCur4 into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when gCur4%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close gCur4;
        end if;
        
		
	
	end reservationListByDate;
    
    
    
    procedure reservationListByName (
        fname in guest.firstname%TYPE,
        lname in guest.lastname%TYPE,
        site1 in int 
    )
	is
        
        cursor nCur is
            select booking.guestId,booking.staffId,booking.roomNo,booking.numberOfGuest,booking.bookingDate,booking.checkout,booking.telephone 
            from booking INNER JOIN guest
            ON booking.guestId=guest.guestId
            where booking.branchid=1 and guest.firstname=fname and guest.lastname=lname;
        cursor nCur2 is
            select booking.guestId,booking.staffId,booking.roomNo,booking.numberOfGuest,booking.bookingDate,booking.checkout,booking.telephone 
            from booking INNER JOIN guest
            ON booking.guestId=guest.guestId
            where booking.branchid=2 and guest.firstname=fname and guest.lastname=lname;
        cursor nCur3 is
            select booking.guestId,booking.staffId,booking.roomNo,booking.numberOfGuest,booking.bookingDate,booking.checkout,booking.telephone 
            from booking INNER JOIN guest
            ON booking.guestId=guest.guestId
            where booking.branchid=3 and guest.firstname=fname and guest.lastname=lname;
        
            gID booking.guestId%TYPE;
            stID booking.staffId%TYPE;
            rmNo booking.roomno%TYPE;
            noG booking.numberOfGuest%TYPE; 
            bkDate booking.bookingDate%TYPE; 
            ckOut booking.checkout%TYPE;
            tel booking.telephone%TYPE;
        
	begin
        DBMS_OUTPUT.put_line('Guest Id' || ' ' || 'Staff Id' || ' ' || 'Room No' || ' ' || 'No. of Guest' || ' ' || 
                        'Booking Date' || ' ' || 'ChekedOut' || ' ' || 'Telephone No.');
            
        if site1=1 then
            open nCur;
            loop
                fetch nCur into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when nCur%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close nCur;
        elsif site1=2 then
            open nCur2;
            loop
                fetch nCur2 into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when nCur2%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close nCur2;
        elsif site1=3 then
            open nCur3;                       
            loop
                fetch nCur3 into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when nCur3%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close nCur3;
        end if;
        
		
	
	end reservationListByName;
    
    
    procedure reservationListByRoom (
        rmNo in booking.roomno%TYPE
    )
	is
        
        cursor Cur1 is
            select guestId,staffId,roomNo,numberOfGuest,bookingDate,checkout,telephone from booking where booking.roomNo=rmNo and booking.branchid=1;
        
            gID1 booking.guestId%TYPE;
            stID1 booking.staffId%TYPE;
            rmNo1 booking.roomno%TYPE;
            noG1 booking.numberOfGuest%TYPE; 
            bkDate1 booking.bookingDate%TYPE; 
            ckOut1 booking.checkout%TYPE;
            tel1 booking.telephone%TYPE;
        
	begin
        open Cur1;
            DBMS_OUTPUT.put_line('Guest Id' || ' ' || 'Staff Id' || ' ' || 'Room No' || ' ' || 'No. of Guest' || ' ' || 
                        'Booking Date' || ' ' || 'ChekedOut' || ' ' || 'Telephone No.');
            loop
                fetch Cur1 into gID1,stID1,rmNo1,noG1,bkDate1,ckOut1,tel1;
                exit when Cur1%notfound;
                DBMS_OUTPUT.put_line(to_char(gID1) ||' ' || to_char(stID1) || ' ' || to_char(rmNo1) || ' ' || to_char(noG1) || ' ' || 
                        to_char(bkDate1) || ' ' || ckOut1 || ' ' || to_char(tel1));
            end loop;
            close Cur1;
	
	end reservationListByRoom;
    
    
	
end reservationListAtDhaka;	
/
