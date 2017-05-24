SET ECHO OFF
SET VERIFY OFF
SET UNDERLINE =
SET HEADING ON

SPOOL "C:\Users\Computer login\Desktop\CSUMB\CST 363\FinalProject\Deliverables\promoteEmployee.txt"

PROMPT
PROMPT -----------------------------------------------------------

PROMPT -------------STARTUP SOLUTIONS, INC. PROMOTION-------------

PROMPT -----------------------------------------------------------

PROMPT 
PROMPT (Valid Employee IDs: 100-199)
ACCEPT vID PROMPT'Please enter Employee ID: '
PROMPT

COLUMN "empInfo" HEADING 'Current Employee Information' FORMAT A50
SELECT rtrim(Emp_ID) || ' - ' ||rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) || ' '|| rtrim(Emp_MI) || ' - ' ||rtrim(POS_Title) AS "EmpInfo"
	FROM EMPLOYEE
	WHERE Emp_ID='&vID';

SELECT POS_Title AS "Available New Titles"
	FROM POSITION
	WHERE NOT(POS_Title=(SELECT POS_Title FROM EMPLOYEE WHERE Emp_ID='&vID'));

PROMPT 
ACCEPT vPos PROMPT'Please enter a new Position from the list above: '
PROMPT

UPDATE EMPLOYEE
	SET POS_Title = (SELECT POS_Title FROM POSITION WHERE LOWER(POS_Title) LIKE LOWER('&vPos'))
	WHERE Emp_ID='&vID';

COLUMN "empInfo" HEADING 'Updated Employee Information'
SELECT rtrim(Emp_ID) || ' - ' || rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) ||' '|| rtrim(Emp_MI) || ' - ' || rtrim(POS_Title) AS "EmpInfo"
	FROM EMPLOYEE
	WHERE Emp_ID='&vID';
COLUMN "empInfo" CLEAR


PROMPT -----------------------------------------------------------

PROMPT -----------------------------------------------------------

SPOOL OFF