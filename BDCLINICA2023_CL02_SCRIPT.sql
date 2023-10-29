USE master
go

IF DB_ID('BDCLINICA2023') IS NOT NULL
Begin
	Alter Database BDCLINICA2023
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	
	DROP DATABASE BDCLINICA2023
End
go

CREATE DATABASE BDCLINICA2023
COLLATE MODERN_SPANISH_CI_AI
go

USE BDCLINICA2023
GO

SET NOCOUNT ON
GO
SET LANGUAGE SPANISH
GO
SET  DATEFORMAT DMY
GO

create table Especialidad
(
	codesp char(3) not null constraint pk_codesp primary key,
	nomesp varchar(40),
	costo  decimal(8,2)
) 
go

insert into Especialidad values('E01','Otorrinolaringologia',80) 
insert into Especialidad values('E02','Gastroenterologia',70) 
insert into Especialidad values('E03','Medicina General',60) 
insert into Especialidad values('E04','Dermatologia',60) 
insert into Especialidad values('E05','urologia',90) 
insert into Especialidad values('E06','Podologia',60) 
insert into Especialidad values('E07','Radiologia',100) 
insert into Especialidad values('E08','Ginecologia',80) 
insert into Especialidad values('E09','Pediatria',60) 
insert into Especialidad values('E10','Traumatologia',70) 
insert into Especialidad values('E11','Reumatologia',70) 
go
go

CREATE TABLE Distrito
(
	coddis	char(3)	not null constraint pk_coddis primary key,
	nomdis	varchar(35)
)
go

INSERT INTO Distrito values('D01','Lima-Cercado') 
INSERT INTO Distrito values('D02','Jesus Maria') 
INSERT INTO Distrito values('D03','Rimac') 
INSERT INTO Distrito values('D04','Magdalena') 
INSERT INTO Distrito values('D05','Pueblo Libre') 
INSERT INTO Distrito values('D06','Miraflores') 
INSERT INTO Distrito values('D07','San Isidro') 
INSERT INTO Distrito values('D08','Surquillo') 
INSERT INTO Distrito values('D09','San Martin de Porres') 
INSERT INTO Distrito values('D10','San Juan de Miraflores') 
INSERT INTO Distrito values('D11','Lince') 
INSERT INTO Distrito values('D12','La Victoria') 
INSERT INTO Distrito values('D13','La Molina') 
INSERT INTO Distrito values('D14','San Luis') 
INSERT INTO Distrito values('D15','San Borja') 
INSERT INTO Distrito values('D16','Los Olivos') 
INSERT INTO Distrito values('D17','San Juan de Lurigancho') 
INSERT INTO Distrito values('D18','Villa El Salvador') 
INSERT INTO Distrito values('D19','Villa Maria del Triunfo') 
INSERT INTO Distrito values('D20','Chorrillos') 
GO
INSERT INTO Distrito values('D21','Ate') 
INSERT INTO Distrito values('D22','San Miguel') 
INSERT INTO Distrito values('D23','Surco') 
INSERT INTO Distrito values('D24','Lince') 
INSERT INTO Distrito values('D25','Ancon') 
INSERT INTO Distrito values('D26','Barranco') 
INSERT INTO Distrito values('D27','Carabayllo') 
INSERT INTO Distrito values('D28','Breña') 
INSERT INTO Distrito values('D29','Chorrillos') 
INSERT INTO Distrito values('D30','Santa Anita') 
INSERT INTO Distrito values('D31','Chaclacayo') 
INSERT INTO Distrito values('D32','Lurin') 
GO

create table Medicos
(
	codmed char(5) not null constraint pk_codmed primary key,
	codesp char(3),
	nommed varchar(40),
	anio_colegio  int,
	coddis	char(3),
	estado	int default 1,
	constraint fk_medicos_codesp 
			  foreign key(codesp) 
			  references Especialidad(codesp),
	constraint fk_medicos_coddis 
			  foreign key(coddis) 
			  references Distrito(coddis)
)          
go

