DROP TABLE deptbb02bak PURGE;
CREATE TABLE deptbb02bak AS SELECT * FROM deptbb02;
VARIABLE rows_deleted VARCHAR2(30)
DECLARE
  v_deptno NUMBER := 40;
BEGIN
  DELETE FROM deptbb02bak
  WHERE deptno > v_deptno;
  :rows_deleted := (SQL%ROWCOUNT || ' rows deleted.');
END;
/
PRINT rows_deleted