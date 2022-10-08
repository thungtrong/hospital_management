
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('admin','$2a$10$5J2Leva6L2WLlZfbC2PxPuZntXzbmBQX09tmwwjlgy13n2AyjD412','ADMIN');
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('doctor1','$2a$10$p5RKk1mBSXMFbkBMdi3C3.ym9fvMSQJSUL5c6uOTOmlWn8i7PxZKO','DOCTOR');

Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (1001,'description','Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES (1002,'', 'Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES (1003,'', 'Inpatient department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES (1004,'', 'Neurology department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (1005,'as','Test department form ');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (1006,'This department deals with clients who have functional disabilities resulting from disease conditions/injuries.','Physical Medicine and Rehabilitation Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values (1007,'The medical department has within it the various clinical services.','Medical Department');
-- Increment current value of sequence
alter sequence VN_JAVA2.seq_department_pk increment by 8;

Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1001, 'hcmc',to_date('11-NOV-11','DD-MON-RR'),'0','doca','0987654321',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1002, 'Quang Ngai',to_date('31-DEC-80','DD-MON-RR'),'0','oidpsff','0987654316',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1003, 'Ha noi',to_date('12-DEC-80','DD-MON-RR'),'0','sadfghj','0987746728',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1004, 'Dong Thap',to_date('21-MAR-85','DD-MON-RR'),'0','doc skal as','0987654632',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1005, 'tmp',to_date('12-DEC-00','DD-MON-RR'),'0','tmp','0987654324',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1006,' East Apple Road, Gage County, Nebraska, 68331, United States',to_date('01-JUL-91','DD-MON-RR'),0,'Rosalie Pam McCann','9355182464',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values (1007,'724, Millersburg Cynthiana Road, Bourbon County, Kentucky, 40361, United States',to_date('06-FEB-86','DD-MON-RR'),1,'Sara McGee','5081053325',null);
alter sequence VN_JAVA2.seq_doctor_pk increment by 8;


Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1001,' Brawners Levee Road, Weakley County, West Tennessee, Tennessee, 38229, United States',to_date('12-JUL-50','DD-MON-RR'),1,'Doreen Wilkinson','4089093803');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1002,'Barren Island, United States',to_date('05-DEC-70','DD-MON-RR'),0,'Shah Khada','8024868256');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1003,'Ho Chi Minh city',to_date('11-DEC-99','DD-MON-RR'),'0','Nguyen Huy Quyen','0937825673');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1004,'Ho Chi Minh city',to_date('01-FEB-90','DD-MON-RR'),'0','Bui Thuy Duong','0987654321');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1005,'Dong Thap province',to_date('21-DEC-00','DD-MON-RR'),'0','Tran Hung Trong','0939946728');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1006,'Ha Noi',to_date('01-FEB-98','DD-MON-RR'),'1','Thieu Ngoc Tram','0939943213');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values (1007,'Thanh Hoa province',to_date('12-DEC-99','DD-MON-RR'),'0','Huynh Quang Anh','0987762810');
alter sequence VN_JAVA2.seq_patient_pk increment by 8;


Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values (1001,to_date('07-OCT-22','DD-MON-RR'),to_date('14-OCT-22','DD-MON-RR'),1);
alter sequence VN_JAVA2.seq_admission_form_pk increment by 2;




Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values (1001,to_date('07-OCT-22','DD-MON-RR'),null,1,1);
alter sequence VN_JAVA2.seq_health_record_pk increment by 2;





-- insert medicine
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1001,null,'Acetaminophen','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1002,null,'Adderall','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1003,null,'Bacitracin','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1004,null,'Candesartan','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1005,null,'Denosumab','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1006,null,'Esomeprazole','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1007,null,'Estradiol','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1008,null,'Fludrocortisone','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1009,null,'Glutathione','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1010,null,'Halobetasol','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1011,null,'Inflectra','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( 1012,null,'Vilazodone','pellet');
alter sequence VN_JAVA2.seq_medicine_pk increment by 13;




Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1000,null,'5,000,000 red cells per cubic millimetre','Red blood cells');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1001,null,'7,000 white cells per cubic millimetre','White blood cells');
--insert test
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1002,null,'4.5-5.5','Haemoglobin');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1003,null,'3.5-5.0','Haematocrit');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1004,null,'135-165','Mean corpuscular volume');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1005,null,'32-36','Mean corpuscular haemoglobin');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1006,null,'11.5-14.5','Mean corpuscular haemoglobin concentration');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values (1007,null,'150-450','Platelets');
alter sequence VN_JAVA2.seq_test_pk increment by 13;
commit;