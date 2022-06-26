create table admin(
 id_admin NUMBER primary key,
 admin_first_name VARCHAR2(10) NOT NULL,
 admin_last_name VARCHAR2(10) NOT NULL,
 admin_father_name VARCHAR2(10),
 admin_email VARCHAR2(50),
 admin_password VARCHAR2(50) )
---------------------------------------------------------------
create table university(
 id_university NUMBER primary key,
 id_admin NUMBER references 
 admin(id_admin),
 university_name VARCHAR2(20),
 university_email VARCHAR2(50),
 university_password VARCHAR2(50),
 university_country VARCHAR2(20) )
  ALTER TABLE university DROP COLUMN university_email;
 ALTER TABLE university DROP COLUMN university_password;
 ---------------------------------------------------------------
 create table ministry(
 id_ministry NUMBER primary key,
 id_admin NUMBER references 
 admin(id_admin),
 ministry_name varchar2(20),
 ministry_email varchar2(50),
 ministry_password varchar2(50) )
 ALTER TABLE MINISTRY DROP COLUMN ministry_email;
 ALTER TABLE MINISTRY DROP COLUMN ministry_password;
 ALTER TABLE MINISTRY MODIFY ministry_name varchar2(30)
 ALTER TABLE MINISTRY ADD CONSTRAINT mini_name_UQ UNIQUE(MINISTRY_NAME);
  ---------------------------------------------------------------
  create table graduate (
 id_graduate NUMBER primary key,
 graduate_id_number VARCHAR2 (10) ,
 graduate_first_name varchar2(20) NOT NULL,
 graduate_last_name varchar2(20) NOT NULL,
 graduate_father_name VARCHAR2(20),
 graduate_mother_name varchar2(20),
 graduate_date VARCHAR2 (50),
 graduate_avg float,
 graduate_profession varchar2(20),
 graduate_university_country VARCHAR2(50) NULL,
 graduate_resident_country VARCHAR2(50),
 graduate_shahid VARCHAR2(10),
 graduate_email VARCHAR2(50),
 graduate_password VARCHAR2(50),
 graduate_check VARCHAR2(20) )
 ALTER TABLE GRADUATE DROP COLUMN graduate_email
 ALTER TABLE GRADUATE DROP COLUMN GRADUATE_PASSWORD
 ------------------------------------------------------------------
 create table message(
 id_message NUMBER primary key,
 id_univesity NUMBER 
 references university(id_university) 
 on delete cascade,
 id_graduate NUMBER references 
 graduate(id_graduate)
 on delete cascade,
 message varchar2(200),
 message_date date,
 message_read NUMBER null )
------------------------------------------------------------------
 create table vacancy(
 id_vacancy NUMBER primary key,
 vacancy_name VARCHAR2(30),
 vacancy_count NUMBER,
 vacancy_check_count NUMBER,
 vacancy_avg float,
 vacancy_type VARCHAR2(10), 
 id_ministry NUMBER
 references ministry(id_ministry)on 
 delete cascade )
------------------------------------------------------------------
 create table emp_condition(
 id_emp_condition NUMBER primary key,
 id_vacancy NUMBER references vacancy(id_vacancy)on delete cascade,
 emp_condition_name VARCHAR2(20),
 emp_condition_type VARCHAR2(20),
 result_condition NUMBER )
------------------------------------------------------------------
 create table desire( 
 id_desire NUMBER primary key,
 id_graduate NUMBER references 
 graduate(id_graduate) on delete 
 cascade,id_vacancy NUMBER REFERENCES vacancy(id_vacancy)
 ON DELETE CASCADE,
 des_order NUMBER)
------------------------------------------------------------------
 create table tb_grad_vac(
 id_graduate NUMBER references 
 graduate(id_graduate),
 id_vacancy NUMBER references 
 vacancy(id_vacancy),
 primary key(id_vacancy,id_graduate) )
 ALTER TABLE tb_phone RENAME TO phone
