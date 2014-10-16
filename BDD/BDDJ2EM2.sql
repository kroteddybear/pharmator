Drop DATABASE pharmator;
CREATE DATABASE pharmator;
USE pharmator;

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (IdUser int AUTO_INCREMENT NOT NULL,
UserFirstName VARCHAR(30),
UserLastName VARCHAR(30),
UserLogin VARCHAR(30),
UserPassWord VARCHAR(30),
PRIMARY KEY (IdUser) ) ENGINE=InnoDB;


DROP TABLE IF EXISTS OBJECTS ;
CREATE TABLE OBJECTS (IdObject int AUTO_INCREMENT NOT NULL,
ObjectsName VARCHAR(30),
CreateDate DATE,
ObjectsPath VARCHAR(50),
PRIMARY KEY (IdObject) ) ENGINE=InnoDB;


DROP TABLE IF EXISTS OBJECTSPROPERTIES ;
CREATE TABLE OBJECTSPROPERTIES (IdProperty int AUTO_INCREMENT NOT NULL,
PropertyName VARCHAR(30),
PRIMARY KEY (IdProperty) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS LINK ;
CREATE TABLE LINK (
IdObject int,
IdProperty int,
PropertyValue VARCHAR(30), 
PRIMARY KEY (IdObject, IdProperty) ) ENGINE=InnoDB;

ALTER TABLE LINK ADD CONSTRAINT FK_LINK_IdObject FOREIGN KEY (IdObject) REFERENCES OBJECTS (IdObject);
ALTER TABLE LINK ADD CONSTRAINT FK_LINK_IdProperty FOREIGN KEY (IdProperty) REFERENCES OBJECTSPROPERTIES (IdProperty);


INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord) VALUES ('GILLET','Jérémy','jgillet','toto');
INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord) VALUES ('DELAVALLEE','Teddy','tdelavallee','toto');
INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord) VALUES ('BELAUD','Audrey','abelaud','toto');
INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord) VALUES ('RERE','Heia','hrere','toto');


INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('firstDoc',"2014/09/19",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('secondDoc',"2014/09/20",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('thirdDoc',"2014/09/21",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('forDoc',"2015/09/14",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('fiveDoc',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('sixDoc',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('sevenDoc',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('heightDoc',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('nineDoc',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('tenDoc',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('elevenDoc',"2008/09/11",'rootFolder');


INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Autor');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('validator');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Agitator');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('NumberOfView');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Status');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Type');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('ToValidate');


INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (3,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (4,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (5,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (6,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (7,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (8,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (9,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (10,1,"Teddy DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (11,1,"Teddy DELAVALLEE");

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,2,"alan");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,2,"moi");

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,5,"Unvalidate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (3,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (4,5,"Reject");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (5,5,"Archived");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (6,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (7,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (8,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (9,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (10,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (11,5,"InProgress");

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,6,"xls");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,6,"pdf");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (3,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (4,6,"pdf");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (5,6,"xls");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (6,6,"pdf");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (7,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (8,6,"xls");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (9,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (10,6,"pptx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (11,6,"pptx");

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (3,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (4,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (5,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (6,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (7,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (8,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (9,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (10,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (11,7,"true");

