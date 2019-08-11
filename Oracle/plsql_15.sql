-- This is an example of a stored function.   An example invocation
-- might be execute :deptname  := getSideEffectDnamebb02('lasorda',:sal4);
-- where deptname and sal4 are suitable global variables.
-- The point is that you can write functions with side effects in spades.
-- A function can also be included and invoked from within a PL/SQL
-- block.    Or it can be stored and called from a PL/SQL block.
-- An included function has slightly different syntax.
-- The function is compiled and stored when we
-- type >SQL start getSideEffectDnamebb02.fn
CREATE OR REPLACE FUNCTION getSideEffectDnamebb02(name IN empbb02.ename%TYPE,
      sal3 OUT empbb02.sal%TYPE)
    RETURN deptbb02.dname%TYPE AS gdname deptbb02.dname%TYPE;
BEGIN
  SELECT dname, sal
  INTO gdname, sal3
  FROM empbb02,deptbb02
  WHERE empbb02.deptno = deptbb02.deptno AND name = ename;
  RETURN(gdname);
END;
/
SHOW ERRORS