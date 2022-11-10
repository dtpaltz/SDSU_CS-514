
-- 'self' refers to the object the method is invoked upon
CREATE OR REPLACE TYPE BODY address_type AS
MEMBER FUNCTION streetName RETURN VARCHAR2 IS
  st   emped.addr.street%type;
BEGIN
  SELECT e.addr.street INTO st FROM emped e WHERE e.addr.street = SELF.street;
  RETURN SUBSTR(st,6,20);
END;
END;
/
SHOW ERRORS





























