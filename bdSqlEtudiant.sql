SQL> clear screen
SQL> connect as sysdba
Enter user-name: louis
Connected.
SQL> show user
USER is "SYS"
SQL> create user scolarité identified by scolarite ;

User created.

SQL> grant dba to scolarite identified by scolarite;

Grant succeeded.

SQL> connect
Enter user-name: scolarite
Connected.



SQL> create table Etudiant (
  2  numetu number(6) not null primary key,
  3  datenais date,
  4  rue varchar(120),
  5  cp varchar(10),
  6  ville varchar(120)
  7  );

Table created.

SQL> desc etudiant
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMETU                                    NOT NULL NUMBER(6)
 DATENAIS                                           DATE
 RUE                                                VARCHAR2(120)
 CP                                                 VARCHAR2(10)
 VILLE                                              VARCHAR2(120)




SQL> create table Matiere(
  2  codemat number(6) not null primary key,
  3  libelle varchar(120) not null,
  4  coef number(3,2) not null
  5  );

Table created.

SQL> desc matiere
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CODEMAT                                   NOT NULL NUMBER(6)
 LIBELLE                                   NOT NULL VARCHAR2(120)
 COEF                                      NOT NULL NUMBER(3,2)

SQL> clear screen
SQL> create table epreuve(
  2  numepreuve number(6) not null primary key,
  3  datepreuve date not null,
  4  lieu varchar(60) not null
  5  ,
  6  codemat number(6),
  7  foreign key(codemat) references matiere(codemat)
  8  );

Table created.

SQL> desc epreuve
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMEPREUVE                                NOT NULL NUMBER(6)
 DATEPREUVE                                NOT NULL DATE
 LIEU                                      NOT NULL VARCHAR2(60)
 CODEMAT                                            NUMBER(6)

SQL> alter table epreuve modify codemat not null;

Table altered.

SQL> desc epreuve
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMEPREUVE                                NOT NULL NUMBER(6)
 DATEPREUVE                                NOT NULL DATE
 LIEU                                      NOT NULL VARCHAR2(60)
 CODEMAT                                   NOT NULL NUMBER(6)

SQL> clear screen
SQL> create table notation(
  2  numetu number(6) not null,
  3  numepreuve number(6) not null,
  4  note number(6) not null,
  5  foreign key(numetu) references etudiant(numetu),
  6  foreign key(numepreuve) references epreuve(numepreuve),
  7  primary key(numetu, numepreuve)
  8  );

Table created.

SQL> desc notation
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMETU                                    NOT NULL NUMBER(6)
 NUMEPREUVE                                NOT NULL NUMBER(6)
 NOTE                                      NOT NULL NUMBER(6)








SQL> insert into etudiant values(1, '01/05/1996', '7em rue C1', '5000', 'Monastir', 'Stephane ALINGA');

1 row created.

SQL> insert into etudiant values(58, '08/06/1998', '6em rue Stah jabeur', '5000', 'Monastir', 'Lucas');

1 row created.

SQL> insert into etudiant values(59, '01/03/2002', '7em rue Habib Bourgiba', '4923', 'Sousse', 'Ameni');

1 row created.




SQL> insert into etudiant values(32, '02/04/2001', '4em rue jane', '825', 'Paris', 'Lise');

1 row created.


SQL> select * from etudiant;

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
         1 01/05/96                                                             
7em rue C1                                                                      
5000                                                                            

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Monastir                                                                        
Stephane ALINGA                                                                 
                                                                                

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
        58 08/06/98                                                             
6em rue Stah jabeur                                                             
5000                                                                            

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Monastir                                                                        
Lucas                                                                           
                                                                                

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
        59 01/03/02                                                             
7em rue Habib Bourgiba                                                          
4923                                                                            

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Sousse                                                                          
Ameni                                                                           
                                                                                

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
        32 02/04/01                                                             
4em rue jane                                                                    
825                                                                             

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Paris                                                                           
Lise                                                                            
                                                                                

SQL> select * from etudiant order by etudiant.nom desc
  2  ;

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
         1 01/05/96                                                             
7em rue C1                                                                      
5000                                                                            

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Monastir                                                                        
Stephane ALINGA                                                                 
                                                                                

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
        58 08/06/98                                                             
6em rue Stah jabeur                                                             
5000                                                                            

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Monastir                                                                        
Lucas                                                                           
                                                                                

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
        32 02/04/01                                                             
4em rue jane                                                                    
825                                                                             

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Paris                                                                           
Lise                                                                            
                                                                                

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
        59 01/03/02                                                             
7em rue Habib Bourgiba                                                          
4923                                                                            

    NUMETU DATENAIS                                                             
---------- --------                                                             
RUE                                                                             
--------------------------------------------------------------------------------
CP                                                                              
----------                                                                      
VILLE                                                                           
--------------------------------------------------------------------------------
NOM                                                                             
------------------------------------------------------------                    
Sousse                                                                          
Ameni                                                                           
                                                                                

SQL> select nom from etudiant order by etudiant.nom desc
  2  ;

NOM                                                                             
------------------------------------------------------------                    
Stephane ALINGA                                                                 
Lucas                                                                           
Lise                                                                            
Ameni                                                                           

SQL> clear screen
SQL> insert into matiere values(153, 'Mathematique pour ingenieur', 0.27);

1 row created.

SQL> insert into matiere values(205, 'Science de ingenieur', 0.30);

