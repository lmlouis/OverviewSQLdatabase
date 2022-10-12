# Overview oracle SQL*Plus 

création d'une base de données [`scoralité`](bdSqlEtudiant.sql) qui contient les tables 

* Etudiants(numetu, nom, prenom, datanais, rue, cp, ville)
* Matiere(codemat, libelle, coef)
* Epreuve(numepreuve, datepreuve, lieu, codemat#)
* Notation(numetu#, numepreuve#, note)

Ensuite effectuer quelques requetes SQL pour intérroger la base de données 

## pre-requis:
* Environement : Linux (ubunut 22.04)
* SGBD SQL : Oracle Xe  11g (SQL*Plus)
* Langage SQL

Voici la trace du travail :   [`click-me`](bdSqlEtudiant.sql)
  
---

## Comment utiliser SQL sur Oracle 

Voici quelques commande pour utiliser Oracle SQL*plus 

### Se connecter à SQL*Plus
login
```
sqlplus
```
se connecter en tant que `sys`
```
sqlplus as sysdba
```
### Créer un utilisateur dba d'une base de données 

```
create user [Username] identified by [Password]
```
### donner le privilège dba à l'utilisateur 

```
grant dba to [Username] identified by [Password]
```

Donner le role sysdba à un utilisateur 
```
grant sysdba to louis
```
Voir la liste de tous les utilisateurs
```
select * from all_users;
```

Se connecter à un utilisateur 

```
connect; 
```

### Enregistrer une trace de son travail 
demarrer 
```
spool filename 
```
stopper 
```
spool off 
```

## Interrogation de la base de données 

1) Liste de tous les etudiants 

```
select * from etudiant;
```

2) Liste de tous les etudiants classé par ordre alphabetique inverse 
```
select * from etudiant order by etudiant.nom desc;
```
3) Libellée et coefficient(%) de chaque matière
   
```
select libelle, coef*100 from matiere;
```
4) Noms et prenoms  des étudiants 
   
```
select nom from etudiant;
```

5) Noms et prenoms  des étudiants domiciliés à Monastir 
   
```
select nom from etudiant where etudiant.ville='Monastir';
```

6) Liste des notes >= 10
   
```
select note from notation where notation.note>=10;
```

7) Liste des épreuves  dont la date se situe entre 1er septembre 2021 et 30 septembre 2022

```
select * from epreuve where datepreuve >= '01/09/2021' and datepreuve <= '03/09/2022';
```
8) Somme des coef de toute les matières 

```
select sum(coef*100) from matiere ;
```

9) Nombre Total d'épreuves
```
select count(*) from epreuve;
```

11) Liste des epreuves avec numero , date, lieu et libelle de la matière 

```
select epreuve.numepreuve, epreuve.datepreuve, epreuve.lieu, matiere.libelle from epreuve, matiere where matiere.codemat = epreuve.codemat;
```

