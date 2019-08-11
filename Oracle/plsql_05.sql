-- shows that group functions are ok INSIDE a  SELECT INTO
VARIABLE b_sal NUMBER
BEGIN
  SELECT SUM(empbb02.sal)
  INTO :b_sal
  FROM empbb02;
END;
.
/
PRINT b_sal
