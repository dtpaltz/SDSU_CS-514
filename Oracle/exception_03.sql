-- the PRAGMA below pairs a name with an error code;
-- the non-predefined code -2292 is for an integrity constraint error,
-- and we give it a name

-- the name let us trap it
-- without trapping all errors using OTHERS, and also lets us RAISE it
-- PRAGMA indicates a pseudo-op (compiler directive)
SET SERVEROUTPUT ON
DECLARE
  e_remaining_emps EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_remaining_emps,-2292);
  v_dept deptbb02.deptno%TYPE;
BEGIN
  v_dept := 10;
  DELETE FROM deptbb02 WHERE deptno = v_dept;
  ROLLBACK;
EXCEPTION
  WHEN e_remaining_emps THEN
    DBMS_OUTPUT.PUT_LINE('Cannot remove dept '||TO_CHAR(v_dept)||
       '.  Employees remain');
    -- we now propagate the error to the environment
    RAISE e_remaining_emps;
END;
.
/