SELECT c.class
FROM student.score s
JOIN student.class c
ON s.name = c.name
WHERE s.score = (
    SELECT MAX(score)
    FROM student.score
    WHERE score < (
        SELECT MAX(score)
        FROM student.score
    )
);
