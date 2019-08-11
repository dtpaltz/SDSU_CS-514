-- when testing, type SET SERVEROUTPUT ON first
-- triggers were not added to ANS SQL until SQL3, aka SQL1999
-- the most typical triggers are attached to some DML command;
-- the triggering event is the DML command, possibly accompanied by a
-- triggering constraint;  if the trigger fires, a PL/SQL block is executed
-- that block can make a check for a condition
-- the variable :new  refers to the new line being inserted!!!
-- if the event is an update, :old refers to the old line
-- line just below is dangerous---may not be in effect when trigger event
-- occurs
-- note: raise_application_error should have an error number between
--   -20000 and -20999
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER tigger
BEFORE INSERT ON deptbb02
FOR EACH ROW
DECLARE
  bad_food_exception exception;
BEGIN
  IF :new.restaurant LIKE '%sushi%' THEN
    raise bad_food_exception;
  END IF;
EXCEPTION
  WHEN bad_food_exception THEN
    DBMS_OUTPUT.PUT_LINE('PELIGRO! raw food');
    --uncomment next line to block insertion
    --raise_application_error(-20000,'gotta run');
    -- raise_application_error is a special Oracle builtin function
END;
/