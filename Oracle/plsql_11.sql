-- tables usually have col. data, but row data is possible, and can come from
-- a database table.
-- in this case we refer to the data as a 'record', and indicate its origin
-- by saying it is a 'table-based record'; plsql6.sql is similar, but
-- does not use a TABLE;  in the example below the data is table-based and
-- TABLE resident
SET SERVEROUTPUT ON
SET PAGES 50
SELECT * FROM deptbb02;
DECLARE
  TYPE dept_type IS TABLE OF deptbb02%ROWTYPE INDEX BY BINARY_INTEGER;
  dept_rows dept_type;
  v_count NUMBER(3);
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM deptbb02;
  FOR i IN 1..v_count LOOP
    SELECT * INTO dept_rows(i)
    FROM deptbb02
    WHERE deptno=i*10;
--depends a lot on choosing deptno by a 'sequence'
  END LOOP;
  FOR i IN 1..v_count LOOP
    DBMS_OUTPUT.PUT_LINE('The '||dept_rows(i).dname||' department dines at '||
       dept_rows(i).restaurant||'.');
  END LOOP;
END;
/