------------------------------------------------------------------
 create table result(
 id_result NUMBER primary key,
 id_ministry NUMBER references 
 ministry(id_ministry)
 on delete cascade,
 id_graduate NUMBER references 
 graduate(id_graduate)
 on delete cascade )
 ------------------------------------------------------------------
 create table phone( 
 id_phone NUMBER primary key,
 phone VARCHAR2(10) NOT NULL,
 id_admin NUMBER references 
 admin(id_admin),
 id_unversity NUMBER 
 references 
 university(id_university)
 on delete cascade,
 id_ministry NUMBER 
 references ministry(id_ministry)
 on delete cascade,
 id_graduate NUMBER 
 references graduate(id_graduate)
 on delete cascade
);
ALTER TABLE PHONE RENAME COLUMN ID_UNVERSITY TO ID_UNIVERSITY;
DROP TABLE phone
------------------------------------------------------------------
CREATE TABLE COUNTRY(
    CNAME VARCHAR2(20) NOT NULL, UNIQUE(CNAME)
);
ALTER TABLE COUNTRY ADD CVALUE VARCHAR2(20)
drop table COUNTRY
------------------------------------------------------------------
CREATE TABLE ALLEMAILS(
    EMAILNO NUMBER CONSTRAINT PK_EMAILNO PRIMARY KEY,
    EMAIL VARCHAR2(100) NOT NULL,
    PASSWORD VARCHAR2(100) NOT NULL,
    ID_G NUMBER CONSTRAINT FK_ID_G REFERENCES GRADUATE(id_graduate),
    ID_M NUMBER  CONSTRAINT FK_ID_M REFERENCES MINISTRY(id_MINISTRY),
    ID_U NUMBER CONSTRAINT FK_ID_U REFERENCES UNIVERSITY(id_UNIVERSITY)
)
ALTER TABLE ALLEMAILS RENAME TO  EMAILPHONE 
ALTER TABLE EMAILPHONE RENAME COLUMN EMAILNO TO EMPHNO 
ALTER TABLE EMAILPHONE DROP COLUMN PHONE
ALTER TABLE EMAILPHONE ADD PHONE VARCHAR2(10) NOT NULL UNIQUE , UNIQUE(PHONE)
ALTER TABLE EMAILPHONE ADD CONSTRAINT PH_ONE CHECK(SUBSTR(PHONE, 1, 3) = '011' OR SUBSTR(PHONE, 1, 2) = '09')
ALTER TABLE ALLEMAILS ADD CONSTRAINT UQ_EMAIL UNIQUE (EMAIL)
ALTER TABLE EMAILPHONE drop CONSTRAINT GM_EMAIL
ALTER TABLE EMAILPHONE ADD CONSTRAINT GM_EMAIL CHECK(SUBSTR(EMAIL, -10) = '@gmail.com' AND LENGTH(EMAIL) > 10)
ALTER TABLE EMAILPHONE ADD CONSTRAINT LGN_EMAIL CHECK(LENGTH(EMAIL) > 10)
ALTER TABLE EMAILPHONE ADD PASSWORD VARCHAR2(100) NOT NULL CONSTRAINT LGN_PSWRD CHECK(LENGTH(PASSWORD) >= 15)
ALTER TABLE EMAILPHONE MODIFY PASSWORD CHAR(7)
ALTER TABLE EMAILPHONE DROP COLUMN PASSWORD
------------------------------------------------------------------
CREATE TABLE DELETENUM(
    DNUM_G NUMBER, CONSTRAINTS UQ_DEL_G UNIQUE(DNUM_G),
    DNUM_M NUMBER, CONSTRAINTS UQ_DEL_M UNIQUE(DNUM_M),
    DNUM_U NUMBER, CONSTRAINTS UQ_DEL_U UNIQUE(DNUM_U),
    DNUM_E NUMBER, CONSTRAINTS UQ_DEL_E UNIQUE(DNUM_E)
)
INSERT INTO DELETENUM(DNUM_G) VALUES(1)
INSERT INTO DELETENUM(DNUM_M) VALUES(4)
INSERT INTO DELETENUM(DNUM_U) VALUES(SEQUNVI.NEXTVAL)
DESC DELETENUM
DROP TABLE DELETENUM
INSERT INTO DELETENUM(DNUM_G) VALUES(1)
DELETE FROM DELETENUM WHERE DNUM_G = 1
SELECT COUNT(*) FROM DELETENUM
ALTER TABLE DELETENUM ADD DNUM_E NUMBER
ALTER TABLE DELETENUM ADD CONSTRAINTS PK_DEL_G DNUM_G NUMBER PRIMARY KEY
SELECT * FROM DELETENUM
DELETE FROM DELETENUM
DROP TABLE DELETENUM
------------------------------------------------------------------
BEGIN
UPDATE COUNTRY SET CVALUE = 'Idlib' WHERE CNAME ='إدلب';
UPDATE COUNTRY SET CVALUE = 'Al-Hasakah' WHERE CNAME ='الحسكة';
UPDATE COUNTRY SET CVALUE = 'Aleppo' WHERE CNAME ='حلب';
UPDATE COUNTRY SET CVALUE = 'Hama' WHERE CNAME ='حماة';
UPDATE COUNTRY SET CVALUE = 'Homs' WHERE CNAME ='حمص';
UPDATE COUNTRY SET CVALUE = 'Der Alzoor' WHERE CNAME ='دير الزور';
UPDATE COUNTRY SET CVALUE = 'Damascus' WHERE CNAME ='دمشق';
UPDATE COUNTRY SET CVALUE = 'Daraa' WHERE CNAME ='درعا';
UPDATE COUNTRY SET CVALUE = 'Tenderness' WHERE CNAME ='الرقة';
UPDATE COUNTRY SET CVALUE = 'Damascus Countryside' WHERE CNAME ='ريف دمشق';
UPDATE COUNTRY SET CVALUE = 'Suwayda' WHERE CNAME ='السويداء';
UPDATE COUNTRY SET CVALUE = 'Tartous' WHERE CNAME ='طرطوس';
UPDATE COUNTRY SET CVALUE = 'Quneitra' WHERE CNAME ='القنيطرة';
UPDATE COUNTRY SET CVALUE = 'Latakia' WHERE CNAME ='اللاذقية';
END;
SELECT * FROM COUNTRY
INSERT INTO UNIVERSITY VALUES(1, 1, 'virtual university', 'virsual@gmail.com', '123', 'Damascus');
SELECT UNIVERSITY_NAME FROM UNIVERSITY WHERE UNIVERSITY_COUNTRY = 'دمشق';
update UNIVERSITY set UNIVERSITY_COUNTRY = 'دمشق';

