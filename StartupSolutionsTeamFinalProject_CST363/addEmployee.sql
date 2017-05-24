PROMPT -----------------------------------------------------------

PROMPT
PROMPT Add new employee
PROMPT 
PROMPT Please Enter Employee Information
PROMPT Example Values are in Parentheses
PROMPT

ACCEPT vFname PROMPT 'First name (Herman): '
ACCEPT vLname PROMPT 'Last name (Munster): '
ACCEPT vMI PROMPT 'Middle initial (R): '
ACCEPT vTitle PROMPT 'Position title (Executive): '
ACCEPT vOffNum PROMPT 'Office number (1): '
ACCEPT vPhone PROMPT 'Phone number (1234567890): '
ACCEPT vStartD PROMPT 'Start date (01-31-2000): '
ACCEPT vStreetAdd PROMPT 'Street address (1313 Mockingbird Ln): '
ACCEPT vCity PROMPT 'City (Mockingbird Heights): '
ACCEPT vState PROMPT 'State (CA): '
ACCEPT vZip PROMPT 'Zip code (90210): '
ACCEPT vDOB PROMPT 'Date of birth (01-31-1980): '


INSERT INTO EMPLOYEE
VALUES ((SELECT MAX(Emp_ID)+1 FROM EMPLOYEE), '&vFname', '&vLname', '&vMI', '&vTitle', '&vOffNum', '&vPhone', 
       TO_DATE('&vStartD', 'MM-DD-YYYY'), '&vStreetAdd', '&vCity', '&vState', '&vZip', TO_DATE('&vDOB', 'MM-DD-YYYY'));
