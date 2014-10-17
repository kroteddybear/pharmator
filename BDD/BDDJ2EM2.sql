Drop DATABASE pharmator;
CREATE DATABASE pharmator;
USE pharmator;

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (IdUser int AUTO_INCREMENT NOT NULL,
UserFirstName VARCHAR(30),
UserLastName VARCHAR(30),
UserLogin VARCHAR(30),
UserPassWord VARCHAR(30),
isValidator BOOLEAN,
PRIMARY KEY (IdUser) ) ENGINE=InnoDB;


DROP TABLE IF EXISTS OBJECTS ;
CREATE TABLE OBJECTS (IdObject int AUTO_INCREMENT NOT NULL,
ObjectsName VARCHAR(70),
CreateDate DATE,
ObjectsPath VARCHAR(150),
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


INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord,isValidator) VALUES ('GILLET','Jérémy','jgillet','toto',true);
INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord,isValidator) VALUES ('DELAVALLEE','Teddy','tdelavallee','toto',true);
INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord,isValidator) VALUES ('BELAUD','Audrey','abelaud','toto',false);
INSERT INTO USERS (UserFirstName, UserLastName, UserLogin,UserPassWord,isValidator) VALUES 
('RERE','Heia','hrere','toto',false);


INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Grossesse et Médicaments',"2014/09/19",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Les Antalgiques',"2014/09/20",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Les Antidiabétiques',"2014/09/21",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('La Contraception',"2015/09/14",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Les Anticoagulants',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Valeurs biologiques de référence',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°1',"2009/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°2',"2010/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°3',"2011/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°4',"2012/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°5',"2013/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Diagnostic d\'une anémie',"2014/09/19",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Hématologie',"2014/09/20",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Calendrier vaccinal',"2014/09/21",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Liste des retraits de médicaments',"2015/09/14",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Exposé sur la PCR',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Plantes médicinales',"2008/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Pansements',"2009/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Aide à la reconnaissance',"2010/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°6',"2011/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°7',"2012/09/11",'rootFolder');
INSERT INTO OBJECTS (ObjectsName,CreateDate,ObjectsPath) VALUES ('Rapport de stage n°8',"2013/09/11",'rootFolder');


INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Autor');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('validator');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Agitator');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('NumberOfView');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Status');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('Type');
INSERT INTO OBJECTSPROPERTIES (PropertyName) VALUES ('ToValidate');


INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (3,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (4,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (5,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (6,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (7,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (8,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (9,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (10,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (11,1,"DELAVALLEE");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (12,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (13,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (14,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (15,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (16,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (17,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (18,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (19,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (20,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (21,1,"GILLET");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (22,1,"GILLET");

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,2,"alan");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,2,"moi");

INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (1,5,"Unvalidate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (2,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (3,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (4,5,"Reject");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (5,5,"Archived");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (6,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (7,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (8,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (9,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (10,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (11,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (12,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (13,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (14,5,"Reject");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (15,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (16,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (17,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (18,5,"Reject");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (19,5,"Validate");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (20,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (21,5,"InProgress");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (22,5,"InProgress");

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
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (12,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (13,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (14,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (15,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (16,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (17,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (18,6,"docx");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (19,6,"pdf");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (20,6,"pdf");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (21,6,"pdf");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (22,6,"pdf");

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
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (12,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (13,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (14,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (15,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (16,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (17,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (18,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (19,7,"false");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (20,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (21,7,"true");
INSERT INTO LINK (IdObject,IdProperty,PropertyValue) VALUES (22,7,"true");

