set serveroutput on
DECLARE
   ename VARCHAR2(20) := NULL;
   era VARCHAR2(20);
   average VARCHAR2(20);
BEGIN
   PLAYERAVERAGES(ename, era, average);
   dbms_output.put_line('Player ' || ename  || ' has an era of ' || era || ' and an average of ' || average);
   
   ename := 'johnson';
   PLAYERAVERAGES(ename, era, average);
   dbms_output.put_line('Player ' || ename  || ' has an era of ' || era || ' and an average of ' || average);
   
   ename := 'bochy';
   PLAYERAVERAGES(ename, era, average);
   dbms_output.put_line('Player ' || ename  || ' has an era of ' || era || ' and an average of ' || average);
   
   ename := 'lasorda';
   PLAYERAVERAGES(ename, era, average);
   dbms_output.put_line('Player ' || ename  || ' has an era of ' || era || ' and an average of ' || average);
END;
/