insert into Medicos values('M0001','E01','ABARCA MENDOZA, BRUCE HAMMER' ,1998,'D01',1) 
insert into Medicos values('M0002','E01','ALIAGA VALERO, JUAN CARLOS' ,1998,'D04',1) 
insert into Medicos values('M0003','E01','ARENAS AGUIRRE, JENRY' ,2006,'D08',1) 
insert into Medicos values('M0004','E01','BACA DAVILA, JHONNY MIGUEL' ,2002,'D02',1) 
insert into Medicos values('M0005','E02','BANCES MORALES, RENZO DIQUEZ' ,1996,'D06',1) 
insert into Medicos values('M0006','E02','BENITES GARCIA, MARTIN EDUARDO',1998,'D17',1) 
insert into Medicos values('M0007','E02','CANAZA PARI, CARLOS JAVIER' ,1997,'D05',1) 
insert into Medicos values('M0008','E02','CARRION MENDOZA, VICTOR HUGO' ,1999,'D10',1) 
insert into Medicos values('M0009','E03','CISNEROS YLLANES, HUGO ALFREDO',2001,'D11',1) 
insert into Medicos values('M0010','E03','DE LA CRUZ ANGELES, JAIRAM ANER' ,2002,'D15',1) 
insert into Medicos values('M0011','E03','FAJARDO ORELLANA, CARLOS DANIEL' ,2001,'D03',1) 
insert into Medicos values('M0012','E04','JAUREGUI FERNANDEZ, KEVIN ELVIZ' ,2003,'D07',1) 
insert into Medicos values('M0013','E09','MARTINEZ PALOMINO, LUZ MARIA ELIZABETH',2004,'D09',1) 
insert into Medicos values('M0014','E04','LENGUA MARTINEZ, ANGEL RUBEN' ,1996,'D12',1) 
insert into Medicos values('M0015','E04','SALAZAR MARTELL, ANGEL RUBEN' ,1996,'D14',1) 
insert into Medicos values('M0016','E05','LOPEZ SALAZAR, JOSE BRIAN' ,1995,'D02',1) 
insert into Medicos values('M0017','E05','MARTINEZ DIGGESTI, GIANPIERO' ,1994,'D13',1) 
insert into Medicos values('M0018','E05','NAVARRO AGUSTIN, HERMAN' ,1999,'D04',1) 
insert into Medicos values('M0019','E05','ORELLANA ESPIRITU, JUAN JOSE' ,1998,'D06',1) 
insert into Medicos values('M0020','E06','PACHECO RODRIGUEZ, ALVARO ELI',1998,'D09',1) 
insert into Medicos values('M0021','E06','REYES PEREZ, KELLY DENISSE' ,2000,'D12',1) 
insert into Medicos values('M0022','E06','RODRIGUEZ AVALOS, KATHERINE ESTEFANI',2003,'D10',1) 
insert into Medicos values('M0023','E09','RUIZ MORALES, LUIS ALBERTO' ,2004,'D09',1) 
go
insert into Medicos values('M0024','E07','SOTELO CAMACHO, MARTIN' ,1998,'D13',1) 
insert into Medicos values('M0025','E08','RENGIFO DUARTE, DIANA' ,2001,'D15',1) 
insert into Medicos values('M0026','E08','REYNA CHOQUE, MONIQUE' ,2005,'D20',1) 
insert into Medicos values('M0027','E09','ROQUE SALAZAR, ARACELLY' ,2004,'D18',1) 
insert into Medicos values('M0028','E09','SAENZ LIÑAN, MILAGROS' ,2004,'D16',1) 
insert into Medicos values('M0029','E09','LIÑAN SAAVEDRA, XIMENA ISABEL',2004,'D15',1) 
insert into Medicos values('M0030','E02','FERNANDEZ GARCIA, MARTIN' ,1997,'D15',1) 
insert into Medicos values('M0031','E02','DIAZ PAZ, ROSARIO' ,1999,'D30',1) 
insert into Medicos values('M0032','E03','YAMAMOTO HIGA, ROBERTO' ,2001,'D21',1) 
insert into Medicos values('M0033','E03','GONZALES GONZALES, MANUEL' ,2002,'D25',1) 
insert into Medicos values('M0034','E03','CASTILLO FLORES, ROGELIO' ,2001,'D23',1) 
insert into Medicos values('M0035','E04','HUAMANI GARCIA, EDUARDO' ,2003,'D27',1) 
insert into Medicos values('M0036','E09','MEDINA ORTEGA, SHIRLEY' ,2004,'D29',1) 
insert into Medicos values('M0037','E04','DE LA CRUZ MEDINA, SEBASTIAN' ,1996,'D12',1) 
insert into Medicos values('M0038','E04','PEÑA QUISPE, ISABEL' ,1996,'D14',1) 
insert into Medicos values('M0039','E05','QUISPE VERA, CRISTINA' ,1995,'D22',1) 
insert into Medicos values('M0040','E05','ORTEGA RAMIREZ, CARLOS' ,1994,'D13',1) 
insert into Medicos values('M0041','E05','CONDORI SOTO, MARTIN' ,1999,'D14',1) 
insert into Medicos values('M0042','E05','VARGAS RIOFRIO, EDUARDO' ,1998,'D16',1) 
insert into Medicos values('M0043','E06','FLORES CASTILLO, PAOLA' ,1998,'D19',1) 
insert into Medicos values('M0044','E10','SANCHEZ HINOSTROZA, JULIO' ,2001,'D22',1) 
insert into Medicos values('M0045','E11','SOTOMAYOR VALVERDE, ANA' ,2005,'D20',1) 
insert into Medicos values('M0046','E09','GARCIA HUAMANI, FIORELLA' ,2004,'D29',1) 
go
insert into Medicos values('M0047','E01','RAMOS ZARATE, GABRIEL' ,1997,'D16',1) 
insert into Medicos values('M0048','E01','JIMENEZ CHAVEZ, KAREN' ,1999,'D31',1) 
insert into Medicos values('M0049','E05','ROSALES PEREZ, JANETH' ,2000,'D22',1) 
insert into Medicos values('M0050','E05','LEON RAMIREZ, PEDRO' ,2002,'D26',1) 
insert into Medicos values('M0051','E07','GARCIA GUTIERREZ, ANTONIO' ,2001,'D24',1) 
insert into Medicos values('M0052','E07','ZARATE CANTA, CESAR' ,2003,'D28',1) 
insert into Medicos values('M0053','E08','ALIAGA MALDONADO, NELSON' ,2004,'D30',1) 
insert into Medicos values('M0054','E08','MALDONADO VARGAS, BRITNEY' ,2006,'D13',1) 
insert into Medicos values('M0055','E08','HERRERA GUTIERREZ, KATTY' ,1996,'D15',1) 
insert into Medicos values('M0056','E05','ROMERO ALIAGA, JUAN JOSE' ,1995,'D23',1) 
insert into Medicos values('M0057','E05','CHAVEZ DIAZ, JULIO CESAR' ,1994,'D14',1) 
insert into Medicos values('M0058','E09','LUQUE SIFUENTES, CARMEN' ,1999,'D15',1) 
insert into Medicos values('M0059','E09','PONCE DE LA CRUZ, PAOLA' ,1998,'D17',1) 
insert into Medicos values('M0060','E02','URIBE ENRIQUEZ, ISABEL' ,1998,'D20',1) 
insert into Medicos values('M0061','E02','ALVARADO LEON, ELIZABETH' ,2001,'D23',1) 
insert into Medicos values('M0062','E10','RAMIREZ POVES, DIANA' ,2005,'D21',1) 
insert into Medicos values('M0063','E11','AGUILAR MALDONADO, DORA' ,2004,'D30',1) 
go
insert into Medicos values('M0064','E02','CALIXTO MALDONADO, VANIA' ,2006,'D13',1) 
insert into Medicos values('M0065','E04','DUARTE CHOQUE, MATILDE' ,2000,'D32',1) 
insert into Medicos values('M0066','E06','SALAZAR SAAVEDRA, MONICA' ,2005,'D20',1) 
insert into Medicos values('M0067','E08','LIÑAN FERNANDEZ, MILAGROS' ,2004,'D18',1) 
insert into Medicos values('M0068','E01','GARCIA CASTILLO, ARACELLY' ,2004,'D16',1) 
insert into Medicos values('M0069','E01','LIÑAN MEDINA, PAOLA',2004,'D15',1) 
insert into Medicos values('M0070','E03','GARCIA PAZ, CARLOS MARTIN' ,1997,'D15',1) 
insert into Medicos values('M0071','E03','HIGA IREY, LUPE' ,2006,'D30',1) 
insert into Medicos values('M0072','E05','SUAREZ MEDINA, ROBERTO' ,2001,'D21',1) 
insert into Medicos values('M0073','E07','GONZALES CARRASCO, EDITH' ,2002,'D32',1) 
insert into Medicos values('M0074','E09','ZARATE VIVAR, ROGER' ,2000,'D23',1) 
insert into Medicos values('M0075','E10','DE LOS SANTOS ORTEGA, EDGARD' ,2003,'D27',1) 
insert into Medicos values('M0076','E10','ROQUE SANTOS, JULIO' ,2004,'D29',1) 
insert into Medicos values('M0077','E11','PONCE CASTILLO, SEBASTIAN' ,1996,'D12',1) 
insert into Medicos values('M0078','E11','EGOAVIL RAMIREZ, ISABEL' ,1996,'D14',1) 
insert into Medicos values('M0079','E11','RAMOS SANCHEZ, CLAUDIA' ,1995,'D22',1) 
insert into Medicos values('M0080','E10','RAMIREZ QUIROGA, ANDRES' ,1994,'D13',1) 

