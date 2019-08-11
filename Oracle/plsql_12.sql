-- The order of the three declarations seems to matter.
-- An internal function declaration changes 'AS' to 'IS',
-- but each word seems to be optional
SET SERVEROUTPUT ON
DECLARE
   c NUMBER := 0;
   a NUMBER NOT NULL := 12;
   FUNCTION foo(a NUMBER) RETURN NUMBER IS b NUMBER;
   BEGIN
     b:=a * a + 5;
     RETURN(b);
   END;
BEGIN
  c := foo(a);
  DBMS_OUTPUT.PUT_LINE(c);
END;
.
/