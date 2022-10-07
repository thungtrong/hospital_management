

REM INSERTING into VN_JAVA2.ACCOUNT
SET DEFINE OFF;
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('admin','$2a$10$5J2Leva6L2WLlZfbC2PxPuZntXzbmBQX09tmwwjlgy13n2AyjD412','ADMIN');
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('doctor1','$2a$10$p5RKk1mBSXMFbkBMdi3C3.ym9fvMSQJSUL5c6uOTOmlWn8i7PxZKO','DOCTOR');

REM INSERTING into VN_JAVA2.DOCTOR
SET DEFINE OFF;
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1, 'hcmc',to_date('11-NOV-11','DD-MON-RR'),'0','doca','0987654321',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (2, 'Quang Ngai',to_date('31-DEC-80','DD-MON-RR'),'0','oidpsff','0987654316',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (3, 'Ha noi',to_date('12-DEC-80','DD-MON-RR'),'0','sadfghj','0987746728',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (4, 'Dong Thap',to_date('21-MAR-85','DD-MON-RR'),'0','doc skal as','0987654632',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (5, 'tmp',to_date('12-DEC-00','DD-MON-RR'),'0','tmp','0987654324',null);


REM INSERTING into VN_JAVA2.ADMISSION_FORM
SET DEFINE OFF;
Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values (3,to_date('07-OCT-22','DD-MON-RR'),to_date('14-OCT-22','DD-MON-RR'),1);

REM INSERTING into VN_JAVA2.DEPARTMENT
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (1,'description','Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES (2,'', 'Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES (3,'', 'Inpatient department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES (4,'', 'Neurology department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (5,'as','Test department form ');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (6,'This department deals with clients who have functional disabilities resulting from disease conditions/injuries.','Physical Medicine and Rehabilitation Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (7,'The medical department has within it the various clinical services.','Medical Department');

REM INSERTING into VN_JAVA2.DOCTOR
SET DEFINE OFF;
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1,' East Apple Road, Gage County, Nebraska, 68331, United States',to_date('01-JUL-91','DD-MON-RR'),0,'Rosalie Pam McCann','9355182464',null);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (2,'724, Millersburg Cynthiana Road, Bourbon County, Kentucky, 40361, United States',to_date('06-FEB-86','DD-MON-RR'),1,'Sara McGee','5081053325',null);

REM INSERTING into VN_JAVA2.HEALTH_RECORD
SET DEFINE OFF;
Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values (2,to_date('07-OCT-22','DD-MON-RR'),null,1,1);

REM INSERTING into VN_JAVA2.HEALTH_RECORD_DETAIL
SET DEFINE OFF;
REM INSERTING into VN_JAVA2.ILLNESS
SET DEFINE OFF;

REM INSERTING into VN_JAVA2.MEDICINE
SET DEFINE OFF;
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (1,null,'Acetaminophen','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (2,null,'Adderall','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (3,null,'Bacitracin','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (4,null,'Candesartan','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (5,null,'Denosumab','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (6,null,'Esomeprazole','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (7,null,'Estradiol','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (8,null,'Fludrocortisone','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (9,null,'Glutathione','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (10,null,'Halobetasol','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (11,null,'Inflectra','pellet');
Insert into VN_JAVA2.MEDICINE (ID, INSTRUCTION,NAME,UNIT) values (12,null,'Vilazodone','pellet');

REM INSERTING into VN_JAVA2.PATIENT
SET DEFINE OFF;
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1,' Brawners Levee Road, Weakley County, West Tennessee, Tennessee, 38229, United States',to_date('12-JUL-50','DD-MON-RR'),1,'Doreen Wilkinson','4089093803');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (2,'Barren Island, United States',to_date('05-DEC-70','DD-MON-RR'),0,'Shah Khada','8024868256');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (3,'Ho Chi Minh city',to_date('11-DEC-99','DD-MON-RR'),'0','Nguyen Huy Quyen','0937825673');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (4,'Ho Chi Minh city',to_date('01-FEB-90','DD-MON-RR'),'0','Bui Thuy Duong','0987654321');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (5,'Dong Thap province',to_date('21-DEC-00','DD-MON-RR'),'0','Tran Hung Trong','0939946728');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (6,'Ha Noi',to_date('01-FEB-98','DD-MON-RR'),'1','Thieu Ngoc Tram','0939943213');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (7,'Thanh Hoa province',to_date('12-DEC-99','DD-MON-RR'),'0','Huynh Quang Anh','0987762810');

REM INSERTING into VN_JAVA2.PRESCRIPTION_DETAIL
SET DEFINE OFF;

REM INSERTING into VN_JAVA2.TEST
SET DEFINE OFF;
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (100,null,'5,000,000 red cells per cubic millimetre','Red blood cells');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (101,null,'7,000 white cells per cubic millimetre','White blood cells');

REM INSERTING into VN_JAVA2.TEST_DETAIL
SET DEFINE OFF;

REM INSERTING into VN_JAVA2.TEST_FORM
SET DEFINE OFF;