-------------------------------------------------------------------------

create table Pacientes
(
	codpac	char(6)	not null constraint pk_codpac primary key,
	nompac	varchar(50)		not null,
	dnipac	char(8)	,
	tel_cel	varchar(10),
	dirpac	varchar(50),
	coddis	char(3),
	estado	int,
		constraint fk_pacientes_coddis 
			  foreign key(coddis) 
			  references Distrito(coddis)
)
go

insert into Pacientes values('P00001','SEDANO MANTILLA, RANDY DANILO','10233234','985745280','Jr. Trujillo 290', 'D03',1)
insert into Pacientes values('P00002','SILVERA SIANCAS, ISAAC','45203678','998530045','Jr. Lopez Pasos 852', 'D01',1)
insert into Pacientes values('P00003','VASQUEZ FERRE, FRANK JUNIOR','41526389','987421895','Av. Uruguay 587', 'D01',1)
insert into Pacientes values('P00004','VEGA FLORES, MARIA LUISA','40477308','896526344','', 'D05',1)
insert into Pacientes values('P00005','VENTURA PEREZ, JOSE ANTONIO','45698712','998563241','', 'D15',1)
insert into Pacientes values('P00006','ROJAS MENDOZA RUTH','25634198','951263741','', 'D18',1)
insert into Pacientes values('P00007','CAMPOS BALLESTEROS MARITZA','25456389','988526304','', 'D10',1)
insert into Pacientes values('P00008','VERA CHIHUAN, CARLOS ALBERTO','21369874','898552417','', 'D02',1)
insert into Pacientes values('P00009','ALMONTE RIVERA, DENNIS OBED','20356380','981063857','', 'D01',1)
insert into Pacientes values('P00010','BRICEÑO PORTILLA, WALTER ALFONSO','41526302','984123505','', 'D03',1)
insert into Pacientes values('P00011','CARDENAS ZEGARRA, EMILIO YANG','48752360','997500246','', 'D03',1)
insert into Pacientes values('P00012','VIDAL ORBEGOZO, JESUS JOEL','40525063','975863408','', 'D02',1)
insert into Pacientes values('P00013','CAMPOS CASTILLO, CARLA HELIN','28967314','977741288','', 'D09',1)
insert into Pacientes values('P00014','VILCHEZ GALAN, PEDRO CARLOS','23410808','999526441','', 'D08',1)
insert into Pacientes values('P00015','ANDRADE ZUASNABAR, DANIELA','40015285','980042347','', 'D12',1)
insert into Pacientes values('P00016','CHUCHON VASQUEZ, JOHEL','40500873','884150047','', 'D15',1)
insert into Pacientes values('P00017','HUARANCCA TAIPE, CINTHYA MILAGROS','42332565','895423706','', 'D11',1)
insert into Pacientes values('P00018','FLORES VILLAR, MERY YAKELY','44142096','986742310','', 'D12',1)
insert into Pacientes values('P00019','OSORIO MALDONADO, DANIELA LUZ','43625241','984705349','', 'D14',1)
insert into Pacientes values('P00020','GUITTON ARTEAGA, CHARLY ELADIO','27282923','985736510','', 'D07',1)
insert into Pacientes values('P00021','LIZARBE GUEVARA, VICTOR RICARDO FRANCO','20246370','989486283','', 'D06',1)
go