SELECT * FROM EMAILPHONE WHERE SUBSTR(PHONE, 1, 3) = '011';

BEGIN
DELETE FROM EMAILPHONE;
DELETE FROM GRADUATE;
DELETE FROM MINISTRY;
DELETE FROM UNIVERSITY;
END;
EXECUTE
SELECT * FROM GRADUATE;
SELECT * FROM EMAILPHONE;
SELECT * FROM MINISTRY
SELECT * FROM UNIVERSITY
SELECT * FROM SESSION_PRIVS
SELECT MINISTRY_NAME, PHONE FROM MINISTRY M, EMAILPHONE P WHERE M.ID_MINISTRY = P.ID_M
SELECT UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE FROM UNIVERSITY U, EMAILPHONE P WHERE U.ID_UNIVERSITY = P.ID_U 
SELECT * FROM COUNTRY
DESC EMAILPHONE
DESC MINISTRY
DESC UNIVERSITY
DESC GRADUATE
CREATE VIEW VIEW_UNIVERSITY AS
SELECT ID_UNIVERSITY, UNIVERSITY_NAME, EMAIL, PHONE, UNIVERSITY_COUNTRY 
FROM UNIVERSITY U, EMAILPHONE E WHERE U.ID_UNIVERSITY = E.ID_U

CREATE VIEW VIEW_MINISTRY AS
SELECT ID_MINISTRY, MINISTRY_NAME, EMAIL, PHONE
FROM MINISTRY M, EMAILPHONE E WHERE M.ID_MINISTRY = E.ID_M


CREATE OR REPLACE PROCEDURE INS_GRAD(NUM VARCHAR2, FNAME VARCHAR2,
LNAME VARCHAR2, FATHER VARCHAR2, MOTHER VARCHAR2, G_DATE VARCHAR2,
G_AVG FLOAT, PROFESSION VARCHAR2, UNI_COUNTRY VARCHAR2, 
G_COUNTRY VARCHAR2, SHAHID VARCHAR2, G_CHECK VARCHAR2,
G_EMAIL VARCHAR2, G_PHONE VARCHAR2, PASS VARCHAR2) IS 
ID NUMBER;
E_ID NUMBER;
DEL_ID NUMBER;
DEL_E_ID NUMBER;
CURSOR CG IS SELECT ID_GRADUATE FROM GRADUATE;
CURSOR CEM IS SELECT EMPHNO FROM EMAILPHONE;
BEGIN
SELECT COUNT(*) INTO ID FROM GRADUATE;
SELECT COUNT(*) INTO E_ID FROM EMAILPHONE;
SELECT MIN(DNUM_G) INTO DEL_ID FROM DELETENUM;
SELECT MIN(DNUM_E) INTO DEL_E_ID FROM DELETENUM;
ID := ID + 1;
E_ID := E_ID + 1;
    FOR FG IN CG
    LOOP
        IF FG.ID_GRADUATE = ID THEN
        ID := DEL_ID;
        END IF;
    END LOOP;
    FOR EG IN CEM
    LOOP
        IF EG.EMPHNO = E_ID THEN
        E_ID := DEL_E_ID;
        END IF;
    END LOOP;
