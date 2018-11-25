-- Zad.0
CREATE TABLE Autor (
    a_id integer PRIMARY KEY,
    imie varchar(100),
    nazwisko varchar(100),
    rok_urodzenia integer
    );

CREATE TABLE Ksiazka (
    k_id integer PRIMARY KEY,
    a_id integer REFERENCES Autor (a_id),
    tytul varchar(200),
    jezyk_oryginalny varchar(50),
    tematyka varchar(100)
    );

CREATE TABLE Egzemplarz (
    sygnatura integer PRIMARY KEY,
    e_id integer REFERENCES Ksiazka (k_id),
    rok_wydania integer,
    ISBN varchar(17),
    wydawnictwo varchar(100),
    jezyk varchar(50)
    );
    
-- dodanie autorow
INSERT INTO Autor (a_id,imie,nazwisko,rok_urodzenia) 
    VALUES (1, 'Remigiusz', 'Mroz', 1987);
INSERT INTO Autor (a_id,imie,nazwisko,rok_urodzenia) 
    VALUES (2, 'Andrzej', 'Pilipiuk', 1974);
INSERT INTO Autor (a_id,imie,nazwisko,rok_urodzenia) 
    VALUES (3, 'Jacek', 'Piekara', 1965);
INSERT INTO Autor (a_id,imie,nazwisko,rok_urodzenia) 
    VALUES (4, 'Witold', 'Gombrowicz', 1904);
INSERT INTO Autor (a_id,imie,nazwisko,rok_urodzenia) 
    VALUES (5, 'Jaroslaw', 'Grzedowicz', 1965);

-- dodanie ksiazek
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(3, 4, 'Ferdydurke', 'polski', 'groteska');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(7, 4, 'Trans-Atlantyk', 'polski', 'groteska');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(5, 2, 'Wieszac kazdy moze', 'polski', 'fantastyka');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(34, 2, 'Droga do Nidaros', 'polski', 'fantastyka');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(43, 2, 'Litr cieklego olowiu', 'polski', 'opowiadania');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(37, 2, '2586 krokow', 'polski', 'opowiadania');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(29, 2, 'Wampir z KC', 'polski', 'fantastyka');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(31, 2, 'Rzeznik drzew', 'polski', 'opowiadania');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(1, 1, 'Ekspozycja', 'polski', 'kryminal');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(6, 1, 'Kasacja', 'polski', 'kryminal');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(14, 1, 'Predkosc ucieczki', 'polski', 'kryminal');
INSERT INTO Ksiazka (k_id,a_id,tytul,jezyk_oryginalny,tematyka) 
    VALUES(19, 1, 'Chor zapomnianych glosow', 'polski', 'fantastyka');

-- dodanie egzemplarzy
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (1, 3, 1937, '978-123-456-789-0', 'Towarzystwo Wydawnicze ROJ', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (2, 3, 1938, '978-123-456-789-1', 'Towarzystwo Wydawnicze ROJ', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (3, 3, 1938, '978-123-456-789-2', 'Towarzystwo Wydawnicze ROJ', 'angielski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (4, 43, 2016, '978-123-456-789-3', 'Fabryka Slow', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (5, 37, 2005, '978-123-456-789-4', 'Fabryka Slow', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (6, 5, 2006, '978-123-456-789-5', 'Fabryka Slow', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (7, 29, 2018, '978-123-456-789-6', 'Fabryka Slow', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (8, 29, 2018, '978-123-456-789-7', 'Fabryka Slow', 'angielski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (9, 31, 2009, '978-123-456-789-8', 'Fabryka Slow', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (10, 1, 2015, '978-123-456-789-9', 'Czwarta Strona', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (11, 6, 2015, '978-123-456-780-0', 'Czwarta Strona', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (12, 19, 2014, '978-123-456-780-1', 'Czwarta Strona', 'polski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (13, 19, 2014, '978-123-456-780-2', 'Czwarta Strona', 'angielski');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (14, 19, 2015, '978-123-456-780-3', 'Czwarta Strona', 'niemiecki');
INSERT INTO Egzemplarz (sygnatura, e_id, rok_wydania, ISBN, wydawnictwo, jezyk)
    VALUES (15, 19, 2015, '978-123-456-780-4', 'Czwarta Strona', 'francuski');

-- Zad.1 Ilu mamy autorow urodzonych pomiedzy 1890 a 1927?
SELECT COUNT(*) FROM Autor
    WHERE rok_urodzenia BETWEEN 1890 AND 1927;
    
-- Zad.2 Dla kazdej ksiazki wyswietl tytul, ilosc egzemplarzy, imie i nazwisko autora.
SELECT k.tytul, COUNT(e.e_id) AS ilosc_egzemplarzy, a.imie, a.nazwisko 
    FROM Ksiazka k 
        JOIN Autor a ON k.a_id=a.a_id
        JOIN Egzemplarz e ON k.k_id=e.e_id
    GROUP BY k.tytul, a.imie, a.nazwisko;
    
-- Zad.3 Ile jest tytulow i egzemplarzy ksiazek z kazdej tematyki?
-- (dwa osobne zapytania, czy jedno?)

-- Zad.4 Dla kazdego ISBN wtswietl najmniejsza sygnature. Posortuj wg. sygnatur.

-- Zad.5 Wyswietl imiona, nazwiska autorow oraz tytuly ich ksiazek.
--       Jesli dla danego autora nie ma ksiazki wyswietlony ma byc NULL w polu tytulu.