1 row created.

SQL> select libelle, coef*100 from matiere;

LIBELLE                                                                         
--------------------------------------------------------------------------------
  COEF*100                                                                      
----------                                                                      
Mathematique pour ingenieur                                                     
        27                                                                      
                                                                                
Science de ingenieur                                                            
        30                                                                      
                                                                                

SQL> select nom from etudiant where etudiant.ville='Monastir';

NOM                                                                             
------------------------------------------------------------                    
Stephane ALINGA                                                                 
Lucas                                                                           

SQL> select note from notation where notation.note>=10;

no rows selected

SQL> clear screen
SQL> desc epreuve
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMEPREUVE                                NOT NULL NUMBER(6)
 DATEPREUVE                                NOT NULL DATE
 LIEU                                      NOT NULL VARCHAR2(60)
 CODEMAT                                   NOT NULL NUMBER(6)




SQL> desc matiere
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CODEMAT                                   NOT NULL NUMBER(6)
 LIBELLE                                   NOT NULL VARCHAR2(120)
 COEF                                      NOT NULL NUMBER(3,2)

SQL> alter table epreuve modify codemat number(3,2);

Table altered.




SQL> select  codemat from matiere
  2  ;

   CODEMAT                                                                      
----------                                                                      
       153                                                                      
       205                                                                      




 


SQL> desc epreuve
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMEPREUVE                                NOT NULL NUMBER(6)
 DATEPREUVE                                NOT NULL DATE
 LIEU                                      NOT NULL VARCHAR2(60)
 CODEMAT                                   NOT NULL NUMBER(3,2)

SQL> alter table epreuve modify codemat number(6);

Table altered.

SQL> insert into epreuve values(1524, '12/05/2022', 'Monastir', 205)
  2  ;

1 row created.

SQL> insert into epreuve values(253, '02/06/2023', 'Sousse', 153);

1 row created.

SQL> desc notation
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMETU                                    NOT NULL NUMBER(6)
 NUMEPREUVE                                NOT NULL NUMBER(6)
 NOTE                                      NOT NULL NUMBER(6)

 


SQL> select etudiant.numetu, epreuve.numepreuve from etudiant, epreuve;

    NUMETU NUMEPREUVE                                                           
---------- ----------                                                           
         1       1524                                                           
        58       1524                                                           
        59       1524                                                           
        32       1524                                                           
         1        253                                                           
        58        253                                                           
        59        253                                                           
        32        253                                                           

8 rows selected.

SQL> insert into notation values (1, 1524, 12);

1 row created.

SQL> insert into notation values (58, 253, 15);

1 row created.

SQL> insert into notation values (59, 1524, 9);

1 row created.

SQL> insert into notation values (32, 253, 7);

1 row created.

SQL> select note from notation where notation.note>=10;

      NOTE                                                                      
----------                                                                      
        12                                                                      
        15                                                                      

SQL> select datepreuve from epreuve;

DATEPREU                                                                        
--------                                                                        
12/05/22                                                                        
02/06/23                                                                        




SQL> select * from epreuve where datepreuve <= '01/09/2021' and datepreuve >= '03/09/2022';

no rows selected

SQL> select * from epreuve where datepreuve >= '01/09/2021' and datepreuve <= '03/09/2022';

NUMEPREUVE DATEPREU LIEU                                                        
---------- -------- ------------------------------------------------------------
   CODEMAT                                                                      
----------                                                                      
      1524 12/05/22 Monastir                                                    
       205                                                                      
                                                                                

SQL> select sum(coef) from matiere ;

 SUM(COEF)                                                                      
----------                                                                      
       ,57                                                                      

SQL> select sum(coef*100) from matiere ;

SUM(COEF*100)                                                                   
-------------                                                                   
           57                                                                   

SQL> select count(*) from epreuve
  2  ;

  COUNT(*)                                                                      
----------                                                                      
         2                                                                      

SQL> select * from epreuve;

NUMEPREUVE DATEPREU LIEU                                                        
---------- -------- ------------------------------------------------------------
   CODEMAT                                                                      
----------                                                                      
      1524 12/05/22 Monastir                                                    
       205                                                                      
                                                                                
       253 02/06/23 Sousse                                                      
       153                                                                      
                                                                                

SQL> clear
SQL> clear screen
SQL> desc epreuve
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMEPREUVE                                NOT NULL NUMBER(6)
 DATEPREUVE                                NOT NULL DATE
 LIEU                                      NOT NULL VARCHAR2(60)
 CODEMAT                                   NOT NULL NUMBER(6)

 


SQL> desc matiere
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CODEMAT                                   NOT NULL NUMBER(6)
 LIBELLE                                   NOT NULL VARCHAR2(120)
 COEF                                      NOT NULL NUMBER(3,2)

SQL> select epreuve.numepreuve, epreuve.datepreuve, epreuve.lieu, matiere.libelle from epreuve, matiere where matiere.codemat = epreuve.codemat;

NUMEPREUVE DATEPREU LIEU                                                        
---------- -------- ------------------------------------------------------------
LIBELLE                                                                         
--------------------------------------------------------------------------------
       253 02/06/23 Sousse                                                      
Mathematique pour ingenieur                                                     
                                                                                
      1524 12/05/22 Monastir                                                    
Science de ingenieur                                                            
                                                                                

SQL> spool off
