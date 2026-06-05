PROMPT === VERSION COMPLETA ===
SET LINESIZE 200
COL BANNER_FULL FORMAT A120
COL VERSION FORMAT A20
COL STATUS FORMAT A15

SELECT BANNER_FULL
FROM   V$VERSION;

SELECT INSTANCE_NAME,
       VERSION,
       VERSION_FULL
FROM   V$INSTANCE;


select description
from dba_registry_sqlpatch
where description like '%Release Update%';


PROMPT -- FEATURES
set linesize 300
set pagesize 500
COLUMN comp_name FORMAT A40
COLUMN version FORMAT 999999999999
COLUMN status FORMAT A20
SELECT
    comp_name,
    version,
    status
FROM
    dba_registry
ORDER BY
    comp_name;
	
	
PROMPT -- PATCH HISTORY
PROMPT -- muestra historial general de upgrades/componentes/parches
SET LINESIZE 200
SET PAGESIZE 100

COL ACTION_TIME   FORMAT A35
COL ACTION        FORMAT A15
COL NAMESPACE     FORMAT A15
COL VERSION       FORMAT A25
COL ID            FORMAT 999999999
COL BUNDLE_SERIES FORMAT A20
COL COMMENTS      FORMAT A60

SELECT
    ACTION_TIME,
    ACTION,
    NAMESPACE,
    VERSION,
    ID,
    BUNDLE_SERIES,
    COMMENTS
FROM DBA_REGISTRY_HISTORY
ORDER BY ACTION_TIME DESC;

PROMPT
-- PROMPT Muestra exactamente los SQL patches/RU/RUR aplicados con datapatch
SET LINESIZE 220
SET PAGESIZE 100

COL ACTION_TIME FORMAT A35
COL STATUS      FORMAT A15
COL DESCRIPTION FORMAT A100

SELECT
    ACTION_TIME,
    STATUS,
    DESCRIPTION
FROM DBA_REGISTRY_SQLPATCH
WHERE DESCRIPTION LIKE '%Release Update%'
ORDER BY ACTION_TIME DESC;


PROMPT
SET LINESIZE 250
SET PAGESIZE 100

COL ACTION_TIME FORMAT A35
COL STATUS      FORMAT A12
COL DESCRIPTION FORMAT A100

SELECT
    PATCH_ID,
    PATCH_UID,
    ACTION,
    STATUS,
    ACTION_TIME,
    DESCRIPTION
FROM DBA_REGISTRY_SQLPATCH
ORDER BY ACTION_TIME DESC;


PROMPT -- INSTANCE
set linesize 300
col instance_name for a20
col host_name for a25
col version for a12
col startup_time for a18
col status for a10
col thread# for a10
col archiver for a10
col instance_role for a20

SELECT instance_name,host_name,version,startup_time,status,thread#,archiver,instance_role
FROM   v$instance;


PROMPT -- Database
set linesize 500;
set pagesize 30;
col dbid format 9999999999;
col name format a15;
col created format a20;
col open_mode format a15;
col database_role format a25;
col db_unique_name format a15;
col log_mode format a15;
col protection_mode format a20;
col current_scn format 99999999999999;
col flashback_on format a15;

SELECT dbid,name,db_unique_name,log_mode,created,open_mode,protection_mode,database_role,current_scn,flashback_on
FROM   v$database;



PROMPT 
PROMPT -- SUPPLEMENTAL
--FK=YES/NO (indiferente)
--ALL=NO

set linesize 500;
set pagesize 30;
col supplemental_log_data_min format a25;
col supplemental_log_data_pk format a25;
col supplemental_log_data_fk format a25;
col supplemental_log_data_ui format a25;
col supplemental_log_data_all format a25;
col force_logging format a20;
SELECT supplemental_log_data_min,supplemental_log_data_pk,supplemental_log_data_fk,supplemental_log_data_ui,supplemental_log_data_all, force_logging
FROM   v$database;