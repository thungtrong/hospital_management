Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'Accident and Emergency departments were established to treat minor accidents and provide care for patients who were taken suddenly ill.','Accident and Emergency Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'The nursing department is the organizational structure through which nurses provide nursing care for clients under the jurisdiction of the institution.','Nursing Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),null,'Inpatient department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),null,'Neurology department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'as','Test department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'This department deals with clients who have functional disabilities resulting from disease conditions/injuries.','Physical Medicine and Rehabilitation Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'The medical department has within it the various clinical services.','Medical Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'The advantage of OPD is that much of the investigative unit and curative work can be done there without admitting the client, thus curtailing medical expenses.','Outpatient Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'Paramedical departments are adjunctive to the practice of medicine in the maintenance or restoration of health and normal functioning.','Paramedical Departments');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),null,'Pathology Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'Pharmacy is a crucial factor in medical factor. It should be planned and organized well.','Pharmacy Department');
Insert into VN_JAVA2.DEPARTMENT (ID,DESCRIPTION,NAME) values ((VN_JAVA2.seq_department_pk.nextval),'The department must be located in a place where there is easy accessibility for OP and IP clients.','Radiology Department');

Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Clark County, Idaho, United States',to_date('11-NOV-80','DD-MON-RR'),0,'Dick Bradley Clayton','0987654321',1000);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),' Moonachie Avenue, Moonachie, Bergen County, New Jersey, 07074, United States',to_date('31-DEC-80','DD-MON-RR'),1,'Christa Hand','0987654316',1002);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),' Limones, Yabucoa, Puerto Rico, 00767, United States',to_date('12-DEC-70','DD-MON-RR'),0,'Kenneth Martin Valenzuela','4649921169',1003);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Wilmington Island, Chatham County, Georgia, 31410, United States',to_date('21-MAR-50','DD-MON-RR'),0,'Luke Wallace Werner','0987654632',1004);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Buckhorn Road, Au Train Township, Alger County, Michigan, United States',to_date('07-MAY-62','DD-MON-RR'),0,'Dan Charles Benjamin','0987654324',1001);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),' East Apple Road, Gage County, Nebraska, 68331, United States',to_date('01-JUL-91','DD-MON-RR'),0,'Rosalie Pam McCann','9355182464',1005);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'724, Millersburg Cynthiana Road, Bourbon County, Kentucky, 40361, United States',to_date('06-FEB-86','DD-MON-RR'),1,'Sara McGee','5081053325',1007);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),' Tierras Nuevas Poniente, Manatí, Puerto Rico, 00701, United States',to_date('14-SEP-75','DD-MON-RR'),0,'Leigh Mindy Shultz','4642345337',1006);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Ray''s Campground, Sunday Road, Hico, Fayette County, West Virginia, 25854, United States',to_date('12-DEC-90','DD-MON-RR'),0,'Ted Devin Schneider','4642336337',1008);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Woodrow Wilson Bridge, National Harbor, Prince George''s County, Maryland, 23242, United States',to_date('09-NOV-70','DD-MON-RR'),0,'Armando Smith','3698970311',1009);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'247, Cole Hill Road, Standish, Cumberland County, Maine, 04084, United States',to_date('03-MAR-94','DD-MON-RR'),1,'Naomi Garner','7860281026',1010);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Town of Riverhead, Suffolk County, New York, United States',to_date('01-JAN-76','DD-MON-RR'),0,'Rebbecca Hughs','9407794231',1000);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Goshen, Litchfield County, Connecticut, 06756, United States',to_date('29-JUL-72','DD-MON-RR'),0,'Jamie Alexis McMullen','5704787708',1001);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Macaná, Guayanilla, Peñuelas, Puerto Rico, 00624, United States',to_date('30-OCT-64','DD-MON-RR'),1,'Jody Ayers','3525869106',1011);
Insert into VN_JAVA2.DOCTOR (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER,DEPARTMENT_ID) values ((VN_JAVA2.seq_doctor_pk.nextval),'Plumas County, California, United States',to_date('26-NOV-60','DD-MON-RR'),0,'Gilberto Sargent','7125685338',1002);

Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),' Brawners Levee Road, Weakley County, West Tennessee, Tennessee, 38229, United States',to_date('12-JUL-50','DD-MON-RR'),1,'Doreen Wilkinson','4089093803');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Barren Island, United States',to_date('05-DEC-70','DD-MON-RR'),0,'Shah Khada','8024868256');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Ho Chi Minh city',to_date('11-DEC-99','DD-MON-RR'),0,'Nguyen Huy Quyen','0937825673');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Ho Chi Minh city',to_date('01-FEB-90','DD-MON-RR'),0,'Bui Thuy Duong','0987654321');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Dong Thap province',to_date('21-DEC-00','DD-MON-RR'),0,'Tran Hung Trong','0939946728');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Ha Noi',to_date('01-FEB-98','DD-MON-RR'),1,'Thieu Ngoc Tram','0939943213');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Thanh Hoa province',to_date('12-DEC-99','DD-MON-RR'),0,'Huynh Quang Anh','0987762810');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Union County, Tennessee, United States',to_date('18-MAR-83','DD-MON-RR'),1,'Susana Potter','2258778215');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Northeast Waterfront Street, Yamhill County, Oregon, 97115, United States',to_date('16-JUL-04','DD-MON-RR'),0,'Gerry Cody Fitch','8153156079');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'Hato Viejo, Ciales, Puerto Rico, United States',to_date('10-APR-79','DD-MON-RR'),0,'Omar Herring','6038888843');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'712, Brattleboro Road, North Bernardston, Bernardston, Franklin County, Massachusetts, 01337, United States',to_date('06-FEB-50','DD-MON-RR'),1,'Helen Johanna Pineda','6604371383');
Insert into VN_JAVA2.PATIENT (ID,ADDRESS,DATE_OF_BIRTH,GENDER,NAME,PHONE_NUMBER) values ((VN_JAVA2.seq_patient_pk.nextval),'County Road 45, Yuma County, Colorado, United States',to_date('24-JUL-95','DD-MON-RR'),0,'Nora Patel','4069416760');


Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('admin','1','$2a$10$5J2Leva6L2WLlZfbC2PxPuZntXzbmBQX09tmwwjlgy13n2AyjD412','ADMIN',null);
Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('doctor1010','1','$2a$10$KteqbfqtGyTTiiLokqHuFuwWEHWLm5z/lN0XJH3xjsudzjAL59q42','DOCTOR',1010);
Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('doctor1000','1','$2a$10$f1UnzywNJULZWuBf/VBok.TqP.LIUxlJfqyjkzhMKCFM14GL/ZkUq','DOCTOR',1000);
Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('doctor1001','1','$2a$10$vqXEKW/ib6sO4xFhvRG1oekuoIBdtcj2yTtiaDgD30FKOxtRpPR1O','DOCTOR',1001);
Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('doctor1002','1','$2a$10$9WRYdCNcv0eSMHqoPQ1xiuqr2EZWfiQiAdjoAgOW0dPfP7TFaZ7W.','DOCTOR',1002);
Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('doctor1003','1','$2a$10$ezFVBP0VTsYDzWebufpaSeqZjQzg7FevmbWBmAhOqLoCImHzT5qqK','DOCTOR',1003);
Insert into VN_JAVA2.ACCOUNT (USERNAME,ENABLE,PASSWORD,ROLE,DOCTOR_ID) values ('doctor1004','1','$2a$10$oIusBsGJSbQ3PBA681ymFuMNOg.9Sl.BSZT44Umnq0ZalzIZDK2jq','DOCTOR',1004);



Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('01-SEP-22','DD-MON-RR'),to_date('13-SEP-22','DD-MON-RR'),1000);
Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('02-SEP-22','DD-MON-RR'),to_date('12-AUG-22','DD-MON-RR'),1001);
Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('03-SEP-22','DD-MON-RR'),to_date('10-SEP-22','DD-MON-RR'),1002);
Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('04-SEP-22','DD-MON-RR'),to_date('14-SEP-22','DD-MON-RR'),1003);
Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('05-SEP-22','DD-MON-RR'),to_date('20-SEP-22','DD-MON-RR'),1004);
Insert into VN_JAVA2.ADMISSION_FORM (ID,DATE_IN,DATE_OUT,PATIENT_ID) values ((VN_JAVA2.seq_admission_form_pk.nextval),to_date('05-SEP-22','DD-MON-RR'),to_date('15-SEP-22','DD-MON-RR'),1005);


Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values ((VN_JAVA2.SEQ_HEALTH_RECORD_PK.nextval),to_date('09-OCT-22','DD-MON-RR'),to_date('14-OCT-22','DD-MON-RR'),1010,1004);
Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values ((VN_JAVA2.SEQ_HEALTH_RECORD_PK.nextval),to_date('02-SEP-22','DD-MON-RR'),null,1010,1001);
Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values ((VN_JAVA2.SEQ_HEALTH_RECORD_PK.nextval),to_date('02-SEP-22','DD-MON-RR'),null,1010,1008);
Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values ((VN_JAVA2.SEQ_HEALTH_RECORD_PK.nextval),to_date('01-OCT-22','DD-MON-RR'),null,1000,1006);
Insert into VN_JAVA2.HEALTH_RECORD (ID,CREATION_DATE,RE_DATE,DOCTOR_ID,PATIENT_ID) values ((VN_JAVA2.SEQ_HEALTH_RECORD_PK.nextval),to_date('02-OCT-22','DD-MON-RR'),null,1000,1010);

Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'An abdominal aortic aneurysm (AAA) is a swelling (aneurysm) of the aorta – the main blood vessel that leads away from the heart, down through the abdomen to the rest of the body.','Abdominal aortic aneurysm');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'The main symptom of acute cholecystitis is a sudden sharp pain in the upper right side of your tummy (abdomen) that spreads towards your right shoulder.','Acute cholecystitis');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Leukaemia is cancer of the white blood cells. Acute leukaemia means the condition progresses rapidly and aggressively and requires immediate treatment.','Acute lymphoblastic leukaemia');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Benign prostate enlargement (BPE), also known as benign prostatic hyperplasia (BPH), is a condition that affects older men and anyone with a prostate.','Benign prostate enlargement');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Bile duct cancer (cholangiocarcinoma) is a rare but aggressive type of cancer.','Bile duct cancer (cholangiocarcinoma)');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Bipolar disorder, formerly known as manic depression, is a condition that affects your moods, which can swing from one extreme to another.','Bipolar disorder');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Bladder cancer is where a growth of abnormal tissue, known as a tumour, develops in the bladder lining. In some cases, the tumour spreads into the surrounding muscles.','Bladder cancer');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Sepsis is a rare but serious complication of an infection. Without quick treatment, sepsis can lead to multiple organ failure and death.','Sepsis');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Primary bone cancer is a rare type of cancer that begins in the bones. This is a separate condition from secondary bone cancer, which is cancer that spreads to the bones after developing in another part of the body.','Bone cancer');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Bowel cancer is a general term for cancer that begins in the large bowel. Depending on where the cancer starts, bowel cancer is sometimes called colon or rectal cancer.','Bowel cancer');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Bowel incontinence is an inability to control bowel movements, resulting in involuntary soiling. It''s also sometimes known as faecal incontinence.','Bowel incontinence');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'A carcinoid tumour is a rare cancer of the neuroendocrine system – the body system that produces hormones.','Carcinoid syndrome and carcinoid tumours');
Insert into VN_JAVA2.ILLNESS (ID,DESCRIPTION,NAME) values ((SEQ_ILLNESS_PK.nextval),'Cellulitis is an infection of the deeper layers of skin and the underlying tissue. It can be serious if not treated promptly.','Cellulitis');

