-- Napisz polecenia SQL, ktore:
-- Zadanie 1. Utworza tabele Produkty z kolumnami: Kod, Nazwa, Cena_Netto, StawkaVat, termin_waznosci.
CREATE TABLE Produkty (
    Kod Varchar(4),
    Nazwa Varchar(30),
    Cena_Netto float,
    StawkaVat Integer,
    termin_waznosci date );
    
-- Zadanie 2. Wprowadza do tabeli Produkty dane:
-- a) 5F, Farba biala 5l, 197, 22, 13 lutego 2010
INSERT INTO produkty (Kod,Nazwa,Cena_Netto,StawkaVat,Termin_waznosci) 
    VALUES ('5F', 'Farba biala 5l', 197, 22, '2010-02-13');
    
-- b) 1F, Farba biala 1l, 42
INSERT INTO produkty (Kod,Nazwa,Cena_Netto)
    VALUES ('1F', 'Farba biala 5l', 42);
    
-- c) 1 grudnia 2010, 1FB (kod), farba burgund 1l (nie zmieniajac kolejnosci)
INSERT INTO produkty (Termin_waznosci,Kod,Nazwa)
    VALUES ('2010-12-01','1FB','farba burgund 1l');
    
-- Zadanie 3. Wyswietla:
-- a) wszystkie informacje z tabeli Pracownicy
SELECT * FROM pracownicy;

-- b) imie, nazwisko i obliczone 19% podatku od pensji
SELECT imie, nazwisko, pensja*0.19 AS podatek_z_pensji FROM pracownicy;

-- c) wszystkie pola pracownikow z dzialu 5
SELECT * FROM pracownicy
    WHERE id_dzialu = 5;
    
-- d) wszystkie pola klientow, nie posiadajacych przypisanego pracownika kontaktowego
SELECT * FROM klienci
    WHERE prac_kontaktowy IS NULL;
    
-- e) wszystkie pola pracownikow, ktorych imie zaczyna sie na litere J
SELECT * FROM pracownicy
    WHERE imie LIKE 'J%';
    
-- f) pola nazwa i cene brutto produktow. Cena brutto to cena netto plus wartosc podatku (StawkaVat) od ceny netto
SELECT nazwa, cena_netto+(cena_netto*stawkaVat*0.01) AS cena_brutto FROM produkty;
