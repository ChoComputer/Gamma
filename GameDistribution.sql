/*  ���� ���̺�
    gnum = ���� �ĺ� ��ȣ
    ���� ����
    ���� �����
    ���߻�
    ��޻�
    �±�
    ����
    ����
    ���
    ���� ����Ʈ
    ������ �ּ�
*/
CREATE TABLE game (
    
);

/*  ����� ���̺�
    email = �̸���
    password = ��й�ȣ
*/
CREATE TABLE user (
    email VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL
);
/*  ������
    �̸���
    �г���
    �Ұ�
*/
CREATE TABLE profile (
    
);

/*  ���� �α���
    ���̵�
    ���� �̸���
*/
CREATE TABLE socialuser(
    
);

/*  ���� ���̺�
    �ð�
    ��ȣ
    UUID
*/
CREATE TABLE userpicture (
    
);

CREATE TABLE gamepicture (

);
/*  ���� �±� ���̺�
    �±� �ĺ� ��ȣ
    gnum = ���� �ĺ� ��ȣ(�ܷ�Ű)
    tag = �±�
*/
CREATE TABLE gametag (
    gnum NUMBER
    tag VARCHAR2(100) NOT NULL
);

/*  ���� ���� ���̺�
    grnum = ���� �ĺ� ��ȣ
    gnum = ���� �ĺ� ��ȣ
    grlike = ���ƿ�, �Ⱦ��
    grtitle = ����
    grcontent = ����
    grdate = �ۼ���
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gamereview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grtitle VARCHAR2(100) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grdate DATE DEFAULT sysdate,
    CONSTRAINTS fk_gamereview FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
);

/*  ���� ��� ���̺�
    rcnum = ��� �ĺ� ��ȣ
    grnum = ���� �ĺ� ��ȣ(�ܷ�Ű)
    rccontent = ��� ����
    rcdate = �ۼ���
*/
CREATE SEQUENCE reviewcomment_num;
CREATE TABLE reviewcomment (
    rcnum NUMBER PRIMARY KEY,
    grnum NUMBER PRIMARY KEY,
    rccontent VARCHAR2(1000) NOT NULL,
    rcdate DATE DEFAULT sysdate,
    CONSTRAINTS fk_reviewcomment FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum)
);

/*  ģ�� ���̺�
    ģ�� �ĺ� ��ȣ
    �̸���
    ģ�� �̸���
*/
CREATE TABLE friends (

);
/*  Q&A ���̺�
    �� �ĺ� ��ȣ
    ����
    ����
    �۾���
    ���� ��¥
*/
CREATE TABLE question (

);
/*  �亯 ���̺�
    �� �ĺ� ��ȣ
    ����
    �亯 ��¥
*/
CREATE TABLE answer (

);

/*  ����� ���� ����
    ���� ��ȣ
    ����� �̸���(�ܷ�Ű)
    ���� ��¥
    ���� �ݾ�
    ���� ���
    ���� ����
*/
CREATE TABLE userpayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    update DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
);
/*  ����� ���̺귯��
    ����� �̸���
    ���� �ĺ� ��ȣ
*/
CREATE TABLE userlibrary (

);
/*  ����� �� ���
    �� �ĺ� ��ȣ
    ����� �̸���
    ���� �ĺ� ��ȣ
*/
CREATE TABLE gamewishlist (

);
/*  ��ٱ���
    ��ٱ��� ��ȣ
    ����� �̸���
    ���� �ĺ� ��ȣ
*/
CREATE TABLE shoppingbasket (

);