INSERT INTO GRADUATE VALUES(ID, NUM, FNAME, LNAME, FATHER,
MOTHER, G_DATE, G_AVG, PROFESSION, UNI_COUNTRY, G_COUNTRY,
SHAHID, G_CHECK);
INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_G, PHONE, PASSWORD)
VALUES(E_ID, G_EMAIL, ID, G_PHONE, PASS);
DELETE FROM DELETENUM WHERE DNUM_G = ID;
DELETE FROM DELETENUM WHERE DNUM_E = E_ID;
END;



BEGIN
INS_MINI('ertyd', 'rety@gmail.com', '0116543213', 'asdf524asdf32452345');
END;

DESC MINISTRY
DESC EMAILPHONE
DELETE FROM DELETENUM WHERE DNUM_M = 4
SELECT * FROM DELETENUM
SET SERVEROUTPUT ON
DECLARE
ID NUMBER;

SELECT MIN(EMPHNO) INTO ID FROM EMAILPHONE;
BEGIN
DBMS_OUTPUT.PUT_LINE(ID);
END;
BEGIN
INSERT ALL
INTO DELETENUM(DNUM_G) VALUES(5)
INTO DELETENUM(DNUM_M) VALUES(4)
SELECT * FROM DUAL;
END;
BEGIN
INS_GRAD(7894234517, ' + txtName.Text + ', ' + txtlName.Text + ',
    ' + txtfName.Text + ', ' + txtmName.Text + ', '1/1/2020', 
     45 , 'Splzn.SelectedValue', ' + cty.SelectedValue + ', ' +
    from_cty.SelectedValue + ', 'RadioShah', '0',
    'cRbn@gmail.com','0974473789', ' + ViewState[PassWord] + ');
END;
BEGIN
DELETE FROM EMAILPHONE WHERE EMPHNO = 1;
DELETE FROM GRADUATE WHERE ID_GRADUATE = 1;
INSERT INTO DELETENUM(DNUM_G, DNUM_E) VALUES(1, 1);
END;
SELECT * FROM GRADUATE
SELECT * FROM EMAILPHONE
SELECT * FROM DELETENUM
DESC DELETENUM
DESC EMAILPHONE
DESC GRADUATE

CREATE TABLE CEMP(
    EMPNO NUMBER(6) REFERENCES HR.EMP(EMPNO),
    ENAME VARCHAR2(100)
)
DROP TABLE CEMP
SELECT * FROM CEMP
DESC CEMP
SELECT * FROM USER_TAB_PRIVS_MADE
SELECT * FROM USER_COL_PRIVS_RECD
CREATE OR REPLACE VIEW VIEW_MINISTRY AS SELECT ID_MINISTRY, MINISTRY_NAME, PHONE FROM MINISTRY M, EMAILPHONE E
WHERE M.ID_MINISTRY = E.ID_M;
SELECT * FROM VIEW_MINISTRY;
CREATE OR REPLACE VIEW VIEW_UNIVERSITY AS SELECT ID_UNIVERSITY, UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE FROM UNIVERSITY U,
EMAILPHONE E WHERE U.ID_UNIVERSITY = E.ID_U;
SELECT UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE FROM VIEW_UNIVERSITY
DESC ADMIN
SELECT * FROM SESSION_PRIVS
DESC MINISTRY
SELECT MINISTRY_NAME,  EMAIL, PHONE FROM MINISTRY M, EMAILPHONE E
WHERE M.ID_MINISTRY = E.ID_M;
DROP PACKAGE PAK_MINI_UNIV
SELECT * FROM SESSION_PRIVS
DESC EMAILPHONE

/*------------------------TRIGGER ------------------------*/
CREATE TRIGGER MINI_ADD_PK BEFORE INSERT ON MINISTRY FOR EACH ROW WHEN (NEW.ID_MINISTRY IS NULL)
DECLARE
CNT NUMBER;
CURSOR C1 IS SELECT ID_MINISTRY FROM MINISTRY;
BEGIN
/*SAIZ DATA TYPE NUMBER(4) => 1..9999 */
FOR I IN 1..9999 LOOP CNT := I;
        FOR J IN C1 LOOP IF I = J.ID_MINISTRY THEN CNT := NULL; EXIT; END IF; END LOOP;
        IF CNT IS NOT NULL THEN :NEW.ID_MINISTRY := CNT; EXIT; END IF;
END LOOP;
END;
CREATE TRIGGER UNIV_ADD_PK BEFORE INSERT ON UNIVERSITY FOR EACH ROW WHEN (NEW.ID_UNIVERSITY IS NULL)
DECLARE
CNT NUMBER;
CURSOR C1 IS SELECT ID_UNIVERSITY FROM UNIVERSITY;
BEGIN
/*SAIZ DATA TYPE NUMBER(4) => 1..9999 */
FOR I IN 1..9999 LOOP CNT := I;
        FOR J IN C1 LOOP IF I = J.ID_UNIVERSITY THEN CNT := NULL; EXIT; END IF; END LOOP;
        IF CNT IS NOT NULL THEN :NEW.ID_UNIVERSITY := CNT; EXIT; END IF;