insert into Pacientes values('P00022','HEREDIA HINOSTROZA, JUAN CARLOS','25630121','','', 'D02',1)
insert into Pacientes values('P00023','TORRES VARA, ANA SOFIA, JUAN CARLOS','23218604','','', 'D05',1)
insert into Pacientes values('P00024','ROJAS SALDAÑA, ROCIO','45862079','','', 'D01',1)
insert into Pacientes values('P00025','MEDINA JUAREZ, PEDRO','','','', 'D07',1)
insert into Pacientes values('P00026','PEREZ VENTURA, KARINA','','','', 'D09',1)
insert into Pacientes values('P00027','SAAVEDRA POVES, PAOLA','','','', 'D12',1)
insert into Pacientes values('P00028','ALVAREZ CASTAÑEDA, FIDEL','40365018','','', 'D12',1)
insert into Pacientes values('P00029','NAKAYAMA OSHIRO, KAORI','48279147','','', 'D14',1)
insert into Pacientes values('P00030','FLORES TORRES, DIEGO','46779173','','', 'D16',1)
insert into Pacientes values('P00031','GONZALES JULIAN, LIZBETH','58270841','','', 'D18',1)
insert into Pacientes values('P00032','VALDIVIESO SOLANO, WALTER','60741983','','', 'D17',1)
insert into Pacientes values('P00033','DIAZ CASTILLO, MIGUEL','','','', 'D16',1)
insert into Pacientes values('P00034','FLORES DE LA TORRE, CRISTINA','','','', 'D15',1)
insert into Pacientes values('P00035','DOMINGUEZ CASTAÑEDA, ALEJANDRO','','','', 'D06',1)
insert into Pacientes values('P00036','CHACON ALVARADO, JOSE','42572335','','', 'D01',1)
insert into Pacientes values('P00037','GUEVARA MALDONADO, VICTOR FRANCISCO','','','', 'D10',1)
insert into Pacientes values('P00038','PASALAGUA RIOS, NELLY','','','', 'D07',1)
insert into Pacientes values('P00039','SALVATIERRA GARCIA, DANIELA','10526374','','', 'D05',1)
insert into Pacientes values('P00040','YANG HO, LIAN WU','','','', 'D02',1)
go

insert into Pacientes values('P00041','SOLANO RIVADENEYRA, LUZ DANIELA','','','', 'D06',1)
insert into Pacientes values('P00042','ESPINOZA FERNANDEZ, RAUL','','','', 'D06',1)
insert into Pacientes values('P00043','GUISSE RAMIREZ, MICHAEL ANDRE','','','', 'D06',1)
insert into Pacientes values('P00044','VELIZ PRIETO, FERNANDO','','','', 'D06',1)
insert into Pacientes values('P00045','TAIPE HINOSTROZA, CINTHYA','','','', 'D06',1)
insert into Pacientes values('P00046','REYES PACHAS, CAROLINA','','','', 'D04',1)
insert into Pacientes values('P00047','MALPARTIDA RODRIGUEZ, ISABEL','','','', 'D07',1)
insert into Pacientes values('P00048','VERA RUIZ, MIRIAM','','','', 'D20',1)
insert into Pacientes values('P00049','SALAZAR BALLON, KATHERINE','','','', 'D20',1)
insert into Pacientes values('P00050','POVES ALARCON, JULISSA','42118563','','', 'D18',1)
go

insert into Pacientes values('P00051','SANCHEZ AREVALO, JUAN CARLOS','52016237','','', 'D17',1)
insert into Pacientes values('P00052','CHERRES DE LA CRUZ, EDUARDO','','','', 'D15',1)
insert into Pacientes values('P00053','ROJAS ORIHUELA, VICTOR','44682257','','', 'D07',1)
insert into Pacientes values('P00054','DANCUART ROMERO, DIANA','','','', 'D01',1)
insert into Pacientes values('P00055','MENDOZA VELASQUEZ, KATYA','','','', 'D02',1)
insert into Pacientes values('P00056','SANTISTEBAN VALDEZ, RENZO','25302571','','', 'D05',1)
insert into Pacientes values('P00057','HUAMAN RAMIREZ, DARIO','','','', 'D03',1)
insert into Pacientes values('P00058','TORRES VALVERDE, MANUEL','14201487','','', 'D14',1)
go


