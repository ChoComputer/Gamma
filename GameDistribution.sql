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

CREATE TABLE gamereview (

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