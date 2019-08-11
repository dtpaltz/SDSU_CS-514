-- This is an example of a stored function.   An example invocation
-- might be SELECT ename,getDnamebb02(ename) FROM empbb02;
-- A function can also be included and invoked from within a PL/SQL
-- block.    Or it can be stored and called from a PL/SQL block.
-- An included function has slightly different syntax.
-- The function is compiled and stored when we
-- type >SQL start getDnamebb02.fn OR when we type the code below
-- directly into sqlplus
-- Syntax note: CREATE OR REPLACE replaces DECLARE, so you can have
-- identifier declarations before the word BEGIN; see getDnamebb02c.fn
-- zero parameter function seem to be frowned on;  see also f.fn
-- for a minimalist example
CREATE OR REPLACE FUNCTION getDnamebb02(name IN empbb02.ename%TYPE)
    RETURN deptbb02.dname%TYPE AS gdname deptbb02.dname%TYPE;
BEGIN
  SELECT dname
  INTO gdname
  FROM empbb02,deptbb02
  WHERE empbb02.deptno = deptbb02.deptno AND name = ename;
  RETURN(gdname);
END;
/