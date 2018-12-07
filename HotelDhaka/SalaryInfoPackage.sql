clear screen;
CREATE OR REPLACE PACKAGE salaryInfo AS

    TYPE measure_record IS RECORD(
       stId staff.staffId%Type,
       fname staff.firstname%Type,
       lname staff.lastname%TYPE,
       address staff.address%TYPE,
       salary number
       );
    TYPE measure_table IS TABLE OF measure_record;

    FUNCTION get_top_N_salaries(foo NUMBER)
        RETURN measure_table
        PIPELINED;
        
END salaryInfo;
/
CREATE OR REPLACE PACKAGE BODY salaryInfo AS

    FUNCTION get_top_N_salaries(foo number)
        RETURN measure_table
        PIPELINED IS

        rec measure_record;
        cursor cur is 
            SELECT distinct (staff.staffId), staff.firstName, staff.lastName, staff.address,salary.amount
          --INTO rec
          FROM Staff ,Salary
          where staff.jobId=salary.jobId and rownum<foo
          Order By salary.amount DESC
          ;

    BEGIN       
        open cur;
        loop       
            fetch cur into rec;
            exit when cur%notfound;
            PIPE ROW (rec);
            DBMS_output.Put_line(to_char(rec.stId)||' '||rec.fname||
                ' '||rec.lname||' '||rec.address||' '||to_char(rec.salary));            
        end loop;
        close cur;
        RETURN;
    END get_top_N_salaries;
END salaryInfo;
/

SELECT *
  FROM table(salaryInfo.get_top_N_salaries(4));

          
          