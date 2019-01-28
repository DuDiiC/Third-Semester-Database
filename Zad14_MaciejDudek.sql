-- Zad.0 
CREATE TABLE Dziela (
    kod integer PRIMARY KEY,
    tytul varchar(50),
    nazwa_autora varchar(50)
);

CREATE TABLE Czytelnicy (
    numer integer PRIMARY KEY,
    imie varchar(50),
    nazwisko varchar(50),
    adres varchar(200),
    quota integer
);

CREATE TABLE Egzemplarze (
    numer integer PRIMARY KEY,
    kod_dziela integer REFERENCES Dziela (kod),
    numer_wypozycz integer REFERENCES Czytelnicy(numer)
);

-- dane do tabeli Dziela (15)
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('1','fringilla.','Adam Mickiewicz');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('2','egestas ligula.','Adam Mickiewicz');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('3','neque sed','Adam Mickiewicz');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('4','magnis dis','Adam Asnyk');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('5','Fusce','Adam Asnyk');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('6','a nunc.','Dillon');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('7','turpis. In condimentum.','Hammett');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('8','Fusce aliquam,','Devin');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('9','enim non nisi.','Amir');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('10','Sed','Quinn');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('11','elit. Aliquam auctor,','Tanisha');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('12','Cum sociis natoque','Dorian');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('13','odio semper','Brooke');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('14','augue','Jamalia');
INSERT INTO Dziela (kod,tytul,nazwa_autora) VALUES ('15','Ut semper pretium','Wyatt');

-- dane do tabeli Czytelnicy (20)
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('1','Armando','Medge','ON','3');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('2','Ora','Dorothy','Nunavut','9');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('3','Kay','Michael','NB','3');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('4','Brett','Jennifer','MB','6');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('5','Uriah','Nathan','Maine','1');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('6','Maryam','Indigo','Nova Scotia','3');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('7','Lysandra','Cheryl','OR','2');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('8','Cleo','Uta','PE','2');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('9','Idona','Kennan','Illinois','6');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('10','Nathan','Jasper','MD','1');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('11','Lester','Drew','Delaware','3');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('12','Audra','Barbara','New Brunswick','3');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('13','Ria','Vance','Prince Edward Island','9');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('14','Echo','Frances','Arizona','4');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('15','Francesca','Cheyenne','OH','5');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('16','Reed','Judah','Arkansas','6');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('17','Zena','Samson','Manitoba','10');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('18','Tasha','Heather','KY','8');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('19','Kerry','TaShya','SK','4');
INSERT INTO Czytelnicy (numer,imie,nazwisko,adres,quota) VALUES ('20','Carly','Yvonne','Yukon','1');

-- dane do tabeli Egzemplarze (100, gdzie 15 jest wypozyczonych)
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('1','9', '1');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('2','12', '1');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('3','5', '2');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('4','15', '2');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('5','8', '2');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('6','10', '2');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('7','10', '2');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('8','11', '3');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('9','13', '4');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('10','11', '4');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('11','2', '4');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('12','4', '4');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('13','11', '4');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('14','15', '5');
INSERT INTO Egzemplarze (numer,kod_dziela, numer_wypozycz) VALUES ('15','3', '5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('16','4');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('17','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('18','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('19','11');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('20','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('21','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('22','13');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('23','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('24','5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('25','3');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('26','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('27','13');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('28','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('29','3');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('30','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('31','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('32','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('33','5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('34','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('35','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('36','13');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('37','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('38','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('39','8');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('40','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('41','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('42','10');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('43','3');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('44','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('45','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('46','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('47','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('48','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('49','5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('50','10');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('51','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('52','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('53','8');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('54','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('55','10');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('56','10');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('57','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('58','8');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('59','10');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('60','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('61','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('62','11');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('63','5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('64','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('65','3');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('66','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('67','4');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('68','4');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('69','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('70','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('71','3');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('72','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('73','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('74','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('75','6');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('76','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('77','11');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('78','5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('79','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('80','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('81','15');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('82','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('83','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('84','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('85','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('86','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('87','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('88','3');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('89','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('90','11');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('91','12');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('92','10');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('93','7');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('94','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('95','1');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('96','9');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('97','2');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('98','5');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('99','13');
INSERT INTO Egzemplarze (numer,kod_dziela) VALUES ('100','9');

-- Zad.1
SELECT e.numer, c.imie, c.nazwisko 
    FROM Czytelnicy c
        JOIN Egzemplarze e ON c.numer = e.numer_wypozycz;

-- Zad.2
SELECT COUNT(*) FROM Egzemplarze
    WHERE numer_wypozycz IS NULL;

-- Zad.3
SELECT AVG(COUNT(*)) FROM Egzemplarze e
    JOIN Dziela d ON d.kod=e.kod_dziela
    WHERE d.nazwa_autora LIKE 'Adam Asnyk'
    GROUP BY d.tytul;

-- Zad.4
SELECT d.* FROM Dziela d
    WHERE NOT EXISTS 
        ( SELECT e.kod_dziela FROM Egzemplarze e
            WHERE d.kod = e.kod_dziela
        );

-- Zad.5


-- Zad.6


-- Zad.7


-- Zad.8


-- Zad.9

