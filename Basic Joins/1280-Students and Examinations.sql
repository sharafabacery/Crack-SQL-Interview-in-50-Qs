/* Write your T-SQL query statement below */
SELECT ST.student_id ,ST.student_name ,S.subject_name ,
(SELECT COUNT(*) 
FROM Examinations E
WHERE ST.student_id = E.student_id AND S.subject_name = E.subject_name 
  ) AS attended_exams 
FROM Subjects S
CROSS JOIN Students ST
ORDER BY ST.student_id  ,S.subject_name