/*

 Python function that is used to extract CPU load from machine via SQL

*/
--DROP FUNCTION get_load_average();

BEGIN;

CREATE OR REPLACE FUNCTION get_load_average(OUT load_1min float, OUT load_5min float, OUT load_15min float) AS
$$
from os import getloadavg
la = getloadavg()
return [la[0], la[1], la[2]]
$$ LANGUAGE plpythonu VOLATILE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION get_load_average() TO pgwatch2;

COMMENT ON FUNCTION get_load_average() is 'created for pgwatch2';

COMMIT;
