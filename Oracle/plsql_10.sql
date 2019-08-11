--this code explores declarations of tables, and entering data into them.
--It also checks out the methods available for PL/SQL tables.
DECLARE
  done BOOLEAN;
  bool VARCHAR2(5);
  i INTEGER;
  j INTEGER;
  TYPE food IS TABLE OF VARCHAR2(20) INDEX BY BINARY_INTEGER;
  spChow FOOD;
BEGIN
  spChow(1) := 'beef taco';
  spChow(2) := 'chicken_taco';
  spChow(3) := 'goat_taco';
  spChow(4) := 'spaghetti';
  spChow(8) := 'carne asada burrito';
  spChow(9) := 'chicken burrito';
  spChow(10) := 'bean burrito';
  spChow(1500) := 'ceviche';
  spChow(14) := 'paella';
  spChow.delete(4);
  DBMS_OUTPUT.PUT_LINE('least index is '||TO_CHAR(spChow.first)||
       ' and greatest is ' ||TO_CHAR(spChow.last));
  DBMS_OUTPUT.PUT_LINE('after 3 comes '||TO_CHAR(spChow.next(4))||
       ' and before 1500 is ' || TO_CHAR(spChow.prior(1500)));
  IF spChow.exists(4) THEN
    bool := 'TRUE';
  ELSE
    bool := 'FALSE';
  END IF;
  DBMS_OUTPUT.PUT_LINE('existence of an element with index 4 is '
       || bool);
-- the following code will traverse this, and many other tables
-- the tables should be non-empty
  i := spChow.first;
  LOOP
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(i)||'.  '||spChow(i));
    EXIT WHEN spChow.last = i;
    i := spChow.next(i);
  END LOOP;
END;
.
/