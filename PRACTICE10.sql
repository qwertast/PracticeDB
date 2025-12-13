CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);
CREATE TABLE MEMBERS (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(255)
);

CREATE TABLE project_members(
    project_id INT,
    member_id INT,
    PRIMARY KEY (project_id, member_id),
    FOREIGN KEY (project_id) REFERENCES Projects (project_id),
    FOREIGN KEY (member_id) REFERENCES MEMBERS (member_id)
);


CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);
CREATE TABLE EQUIPMENT(
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);
CREATE TABLE EquipmentRentals(
    client_id INT,
    equipment_id INT,
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES EQUIPMENT (equipment_id)
);


CREATE TABLE STUDENTS(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);
CREATE TABLE COURSES(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_professor VARCHAR(255) NOT NULL
)

CREATE TABLE STUDENTGRADES(
    student_id INT,
    course_id INT,
    grade INT,
    PRIMARY KEY (student_id,course_id),
    FOREIGN KEY (student_id) REFERENCES STUDENTS (student_id),
    FOREIGN KEY (course_id) REFERENCES COURSES (course_id)
);