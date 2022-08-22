CREATE TABLE patient
(
id NUMBER(9),
name VARCHAR2(100) NOT NULL,
date_of_birth DATE,
gender CHAR(1),
address VARCHAR2(255),
phone_number VARCHAR2(15),
CONSTRAINTS patient_id_pk PRIMARY KEY(id)
);--

CREATE TABLE admission_form
(
id NUMBER,
date_in DATE,
date_out DATE,
patient_id NUMBER(9),
CONSTRAINTS admission_form_id_pk PRIMARY KEY(id),
CONSTRAINTS admission_form_patient_id_fk FOREIGN KEY (patient_id) 
REFERENCES patient (id) ON DELETE CASCADE
);--

-- test_form
CREATE TABLE test_form
(
id NUMBER,
patient_id NUMBER,
creation_date DATE,
CONSTRAINTS test_form_id_pk PRIMARY KEY(id),
CONSTRAINTS test_form_patient_id_fk FOREIGN KEY (patient_id)
REFERENCES patient(id) ON DELETE SET NULL
);--

CREATE TABLE test(
id NUMBER(5),
test_name VARCHAR2(100),
nomarl_result VARCHAR2(100),
description VARCHAR2(255),
CONSTRAINTS test_id_pk PRIMARY KEY (id)
);

CREATE TABLE test_detail(
test_id NUMBER(5),
test_form_id NUMBER,
test_result VARCHAR2(100),
CONSTRAINTS test_detail_testid_form_id_pk PRIMARY KEY (test_id, test_form_id),
CONSTRAINTS test_detail_test_id_fk FOREIGN KEY (test_id)
REFERENCES test(id) ON DELETE CASCADE
);

-- doctor, department
CREATE TABLE department
(
id NUMBER(3),
name VARCHAR2(100),
description VARCHAR2(255),
CONSTRAINTS department_id_pk PRIMARY KEY (id)
);
CREATE TABLE doctor
(
id NUMBER,
department_id NUMBER(3),
name VARCHAR2(100),
date_of_birth DATE,
gender CHAR(1),
address VARCHAR2(255),
phone_number VARCHAR2(15),
CONSTRAINTS doctor_id_pk PRIMARY KEY (id),
CONSTRAINTS doctor_department_id_fk FOREIGN KEY (department_id)
REFERENCES department(id)
);

-- health_record
CREATE TABLE health_record
(
id NUMBER,
creation_date DATE,
re_date DATE,
doctor_id NUMBER,
patient_id NUMBER(9),
CONSTRAINTS health_record_id_pk PRIMARY KEY(id),
CONSTRAINTS health_record_patient_id_fk FOREIGN KEY (patient_id) 
REFERENCES patient (id) ON DELETE CASCADE,
CONSTRAINTS health_record_doctor_id_fk FOREIGN KEY (doctor_id) 
REFERENCES doctor (id) ON DELETE SET NULL
);

CREATE TABLE illness
(
id NUMBER(3),
name VARCHAR2(100),
description VARCHAR2(255),
CONSTRAINTS illness_id_pk PRIMARY KEY (id)
);

CREATE TABLE health_record_detail
(
health_record_id NUMBER,
illness_id NUMBER(3),
CONSTRAINTS hrd_health_record_id_fk FOREIGN KEY (health_record_id)
REFERENCES health_record (id),
CONSTRAINTS hrd_illness_id_fk FOREIGN KEY (illness_id)
REFERENCES illness(id)
);
-- prescription
CREATE TABLE prescription
(
id NUMBER,
health_record_id NUMBER,
CONSTRAINTS prescription_id_pk PRIMARY KEY (id),
CONSTRAINTS prescription_health_r_id_fk FOREIGN KEY (health_record_id)
REFERENCES health_record (id)
);

CREATE TABLE medicine
(
id NUMBER(9),
name VARCHAR2(150),
unit VARCHAR2(30),
instruction VARCHAR(255),
CONSTRAINTS medicine_id_pk PRIMARY KEY (id)
);

CREATE TABLE prescription_deatail
(
prescription_id NUMBER,
medicine_id NUMBER(9),
amount NUMBER(3),
CONSTRAINTS presc_deatail_pk PRIMARY KEY (prescription_id, medicine_id),
CONSTRAINTS presc_deatail_presc_id_fk FOREIGN KEY (prescription_id)
REFERENCES prescription (id),
CONSTRAINTS presc_deatail_medicine_id_fk FOREIGN KEY (medicine_id)
REFERENCES medicine (id)
);




