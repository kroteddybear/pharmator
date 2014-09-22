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


INSERT INTO OBJECTS (ObjectsName,CreateDate) VALUES ('firstDoc',"2014/09/19");
INSERT INTO OBJECTS (ObjectsName,CreateDate) VALUES ('secondDoc',"2014/09/20");
INSERT INTO OBJECTS (ObjectsName,CreateDate) VALUES ('thirdDoc',"2014/09/21");

INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('autor');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('validator');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('agitator');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('NumberOfView');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('State');

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,1,"tedy");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,2,"alan");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,2,"moi");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,3,"toto");
