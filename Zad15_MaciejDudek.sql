-- Zad.0 
CREATE TABLE Linie
(
    Nr_linii integer PRIMARY KEY,
    rodzaj varchar(20)
);

CREATE TABLE Autobusy
(
    Nr_aut integer PRIMARY KEY,
    Nr_linii REFERENCES Linie (Nr_linii),
    Kierowca varchar(20)
);

CREATE TABLE Przystanki
(
    Nr_przyst integer PRIMARY KEY,
    Nazwa_ulicy varchar(20)
);

 CREATE TABLE Przyst_linii
 (
    Nr_linii integer REFERENCES Linie (Nr_linii), 
    Nr_przyst integer REFERENCES Przystanki (Nr_przyst), 
    Nr_kolejny integer
 );
    
INSERT INTO Linie VALUES (57, 'nocna'); 
INSERT INTO Linie VALUES (66, 'dzienna');
INSERT INTO Linie VALUES (86, 'dzienna');
INSERT INTO Linie VALUES (52, 'dzienna');
INSERT INTO Linie VALUES (64, 'nocna');
INSERT INTO Linie VALUES (80, 'dzienna');

INSERT INTO Autobusy VALUES (3553, 64, 'Kowalski');
INSERT INTO Autobusy VALUES (3452, 80, 'Andrzejczak');
INSERT INTO Autobusy VALUES (3501, 57, 'Martyniuk');
INSERT INTO Autobusy VALUES (3253, 52, 'Macierz');

INSERT INTO Przystanki VALUES (1, 'Kwiatowa');
INSERT INTO Przystanki VALUES (2, 'Akacjowa');
INSERT INTO Przystanki VALUES (3, 'Nowodworska');
INSERT INTO Przystanki VALUES (4, 'Polska');
INSERT INTO Przystanki VALUES (5, 'Macierzowa');

INSERT INTO Przyst_linii VALUES (64, 2, 4);
INSERT INTO Przyst_linii VALUES (57, 1, 5);
INSERT INTO Przyst_linii VALUES (52, 1, 5);
INSERT INTO Przyst_linii VALUES (64, 4, 1);
INSERT INTO Przyst_linii VALUES (57, 5, 2);    

-- Zad.1
CREATE VIEW Puste_przystanki AS
    SELECT *
    FROM Przystanki 
    WHERE Nr_przyst NOT IN 
        ( SELECT Nr_przyst FROM Przyst_linii );
        
-- Zad.2
SELECT 'tak' AS odpowiedz FROM Przystanki
    JOIN Przyst_linii USING (Nr_przyst)
    WHERE EXISTS 
        ( SELECT * FROM Przystanki JOIN Przyst_linii USING (Nr_przyst)
            WHERE Nazwa_ulicy='Kwiatowa' AND Nr_linii=5 )
UNION
SELECT 'nie' AS odpowiedz FROM Przystanki
    JOIN Przyst_linii USING (Nr_przyst)
    WHERE NOT EXISTS 
        (SELECT * FROM Przystanki JOIN Przyst_linii USING (Nr_przyst)
            WHERE Nazwa_ulicy='Kwiatowa' AND Nr_linii=5 
        );

-- Zad.3 
CREATE VIEW LinieNaPrzystankach AS
    SELECT Przystanki.Nr_przyst, Przystanki.nazwa_ulicy, Linie.Nr_linii, Linie.rodzaj
    FROM Przystanki JOIN Przyst_linii ON Przystanki.Nr_przyst = Przyst_linii.Nr_przyst 
                    JOIN Linie ON Przyst_linii.Nr_Linii = Linie.Nr_linii;
                    
-- Zad.4 
CREATE VIEW InfoKierowcy AS
    SELECT Autobusy.kierowca, Linie.rodzaj
    FROM Autobusy JOIN Linie USING (Nr_linii);

-- Zad.5 
CREATE SEQUENCE Numeracja 
    START WITH 52
    INCREMENT BY 1;
    
-- Zad.6 
INSERT INTO Autobusy (Nr_aut, Nr_linii, Kierowca) 
    VALUES (Numeracja.NEXTVAL, 66, 'Jankowski');