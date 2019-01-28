-- Zad.1
CREATE TABLE Produkty (
    Kod Varchar(4),
    Nazwa Varchar(30),
    Cena_Netto float,
    StawkaVat Integer,
    termin_waznosci date );
    
-- Zad.2
-- a) 
INSERT INTO produkty (Kod,Nazwa,Cena_Netto,StawkaVat,Termin_waznosci) 
    VALUES ('5F', 'Farba biala 5l', 197, 22, '2010-02-13');
    
-- b) 
INSERT INTO produkty (Kod,Nazwa,Cena_Netto)
    VALUES ('1F', 'Farba biala 5l', 42);
    
-- c) 
INSERT INTO produkty (Termin_waznosci,Kod,Nazwa)
    VALUES ('2010-12-01','1FB','farba burgund 1l');
    
-- Zad.3
-- a) 
SELECT * FROM pracownicy;

-- b) 
SELECT imie, nazwisko, pensja*0.19 AS podatek_z_pensji FROM pracownicy;

-- c) 
SELECT * FROM pracownicy
    WHERE id_dzialu = 5;
    
-- d) 
SELECT * FROM klienci
    WHERE prac_kontaktowy IS NULL;
    
-- e) 
SELECT * FROM pracownicy
    WHERE imie LIKE 'J%';
    
-- f)
SELECT nazwa, cena_netto+(cena_netto*stawkaVat*0.01) AS cena_brutto FROM produkty;