END LOOP;
END;
CREATE TRIGGER EML_ADD_PK BEFORE INSERT ON EMAILPHONE FOR EACH ROW WHEN (NEW.EMPHNO IS NULL)
DECLARE
CNT NUMBER;
CURSOR C1 IS SELECT EMPHNO FROM EMAILPHONE;
BEGIN
/*SAIZ DATA TYPE NUMBER(4) => 1..9999 */
FOR I IN 1..9999 LOOP CNT := I;
        FOR J IN C1 LOOP IF I = J.EMPHNO THEN CNT := NULL; EXIT; END IF; END LOOP;
        IF CNT IS NOT NULL THEN :NEW.EMPHNO := CNT; EXIT; END IF;
END LOOP;
END;
CREATE TRIGGER COND_ADD_PK BEFORE INSERT ON EMP_CONDITION FOR EACH ROW WHEN (NEW.ID_EMP_CONDITION IS NULL)
DECLARE
CNT NUMBER;
CURSOR C1 IS SELECT ID_EMP_CONDITION FROM EMP_CONDITION;
BEGIN
/*SAIZ DATA TYPE NUMBER(4) => 1..9999 */
FOR I IN 1..9999 LOOP CNT := I;
        FOR J IN C1 LOOP IF I = J.ID_EMP_CONDITION THEN CNT := NULL; EXIT; END IF; END LOOP;
        IF CNT IS NOT NULL THEN :NEW.ID_EMP_CONDITION := CNT; EXIT; END IF;
END LOOP;
END;
CREATE TRIGGER VAC_ADD_PK BEFORE INSERT ON VACANCY FOR EACH ROW WHEN (NEW.ID_VACANCY IS NULL)
DECLARE
CNT NUMBER;
CURSOR C1 IS SELECT ID_VACANCY FROM VACANCY;
BEGIN
/*SAIZ DATA TYPE NUMBER(4) => 1..9999 */
FOR I IN 1..9999 LOOP CNT := I;
        FOR J IN C1 LOOP IF I = J.ID_VACANCY THEN CNT := NULL; EXIT; END IF; END LOOP;
        IF CNT IS NOT NULL THEN :NEW.ID_VACANCY := CNT; EXIT; END IF;
END LOOP;
END;
CREATE TRIGGER TR BEFORE INSERT ON DESIRE FOR EACH ROW WHEN (NEW.ID_DESIRE IS NULL)
DECLARE
CNT NUMBER;
CURSOR C1 IS SELECT ID_DESIRE FROM DESIRE;
BEGIN
FOR I IN 1..9999 LOOP 
        CNT := I;
        FOR J IN C1 LOOP 
        IF I = J.ID_DESIRE THEN 
        CNT := NULL; 
        EXIT; 
        END IF; 
        END LOOP;
        IF CNT IS NOT NULL THEN 
        :NEW.ID_DESIRE := CNT; 
        EXIT; 
        END IF;
END LOOP;
END;

