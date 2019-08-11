DECLARE
  g_monthly_sal NUMBER;
  v_sal NUMBER(9,2) NOT NULL:= &p_annual_sal;
  c_val CONSTANT NUMBER:= -10;
BEGIN
  g_monthly_sal := v_sal/12;
  DBMS_OUTPUT.PUT_LINE('The monthly salary is $' || TO_CHAR(g_monthly_sal) || ' and your value to us is ' || c_val || '.');
END;
/