-- 19-m-to-m.SQL

SELECT
	*
FROM students;

SELECT
	*
FROM students_courses;

SELECT
	*
FROM courses;

-- 각 학생별 수강 수업 확인

SELECT
	*
FROM students s
INNER JOIN students_courses sc ON s.id=sc.student_id
INNER JOIN courses c ON sc.course_id=c.id;

SELECT
	*
FROM courses c
INNER JOIN students_courses sc ON c.id=sc.course_id
INNER JOIN students s ON sc.student_id=s.id
order by c.name;

SELECT
	s.id,
	s.name,
	COUNT(c.id) AS 수업수,
	STRING_AGG(c.name, ', ')
FROM students s
INNER JOIN students_courses sc ON s.id=sc.student_id
INNER JOIN courses c ON sc.course_id=c.id
group by s.id, s.name;

SELECT
	c.id,
	c.name,
	c.classroom,
	count(s.id) as 수강인원,
	STRING_AGG(s.name, ', '),
	ROUND(AVG(
	CASE
        WHEN sc.grade='A+' THEN 4.3
        WHEN sc.grade = 'A'  THEN 4.0
        WHEN sc.grade = 'A-' THEN 3.7
        WHEN sc.grade = 'B+' THEN 3.3
        WHEN sc.grade = 'B'  THEN 3.0
        ELSE 0
    END)
	,2) AS 평균학점
FROM courses c
INNER JOIN students_courses sc ON c.id=sc.course_id
INNER JOIN students s ON sc.student_id=s.id
group by c.id, c.name, c.classroom;