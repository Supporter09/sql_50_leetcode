SELECT
    s.student_id
    ,s.student_name
    ,SU.subject_name
    ,COUNT(E.student_id) attended_exams
FROM Students S
CROSS JOIN Subjects SU
LEFT JOIN Examinations E
    ON E.student_id = S.student_id
    AND E.subject_name = SU.subject_name
GROUP BY S.student_id, S.student_name, Su.subject_name
ORDER BY S.student_id, S.student_name, Su.subject_name

-- Explaination: First we cross join Students with Subjects to create table with format like output
-- Student Pair With Each Subject Name. After that, we Left Join Examinations to get to get number of 
-- attendance for each subject. Subjects don't have match will be null -> be 0 when count
