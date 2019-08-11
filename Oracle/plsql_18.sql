--VAR v deptbb02.dname%TYPE;
VARIABLE v VARCHAR2(8);
--BEGIN
execute   :v := getDnamebb02('lasorda');
--DBMS_OUTPUT.PUT_LINE(v);
--END
PRINT v;
