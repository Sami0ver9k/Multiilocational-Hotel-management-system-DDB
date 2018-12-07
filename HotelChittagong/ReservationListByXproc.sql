set serveroutput on;
create or replace package reservationListAtCtg as
	procedure reservationListByDate(
        ckIn in booking.checkedin%TYPE
    );
    procedure reservationListByName (
        fname in guest.firstname%TYPE,
        lname in guest.lastname%TYPE
    );
    procedure reservationListByRoom (
        rmNo in booking.roomno%TYPE
    );
    	
end reservationListAtCtg;
/

create or replace package body reservationListAtCtg as
	
    procedure reservationListByDate(
        ckIn in booking.checkedin%TYPE
    )
	is
        
        cursor gCur2 is
            select guestId,staffId,roomNo,numberOfGuest,bookingDate,checkout,telephone from booking where booking.checkedin=ckin;
        
            gID booking.guestId%TYPE;
            stID booking.staffId%TYPE;
            rmNo booking.roomno%TYPE;
            noG booking.numberOfGuest%TYPE; 
            bkDate booking.bookingDate%TYPE; 
            ckOut booking.checkout%TYPE;
            tel booking.telephone%TYPE;
        
	begin
        
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
        
	
	end reservationListByDate;
    
    
    
    procedure reservationListByName (
        fname in guest.firstname%TYPE,
        lname in guest.lastname%TYPE
    )
	is
        
        cursor nCur is
            select booking.guestId,booking.staffId,booking.roomNo,booking.numberOfGuest,booking.bookingDate,booking.checkout,booking.telephone 
            from booking INNER JOIN guest
            ON booking.guestId=guest.guestId
            where guest.firstname=fname and guest.lastname=lname;
        
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
            
        
            open nCur;
            loop
                fetch nCur into gID,stID,rmNo,noG,bkDate,ckOut,tel;
                exit when nCur%notfound;
                DBMS_OUTPUT.put_line(to_char(gID) ||' ' || to_char(stID) || ' ' || to_char(rmNo) || ' ' || to_char(noG) || ' ' || 
                        to_char(bkDate) || ' ' || ckOut || ' ' || to_char(tel));
            end loop;
            close nCur;
	
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
    
    
	
end reservationListAtCtg;	
/
