spool plsql.dat
accept ann_sal prompt 'please enter an annual salary'
set echo on
--% can use VARIABLE or VAR
--% this is a variation of plsql3.sql with more programming care
-- when a bind or subst. var. is used, the statement, if used recently
-- before, will be parsed and saved, and the parse step can be omitted
VARIABLE mo_sal VARCHAR2(10);
VAR mo NUMBER;
VAR date2 DATE := '03-JAN-07';
DECLARE
  v_sal NUMBER(9,2):= &ann_sal;
  v_date DATE := '03-JAN-07';
BEGIN
  :mo_sal:=TO_CHAR(v_sal/12,'99999.99');
  :mo := v_sal   ;
END;
/
PRINT mo_sal