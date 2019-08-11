-- This example looks at cursors with parameters.
-- It could nicely be done as a function or procedure!
-- a cursor parameter may not have a field width specified
-- The cursor active set can be reconstituted, but the
-- initializing select's are similar to each other
spool cursorbb02d.dat
set echo on
set pages 100
set serveroutput on
DECLARE
   CURSOR c(cdept NUMBER) IS
   SELECT *
   FROM empbb02
   WHERE deptno = cdept;
   rec  empbb02%ROWTYPE;
BEGIN
   FOR rec IN c(10) LOOP
     DBMS_OUTPUT.PUT_LINE(rec.ename ||' makes '||rec.sal ||
        ' for department '||rec.deptno||'.');
   END LOOP;
   FOR rec IN c(&num) LOOP
     DBMS_OUTPUT.PUT_LINE(rec.ename ||' makes '||rec.sal||
        ' for department '|| rec.deptno||'.');
   END LOOP;
END;
/