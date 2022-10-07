REM INSERTING into VN_JAVA2.DEPARTMENT
Insert into VN_JAVA2.DEPARTMENT (DESCRIPTION,NAME) VALUES ('', 'Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (DESCRIPTION,NAME) VALUES ('', 'Inpatient department');
Insert into VN_JAVA2.DEPARTMENT (DESCRIPTION,NAME) VALUES ('', 'Neurology department');
Insert into VN_JAVA2.DEPARTMENT (DESCRIPTION,NAME) values ('as','Test department form ');
Insert into VN_JAVA2.DEPARTMENT (DESCRIPTION,NAME) values ('This department deals with clients who have functional disabilities resulting from disease conditions/injuries.','Physical Medicine and Rehabilitation Department');
Insert into VN_JAVA2.DEPARTMENT (DESCRIPTION,NAME) values ('The medical department has within it the various clinical services.','Medical Department');

REM INSERTING into VN_JAVA2.ACCOUNT
SET DEFINE OFF;
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('admin','$2a$10$5J2Leva6L2WLlZfbC2PxPuZntXzbmBQX09tmwwjlgy13n2AyjD412','ADMIN');
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('doctor1','$2a$10$p5RKk1mBSXMFbkBMdi3C3.ym9fvMSQJSUL5c6uOTOmlWn8i7PxZKO','DOCTOR');

REM INSERTING into VN_JAVA2.DOCTOR
SET DEFINE OFF;
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1,'hcmc',to_date('11-NOV-11','DD-MON-RR'),'0','doca','0987654321',null);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (4,'Quang Ngai',to_date('31-DEC-80','DD-MON-RR'),'0','oidpsff','0987654316',null);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (3,'Ha noi',to_date('12-DEC-80','DD-MON-RR'),'0','sadfghj','0987746728',null);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (5,'Dong Thap',to_date('21-MAR-85','DD-MON-RR'),'0','doc skal as','0987654632',null);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (26,'tmp',to_date('12-DEC-00','DD-MON-RR'),'0','tmp','0987654324',null);

REM INSERTING into VN_JAVA2.PATIENT
SET DEFINE OFF;
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (22,'Ho Chi Minh city',to_date('11-DEC-99','DD-MON-RR'),'0','Nguyen Huy Quyen','0937825673');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (2,'Ho Chi Minh city',to_date('01-FEB-90','DD-MON-RR'),'0','Bui Thuy Duong','0987654321');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (21,'Dong Thap province',to_date('21-DEC-00','DD-MON-RR'),'0','Tran Hung Trong','0939946728');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (24,'Ha Noi',to_date('01-FEB-98','DD-MON-RR'),'1','Thieu Ngoc Tram','0939943213');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (46,'Thanh Hoa province',to_date('12-DEC-99','DD-MON-RR'),'0','Huynh Quang Anh','0987762810');

REM INSERTING into VN_JAVA2.MEDICINE
SET DEFINE OFF;
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (100,null,'Acetaminophen','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (101,null,'Adderall','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (102,null,'Bacitracin','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (103,null,'Candesartan','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (104,null,'Denosumab','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (105,null,'Esomeprazole','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (106,null,'Estradiol','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (107,null,'Fludrocortisone','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (108,null,'Glutathione','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (109,null,'Halobetasol','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (110,null,'Inflectra','pellet');
Insert into VN_JAVA2.MEDICINE (ID,INSTRUCTION,NAME,UNIT) values (112,null,'Vilazodone','pellet');