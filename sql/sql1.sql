
Insert into VN_JAVA2.ACCOUNT (USERNAME,PASSWORD,ROLE) values ('admin','$2a$10$5J2Leva6L2WLlZfbC2PxPuZntXzbmBQX09tmwwjlgy13n2AyjD412','ADMIN');

Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'description','Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES ((VN_JAVA2.seq_department_pk.nextval),'', 'Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES ((VN_JAVA2.seq_department_pk.nextval),'', 'Inpatient department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) VALUES ((VN_JAVA2.seq_department_pk.nextval),'', 'Neurology department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'as','Test department form ');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'This department deals with clients who have functional disabilities resulting from disease conditions/injuries.','Physical Medicine and Rehabilitation Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'The medical department has within it the various clinical services.','Medical Department');


Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval), 'hcmc',to_date('11-NOV-11','DD-MON-RR'),'0','doca','0987654321',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval), 'Quang Ngai',to_date('31-DEC-80','DD-MON-RR'),'0','oidpsff','0987654316',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval), 'Ha noi',to_date('12-DEC-80','DD-MON-RR'),'0','sadfghj','0987746728',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval), 'Dong Thap',to_date('21-MAR-85','DD-MON-RR'),'0','doc skal as','0987654632',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval), 'tmp',to_date('12-DEC-00','DD-MON-RR'),'0','tmp','0987654324',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),' East Apple Road, Gage County, Nebraska, 68331, United States',to_date('01-JUL-91','DD-MON-RR'),0,'Rosalie Pam McCann','9355182464',null);
Insert into VN_JAVA2.DOCTOR (ID, ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'724, Millersburg Cynthiana Road, Bourbon County, Kentucky, 40361, United States',to_date('06-FEB-86','DD-MON-RR'),1,'Sara McGee','5081053325',null);



Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),' Brawners Levee Road, Weakley County, West Tennessee, Tennessee, 38229, United States',to_date('12-JUL-50','DD-MON-RR'),1,'Doreen Wilkinson','4089093803');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Barren Island, United States',to_date('05-DEC-70','DD-MON-RR'),0,'Shah Khada','8024868256');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Ho Chi Minh city',to_date('11-DEC-99','DD-MON-RR'),'0','Nguyen Huy Quyen','0937825673');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Ho Chi Minh city',to_date('01-FEB-90','DD-MON-RR'),'0','Bui Thuy Duong','0987654321');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Dong Thap province',to_date('21-DEC-00','DD-MON-RR'),'0','Tran Hung Trong','0939946728');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Ha Noi',to_date('01-FEB-98','DD-MON-RR'),'1','Thieu Ngoc Tram','0939943213');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Thanh Hoa province',to_date('12-DEC-99','DD-MON-RR'),'0','Huynh Quang Anh','0987762810');


-- Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('07-OCT-22','DD-MON-RR'),to_date('14-OCT-22','DD-MON-RR'),1);



-- Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values ((VN_JAVA2.SEQ_HEALTH_RECORD_PK.nextval),to_date('07-OCT-22','DD-MON-RR'),null,1,1);




-- insert medicine
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Acetaminophen','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Adderall','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Bacitracin','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Candesartan','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Denosumab','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Esomeprazole','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Estradiol','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Fludrocortisone','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Glutathione','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Halobetasol','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Inflectra','pellet');
Insert into VN_JAVA2.MEDICINE (Id,INSTRUCTION,NAME,UNIT) values ( (VN_JAVA2.seq_medicine_pk.nextval) ,null,'Vilazodone','pellet');





--insert test
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'5,000,000 red cells per cubic millimetre','Red blood cells');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'7,000 white cells per cubic millimetre','White blood cells');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'4.5-5.5','Haemoglobin');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'3.5-5.0','Haematocrit');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'135-165','Mean corpuscular volume');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'32-36','Mean corpuscular haemoglobin');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'11.5-14.5','Mean corpuscular haemoglobin concentration');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'150-450','Platelets');

commit;