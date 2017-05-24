PROMPT -----------------------------------------------------------

PROMPT
PROMPT Cost of living pay increase

ACCEPT vFactor PROMPT 'Please enter the amount to increase as a percent (5 = 5% increase): ';

UPDATE POSITION
SET POS_Rate = (POS_Rate + (POS_Rate * &vFactor * 0.01));