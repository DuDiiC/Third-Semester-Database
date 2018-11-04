-- Zad.1 Utworz tabele Testy z kolumnami: opis, projekt, termin, tester, informacje.
CREATE TABLE Testy (
    opis varchar(200),
    projekt varchar(20),
    termin date,
    tester integer,
    informacje varchar(200) );

-- Zad.2 Doloz kolumne identyfikator.
ALTER TABLE Testy
    ADD identyfikator integer;
    
-- Zad.3 Zmien nazwe kolumny identyfikator na id.
ALTER TABLE Testy
    RENAME COLUMN identyfikator TO id;
    
-- Zad.4 Usun kolumne informacje.
ALTER TABLE Testy
    DROP COLUMN informacje;

-- Zad.5 Zmien typ danych kolumny opis na Varchar dlugosci 50 i ustaw flage Not Null.
ALTER TABLE Testy
    MODIFY opis varchar(50) NOT NULL;
    
-- Zad.6 Ustaw klucz glowny na id.
ALTER TABLE Testy
    MODIFY id integer PRIMARY KEY;
    
-- Zad.7 Ustaw klucz obcy na kolumnie tester wskazujacy na tabele Pracownicy.
ALTER TABLE Testy
    MODIFY tester integer REFERENCES Pracownicy (id);
    
-- Zad.8 Usun tabele Testy.
DROP TABLE Testy CASCADE CONSTRAINTS PURGE;