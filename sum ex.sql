

CREATE TABLE quiz_50 (
    col1 NUMBER(10),
    col2 NUMBER(10),
    col3 NUMBER(10)
);

INSERT INTO quiz_50 VALUES (10, 20, null);
INSERT INTO quiz_50 VALUES (15, null, null);
INSERT INTO quiz_50 VALUES (50, 70, 20);

SELECT * FROM quiz_50;

SELECT 
    sum(col2) 
FROM quiz_50
;

SELECT 
    sum(col1 + col2 + col3) 
FROM quiz_50
;





