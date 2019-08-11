set serveroutput on
declare
  b1 boolean := false;
  b2 boolean;
  b3 boolean := true;
begin
  b2 := b3 and b2;
  if (b2 = true) THEN
    dbms_output.put_line('b2 is true');
  elseif (b2 = false) then
    dbms_output.put_line('b2 is false');
  else
    dbms_output.put_line('b2 is null');
  end if;
  
  b3 := b3 and 3 < 2;
  
  if (b3 = true) then
    dbms_output.put_line('b3 is true');
  else
    dbms_output.put_line('b3 is false');
  end if;
end;
/