create table Citas
(
	nrocita int not null constraint pk_nrocita primary key,
	codmed  char(5),
	codpac  char(6),
	tipo    int,
	pago    decimal(8,2),
	fecha	datetime default getdate()+1,
	estado int default 0,
	descrip	varchar(400)
		constraint fk_citas_codmed 
				  foreign key(codmed) 
				  references Medicos(codmed),
		constraint fk_citas_codpac 
				  foreign key(codpac) 
				  references Pacientes(codpac) 				   
) 
go

SET LANGUAGE SPANISH
GO
-- 2021
INSERT INTO Citas VALUES(10001,'M0001','P00001',2,50,'05/08/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10002,'M0003','P00002',3,50,'10/08/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10003,'M0008','P00003',1,30,'20/08/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10004,'M0001','P00004',1,20,'25/08/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10005,'M0002','P00005',2,40,'30/08/2021',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10006,'M0004','P00006',2,50,'01/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10007,'M0009','P00007',3,60,'04/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10008,'M0012','P00008',3,40,'04/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10009,'M0003','P00012',3,10,'16/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10010,'M0009','P00014',1,20,'18/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10011,'M0018','P00009',3,40,'22/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10012,'M0014','P00015',2,60,'28/09/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10013,'M0015','P00010',3,60,'30/09/2021',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10014,'M0005','P00013',3,70,'05/10/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10015,'M0017','P00011',1,50,'13/10/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10016,'M0019','P00016',1,70,'16/10/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10017,'M0004','P00018',1,60,'22/10/2021',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10018,'M0022','P00020',1,60,'25/10/2021',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10019,'M0020','P00017',2,80,'31/10/2021',0,'Sin Descripcion')
GO

