

-- 트랜잭션
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '도우너', 12);
INSERT INTO student VALUES (4, '커밋실패', 13);

ROLLBACK;

-- 계좌이체
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

-- 커밋은 아무곳에서 하면 안되고 모두 성공이었을때 커밋 해야함
-- 예를들어 2개중 한개만 성공하면 롤백시켜서 되돌려야함 커밋하면 안돼~~
COMMIT;


DELETE FROM student;
-- DELETE로 삭제한걸 커밋으로 반영하지 않았으면 ROLLBACK으로 되돌릴 수 있다
ROLLBACK;

SELECT * FROM student;
TRUNCATE TABLE student; 





