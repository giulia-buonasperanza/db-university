-- contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS year, COUNT(*) AS total_students
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY year;


-- contare gli insegnati che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*) AS total_teachers
FROM teachers
GROUP BY office_address
ORDER BY total_teachers DESC;

-- calcolare la media dei voti di ogni appello d'esame
SELECT e.id, e.date, e.hour, AVG(es.vote) AS average_vote
FROM exams e
JOIN exam_student es ON e.id = es.exam_id
GROUP BY e.id, e.date, e.hour
ORDER BY e.date;

-- contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT d.name AS departement, COUNT(deg.id) AS total_degrees
FROM departments d
LEFT JOIN degrees deg ON d.id = deg.department_id
GROUP BY d.id, d.name
ORDER BY total_degrees DESC;