create type student as object (
redid number(9),
member function tostring return varchar2,
pragma restrict_references(tostring, wnds));

createe or replace type body student as
member function tostring() return varchar is