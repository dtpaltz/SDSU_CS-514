DECLARE
 l_x NUMBER := 2;
 out VARCHAR2(6);
BEGIN
CASE WHEN l_x = 1 THEN out := 'one';
     WHEN l_x = 2 THEN out :='two';
     WHEN l_x = 3 THEN out := 'three';
     ELSE out := 'big';
END CASE;
DBMS_OUTPUT.PUT_LINE (out);
end;
.
/