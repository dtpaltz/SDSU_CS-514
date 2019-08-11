-- A stored procedure is hard to use from SQL since SQL has no
-- variables, and thus no way to capture output parameters.
-- Thus this proc, which captures statistics by department, will
-- be used in a PL/SQL block
CREATE OR REPLACE PROCEDURE empStatsbb02(
  deptid IN empbb02.deptno%TYPE,
  avgsal OUT NUMBER,
  totsal OUT NUMBER) AS
BEGIN
  SELECT ROUND(AVG(empbb02.sal)),SUM(empbb02.sal)
  INTO avgsal,totsal
  FROM empbb02
  WHERE empbb02.deptno = deptid;
END;
.
/
SHOW ERRORS