/*--------********------PACKAGE FOR MINISTRY AND UNIVERSITY--------**********------*/
/*------------------------PACKAGE SPECIFICATION------------------------*/
CREATE OR REPLACE PACKAGE PAK_MINI_UNVI IS
FUNCTION FUNCHECK(CH VARCHAR2, NCH NUMBER, NA VARCHAR2) RETURN NUMBER;
PROCEDURE INS_MINI_UNV(MUNAME VARCHAR2, CNTRY VARCHAR2, MU_PHONE VARCHAR2, G_EMAIL VARCHAR2, PASS VARCHAR2);
PROCEDURE UPD_MINI_UNV(MUNAME VARCHAR2, MU_PHONE VARCHAR2, CNTRY VARCHAR2, PK NUMBER);
PROCEDURE DEL_MINI_UNV(NUID NUMBER, NO NUMBER);
END;
/*------------------------PACKAGE BODY------------------------*/
CREATE OR REPLACE PACKAGE BODY PAK_MINI_UNVI IS
            /*--------PROCEDURE INS_MINI_UNV----------*/
    PROCEDURE INS_MINI_UNV(MUNAME VARCHAR2, CNTRY VARCHAR2,
    MU_PHONE VARCHAR2, G_EMAIL VARCHAR2, PASS VARCHAR2) IS 
    ID NUMBER;
    BEGIN
    IF CNTRY IS NULL THEN
        INSERT INTO MINISTRY VALUES(NULL, 1, MUNAME);
        SELECT ID_MINISTRY INTO ID FROM MINISTRY WHERE MINISTRY_NAME = MUNAME;
        INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_M, PHONE, PASSWORD)
        VALUES(NULL, G_EMAIL, ID, MU_PHONE, PASS);
    ELSE
        INSERT INTO UNIVERSITY VALUES(NULL, 1, MUNAME, CNTRY);
        SELECT ID_UNIVERSITY INTO ID FROM UNIVERSITY WHERE UNIVERSITY_NAME = MUNAME AND UNIVERSITY_COUNTRY = CNTRY;
        INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_U, PHONE, PASSWORD)
        VALUES(NULL, G_EMAIL, ID, MU_PHONE, PASS);
    END IF;
    END;
                /*--------FUNCTION FUNCHECK----------*/
    FUNCTION FUNCHECK(CH VARCHAR2, NCH NUMBER, NA VARCHAR2) RETURN NUMBER IS
    CURSOR CURUNIV IS SELECT UNIVERSITY_NAME || '(' || CNAME || ')' AS FLUNIVCNTY FROM UNIVERSITY, COUNTRY WHERE UNIVERSITY_COUNTRY = CVALUE;
    CURSOR CURMINI IS SELECT MINISTRY_NAME FROM MINISTRY;
    CURSOR CUREMLPH IS SELECT EMAIL, PHONE FROM EMAILPHONE;
    CURSOR CURPKGRAD IS SELECT GRADUATE_ID_NUMBER FROM GRADUATE;
    BEGIN
    IF NA = 'NAME' THEN
        IF NCH = 0 THEN
            FOR I IN CURMINI LOOP IF CH = I.MINISTRY_NAME THEN RETURN 1; END IF; END LOOP;
        ELSIF NCH = 1 THEN
            FOR I IN CURUNIV LOOP IF CH = I.FLUNIVCNTY THEN RETURN 1; END IF; END LOOP;
        END IF;
    END IF;
    IF NA = 'EMAIL' THEN
        FOR I IN CUREMLPH LOOP IF CH = I.EMAIL THEN RETURN 1; END IF; END LOOP;
    ELSIF NA = 'PHONE' THEN
        FOR I IN CUREMLPH LOOP IF CH = I.PHONE THEN RETURN 1; END IF; END LOOP;
    ELSIF NA = 'PK_GRADUATE' THEN
        FOR I IN CURPKGRAD LOOP IF CH = I.GRADUATE_ID_NUMBER THEN RETURN 1; END IF; END LOOP;
    END IF;
    RETURN 0;
    END;
                /*--------PROCEDURE UPD_MINI_UNV----------*/
    PROCEDURE UPD_MINI_UNV(MUNAME VARCHAR2, MU_PHONE VARCHAR2, CNTRY VARCHAR2, PK NUMBER) IS
    BEGIN
    IF CNTRY IS NULL THEN
    UPDATE MINISTRY SET MINISTRY_NAME = MUNAME WHERE ID_MINISTRY = PK;
    UPDATE EMAILPHONE SET PHONE = MU_PHONE WHERE ID_M = PK;
    ELSE
    UPDATE UNIVERSITY SET UNIVERSITY_NAME = MUNAME, UNIVERSITY_COUNTRY = CNTRY WHERE ID_UNIVERSITY = PK;
    UPDATE EMAILPHONE SET PHONE = MU_PHONE WHERE ID_U = PK;
    END IF;
    END;
                /*--------PROCEDURE DEL_MINI_UNV----------*/
    PROCEDURE DEL_MINI_UNV(NUID NUMBER, NO NUMBER) IS
    EM NUMBER;
    BEGIN
    IF NO = 0 THEN
    DELETE FROM EMAILPHONE WHERE ID_M = NUID;
    DELETE FROM MINISTRY WHERE ID_MINISTRY = NUID;
    ELSIF NO = 1 THEN
    DELETE FROM EMAILPHONE WHERE ID_U = NUID;
    DELETE FROM UNIVERSITY WHERE ID_UNIVERSITY = NUID;
    END IF;
    END;
END;
/*-------------END PACKAGE--------------*/

