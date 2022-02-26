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

DESC EMAILPHONE

BEGIN
DELETE FROM EMAILPHONE;
DELETE FROM GRADUATE;
DELETE FROM MINISTRY;
DELETE FROM UNIVERSITY;
END;

SELECT * FROM GRADUATE;
SELECT * FROM EMAILPHONE;
SELECT * FROM MINISTRY
SELECT * FROM UNIVERSITY
SELECT * FROM SESSION_PRIVS
