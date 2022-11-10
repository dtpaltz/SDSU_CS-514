-- this is for education employees, more or less, not baseball employees
-- can use DROP TYPE address_type     "ONLY IF"   it is not part of an
-- existing table, i.e. emped would have to be dropped first
-- the '/' at the end of CREATE TYPE seems to be pretty darned necessary
-- This example is method free, just to get started.  It is not persisted.
-- before running, drop table emped purge, then drop both types
DROP TABLE emped PURGE;
CREATE TYPE address_type AS OBJECT (
  street VARCHAR2(20),
  city VARCHAR2(14),
  state VARCHAR2(14),
  zip NUMBER(5)   );
/
CREATE TYPE name_type AS OBJECT (
  first VARCHAR2(10),
  middle VARCHAR2(10),
  last VARCHAR2(10)  );
/
CREATE TABLE emped (empno VARCHAR2(6),
                    ename name_type,
                    addr  address_type);
INSERT INTO emped VALUES('p10',name_type('john','david','sloan'),
                         address_type('110  elm street','topeka','kansas',76111)
                  );
INSERT INTO emped VALUES('p20',name_type(null,null,'mcGraw'),
                   address_type('3224 fifth ave','lonesome town','iowa',53444)
                  );
INSERT INTO emped VALUES('p30',name_type('amos','alonzo','stagg'),null);

SELECT ename from emped;

--for the next select, the table alias seems necessary

SELECT e.ename.last from emped e;