CREATE OR REPLACE PROCEDURE PlayerAverages
(
  p_ename IN OUT VARCHAR2,
  p_era OUT VARCHAR2,
  p_average OUT VARCHAR2
)
AS 
BEGIN
  p_era := 'NA';
  p_average := 'NA';
  
  IF p_ename IS NOT NULL THEN
    SELECT TO_CHAR(era), TO_CHAR(average)
    INTO p_era, p_average
    FROM empbb02 NATURAL JOIN infobb02
    WHERE ename = p_ename;
  ELSE
    p_ename := 'NA';
  END IF;
    
  IF p_era IS NULL THEN
    p_era := 'NA';
  END IF;

  IF p_average IS NULL THEN
    p_average := 'NA';
  END IF;
END;