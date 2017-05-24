SET ECHO OFF
SET VERIFY OFF
SET UNDERLINE =
CLEAR BREAKS
SET PAGESIZE 50

SPOOL "C:\Users\Computer login\Desktop\CSUMB\CST 363\FinalProject\Deliverables\reports.txt"

PROMPT
PROMPT -----------------------------------------------------------

PROMPT --------------STARTUP SOLUTIONS, INC. REPORTS--------------

PROMPT -----------------------------------------------------------


SET HEADING OFF
COLUMN SALARY FORMAT $9,999,990
SELECT 'Average Salary: ', ltrim(AVG(POS_Rate)) AS "Salary"
	FROM EMPLOYEE LEFT JOIN POSITION
	ON EMPLOYEE.POS_Title = POSITION.POS_Title;
COLUMN SALARY CLEAR

PROMPT -----------------------------------------------------------

SELECT 'Total Number of Employees: ', ltrim(COUNT(EMP_ID))
	FROM EMPLOYEE;


PROMPT -----------------------------------------------------------

SELECT 'Oldest Employee: ' || rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) || ' - ' || SUBSTR((SYSDATE - Emp_DOB)/365,1,2) || ' years old' AS "Oldest Employee"
	FROM EMPLOYEE, DUAL
	WHERE (SYSDATE - Emp_DOB) = (SELECT MAX(SYSDATE - Emp_DOB) FROM EMPLOYEE, DUAL);
SET HEADING ON


PROMPT -----------------------------------------------------------

PROMPT
PROMPT Annual Labor Cost by Office
COLUMN "Annual Labor Cost" FORMAT $9,999,990 HEADING "Labor Cost"
COLUMN "Office" FORMAT A8 JUSTIFY RIGHT
SELECT rtrim(Office#) AS "Office", SUM(POS_Rate) AS "Annual Labor Cost"
	FROM EMPLOYEE LEFT JOIN POSITION
	ON EMPLOYEE.POS_Title = POSITION.POS_Title
	GROUP BY Office#
	ORDER BY Office# ASC;
COLUMN "Annual Labor Cost" CLEAR


PROMPT -----------------------------------------------------------

PROMPT 
PROMPT Employees Under Age 21 By Office
COLUMN DOB HEADING 'Birth |Date' FORMAT A11
COLUMN NAME FORMAT A25
BREAK ON "Office" SKIP 1
SELECT rtrim(Office#) AS "Office", rtrim(rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) || ' ' || rtrim(Emp_MI)) AS "Name", ltrim(to_char(Emp_DOB, 'mm/dd/yyyy')) AS "DOB", SUBSTR((SYSDATE - Emp_DOB)/365,1,2) || ' years old' AS "Age"
	FROM EMPLOYEE, DUAL
	WHERE (SYSDATE - Emp_DOB) < 7665
	ORDER BY Office#, Emp_DOB DESC;

PROMPT -----------------------------------------------------------

PROMPT 
PROMPT Employees Who Have Worked More Than 25 Years By Office
COLUMN "Start Date" HEADING 'Start |Date' FORMAT A11
COLUMN "workLength" HEADING 'Years |Worked'
COLUMN NAME FORMAT A25
SELECT rtrim(Office#) AS "Office", rtrim(rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) || ' ' || rtrim(Emp_MI)) AS "Name", ltrim(to_char(Emp_StartD, 'mm/dd/yyyy')) AS "Start Date", SUBSTR((SYSDATE - Emp_StartD)/365,1,2) || ' years' AS "workLength"
	FROM EMPLOYEE, DUAL
	WHERE (SYSDATE - Emp_StartD) > 10950
	ORDER BY Office#, Emp_StartD DESC;
CLEAR BREAKS
COLUMN "Office" CLEAR
COLUMN "Start Date" CLEAR
COLUMN DOB CLEAR
COLUMN NAME CLEAR


PROMPT -----------------------------------------------------------

PROMPT -----------------------------------------------------------



PROMPT -----------------------------------------------------------

PROMPT
PROMPT Employee Start Dates By Position
COLUMN Name FORMAT A25 HEADING "Employee Name"
COLUMN Title HEADING "Employee Title"
COLUMN Start HEADING "Start Date"
BREAK ON "Title" SKIP 1

SELECT trim(POS_Title) AS "Title", rtrim(rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) || ' ' || rtrim(Emp_MI)) AS "Name", ltrim(to_char(Emp_StartD, 'MM/DD/YYYY')) AS "Start"
FROM EMPLOYEE
ORDER BY POS_Title ASC;




PROMPT -----------------------------------------------------------

PROMPT
PROMPT Employee Start Dates By Office
COLUMN Name FORMAT A25 HEADING "Employee Name"
COLUMN Start HEADING "Start Date"
COLUMN Office FORMAT A8 JUSTIFY RIGHT
BREAK ON Office SKIP 1
SELECT rtrim(rtrim(Emp_Lname) || ', ' || rtrim(Emp_Fname) || ' ' || rtrim(Emp_MI)) AS "Name", ltrim(to_char(Emp_StartD, 'MM/DD/YYYY')) AS "Start", rtrim(Office#) AS "Office"
FROM EMPLOYEE
ORDER BY Office# ASC;



PROMPT -----------------------------------------------------------

PROMPT
PROMPT Highest paid employee per office

SELECT M.Office#, POSITION.POS_Title, POS_Rate, Emp_ID
FROM (SELECT Office#, MAX(POSITION.POS_Rate) RATE
    FROM EMPLOYEE, POSITION
    WHERE EMPLOYEE.POS_Title = POSITION.POS_Title
    GROUP BY Office#) M, POSITION, EMPLOYEE
WHERE POSITION.POS_Rate = M.RATE
    AND EMPLOYEE.Office# = M.Office#
    AND EMPLOYEE.POS_Title = POSITION.POS_Title
ORDER BY M.Office#;


PROMPT -----------------------------------------------------------

PROMPT
PROMPT Lowest paid employee per office

SELECT M.Office#, POSITION.POS_Title, POS_Rate, Emp_ID
FROM (SELECT Office#, MIN(POSITION.POS_Rate) RATE
    FROM EMPLOYEE, POSITION
    WHERE EMPLOYEE.POS_Title = POSITION.POS_Title
    GROUP BY Office#) M, POSITION, EMPLOYEE
WHERE POSITION.POS_Rate = M.RATE
    AND EMPLOYEE.Office# = M.Office#
    AND EMPLOYEE.POS_Title = POSITION.POS_Title
ORDER BY M.Office#;


SPOOL OFF