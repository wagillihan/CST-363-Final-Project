PROMPT -----------------------------------------------------------

PROMPT
PROMPT Change Office Location

ACCEPT vID PROMPT 'Please enter office number to update (1-10): ';
ACCEPT vStreetAdd PROMPT 'New Street address: ';
ACCEPT vCity PROMPT 'City: ';
ACCEPT vState PROMPT 'State: ';
ACCEPT vZip PROMPT 'Zip code: ';

UPDATE OFFICE
SET Office_StreetAdd = '&vStreetAdd', Office_City = '&vCity',  Office_State = '&vState', Office_Zip = '&vZip'
WHERE Office# = '&vID';
