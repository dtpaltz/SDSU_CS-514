set echo off
set termout off

CREATE TABLE empbb02
(
empno VARCHAR2(5),
ename VARCHAR2(10) NOT NULL,
pos VARCHAR2(12),
boss VARCHAR2(4),
hiredate DATE,
sal NUMBER(6),
deptno NUMBER(2),
incentives NUMBER(6)
);

INSERT INTO empbb02 VALUES('712', 'rickey', 'gm', NULL, '01-JAN-98', 10000, 40, NULL);
INSERT INTO empbb02 VALUES('735', 'lasorda', 'coach', '712', '10-JAN-98', 2000, 40, NULL);
INSERT INTO empbb02 VALUES('707', 'bochy', 'coach', '712', '11-JAN-98', 2000, 40, NULL);
INSERT INTO empbb02 VALUES('798', 'berra', 'coach', '712', '12-JAN-98', 2000, 40, NULL);
INSERT INTO empbb02 VALUES('782', 'musial', 'right field', '707', '01-FEB-98', 42000, 20, NULL);
INSERT INTO empbb02 VALUES('763', 'gehrig', 'first base', '735', '11-MAR-98', 85000, 10, NULL);
INSERT INTO empbb02 VALUES('777', 'minoso', 'shortstop', '735', '05-MAY-98', 85000, 10, 6000);
INSERT INTO empbb02 VALUES('721', 'sandberg', 'second base', '735', '28-FEB-98', 25000, 10, NULL);
INSERT INTO empbb02 VALUES('788', 'cey', 'third base', '735', '10-JAN-99', 15000, 10, 8000);
INSERT INTO empbb02 VALUES('720', 'williams', 'left field', '707', '05-JAN-99', 150000, 20, NULL);
INSERT INTO empbb02 VALUES('755', 'johnson', 'pitcher', '798', '08-NOV-98', 50000, 30, NULL);
INSERT INTO empbb02 VALUES('744', 'brown', 'pitcher', '798', '18-OCT-99', 40000, 30, 4000);
INSERT INTO empbb02 VALUES('730', 'mays', 'center field', '707', '01-JAN-98', 240000, 20, NULL);
INSERT INTO empbb02 VALUES('799', 'mungo', 'pitcher', '798', '10-MAR-00', 20000, 30, 12000);
INSERT INTO empbb02 VALUES('766', 'rodriguez', 'catcher', '735', '16-OCT-01', 100000, 50, NULL);

CREATE TABLE infobb02
(
empno VARCHAR2(5),
fname VARCHAR2(10),
nick VARCHAR2(15),
uni VARCHAR2(4),
average NUMBER(4),
era NUMBER(6,3)
);

INSERT INTO infobb02 VALUES('712', 'branch', NULL, '56', NULL, NULL);
INSERT INTO infobb02 VALUES('735', 'tommy', NULL, '62', NULL, NULL);
INSERT INTO infobb02 VALUES('707', 'bruce', NULL, '64', 220, NULL);
INSERT INTO infobb02 VALUES('777', 'orestes', 'minnie', '27', 270, 32);
INSERT INTO infobb02 VALUES('763', 'lou', 'iron horse', '14', 350, NULL);
INSERT INTO infobb02 VALUES('782', 'stan', 'the man', '19', 342, NULL);
INSERT INTO infobb02 VALUES('798', 'larry', 'yogi', '66', 290, NULL);
INSERT INTO infobb02 VALUES('788', 'ron', 'penguin', '35', 287, NULL);
INSERT INTO infobb02 VALUES('730', 'willie', 'say hey kid', '12', 325, NULL);
INSERT INTO infobb02 VALUES('755', 'randy', 'the big unit', '8 ', 123, 2.15);
INSERT INTO infobb02 VALUES('744', 'mordecai', '3 fingers', '25', 168, 3.27);
INSERT INTO infobb02 VALUES('721', 'ryne', 'rhino', '17', 294, NULL);
INSERT INTO infobb02 VALUES('799', 'van lingle', NULL, '31', 230, 2.82);
INSERT INTO infobb02 VALUES('720', 'ted', 'teddy ballgame', '10', 350, NULL);
INSERT INTO infobb02 VALUES('766', 'ivan', 'pudge', '4 ', 339, NULL);

CREATE TABLE deptbb02
(
deptno NUMBER(3),
dname VARCHAR2(8),
restaurant VARCHAR2(15),
location VARCHAR2(15),
motto VARCHAR2(30)
);

INSERT INTO deptbb02 VALUES(10, 'infield', 'Jade', 'Clairmont', 'Let''s play two!');
INSERT INTO deptbb02 VALUES(20, 'outfield', 'House of Pasta', 'Santee', 'Alea iacta est');
INSERT INTO deptbb02 VALUES(30, 'pitcher', 'Crab Shack', 'Pacific Beach', 'Semper paratus');
INSERT INTO deptbb02 VALUES(40, 'staff', 'Burger King', 'Lakeside', 'Experientia docet');
INSERT INTO deptbb02 VALUES(50, 'catchers', 'Pinnacle Peak', 'Santee', 'Non bastardi carborundum');

CREATE TABLE salsbb02
(
grade NUMBER(2),
role VARCHAR2(8),
losal NUMBER(6),
hisal NUMBER(6)
);

INSERT INTO salsbb02 VALUES(1, 'staff', 1000, 5000);
INSERT INTO salsbb02 VALUES(2, 'staff', 5001, 10000);
INSERT INTO salsbb02 VALUES(1, 'hitter', 5000, 15000);
INSERT INTO salsbb02 VALUES(2, 'hitter', 15001, 50000);
INSERT INTO salsbb02 VALUES(3, 'hitter', 50001, 250000);
INSERT INTO salsbb02 VALUES(1, 'pitcher', 5000, 25000);
INSERT INTO salsbb02 VALUES(2, 'pitcher', 25001, 125000);

set echo on
set termout on
