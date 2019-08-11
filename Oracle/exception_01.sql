--  This code explores user exceptions.   A working program is modified so
--  as to force an error condition to be raised.
set serveroutput on
DECLARE
  v_name empbb02.ename%TYPE;
  v_pos  empbb02.pos%TYPE;
  v_sal  empbb02.sal%TYPE;
  v_exception EXCEPTION;
BEGIN
  SELECT empbb02.ename, empbb02.pos, empbb02.sal
  INTO v_name,v_pos,v_sal
  FROM empbb02
  WHERE empbb02.empno = '735';
-- we now deliberately force an error condition
--  v_sal := 0;
  IF v_sal <= 0 THEN
    RAISE v_exception;
  END IF;
INSERT INTO empbb02 VALUES('735','moe','ss','735','01-JAN-06',30,90,NULL);
  DBMS_OUTPUT.PUT_LINE(v_name || ' is a '|| v_pos ||
    ' and makes $'||TO_CHAR(v_sal)||' per month.');
EXCEPTION
    WHEN v_exception THEN
      DBMS_OUTPUT.PUT_LINE('A negative or zero salary is < min. wage.');
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Zero rows returned');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE||' ---- '||SQLERRM);
END;
/