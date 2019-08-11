-- simple test of the 'execute' command, which basically creates a
-- minimal anonymous block containing the following invocation
VARIABLE deptname VARCHAR2(8);
execute :deptname := getDnamebb02('lasorda');
PRINT deptname