INSERT INTO Citas VALUES(10020,'M0005','P00021',2,50,'02/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10021,'M0010','P00019',1,30,'05/11/2021',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10022,'M0016','P00001',2,40,'06/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10023,'M0006','P00002',2,50,'10/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10024,'M0003','P00003',2,30,'14/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10025,'M0007','P00004',3,40,'18/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10026,'M0008','P00005',3,60,'20/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10027,'M0014','P00006',4,50,'24/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10028,'M0018','P00007',3,60,'27/11/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10029,'M0007','P00008',1,70,'30/11/2021',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10030,'M0003','P00012',1,55,'01/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10031,'M0009','P00014',4,45,'03/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10032,'M0010','P00009',1,50,'08/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10033,'M0012','P00015',1,50,'10/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10034,'M0011','P00010',3,50,'12/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10035,'M0011','P00013',2,50,'15/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10036,'M0015','P00011',1,50,'19/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10037,'M0019','P00016',1,50,'21/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10038,'M0021','P00018',2,50,'23/12/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10039,'M0022','P00020',2,50,'28/12/2021',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10040,'M0021','P00017',2,50,'29/12/2021',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10041,'M0022','P00021',2,50,'30/12/2021',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10042,'M0023','P00019',2,50,'30/12/2021',0,'Sin Descripcion')  
go

-- 2022
---------------------
INSERT INTO Citas VALUES(10043,'M0001','P00022',2,40,'02/01/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10044,'M0003','P00023',2,50,'05/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10045,'M0005','P00028',2,30,'09/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10046,'M0007','P00025',3,40,'10/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10047,'M0009','P00026',3,60,'15/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10048,'M0011','P00024',4,50,'18/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10049,'M0013','P00027',3,60,'20/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10050,'M0015','P00030',1,70,'22/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10051,'M0017','P00034',1,55,'25/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10052,'M0019','P00033',4,45,'28/01/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10053,'M0021','P00032',1,50,'30/01/2022',0,'Sin Descripcion')  

INSERT INTO Citas VALUES(10054,'M0023','P00031',1,50,'03/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10055,'M0002','P00035',3,50,'07/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10056,'M0004','P00029',2,50,'10/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10057,'M0006','P00040',1,50,'12/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10058,'M0008','P00042',1,50,'15/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10059,'M0010','P00038',2,50,'20/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10060,'M0012','P00043',2,50,'21/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10061,'M0014','P00045',2,50,'24/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10062,'M0016','P00037',2,50,'27/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10063,'M0018','P00041',2,50,'28/02/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10064,'M0020','P00036',2,50,'28/02/2022',0,'Sin Descripcion')  

INSERT INTO Citas VALUES(10065,'M0022','P00044',2,50,'01/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10066,'M0023','P00039',2,50,'03/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10067,'M0001','P00001',2,50,'07/03/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10068,'M0003','P00002',3,50,'11/03/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10069,'M0008','P00003',1,30,'15/03/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10070,'M0001','P00004',1,20,'20/03/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10071,'M0002','P00005',2,40,'22/03/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10072,'M0004','P00006',2,50,'24/03/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10073,'M0003','P00023',2,50,'27/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10074,'M0005','P00028',2,30,'27/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10075,'M0007','P00025',3,40,'28/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10076,'M0009','P00026',3,60,'30/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10077,'M0011','P00024',4,50,'31/03/2022',0,'Sin Descripcion')  


INSERT INTO Citas VALUES(10078,'M0013','P00027',3,60,'03/04/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10079,'M0015','P00030',1,70,'05/04/2022',2,'Cita Anulada')  
INSERT INTO Citas VALUES(10080,'M0017','P00034',1,55,'09/04/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10081,'M0019','P00033',4,45,'12/04/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10082,'M0018','P00007',3,60,'14/04/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10083,'M0007','P00008',1,70,'16/04/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10084,'M0003','P00012',1,55,'18/04/2022',2,'Cita Anulada') 
INSERT INTO Citas VALUES(10085,'M0015','P00030',1,70,'21/04/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10086,'M0009','P00014',4,45,'23/04/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10087,'M0010','P00009',1,50,'25/04/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10088,'M0012','P00015',1,50,'28/04/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10089,'M0011','P00010',3,50,'29/04/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10090,'M0003','P00012',1,55,'30/04/2022',0,'Sin Descripcion') 


INSERT INTO Citas VALUES(10091,'M0011','P00015',1,50,'02/05/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10092,'M0015','P00010',3,50,'05/05/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10093,'M0018','P00013',2,50,'08/05/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10094,'M0023','P00011',1,50,'10/05/2022',2,'Cita Anulada') 
INSERT INTO Citas VALUES(10095,'M0021','P00016',1,50,'12/05/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10096,'M0019','P00018',2,50,'15/05/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10097,'M0011','P00020',2,50,'18/05/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10098,'M0002','P00017',2,50,'23/05/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10099,'M0010','P00021',2,50,'25/05/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10100,'M0004','P00019',2,50,'28/05/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10101,'M0004','P00006',2,50,'31/05/2022',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10102,'M0018','P00023',2,50,'02/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10103,'M0015','P00028',2,30,'05/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10104,'M0023','P00011',1,50,'08/06/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10105,'M0017','P00025',3,40,'14/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10106,'M0019','P00026',3,60,'18/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10107,'M0021','P00024',4,50,'19/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10108,'M0023','P00027',3,60,'21/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10109,'M0004','P00006',2,50,'23/06/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10110,'M0005','P00030',1,70,'24/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10111,'M0007','P00034',1,55,'27/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10112,'M0009','P00033',4,45,'28/06/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10113,'M0008','P00007',3,60,'30/06/2022',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10114,'M0017','P00008',1,70,'01/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10115,'M0013','P00012',1,55,'02/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10116,'M0023','P00030',1,70,'04/07/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10117,'M0019','P00014',4,45,'09/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10118,'M0020','P00009',1,50,'12/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10119,'M0008','P00007',3,60,'13/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10120,'M0022','P00015',1,50,'14/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10121,'M0021','P00001',2,50,'15/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10122,'M0023','P00002',3,50,'19/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10123,'M0018','P00003',1,30,'20/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10124,'M0021','P00004',1,20,'22/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10125,'M0012','P00005',2,40,'24/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10126,'M0014','P00006',2,50,'25/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10127,'M0007','P00007',3,60,'27/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10128,'M0013','P00008',3,40,'29/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10129,'M0016','P00012',3,10,'29/07/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10130,'M0003','P00014',1,20,'30/07/2022',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10131,'M0005','P00009',3,40,'03/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10132,'M0004','P00015',2,60,'05/08/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10133,'M0007','P00007',3,60,'08/08/2021',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10134,'M0024','P00003',1,30,'11/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10135,'M0026','P00004',1,20,'13/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10136,'M0027','P00046',2,40,'17/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10137,'M0029','P00006',2,50,'21/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10138,'M0028','P00007',3,60,'23/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10139,'M0024','P00048',3,40,'26/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10140,'M0028','P00049',3,10,'28/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10141,'M0027','P00047',1,20,'29/08/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10142,'M0025','P00009',3,40,'29/08/2022',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10143,'M0029','P00015',2,60,'01/09/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10144,'M0029','P00007',3,60,'05/09/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10145,'M0023','P00027',3,60,'08/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10146,'M0025','P00030',1,70,'08/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10147,'M0027','P00034',1,55,'10/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10148,'M0029','P00033',4,45,'12/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10149,'M0011','P00032',1,50,'14/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10150,'M0013','P00031',1,50,'15/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10151,'M0012','P00035',3,50,'18/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10152,'M0014','P00029',2,50,'20/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10153,'M0016','P00040',1,50,'21/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10154,'M0018','P00042',1,50,'24/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10155,'M0020','P00038',2,50,'25/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10156,'M0012','P00043',2,50,'28/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10157,'M0014','P00045',2,50,'30/09/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10158,'M0029','P00037',2,50,'30/09/2022',0,'Sin Descripcion')  
GO

INSERT INTO Citas VALUES(10159,'M0014','P00006',2,50,'01/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10160,'M0009','P00007',3,60,'04/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10161,'M0022','P00008',3,40,'08/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10162,'M0013','P00012',3,10,'13/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10163,'M0029','P00014',1,20,'16/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10164,'M0018','P00009',3,40,'16/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10165,'M0024','P00015',2,60,'18/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10166,'M0015','P00010',3,60,'20/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10167,'M0025','P00013',3,70,'20/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10168,'M0007','P00011',1,50,'23/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10169,'M0009','P00016',1,70,'26/10/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10170,'M0004','P00018',1,60,'26/10/2022',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10171,'M0002','P00020',1,60,'28/10/2022',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10172,'M0020','P00017',2,80,'30/10/2022',0,'Sin Descripcion')
GO
--------------------------------------------------------------------
INSERT INTO Citas VALUES(10173,'M0014','P00006',2,50,'02/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10174,'M0015','P00030',1,70,'03/11/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10175,'M0007','P00034',1,55,'04/11/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10176,'M0009','P00033',4,45,'04/11/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10177,'M0008','P00007',3,60,'08/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10178,'M0017','P00008',1,70,'09/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10179,'M0013','P00012',1,55,'11/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10180,'M0023','P00030',1,70,'14/11/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10181,'M0019','P00014',4,45,'17/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10182,'M0020','P00009',1,50,'19/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10183,'M0008','P00007',3,60,'21/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10184,'M0022','P00015',1,50,'22/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10185,'M0021','P00001',2,50,'24/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10186,'M0029','P00002',3,50,'24/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10187,'M0018','P00003',1,30,'26/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10188,'M0021','P00004',1,20,'27/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10189,'M0012','P00005',2,40,'28/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10190,'M0014','P00006',2,50,'28/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10191,'M0007','P00007',3,60,'29/11/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10192,'M0029','P00008',3,40,'30/11/2022',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10193,'M0016','P00012',3,10,'01/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10194,'M0003','P00014',1,20,'02/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10195,'M0005','P00009',3,40,'04/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10196,'M0004','P00015',2,60,'08/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10197,'M0007','P00007',3,60,'09/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10198,'M0020','P00009',1,50,'10/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10199,'M0008','P00007',3,60,'12/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10200,'M0022','P00015',1,50,'13/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10201,'M0021','P00001',2,50,'15/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10202,'M0023','P00002',3,50,'18/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10203,'M0018','P00003',1,30,'20/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10204,'M0061','P00001',2,50,'21/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10205,'M0063','P00002',3,50,'22/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10206,'M0058','P00003',1,30,'22/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10207,'M0051','P00004',1,20,'23/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10208,'M0052','P00005',2,40,'23/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10209,'M0054','P00006',2,50,'26/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10210,'M0059','P00007',3,60,'26/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10211,'M0052','P00008',3,40,'27/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10212,'M0053','P00012',3,10,'28/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10213,'M0049','P00014',1,20,'28/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10214,'M0048','P00009',3,40,'29/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10215,'M0044','P00015',2,60,'30/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10216,'M0045','P00010',3,60,'30/12/2022',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10217,'M0045','P00013',3,70,'30/12/2022',0,'Sin Descripcion') 


INSERT INTO Citas VALUES(10218,'M0037','P00011',1,50,'02/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10219,'M0039','P00016',1,70,'04/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10220,'M0034','P00018',1,60,'05/01/2023',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10221,'M0012','P00020',1,60,'08/01/2023',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10222,'M0010','P00017',2,80,'10/01/2023',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10223,'M0025','P00021',2,50,'11/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10224,'M0040','P00019',1,30,'14/01/2023',0,'Sin Descripcion')
INSERT INTO Citas VALUES(10225,'M0056','P00001',2,40,'18/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10226,'M0046','P00002',2,50,'19/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10227,'M0033','P00003',2,30,'20/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10228,'M0037','P00004',3,40,'21/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10229,'M0038','P00005',3,60,'22/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10230,'M0024','P00006',4,50,'22/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10231,'M0028','P00007',3,60,'24/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10232,'M0027','P00008',1,70,'25/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10233,'M0023','P00012',1,55,'25/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10234,'M0029','P00014',4,45,'27/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10235,'M0030','P00009',1,50,'27/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10236,'M0032','P00015',1,50,'28/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10237,'M0031','P00010',3,50,'28/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10238,'M0031','P00013',2,50,'29/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10239,'M0035','P00011',1,50,'29/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10240,'M0039','P00016',1,50,'30/01/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10241,'M0041','P00018',2,50,'31/01/2023',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10242,'M0042','P00020',2,50,'01/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10243,'M0041','P00017',2,50,'03/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10244,'M0042','P00021',2,50,'03/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10245,'M0043','P00019',2,50,'07/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10246,'M0051','P00022',2,40,'10/02/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10247,'M0053','P00023',2,50,'14/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10248,'M0055','P00028',2,30,'16/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10249,'M0057','P00025',3,40,'20/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10250,'M0059','P00026',3,60,'22/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10251,'M0061','P00024',4,50,'23/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10252,'M0063','P00027',3,60,'24/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10253,'M0062','P00030',1,70,'25/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10254,'M0061','P00034',1,55,'26/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10255,'M0059','P00033',4,45,'27/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10256,'M0041','P00032',1,50,'28/02/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10257,'M0023','P00031',1,50,'28/02/2023',0,'Sin Descripcion')  


INSERT INTO Citas VALUES(10258,'M0062','P00035',3,50,'01/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10259,'M0004','P00029',2,50,'01/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10260,'M0016','P00040',1,50,'02/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10261,'M0008','P00042',1,50,'03/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10262,'M0010','P00038',2,50,'05/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10263,'M0012','P00043',2,50,'07/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10264,'M0014','P00045',2,50,'10/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10265,'M0016','P00037',2,50,'12/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10266,'M0018','P00041',2,50,'12/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10267,'M0020','P00036',2,50,'15/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10268,'M0022','P00044',2,50,'15/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10269,'M0023','P00039',2,50,'17/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10270,'M0001','P00001',2,50,'18/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10271,'M0003','P00002',3,50,'18/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10272,'M0008','P00003',1,30,'20/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10273,'M0001','P00004',1,20,'21/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10274,'M0002','P00005',2,40,'16/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10275,'M0004','P00006',2,50,'18/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10276,'M0003','P00023',2,50,'18/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10277,'M0005','P00028',2,30,'20/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10278,'M0007','P00025',3,40,'20/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10279,'M0009','P00026',3,60,'21/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10280,'M0011','P00024',4,50,'23/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10281,'M0013','P00027',3,60,'23/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10282,'M0015','P00030',1,70,'24/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10283,'M0017','P00034',1,55,'25/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10284,'M0019','P00033',4,45,'26/03/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10285,'M0018','P00007',3,60,'28/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10286,'M0007','P00008',1,70,'28/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10287,'M0003','P00012',1,55,'29/03/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10288,'M0015','P00030',1,70,'30/03/2022',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10289,'M0009','P00014',4,45,'31/03/2023',0,'Sin Descripcion') 

INSERT INTO Citas VALUES(10290,'M0010','P00009',1,50,'01/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10291,'M0012','P00015',1,50,'03/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10292,'M0011','P00010',3,50,'03/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10293,'M0003','P00012',1,55,'05/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10294,'M0011','P00015',1,50,'07/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10295,'M0015','P00010',3,50,'07/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10296,'M0018','P00013',2,50,'10/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10297,'M0023','P00011',1,50,'12/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10298,'M0021','P00016',1,50,'12/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10299,'M0019','P00018',2,50,'15/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10300,'M0011','P00020',2,50,'15/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10301,'M0002','P00017',2,50,'17/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10302,'M0010','P00021',2,50,'17/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10303,'M0004','P00019',2,50,'19/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10304,'M0004','P00006',2,50,'19/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10305,'M0018','P00023',2,50,'20/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10306,'M0015','P00028',2,30,'22/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10307,'M0023','P00011',1,50,'23/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10308,'M0017','P00025',3,40,'24/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10309,'M0019','P00026',3,60,'24/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10310,'M0021','P00024',4,50,'25/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10311,'M0023','P00027',3,60,'26/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10312,'M0004','P00006',2,50,'28/04/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10313,'M0005','P00030',1,70,'29/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10314,'M0007','P00034',1,55,'29/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10315,'M0009','P00033',4,45,'30/04/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10316,'M0008','P00007',3,60,'30/04/2023',0,'Sin Descripcion')
GO

 
INSERT INTO Citas VALUES(10317,'M0017','P00008',1,70,'02/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10318,'M0013','P00012',1,55,'03/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10319,'M0023','P00030',1,70,'06/05/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10320,'M0019','P00014',4,45,'08/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10321,'M0020','P00009',1,50,'10/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10322,'M0008','P00007',3,60,'12/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10323,'M0022','P00015',1,50,'12/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10324,'M0021','P00001',2,50,'14/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10325,'M0023','P00002',3,50,'16/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10326,'M0018','P00003',1,30,'17/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10327,'M0021','P00004',1,20,'17/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10328,'M0012','P00005',2,40,'20/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10329,'M0014','P00006',2,50,'21/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10330,'M0007','P00007',3,60,'22/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10331,'M0013','P00008',3,40,'24/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10332,'M0016','P00012',3,10,'24/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10333,'M0003','P00014',1,20,'26/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10334,'M0005','P00009',3,40,'27/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10335,'M0004','P00015',2,60,'28/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10336,'M0007','P00007',3,60,'28/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10337,'M0017','P00008',1,70,'29/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10338,'M0013','P00012',1,55,'30/05/2023',0,'Sin Descripcion') 
INSERT INTO Citas VALUES(10339,'M0023','P00030',1,70,'31/05/2023',0,'Sin Descripcion')  
INSERT INTO Citas VALUES(10340,'M0019','P00014',4,45,'31/05/2023',0,'Sin Descripcion') 
GO

--------------------------------------------------------------------
UPDATE C
	SET pago=E.costo
FROM Citas C INNER JOIN Medicos M 
    ON C.codmed=M.codmed
		INNER JOIN Especialidad E
		ON M.codesp=E.codesp
GO

SET NOCOUNT OFF
GO

-- Actualizando la descripcion	
UPDATE Citas
	SET estado=1,
	    descrip='Faringitis Aguda'
WHERE nrocita%3=0 and nrocita%7<>0
GO	

UPDATE Citas
	SET estado=1,
	    descrip='Gripe Aguda'
WHERE nrocita%7=0 and nrocita%3<>0
GO	

UPDATE Citas
	SET estado=1,
	    descrip='Asma principios'
WHERE nrocita%2=0 and nrocita%2 not in(4,6,8) 
GO	

UPDATE Citas
	SET estado=1,
	    descrip='Diabetes principios'
WHERE nrocita%8=0 and nrocita%2 not in(2,4) 
GO	

UPDATE Citas
	SET estado=1,
	    descrip='Poliomielitis'
WHERE nrocita%5=0
GO	

SET NOCOUNT OFF
GO

PRINT 'BASE DE DATOS: BDCLINICA2023, CREADA CORRECTAMENTE'
PRINT 'FECHA:'+CONVERT(VARCHAR(20),GETDATE())
GO
SELECT MENSAJE='BASE DE DATOS: BDCLINICA2023, CREADA CORRECTAMENTE '
UNION ALL
SELECT 'FECHA:'+CONVERT(VARCHAR(20),GETDATE())
GO


 



