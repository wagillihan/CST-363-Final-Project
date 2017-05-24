SET ECHO OFF
SET VERIFY OFF
SET UNDERLINE =
SET HEADING OFF

SPOOL "C:\Users\Computer login\Desktop\CSUMB\CST 363\FinalProject\Deliverables\lookupEmployee.txt"

PROMPT
PROMPT -----------------------------------------------------------

PROMPT ----------STARTUP SOLUTIONS, INC. Employee Lookup----------

PROMPT -----------------------------------------------------------

PROMPT 
PROMPT (Valid Employee IDs: 100-199)
ACCEPT vID PROMPT'Please enter Employee ID: '
PROMPT

SELECT rtrim(E.Emp_Lname) || ', ' || rtrim(E.Emp_Fname) || ' ' || rtrim(E.Emp_MI) || CHR(10) ||
		'Employee ID: ' || rtrim(E.Emp_ID) || CHR(10) || CHR(10) ||
		'Personal Information' || CHR(10) ||
		'  DOB: ' || ltrim(to_char(E.Emp_DOB, 'mm/dd/yyyy')) || CHR(10) ||
		'  Phone #: (' || SUBSTR(E.Emp_Phone,1,3) ||')'|| SUBSTR(E.Emp_Phone,4,3) || '-' || SUBSTR(E.Emp_Phone,7,4) || CHR(10) ||
		'  Address: ' || rtrim(E.Emp_StreetAdd) || CHR(10) ||
		'           ' || rtrim(E.Emp_City) || ', ' || rtrim(E.Emp_State) || ' ' || rtrim(E.Emp_Zip) || CHR(10) || CHR(10) ||
		'Employee Information' || CHR(10) ||
		'  Position: ' || rtrim(E.POS_Title) || CHR(10)||
		'  Salary: ' || ltrim(to_char(POS_Rate, '$9,999,999')) || CHR(10)||
		'  Paid Days Off (PDO): ' || rtrim(POS_VacDays) || CHR(10)|| CHR(10)||
		'Office Information' || CHR(10)||
		'  Office #' || rtrim(E.Office#) || CHR(10) ||
		'  Manager: ' || rtrim(M.Emp_Lname) || ', ' || rtrim(M.Emp_Fname) || ' ' || rtrim(M.Emp_MI) || CHR(10) ||
		'  Address: ' || rtrim(Office_StreetAdd) || CHR(10) ||
		'           ' || rtrim(Office_City) || ', ' || rtrim(Office_State) || ' ' || rtrim(Office_Zip) || CHR(10) || CHR(10) ||
		CHR(10)
	FROM EMPLOYEE E, POSITION, OFFICE, EMPLOYEE M
	WHERE E.Office# = OFFICE.Office# AND E.POS_Title = POSITION.POS_Title AND M.Emp_ID = OFFICE.Manager_ID AND E.Emp_ID='&vID';


PROMPT -----------------------------------------------------------

PROMPT -----------------------------------------------------------


SPOOL OFF