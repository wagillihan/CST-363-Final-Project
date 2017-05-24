SET define on
SET verify off
SET heading off
SET echo off

PROMPT 'Welcome to Startup Solutions';
PROMPT
PROMPT '1: Add Employee             | 2: Employee Lookup';
PROMPT '3: Change Office Location   | 4: Cost of Living Increase';
PROMPT '5: Promote Employee         | 6: Reports';
PROMPT '7: Update Pay Rate          | 8: Create Invoice';

ACCEPT input PROMPT 'Enter selection:';

col menu new_val menuVar

SET term off
SELECT
   CASE '&input'
      WHEN '1' THEN '@addEmployee.sql' 
      WHEN '2' THEN '@lookupEmployee.sql'
      WHEN '3' THEN '@changeOfficeLoc.sql'
      WHEN '4' THEN '@costLivingInc.sql'
      WHEN '5' THEN '@promoteEmployee.sql'
      WHEN '6' THEN '@reports.sql'
      WHEN '7' THEN '@updatePayRate.sql'
      ELSE '@reports.sql'
   END AS menu 
FROM DUAL;
SET term on

@&menuVar