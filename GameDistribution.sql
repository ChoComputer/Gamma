/*  κ²μ ??΄λΈ?
    gnum = κ²μ ?λ³? λ²νΈ
    κ²μ ? λͺ?
    κ²μ μΆμ?Ό
    κ°λ°?¬
    λ°°κΈ?¬
    ?κ·?
    κ°?κ²?
    ?€λͺ?
    ?±κΈ?
    κ²μ ?¬?΄?Έ
    ??? μ£Όμ
*/

CREATE SEQUENCE game_num;
CREATE TABLE game (
    gnum NUMBER PRIMARY KEY,
    gname VARCHAR2(100) NOT NULL,
    glaunch DATE NOT NULL,
    gdeveloper VARCHAR2(20) NOT NULL,
    gfublisher VARCHAR2(20) NOT NULL,
    gprice VARCHAR2(20) NOT NULL,
    gcontent VARCHAR2(1000) NOT NULL,
    ggrade NUMBER(4) NOT NULL,
    gsite VARCHAR2(100) NOT NULL,
    gaddress VARCHAR2(1000) NOT NULL
);
SELECT * FROM game;

/*  κ²μ ??€? ?κ΅? ?¬?­
    gnum = κ²μ ?λ³? λ²νΈ(?Έ??€)
    ?΄?μ²΄μ 
    ?λ‘μΈ?
    λ©λͺ¨λ¦?
    κ·Έλ?½
    DirectX
    ???₯κ³΅κ°
*/
CREATE TABLE gameRequirement (
    gnum NUMBER NOT NULL,
    gos VARCHAR2(100) PRIMARY KEY,
    gprocessor VARCHAR2(100) NOT NULL,
    gmemory VARCHAR2(100) NOT NULL,
    ggraphic VARCHAR2(100) NOT NULL,
    gdirectx VARCHAR2(100) NOT NULL,
    gstore VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_gameRequirement FOREIGN KEY(gnum) 
    REFERENCES game(gnum)

);

/*  ?¬?©? ??΄λΈ?
    email = ?΄λ©μΌ
    password = λΉλ?λ²νΈ
    google_login_yn	= κ΅¬κ? λ‘κ·Έ?Έ
    
*/
CREATE SEQUENCE consumer_num;
CREATE TABLE consumer (
    cnum NUMBER,
    cid VARCHAR2(20) PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    nick_name VARCHAR(20) NOT NULL
);


/*  ?¬μ§? ??΄λΈ?
    ?κ°?
    λ²νΈ
    UUID
*/
CREATE TABLE consumerPicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    cid VARCHAR2(100),
    upic_num VARCHAR2(20),
    upic_time VARCHAR2(20),
    CONSTRAINT fk_Picture FOREIGN KEY (cid)
    REFERENCES consumer(cid)
);

CREATE TABLE gamePicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    gnum NUMBER NOT NULL,
    gpic_num VARCHAR2(20) NOT NULL,
    gpic_time VARCHAR2(20) NOT NULL
);

/*  ?¬?©? ?Ό?΄λΈλ¬λ¦?
    ?¬?©? ?΄λ©μΌ
    κ²μ ?λ³? λ²νΈ
*/
CREATE TABLE consumerLibrary (
    ubnum number PRIMARY KEY,
    cid VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_consumerlibrary FOREIGN KEY (cid)
    REFERENCES consumer(cid)
);

/*  κ΅¬κ? λ‘κ·Έ?Έ
    ??΄?
    ?Έμ¦? ?΄λ©μΌ
    
    >> user tableκ³? κ΅¬κ? λ‘κ·Έ?Έ ??΄λΈ? μ»¬λ¦Ό?΄ μ€λ³΅??΄ λΆλ¦¬ ?  ?΄? κ°? ??Όλ©? (κ΅¬κ? id = ?΄λ©μΌ, ?Έμ¦? ?΄λ©μΌ = ?΄λ©μΌ)
    , λΆλ¦¬? κ°λ°? ?Ό??΄ ?¬ ? ??
    
    ?¨, ? ????΄λΈμ κ΅¬κ? λ‘κ·Έ?Έ col ? μΆκ???¬, κ΅¬κ? λ‘κ·Έ?Έ ?Έμ§?, ???΄μ§? ??κ°?? ? ?Έμ§? κ΅¬λΆ?? ?? ?κΈ°μ user ??΄λΈμ google_login μ»¬λΌ? μΆκ? ?¨.
    
CREATE TABLE socialuser(
    
);
*/
/*  κ²μ ?κ·? ??΄λΈ?
    ?κ·? ?λ³? λ²νΈ
    gnum = κ²μ ?λ³? λ²νΈ(?Έ??€)
    tag = ?κ·?
*/
CREATE SEQUENCE gametag_num;
CREATE TABLE gameTag (
    gtnum NUMBER,
    gnum NUMBER,
    tagname VARCHAR2(100),
    CONSTRAINT fk_gametag FOREIGN KEY(gnum) 
    REFERENCES game(gnum),
    CONSTRAINT pk_gametag PRIMARY KEY(gnum, tagname)
);