/*--------********------PACKAGE FOR GRADUATE--------**********------*/
/*------------------------PACKAGE SPECIFICATION------------------------*/
CREATE OR REPLACE PACKAGE PAK_GRAD IS
PROCEDURE INS_GRAD(NUM VARCHAR2, FNAME VARCHAR2,
LNAME VARCHAR2, FATHER VARCHAR2, MOTHER VARCHAR2, G_DATE VARCHAR2,
G_AVG FLOAT, PROFESSION VARCHAR2, UNI_COUNTRY VARCHAR2, 
G_COUNTRY VARCHAR2, SHAHID VARCHAR2, G_CHECK VARCHAR2,
G_EMAIL VARCHAR2, G_PHONE VARCHAR2, PASS VARCHAR2);
END;
/*------------------------PACKAGE BODY------------------------*/
CREATE OR REPLACE PACKAGE BODY PAK_GRAD IS
PROCEDURE INS_GRAD(NUM VARCHAR2, FNAME VARCHAR2,
LNAME VARCHAR2, FATHER VARCHAR2, MOTHER VARCHAR2, G_DATE VARCHAR2,
G_AVG FLOAT, PROFESSION VARCHAR2, UNI_COUNTRY VARCHAR2, 
G_COUNTRY VARCHAR2, SHAHID VARCHAR2, G_CHECK VARCHAR2,
G_EMAIL VARCHAR2, G_PHONE VARCHAR2, PASS VARCHAR2) IS
ID NUMBER;
BEGIN
    INSERT INTO GRADUATE VALUES(NULL, NUM, FNAME, LNAME, FATHER, MOTHER, G_DATE,
    G_AVG, PROFESSION, UNI_COUNTRY, G_COUNTRY, SHAHID, G_CHECK);
    SELECT ID_GRADUATE INTO ID FROM GRADUATE WHERE GRADUATE_ID_NUMBER = NUM;
    INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_G, PHONE, PASSWORD)
    VALUES(NULL, G_EMAIL, ID, G_PHONE, PASS);
END;
END;
/*-------------END PACKAGE--------------*/



/*--------********------PACKAGE FOR VACANCY AND EMP_CONDITION--------**********------*/

/*------------------------PACKAGE SPECIFICATION------------------------*/
CREATE OR REPLACE PACKAGE PAK_VAC_COND IS
FUNCTION FUN_CHVAC_REP(VNAME VARCHAR2, VTYPE VARCHAR2, VACMINI NUMBER) RETURN NUMBER;
PROCEDURE INS_VAC(VNAME VARCHAR2, CNTVAC NUMBER, VAVG FLOAT, VTYPE VARCHAR2, VACMINI NUMBER);
END;

/*------------------------PACKAGE BODY------------------------*/
CREATE OR REPLACE PACKAGE BODY PAK_VAC_COND IS
    FUNCTION FUN_CHVAC_REP(VNAME VARCHAR2, VTYPE VARCHAR2, VACMINI NUMBER) RETURN NUMBER IS
    CURSOR C1 IS SELECT VACANCY_NAME, VACANCY_TYPE FROM VACANCY WHERE ID_MINISTRY = VACMINI;
    BEGIN
    FOR I IN C1 LOOP
    IF I.VACANCY_NAME = VNAME AND I.VACANCY_TYPE = VTYPE THEN
    RETURN 1;
    END IF;
    END LOOP;
    RETURN 0;
    END;
    PROCEDURE INS_VAC(VNAME VARCHAR2, CNTVAC NUMBER, VAVG FLOAT, VTYPE VARCHAR2, VACMINI NUMBER) IS
    BEGIN
    INSERT INTO VACANCY VALUES(NULL, VNAME, CNTVAC, 0, VAVG, VTYPE, VACMINI);
    END;
END;
SELECT PAK_VAC_COND.FUN_CHVAC_REP('SDF', 'SDF', 1) FROM DUAL
/*-------------END PACKAGE--------------*/
UPDATE VACANCY SET VACANCY_TYPE = 'Literary' WHERE VACANCY_TYPE = 'literary'
BEGIN PAK_MINI_UNVI.DEL_MINI_UNV(1, 1); END;

SELECT * FROM VIEW_MINISTRY
SELECT * FROM MINISTRY
SELECT * FROM EMAILPHONE

