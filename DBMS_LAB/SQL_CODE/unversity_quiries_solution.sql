USE UNIVERSITY;

#GROUPING
SELECT COUNT(*) , SUM(capacity),MAX(room_number),MIN(capacity),building
FROM classroom

GROUP BY capacity;

#2
SELECT name
FROM instructor;
#3
SELECT *
FROM course
WHERE dept_name='Biology';

#4
SELECT room_number, capacity
FROM classroom
WHERE building='Watson';

#5
SELECT * 
FROM student
WHERE dept_name='Comp. Sci.';

#6
SELECT *
FROM course
WHERE credits>3;

#7
SELECT name , salary
FROM instructor
WHERE salary>70000;

#8
SELECT * 
FROM section
WHERE  semester='Fall' And year=2017;

#9
SELECT name
FROM student
WHERE tot_cred>50;

#10
SELECT *
FROM   course AS t1
       JOIN 
       prereq AS t2
       ON t1.course_id=t2.prereq_id;
/*
SELECT course.course_id, course.title, prereq.prereq_id
FROM course
JOIN prereq USING(course_id);
*/
#11
SELECT room_number
FROM classroom
WHERE building='Taylor';

#12
SELECT name,dept_name
FROM instructor;

#13
SELECT  *
FROM student
WHERE tot_cred=0;

#14
SELECT *
FROM section
WHERE building='Packard';

#15
SELECT *
FROM teaches  AS t1
       JOIN 
       instructor AS t2
       ON t1.ID =t2.ID
       WHERE t2.name='Srinivasan';
  /*     
       #16
       SELECT *
        FROM time_slot
        WHERE start_time >= '10:00:00';

*/
#17
SELECT i.name
FROM advisor AS a 
      JOIN 
      instructor AS i 
      ON i.ID=a.i_id
      
WHERE a.s_id=12345;

#18
SELECT * 
FROM department
WHERE building='Taylor';

#19
SELECT student.name AS student, instructor.name AS advisor
FROM advisor
JOIN student 
ON advisor.s_ID=student.ID
JOIN instructor
ON advisor.i_ID=instructor.ID;

#20
SELECT budget
FROM department AS d
WHERE d.dept_name='Finance';

#SORTING
SELECT name,ID,tot_cred
FROM student
WHERE tot_cred>50
ORDER BY  name ASC,ID ASC,tot_cred ASC;


#30
SELECT tot_cred
FROM student

ORDER BY tot_cred DESC
LIMIT 0,3;

#30
SELECT MAX(tot_cred)
FROM student;

#35
SELECT s.name
FROM student s 
JOIN advisor a 
ON s.ID=a.s_id
JOIN instructor i 
ON a.i_id=i.ID 
WHERE i.name='Einstein';

#36
SELECT c.title
FROM course c
JOIN takes t 
ON c.course_id = t.course_id
JOIN student s 
ON t.ID = s.ID
WHERE s.name = 'Zhang';


#37
SELECT s.name
FROM student s
WHERE NOT EXISTS (
  SELECT c.course_id
  FROM course c
  WHERE c.dept_name = 'Comp. Sci.'
  AND c.course_id NOT IN (
    SELECT t.course_id
    FROM takes t
    WHERE t.ID = s.ID
  )
);


       
#38
/*
SELECT *
FROM instructor i 
JOIN teaches t 
ON i.ID=t.ID
WHERE t.course_id IS NULL;
*/
SELECT name
FROM instructor
WHERE ID NOT IN (
    SELECT ID 
    FROM teaches);