/*  κ²μ λ¦¬λ·° ??΄λΈ?
    grnum = λ¦¬λ·° ?λ³? λ²νΈ
    gnum = κ²μ ?λ³? λ²νΈ(?Έ??€)
    grlike = μ’μ?, ?«?΄?
    grtitle = ? λͺ?
    grcontent = λ³Έλ¬Έ
    grrecomment = ?κ°? μΆμ² ?
    grdate = ??±?Ό
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gameReview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    email VARCHAR2(100) NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grtitle VARCHAR2(100) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grrecommend NUMBER,
    grdate DATE DEFAULT sysdate,
    CONSTRAINT fk_gamereview FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
);

/*  λ¦¬λ·° ?κΈ? ??΄λΈ?
    rcnum = ?κΈ? ?λ³? λ²νΈ
    grnum = λ¦¬λ·° ?λ³? λ²νΈ(?Έ??€)
    rccontent = ?κΈ? λ³Έλ¬Έ
    rcdate = ??±?Ό
*/
CREATE SEQUENCE reviewcomment_num;
CREATE TABLE reviewComment (
    rcnum NUMBER PRIMARY KEY,
    grnum NUMBER,
    cid VARCHAR2(20) NOT NULL,
    rccontent VARCHAR2(1000) NOT NULL,
    rcdate DATE DEFAULT sysdate,
    CONSTRAINT fk_reviewcomment FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum),
    CONSTRAINT fk_consumer FOREIGN KEY(cid) 
    REFERENCES consumer(cid)
);

/*  μΉκ΅¬ ??΄λΈ?
    μΉκ΅¬ ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    μΉκ΅¬ ?΄λ©μΌ
    λ³ΈμΈ ?΄λ©μΌ(?Έ??€)
    ?λ‘μ(λ³ΈμΈ?΄ ?€λ₯Έμ¬??)
    ?λ‘μ(?€λ₯Έμ¬??΄ λ³ΈμΈ?)
*/
CREATE SEQUENCE friends_num;
CREATE TABLE friends (
    fnum NUMBER PRIMARY KEY,
    follower VARCHAR2(30) NOT NULL,
    following VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES join_user(email)
);

/*  ??κΈ? ??΄λΈ?
    ??κΈ? ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    ?΄λ©μΌ(?Έ??€)
    ??κΈ? ??±?Ό
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    semail VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(semail) REFERENCES join_user(email),
    sdate DATE DEFAULT SYSDATE
);

/*  Question ??΄λΈ?
    κΈ? ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    ? λͺ?
    λ³Έλ¬Έ
    κΈ??΄?΄(?Έ??€)
    μ§λ¬Έ ? μ§?
*/
CREATE SEQUENCE question_num;
CREATE TABLE question (
    qnum NUMBER PRIMARY KEY,
    qtitle VARCHAR2(50) NOT NULL,
    qcontent VARCHAR2(1000) NOT NULL,
    qwriter VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_question FOREIGN KEY(qwriter) REFERENCES consumer(cid),
    qdate DATE DEFAULT SYSDATE
);

/*  Answer ??΄λΈ?
    κΈ? ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    μ§λ¬ΈκΈ? ?λ³? λ²νΈ(?Έ??€)
    λ³Έλ¬Έ
    ?΅λ³? ? μ§?
*/
CREATE SEQUENCE answer_num;
CREATE TABLE answer (
    anum NUMBER PRIMARY KEY,
    qnanum NUMBER NOT NULL,
    CONSTRAINT fk_answer FOREIGN KEY(qnanum) REFERENCES question(qnum),
    acontent VARCHAR2(1000) NOT NULL,
    adate DATE DEFAULT SYSDATE
);

/*  ?¬?©? κ²°μ  ?΄?­
    κ²°μ  λ²νΈ
    ?¬?©? ?΄λ©μΌ(?Έ??€)
    κ²°μ  ? μ§?
    κ²°μ  κΈμ‘
    κ²°μ  λ°©λ²
    κ²°μ  ??
*/
CREATE TABLE consumerPayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    upday DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
);

/*  ?¬?©? μ°? λͺ©λ‘
    μ°? ?λ³? λ²νΈ
    ?¬?©? ?΄λ©μΌ
    κ²μ ?λ³? λ²νΈ
*/
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gameWishlist (
    wishnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_gamewishlist FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINTS fk_gamewhishlist FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  ΐεΉΩ±Έ΄Ο
    ΐεΉΩ±Έ΄Ο ΉψΘ£
    »ηΏλΐΪ ΐΜΈήΐΟ
    °ΤΐΣ ½ΔΊ° ΉψΘ£
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(gnum)REFERENCES game(gnum)

);