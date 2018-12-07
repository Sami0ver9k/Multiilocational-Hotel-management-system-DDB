clear screen;
create or replace FUNCTION one_employee (employee_id_in 
IN staff.staffId%TYPE)
   RETURN staff%ROWTYPE
   RESULT_CACHE RELIES_ON (staff)
IS
    l_employee   staff%ROWTYPE;
BEGIN
   SELECT *
      INTO l_employee
      FROM staff
    WHERE staffId = employee_id_in;

    RETURN l_employee;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN l_employee;
END one_employee;
/
SET SERVEROUTPUT ON;
declare
    l_employee   staff%ROWTYPE;
begin
    l_employee:=one_employee(1);
    DBMS_output.Put_line(to_char(l_employee.staffId)||' '||to_char(l_employee.jobId)||' '||l_employee.firstname||
            ' '||l_employee.lastname||' '||l_employee.address||' '||to_char(l_employee.bookingId));
End;
/
