-- selezionare tutti gli studenti iscritti al corso di laurea di economia
SELECT s.*
FROM students s
JOIN degrees d ON s.degree_id = d.id
WHERE d.name = 'Corso di Laurea in Economia';

-- selezionare tutti i corsi di laurea magistrale del dipartimento di neuroscienze
SELECT d.*
FROM  degrees d
JOIN departments dep ON d.department_id = dep.id
WHERE d.level = 'magistrale'
AND dep.name = 'Dipartimento di Neuroscienze';

SELECT c.*
FROM courses c
JOIN course_teacher ct ON c.id = ct.course_id
WHERE  ct.teacher_id = 44;

-- selzionare tutti gli studenti con il corso di laurea e il relativo dipartimento in ordine per cognome e nome 
SELECT s.surname , s.name, d.name AS degree_name
FROM students s
JOIN degrees d ON s.degree_id = d.id
JOIN departments dep ON d.department_id = dep.id
ORDER BY s.surname, s.name;

-- selezionare tutti i corsi di laurea con i relativi corsi e inseganti
SELECT d.name AS degree_name, c.name AS course_name, t.name, t.surname
FROM degrees d
JOIN courses c ON d.id = c.degree_id
JOIN course_teacher ct ON c.id = ct.course_id
JOIN teachers t ON ct.teacher_id = t.id
ORDER BY d.name, c.name; 

-- selezionare tutti i docenti che inseganno del dipartimento di matematica
SELECT DISTINCT t.*
FROM teachers t
JOIN course_teacher ct ON t.id = ct.teacher_id
JOIN courses c ON ct.course_id = c.id
JOIN degrees d ON c.degree_id = d.id
JOIN departments dep ON d.department_id = dep.id
WHERE dep.name = 'Dipartimento di Matematica';

-- per ogni studente e per ogni esame : numero di tentativi sostenuti e voto massimo ottenuto
SELECT s.id, s.name, s.surname, e.course_id, COUNT(*) attempts, MAX(es.vote) AS max_vote
FROM exam_student es
JOIN students s ON es.student_id = s.id 
JOIN exams e ON es.exam_id = e.id
GROUP BY s.id, e.course_id;