Insert into VN_JAVA2.HEALTH_RECORD_DETAIL (HEALTH_RECORD_ID,ILLNESS_ID) values (1000,1002);
Insert into VN_JAVA2.HEALTH_RECORD_DETAIL (HEALTH_RECORD_ID,ILLNESS_ID) values (1001,1006);
Insert into VN_JAVA2.HEALTH_RECORD_DETAIL (HEALTH_RECORD_ID,ILLNESS_ID) values (1002,1009);
Insert into VN_JAVA2.HEALTH_RECORD_DETAIL (HEALTH_RECORD_ID,ILLNESS_ID) values (1003,1012);

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

--increment current values sequence
--alter sequence VN_JAVA2.MEDICINE_SEQ increment by 12;

--insert test
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'5,000,000 red cells per cubic millimetre','Red blood cells');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'7,000 white cells per cubic millimetre','White blood cells');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'4.5-5.5','Haemoglobin');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'3.5-5.0','Haematocrit');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'135-165','Mean corpuscular volume');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'32-36','Mean corpuscular haemoglobin');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'11.5-14.5','Mean corpuscular haemoglobin concentration');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'150-450','Platelets');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'>90%','DNA Test');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'40–60 mg per 100 ml ','Epinephrine tolerance test,');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'1 gram of glucose per kilogram','Glucose tolerance test');
Insert into VN_JAVA2.TEST (ID,DESCRIPTION,NORMAL_RESULT,TEST_NAME) values ((VN_JAVA2.seq_test_pk.nextval),null,'75–115 ml per minute for women and 85–125 ml per minute for men','Inulin clearance');


Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),12,1000,1001);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),12,1000,1004);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),12,1001,1004);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),15,1001,1004);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),15,1002,1010);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),12,1003,1004);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),12,1004,1007);
Insert into VN_JAVA2.PRESCRIPTION_DETAIL (ID,QUANTITY,HEALTH_RECORD_ID,MEDICINE_ID) values ((PRESCRIPTION_DETAI_PK.nextval),12,1004,1006);

Insert into VN_JAVA2.TEST_FORM(ID, CREATION_DATE, PATIENT_ID) values ((SEQ_TEST_FORM_PK.nextval), to_date('01-OCT-22','DD-MON-RR'), 1001);
Insert into VN_JAVA2.TEST_FORM(ID, CREATION_DATE, PATIENT_ID) values ((SEQ_TEST_FORM_PK.nextval), to_date('02-OCT-22','DD-MON-RR'), 1002);
Insert into VN_JAVA2.TEST_FORM(ID, CREATION_DATE, PATIENT_ID) values ((SEQ_TEST_FORM_PK.nextval), to_date('03-OCT-22','DD-MON-RR'), 1003);
Insert into VN_JAVA2.TEST_FORM(ID, CREATION_DATE, PATIENT_ID) values ((SEQ_TEST_FORM_PK.nextval), to_date('04-OCT-22','DD-MON-RR'), 1004);


commit;