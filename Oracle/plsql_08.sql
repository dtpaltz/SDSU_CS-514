--illustrates control structures
spool control.dat
set echo on
set pause on
set pages 100
set serveroutput on
DECLARE
  i  INTEGER := 0;
  j  INTEGER := 0;
  --k  INTEGER := 20;
BEGIN
  <<Outer>>
  LOOP
    i := i + 1;
    <<Inner>>
    LOOP
      j := j + 1;
      i := i + 1;
      EXIT Outer WHEN j = 4;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('i = ' || i || ' and j is   ' || j);
  FOR k IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('k times k is ' || k*k);
  END LOOP;
  --DBMS_OUTPUT.PUT_LINE(k);
END;
/