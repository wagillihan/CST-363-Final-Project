PROMPT -----------------------------------------------------------

PROMPT
PROMPT Update Pay Rates
PROMPT The following positions can be updated:
PROMPT Accountant, Analyst, DBA, Executive, Marketing Agent, Programmer, Sales Associate
PROMPT
ACCEPT vPOS_Title PROMPT 'Please enter the position to update: ';
ACCEPT vNewRate PROMPT 'Please enter the new annual pay rate: ';

UPDATE POSITION
SET POS_Rate = &vNewRate
WHERE POS_Title = '&vPOS_Title';
