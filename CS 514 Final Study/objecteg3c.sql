-- this is a variation in which we create a object type for employees
-- themselves;  We use special syntax CREATE TABLE ... OF ...to create
-- a so-called "object table".  Such a table can be treated as a table
-- of fields, OR as a table of objects; two distinct display patterns
-- result, depending on the SELECT used.  There is no name for the
-- "column of objects" in this case, unlike objecteg3b.sql.  NOTE:
-- DESC emped is also different for objecteg3b and objecteg3c

-- this is for education employees, more or less, not baseball employees
-- can use DROP TYPE address_type     "ONLY IF"   it is not part of an
-- existing table, i.e. emped would have to be dropped first
-- the '/' at the end of CREATE TYPE seems to be pretty darned necessary
-- This extension of object.sql adds VARRAY and an instance method
-- The method return type should evidently not mention a size.
-- The method body is defined within PL/SQL.  The file is address_type.body
DROP TABLE emped3 PURGE;
DROP TABLE emped PURGE;
DROP TYPE name_type3;
DROP TYPE address_type3;
DROP TYPE phones_type3;
DROP TYPE t_emped;

CREATE TYPE address_type3 AS OBJECT (
  street VARCHAR2(20),
  city VARCHAR2(14),
  state VARCHAR2(14),
  zip NUMBER(5),
  member function streetName3 return VARCHAR2,
  pragma restrict_references(streetName3,WNDS)
);
/

CREATE TYPE name_type3 AS OBJECT (
  first VARCHAR2(10),
  middle VARCHAR2(10),
  last VARCHAR2(10),
  member function middleInit return VARCHAR2,
  pragma restrict_references(middleInit,WNDS)
);
/

CREATE TYPE phones_type3 AS VARRAY(5) OF CHAR(12);
/

CREATE TYPE t_emped AS OBJECT (
  empno VARCHAR2(6),
  ename name_type3,
  addr address_type3,
  phones phones_type3);
/
SHOW ERRORS

CREATE TABLE emped3 OF t_emped;

-- CREATE TABLE emped3 (empno VARCHAR2(6),
                   -- ename name_type3,
                    -- addr  address_type3,
                    --phones phones_type3);
					
-- the insert statements now change
INSERT INTO emped3 VALUES(t_emped('p10',name_type3('john','david','sloan'),
                      address_type3('110 elm street','topeka','kansas',76111),
                      phones_type3('619-443-9876',null,null)  )
                  );
INSERT INTO emped3 VALUES(t_emped('p20',name_type3(null,null,'mcGraw'),
                 address_type3('3224 fifth ave','lonesome town','iowa',53444),
                 phones_type3('619-111-2233','858-423-6782','594-699-0022')
                 )   );
INSERT INTO emped3 VALUES(t_emped('p30',name_type3('amos','alonzo','stagg'),
                  null,phones_type3('999-999-9999'))  );
.







