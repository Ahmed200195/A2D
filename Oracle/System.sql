SELECT * FROM SESSION_PRIVS
GRANT SELECT ON Ahmed.XX_EMP TO HR
REVOKE SELECT ON Ahmed.XX_EMP FROM HR
REVOKE All on HR.EMP from Ahmed
REVOKE ALL ON DBMS_STATS FROM HR
SHOW USER

CREATE ROLE MANAGER;

GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW TO MANAGER
SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE = 'MANAGER'

GRANT MANAGER TO Ahmed

SELECT * FROM USER_RECYCLEBIN
SHOW con_name
select name from v$active_services;
select instance_name from v$instance;
CREATE PLUGGABLE DATABASE salespdb ADMIN USER hr IDENTIFIED BY hr;
create pluggable database PDBORCL admin user hr identified by hr
DROP USER Ahmed CASCADE
CREATE USER Ahmed IDENTIFIED BY ahmed
GRANT CREATE SESSION TO Ahmed
GRANT UNLIMITED TABLESPACE, CREATE TABLE TO HR WITH ADMIN OPTION
GRANT ALL PRIVILEGES TO HR
drop user hr CASCADE
show con_name
CREATE USER hme IDENTIFIED BY hme DEFAULT TABLESPACE USERS QUOTA 5M ON USERS
GRANT CREATE SESSION, CREATE TABLE, UNLIMITED TABLESPACE TO hme
GRANT CREATE PROCEDURE TO hme
CREATE ROLE SSS;
GRANT CREATE ROLE TO XYZ
CREATE ROLE XYZ;
CREATE ROLE XXX;
GRANT XXX TO XYZ;
GRANT XYZ TO HR;
DROP ROLE XYZ;
CREATE USER DN IDENTIFIED BY 123 QUOTA 5M ON USERS ACCOUNT LOCK PASSWORD EXPIRE
GRANT UNLIMITED TABLESPACE TO DN
REVOKE UNLIMITED TABLESPACE 
ALTER USER DN ACCOUNT UNLOCK IDENTIFIED BY 321
DROP USER DN CASCADE CONSTRAINTS
ALTER SESSION SET CONTAINER = XEPDB1
GRANT EXECUTE ON 
GRANT CREATE TRIGGER TO HME
CREATE DIRECTORY DIR AS 'E:\Documents\GitHub\A2D\Oracle';
GRANT READ, WRITE ON DIRECTORY DIR TO PUBLIC