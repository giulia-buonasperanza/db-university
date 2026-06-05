-- selezionare tutti gli studenti nati nel 1990
SELECT *
FROM students
WHERE YEAR(date_of_birth) = 1990;

-- selezionare tutti i corsi che valgono più di 10 crediti
SELECT *
FROM courses
WHERE cfu > 10;

-- selezionare tuttui gli studenti che hanno più di 30 anni
SELECT *
FROM students
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

-- selezionare tutti i corsi del primo semestre del primo anno
SELECT *
FROM courses
WHERE period = 'I semestre'
AND year= 1;

-- selezionare tutti gli appelli d'esame che avvengono nel pomeriggio(dopo le 14) del 20/06/2026
SELECT *
FROM exams
WHERE date= '2020-06-20'
AND hour > '14:00:00';

-- selezionare tutti i corsi di laurea magistrale
SELECT *
FROM degrees
WHERE level = 'magistrale';

-- da quanti dipartimenti è composta l'università?
SELECT COUNT(*) as all_departments
FROM departments; 

-- quanti sono gli insegnabti che non hanno un numero di telefono?
SELECT COUNT(*) as teachers_without_phone
FROM teachers
WHERE phone IS NULL;
