

-- Ʈ�����
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '��ö��', 15);
INSERT INTO student VALUES (2, 'ȫ�浿', 16);

SELECT * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '�����', 12);
INSERT INTO student VALUES (4, 'Ŀ�Խ���', 13);

ROLLBACK;

-- ������ü
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '��ö��';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '�ڿ���';

-- Ŀ���� �ƹ������� �ϸ� �ȵǰ� ��� �����̾����� Ŀ�� �ؾ���
-- ������� 2���� �Ѱ��� �����ϸ� �ѹ���Ѽ� �ǵ������� Ŀ���ϸ� �ȵ�~~
COMMIT;


DELETE FROM student;
-- DELETE�� �����Ѱ� Ŀ������ �ݿ����� �ʾ����� ROLLBACK���� �ǵ��� �� �ִ�
ROLLBACK;

SELECT * FROM student;
TRUNCATE TABLE student; 





