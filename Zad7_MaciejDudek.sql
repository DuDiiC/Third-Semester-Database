-- Zad.1 
CREATE TABLE Testy (
    opis varchar(200),
    projekt varchar(20),
    termin date,
    tester integer,
    informacje varchar(200) );

-- Zad.2 
ALTER TABLE Testy
    ADD identyfikator integer;
    
-- Zad.3 
ALTER TABLE Testy
    RENAME COLUMN identyfikator TO id;
    
-- Zad.4 
ALTER TABLE Testy
    DROP COLUMN informacje;

-- Zad.5 
ALTER TABLE Testy
    MODIFY opis varchar(50) NOT NULL;
    
-- Zad.6 
ALTER TABLE Testy
    MODIFY id integer PRIMARY KEY;
    
-- Zad.7 
ALTER TABLE Testy
    MODIFY tester integer REFERENCES Pracownicy (id);
    
-- Zad.8 
DROP TABLE Testy CASCADE CONSTRAINTS PURGE;