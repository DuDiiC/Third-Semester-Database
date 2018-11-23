-- PROBLEM 1
-- Zad.0    
CREATE TABLE Wyk_prac (
    p_id integer PRIMARY KEY,
    d_id integer,
    imie varchar(50),
    nazwisko varchar(50), 
    pensja integer );
    
CREATE TABLE Wyk_dzial (
    d_id integer PRIMARY KEY,
    k_id integer REFERENCES Wyk_prac (p_id),
    nazwa varchar(100) );
    
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('1','2','Zelda','Oleg','9428');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('2','4','Caesar','Miranda','2694');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('3','2','Sloane','Renee','5781');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('4','1','Joel','Grady','9203');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('5','4','Hunter','Ignatius','7228');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('6','4','Lacey','Pandora','9530');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('7','2','Olga','Zephr','8773');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('8','4','Constance','Cassady','4000');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('9','2','Tanner','Chancellor','3964');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('10','3','Shelly','Fritz','9541');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('11','3','Britanni','Hunter','4520');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('12','1','Rafael','Colleen','5819');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('13','1','Marah','Brody','7127');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('14','2','Stephanie','Leandra','5506');
INSERT INTO Wyk_prac (p_id,d_id,imie,nazwisko,pensja) VALUES ('15','1','Latifah','Edan','2355');

INSERT INTO Wyk_dzial (d_id,k_id,nazwa) VALUES ('1','11','Pierwszy');
INSERT INTO Wyk_dzial (d_id,k_id,nazwa) VALUES ('2','8','Drugi');
INSERT INTO Wyk_dzial (d_id,k_id,nazwa) VALUES ('3','1','Trzeci');
INSERT INTO Wyk_dzial (d_id,k_id,nazwa) VALUES ('4','14','Czwarty');
INSERT INTO Wyk_dzial (d_id,k_id,nazwa) VALUES ('5','12','Piaty');

-- Zad.1 
SELECT SUM(p.pensja), d.nazwa 
    FROM Wyk_prac p JOIN Wyk_dzial d ON d.d_id = p.d_id
    GROUP BY d.nazwa
    ORDER BY SUM(p.pensja);

-- Zad.2 (nie wyswietla pieciu, bo moze byc tak, ze kierownik nie ma pod soba pracownikow)
SELECT p1.imie, p1.nazwisko, AVG(p2.pensja) AS srednia_pensja_w_dziale
    FROM Wyk_prac p1 JOIN Wyk_dzial d 
    ON p1.p_id = d.k_id JOIN Wyk_prac p2
    ON d.d_id = p2.d_id
    GROUP BY (p1.imie, p1.nazwisko);
    
-- Zad.3
SELECT * FROM Wyk_prac
    WHERE d_id IN -- = to jeden wynik, IN to wiecej wynikow
        ( SELECT d_id FROM Wyk_dzial 
        WHERE k_id IN 
            ( SELECT p_id FROM Wyk_prac
            WHERE imie='Constance' AND nazwisko='Cassady'
            )
        );
        
-- Zad.4
-- a)
SELECT SUM(p1.pensja) FROM Wyk_prac p1
    GROUP BY p1.d_id
    HAVING p1.d_id IN
        ( SELECT d.d_id FROM Wyk_dzial d
        JOIN Wyk_prac p2 ON d.k_id=p2.p_id
        WHERE p2.imie='Constance' AND p2.nazwisko='Cassady'
        );
    
-- a) v2
SELECT SUM(pensja) FROM Wyk_prac
    GROUP BY d_id
    HAVING d_id IN 
        ( SELECT d_id FROM Wyk_dzial 
        WHERE k_id IN 
            ( SELECT p_id FROM Wyk_prac
            WHERE imie='Constance' AND nazwisko='Cassady'
            )
        );
        
-- b)
SELECT SUM(pensja) FROM Wyk_prac
    WHERE d_id IN 
        ( SELECT d_id FROM Wyk_dzial 
        WHERE k_id IN
            ( SELECT p_id FROM Wyk_prac
            WHERE imie='Constance' AND nazwisko='Cassady'
            )
        );
    --GROUP BY d_id; zbedne, bo tylko jedno wyswietlamy, wiec domyslnie po tym sortuje
    
-- Zad.5  operatory teorii zbiorow (NIE DZIALA)
SELECT d.nazwa, SUM(p.pensja), COUNT(p.p_id), 'najwiecej pracownikow' AS opis 
    FROM Wyk_dzial d JOIN Wyk_prac p
        ON d.d_id=p.d_id
    WHERE ??? = 
        ( SELECT MAX(ilosc) FROM 
            ( SELECT COUNT(*) AS ilosc FROM Wyk_prac
            GROUP BY d_id
            )
        )
    GROUP BY d.nazwa;
UNION
SELECT ;

-- pomoc
SELECT d.nazwa, SUM(p.pensja), COUNT(p.p_id) 
    FROM Wyk_dzial d JOIN Wyk_prac p
        ON d.d_id=p.d_id
    GROUP BY d.nazwa;