DELETE FROM MINISTRY WHERE ID_MINISTRY IN (2, 3)
SELECT * FROM UNIV_WITH_COUNTRY
SELECT * FROM UNIVERSITY
SELECT * FROM DELETENUM
DELETE FROM UNIVERSITY WHERE ID_UNIVERSITY = 4
SELECT SEQUNVI.NEXTVAL FROM DUAL
SELECT SEQUNVI.CURRVAL FROM DUAL
EXECUTE
SELECT * FROM EMAILPHONE
DROP PROCEDURE INS_MINI_UNIV;
SHOW ERROR;
SELECT PAK_MINI_UNIV.FUNCHECK('ertyd', 0, 'NAME') AS RESCH FROM DUAL;
BEGIN
IF PAK_MINI_UNIV.FUNCHECK('ertyd', 0, 'NAME') = TRUE THEN
DBMS_OUTPUT.PUT_LINE('ASF');
END IF;
END;
SHOW ERROR
BEGIN
PAK_MINI_UNVI.INS_MINI_UNV('هندسة معلوماتية', '" + from + "', '" + txtPhe.Text + "', '" + txtEmail.Text + "', '" + ViewState["EcodingPassword"] + "');
END;
EXECUTE PAK_MINI_UNVI.INS_MINI_UNV('" + txtName.Text + "', 'Homs', '0913222312', 'ASeF@gmail.com', '" + txtPswd.Text + "');
SELECT * FROM EMAILPHONE
SELECT * FROM MINISTRY
SELECT * FROM UNIVERSITY
SELECT * FROM DELETENUM
DELETE FROM DELETENUM
DELETE FROM EMAILPHONE where ID_U = 2
DELETE FROM MINISTRY
DELETE FROM UNIVERSITY
INSERT INTO DELETENUM(DNUM_M) VALUES(1);
SELECT * FROM MINISTRY
SELECT * FROM UNIVERSITY
UPDATE UNIVERSITY SET UNIVERSITY_COUNTRY = 'Homs'
CREATE SEQUENCE SEQEML;
CREATE SEQUENCE SEQUNVI;
CREATE SEQUENCE SEQMINI;
DROP SEQUENCE SEQMINI;
DROP SEQUENCE SEQEML;
DROP SEQUENCE SEQUNVI;
BEGIN
DELETE FROM EMAILPHONE;
DELETE FROM GRADUATE;
DELETE FROM MINISTRY;
DELETE FROM UNIVERSITY;
DELETE FROM DELETENUM;
END;
SHOW ERROR;
CREATE OR REPLACE VIEW UNIV_WITH_COUNTRY AS
SELECT ID_UNIVERSITY, UNIVERSITY_NAME || '(' || CNAME || ')' AS FLUNIVCNTY FROM UNIVERSITY, COUNTRY WHERE UNIVERSITY_COUNTRY = CVALUE;
SELECT CURRVAL FROM SEQUNVI
CREATE OR REPLACE VIEW VAC_COND_VIEW AS
SELECT ID_MINISTRY, VACANCY_NAME, VACANCY_TYPE, VACANCY_COUNT, VACANCY_AVG, EMP_CONDITION_NAME, EMP_CONDITION_TYPE FROM
VACANCY V, EMP_CONDITION E WHERE V.ID_VACANCY = E.ID_VACANCY(+) AND ID_MINISTRY IN (SELECT ID_MINISTRY FROM MINISTRY);
SELECT * FROM VAC_COND_VIEW
DROP TABLE DELETENUM
SELECT PAK_MINI_UNVI.
SELECT * FROM EMAILPHONE
select PAK_MINI_UNVI.FUNCHSIGN(EM  => 'QWER@gmail.com' /*IN VARCHAR2*/,
                               PASS  => '=>?@ABCDE=>?@ABCDE' /*IN VARCHAR2*/) from dual
SELECT ID_MINISTRY, EMAIL, PASSWORD FROM MINISTRY M, EMAILPHONE E WHERE M.ID_MINISTRY = E.ID_M
UPDATE ADMIN SET ADMIN_PASSWORD = '=>?Mtyqp:PZ=>?'
SELECT DISTINCT UNIVERSITY_NAME FROM UNIVERSITY
SELECT ID_VACANCY, VACANCY_NAME FROM VACANCY WHERE ID_MINISTRY = 1
SELECT VACANCY_TYPE, VACANCY_AVG, VACANCY_COUNT FROM VACANCY WHERE ID_MINISTRY = '1'
SELECT V.ID_VACANCY, VACANCY_TYPE, VACANCY_AVG, VACANCY_COUNT FROM VACANCY V, EMP_CONDITION C WHERE V.ID_VACANCY = C.ID_VACANCY AND ID_MINISTRY = '1'
SELECT EMP_CONDITION_NAME, EMP_CONDITION_TYPE FROM VACANCY V, EMP_CONDITION C WHERE V.ID_VACANCY = 2 AND V.ID_VACANCY = C.ID_VACANCY
SELECT * FROM VACANCY V, EMP_CONDITION C WHERE V.ID_VACANCY = C.ID_VACANCY(+) AND ID_MINISTRY IN (SELECT ID_MINISTRY FROM MINISTRY)
SELECT VACANCY_NAME, VACANCY_TYPE FROM VACANCY WHERE ID_MINISTRY = 1
DELETE FROM VACANCY WHERE VACANCY_TYPE = 'Scientific'
DESC VACANCY
ALTER TABLE VACANCY MODIFY VACANCY_TYPE VARCHAR2(20)
DESC STUDENTS
SELECT * FROM STUDENTS