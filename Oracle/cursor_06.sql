-- a cursor record can be used for an update or delete provided one
-- advertises the intent;   when done with this, execute
-- SELECT * FROM empbb6; DROP TABLE empbb6 PURGE;
-- A 'lock' is obtained on the affected data after active set
-- initialization, released upon close
SET PAGES 100
SET PAUSE Off
CREATE TABLE empbb6 AS SELECT * FROM empbb02;
DECLARE
  CURSOR c IS
     SELECT sal FROM empbb6
     WHERE deptno = 30
     FOR UPDATE OF sal NOWAIT;
BEGIN
  FOR rec IN c LOOP
    UPDATE empbb6 SET sal = rec.sal + 150
    WHERE CURRENT OF c; --without this every sal in entire table becomes 20150
    -- only salaries in dept 30 are raised, even tho the cursor appears to
    -- just contain 3 numbers;  it still is aware of the rows they came from
  END LOOP;
  COMMIT;
END;
/
SELECT * FROM empbb6;
DROP TABLE empbb6 PURGE;