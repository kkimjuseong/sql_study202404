

CREATE TABLE ��_38 (
    ��ID NUMBER PRIMARY KEY,
    ���� VARCHAR2(100)
);

CREATE TABLE ������_38 (
    ������ID NUMBER PRIMARY KEY,
    �������� VARCHAR2(100)
);

CREATE TABLE ��õ������_38 (
    ��ID NUMBER,
    ������ID NUMBER,
    ��õ������� DATE
);

CREATE TABLE ��ȣ������_38 (
    ��ID NUMBER,
    ������ID NUMBER,
    ������� DATE
);


INSERT INTO ��_38 VALUES (1, '��ö��');
INSERT INTO ��_38 VALUES (2, '�ڿ���');
COMMIT;


INSERT INTO ������_38 VALUES (1, '��ȭ');
INSERT INTO ������_38 VALUES (2, '�ִϸ��̼�');
INSERT INTO ������_38 VALUES (3, '��ť���͸�');

INSERT INTO ��õ������_38 VALUES (1, 1, SYSDATE);
INSERT INTO ��õ������_38 VALUES (1, 2, SYSDATE);
INSERT INTO ��õ������_38 VALUES (2, 2, SYSDATE);

INSERT INTO ��ȣ������_38 VALUES (1, 2, SYSDATE);
INSERT INTO ��ȣ������_38 VALUES (2, 1, SYSDATE);
INSERT INTO ��ȣ������_38 VALUES (2, 3, SYSDATE);

