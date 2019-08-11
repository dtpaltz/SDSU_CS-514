-- plsql6.sql contains a "table-based" record.  This is 'implicit' and
-- the RECORD keyword is not used, but %ROWTYPE is used.
-- this is an example of a "programmer-defined" record, and the keywords
-- TYPE and RECORD both come into play; the code also shows that a table
-- of explicit records can be created
SET SERVEROUTPUT ON
DECLARE
  TYPE rectype IS RECORD
     (recname empbb02.ename%TYPE,
      recsal  empbb02.sal%TYPE);
  second_guesser rectype;
  TYPE tab_of_guessers IS TABLE OF rectype INDEX BY BINARY_INTEGER;
  noisy_fans tab_of_guessers;
BEGIN
  second_guesser.recname := 'Joe';
  second_guesser.recsal := 2;
  noisy_fans(1) := second_guesser;
  noisy_fans(2).recname := 'Moe';
  noisy_fans(2).recsal := 5;
  noisy_fans(-1).recname := 'Sue';
  DBMS_OUTPUT.PUT_LINE ('Hindsight '||noisy_fans(2).recname||
         ' is the official second guesser for the team.');
END;
.
/