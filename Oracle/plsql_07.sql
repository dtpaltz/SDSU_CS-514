DECLARE
  b1 BOOLEAN := FALSE;
  b2 BOOLEAN;
  b3 BOOLEAN := TRUE;
BEGIN
  b2 := b3 AND b2;
  IF b2 = TRUE THEN
    DBMS_OUTPUT.PUT_LINE('b2 is TRUE');
  ELSIF (b2 = FALSE) THEN
    DBMS_OUTPUT.PUT_LINE('b2 is FALSE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('b2 is NULL');
  END IF;
  b3 := b3 AND 3 < 2;
  IF (b3 = TRUE) THEN
    DBMS_OUTPUT.PUT_LINE('b3 is TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('b3 is FALSE');
  END IF;
END;
.