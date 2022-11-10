-- this is for education employees, more or less, not baseball employees
-- can use DROP TYPE address_type     "ONLY IF"   it is not part of an
-- existing table, i.e. emped would have to be dropped first
-- the '/' at the end of CREATE TYPE seems to be pretty darned necessary
-- This extension of object.sql adds VARRAY and an instance method
-- The method return type should evidently not mention a size.
-- The method body is defined within PL/SQL.  The file is address_type.body
DROP TABLE emped PURGE;
DROP TYPE name_type;
DROP TYPE address_type;
DROP TYPE phones_type;
CREATE TYPE address_type AS OBJECT (
  street VARCHAR2(20),
  city VARCHAR2(14),
  state VARCHAR2(14),
  zip NUMBER(5),
  member function streetName return VARCHAR2,
  pragma restrict_references(streetName,WNDS)
);
/
CREATE TYPE name_type AS OBJECT (
  first VARCHAR2(10),
  middle VARCHAR2(10),
  last VARCHAR2(10)  );
/
CREATE TYPE phones_type AS VARRAY(5) OF CHAR(12);
/
CREATE TABLE emped (empno VARCHAR2(6),
                    ename name_type,
                    addr  address_type,
                    phones phones_type);
INSERT INTO emped VALUES('p10',name_type('john','david','sloan'),
                      address_type('110  elm street','topeka','kansas',76111),
                      phones_type('619-443-9876',null,null)
                  );
INSERT INTO emped VALUES('p20',name_type(null,null,'mcGraw'),
                 address_type('3224 fifth ave','lonesome town','iowa',53444),
                 phones_type('619-111-2233','858-423-6782','594-699-0022')
                  );
INSERT INTO emped VALUES('p30',name_type('amos','alonzo','stagg'),
                  null,phones_type('999-999-9999'));