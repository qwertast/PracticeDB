CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY, -- Уникальный идентификатор студента
    full_name VARCHAR(255) NOT NULL, -- Полное имя студента
    email VARCHAR(255) UNIQUE NOT NULL, -- Электронная почта студента (должна быть уникальной)
    start_year INT -- Год поступления студента
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY, -- Уникальный идентификатор курса
    course_name VARCHAR(255) NOT NULL, -- Название курса
    credits INT CHECK (credits > 0) -- Количество зачетных единиц курса (должно быть больше 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE, -- Ссылка на ID студента (внешний ключ)
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE, -- Ссылка на ID курса (внешний ключ)
    grade CHAR(1), -- Оценка студента за курс (например, 'A', 'B', 'C')
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO students (full_name, email, start_year) VALUES
('Алексей Смирнов', 'aleksey@example.com', 2021),
('Елена Кузнецова', 'elena@example.com', 2022),
('Дмитрий Новиков', 'dmitriy@example.com', 2021),
('Ольга Морозова', 'olga@example.com', 2023);

INSERT INTO courses (course_name, credits) VALUES
('Введение в программирование', 5),
('Базы данных', 4),
('Веб-технологии',4);

INSERT INTO enrollments (student_id, course_id, grade) VALUES (
    (SELECT student_id FROM students WHERE full_name = 'Алексей Смирнов'),
    (SELECT course_id FROM courses WHERE course_name = 'Базы данных'),
    'A'
);

INSERT INTO enrollments (student_id, course_id, grade) VALUES (
    (SELECT student_id FROM students WHERE full_name = 'Елена Кузнецова'),
    (SELECT course_id FROM courses WHERE course_name ='Базы данных'),
    'B'
);

INSERT INTO enrollments (student_id, course_id, grade) VALUES (
    (SELECT student_id FROM students WHERE full_name = 'Елена Кузнецова'),
    (SELECT course_id FROM courses WHERE course_name ='Веб-технологии'),
    'А'
);

INSERT INTO enrollments (student_id, course_id) VALUES (
    (SELECT student_id FROM students WHERE full_name = 'Дмитрий Новиков'),
    (SELECT course_id FROM courses WHERE course_name = 'Введение в программирование')
);

INSERT INTO enrollments (student_id, course_id) VALUES (
    (SELECT student_id FROM students WHERE full_name = 'Дмитрий Новиков'),
    (SELECT course_id FROM courses WHERE course_name = 'Базы данных')
);

INSERT INTO enrollments (student_id, course_id) VALUES (
    (SELECT student_id FROM students WHERE full_name = 'Дмитрий Новиков'),
    (SELECT course_id FROM courses WHERE course_name = 'Веб-технологии')
);

UPDATE students
SET email = 'elena.kuznetsova@newmail.com'
WHERE full_name = 'Елена Кузнецова'

UPDATE enrollments
SET grade = 'A'
WHERE student_id = 3 AND course_id = 1

DELETE FROM Students
WHERE email = 'elena.kuznetsova@newmail.com';





SELECT * FROM Students;

SELECT course_name, credits FROM courses

SELECT * FROM Students WHERE start_year = 2021;

SELECT * FROM courses WHERE credits > 4;

SELECT * FROM Students WHERE email = 'elena.kuznetsova@newmail.com';

SELECT * FROM students where full_name LIKE 'Дмитрий%';

SELECT * FROM enrollments where grade IS NULL;

SELECT * FROM courses ORDER BY course_name;

SELECT full_name, start_year FROM Students ORDER BY start_year ;

SELECT full_name, start_year FROM Students ORDER BY start_year DESC LIMIT 2;