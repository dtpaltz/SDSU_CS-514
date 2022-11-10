DROP TABLE City;
DROP TYPE Point;

CREATE TYPE Point AS OBJECT (
  x NUMBER,
  y NUMBER,
  member function Distance(p2 IN Point) RETURN NUMBER,
  PRAGMA RESTRICT_REFERENCES(Distance,WNDS) );
/

CREATE TABLE City (
     Name VARCHAR(30),
     Country VARCHAR(30),
     Pop NUMBER(5,2),
     Capital CHAR(1),
     Shape Point);

INSERT INTO City VALUES('Brasilia', 'Brazil',1.5,'Y',Point(-55.4,-23.2));
INSERT INTO City VALUES('Ottawa','Canada',0.8,'Y',Point(-75.65,45.70));


-- point.body
CREATE OR REPLACE TYPE BODY Point AS
member function Distance(p2 IN Point) return NUMBER IS
  x1   City.Shape.x%type;
  y1   City.Shape.y%type;
  x2   City.Shape.x%type;
  y2   City.Shape.y%type;
  z    NUMBER(14,6);
  delta NUMBER(14,6);
  pi   NUMBER(14,7) := 3.141593;
BEGIN
  SELECT  c.Shape.x INTO x1
  FROM City c  WHERE c.Shape.x = self.x;
  SELECT c.Shape.y INTO y1
  FROM City c WHERE c.Shape.y = self.y;
-- approximation is commented out below
--RETURN SQRT((x1-p2.x)*(x1-p2.x) + (y1-p2.y)*(y1-p2.y))*111.111;
-- calculate all 4 angles in radians
  x1 := x1*pi/180;
  y1 := y1*pi/180;
  x2 := p2.x*pi/180;
  y2 := p2.y*pi/180;
  delta:= abs(x2-x1);
  IF delta > pi THEN delta:=2*pi - delta; END IF;
  z := sin(y1)*sin(y2) + cos(y1)*cos(y2)*cos(delta);
-- take inverse cosine, convert back to degrees, give ans in kilometers
  RETURN (acos(z)*180/pi)*111.111;
END;
END;
/
SHOW ERRORS

-- pointTest.sql
SET PAGES 100
SET ECHO ON
SET PAUSE ON
SELECT c.name,c.Shape.distance(d.Shape) FROM city c ,City d
WHERE c.name = 'Ottawa';







