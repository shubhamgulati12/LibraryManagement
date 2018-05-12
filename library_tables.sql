--Drop table books if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE BOOKS CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Create table books
Create table books(
BOOK_ID VARCHAR2(10 CHAR),
BOOK_TITLE VARCHAR2(300 CHAR),
BOOK_AUTHOR VARCHAR2(50 CHAR),
Constraint PK_BOOKS PRIMARY KEY (BOOK_ID)
);
/

--Drop table users if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE USERS CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Create table users
Create table users(
USER_ID VARCHAR2(10 CHAR),
NAME VARCHAR2(50 CHAR),
DESIGNATION VARCHAR2(10 CHAR),
CONSTRAINT PK_USERS PRIMARY KEY (USER_ID)
);
/

--Drop table issues if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ISSUES CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Create table Issues
Create table issues(
Issue_ID	Number(10,0),
Book_ID	VARCHAR2(10 CHAR),
Book_Title	Varchar2(100 CHAR),
Borrower_ID	VARCHAR2(10 CHAR),
Borrower_Name	Varchar2(100 CHAR),
Borrower_Designation	Varchar2(50 CHAR),
Issue_Date	date,
Date_Expiry	date,
CONSTRAINT PK_ISSUE PRIMARY KEY (ISSUE_ID)
);
/

--Drop table issues if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE RETURNS CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Create table Returns
Create table returns(
Return_ID	Number(10,0),
Book_ID	VARCHAR2(10 CHAR),
Borrower_ID	VARCHAR2(10 CHAR),
Borrower_Name	Varchar2(100 CHAR),
Issue_date Date,
Deadline_Date DATE,
Return_Date	DATE,
Delay	NUMBER(10,0),
CONSTRAINT PK_RETURN PRIMARY KEY (RETURN_ID),
CONSTRAINT FK_RETURN FOREIGN KEY (RETURN_ID)
REFERENCES ISSUES(ISSUE_ID)
);
/

--Drop table issues if already existing
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE FINE CASCADE CONSTRAINT PURGE';
	EXCEPTION
    WHEN OTHERS THEN
    NULL;
END;
/
--Fine
Create table fine(
Fine_ID	Number(10,0),
Book_ID VARCHAR2(10 CHAR),
Book_Title	Varchar2(100 CHAR),
Borrower_ID	VARCHAR2(10 CHAR),
Borrower_Name	Varchar2(100 CHAR),
Delay	NUMBER(19,9),
Fine_Amount	NUMBER(38,19),
CONSTRAINT PK_FINE PRIMARY KEY (FINE_ID),
CONSTRAINT FK_FINE FOREIGN KEY(FINE_ID)
REFERENCES RETURNS(RETURN_ID)
);
/


--INSERT STATEMENTS for BOOKS and USERS:
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B001','Sewell, A.','The adventures of black beauty');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B002','Hates, S.','The candlewick book of fairy tales');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B003','Alcott, L.M.','Little women');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B004','Noonan, D.','The last steam train');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B005','Hill, A.','The burnt stick');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B006','Rowe, J.','Hidden treasures');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B007','O Brien, M.L.','Wunambi');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B008','Spyri, J.','Heidi');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B009','Harris, R. and Harp, B.','The dream');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B010','Bucikingham, S.','Alec and his flying bed');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B011','Honey, E.','Honey sandwich');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B012','Bernestain, S. and Bernestain, J.','Get in a fight');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B013','Adams, J.','Pigs and honey');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B014','Koplow, L.','Tanya and the tobo man');
Insert into Books (Book_ID, Book_Author, Book_Title) values ('B015','Armitage, R. and Armitage, D.','The light house keepers catastrope');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_001','Nishant','STUDENT');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STAF_001','Shubham','STAFF');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_002','Logan','STUDENT');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_003','Aryan','STUDENT');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_004','Paul','STUDENT');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_005','Adam','STUDENT');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STAF_002','Lin','STAFF');
Insert into Users (USER_ID, NAME, DESIGNATION) values ('STAF_003','Xu','STAFF');
commit;