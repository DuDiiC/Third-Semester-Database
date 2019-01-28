-- Zad.1 
SELECT CONCAT(nazwa, CONCAT(' jest dostepny pod numerem tel.: ', telefon)) AS tekst_kontaktowy
    FROM klienci
    WHERE telefon IS NOT NULL;

-- Zad.2 
SELECT imie, nazwisko, ROUND(pensja*0.19, 2) AS pieniadze_dla_US
    FROM pracownicy;

-- Zad.3 
SELECT nazwa, COALESCE(prac_kontaktowy, 0) FROM klienci;

-- Zad.4 
INSERT INTO pracownicy (id, imie, nazwisko, id_dzialu)
    VALUES ((SELECT MAX(id) + 1 FROM pracownicy), 'Jan', 'Kowalski', 5);

-- Zad.5 
SELECT  AVG(pensja) AS sr_pensja, 
        ROUND(AVG(NVL(pensja, 0)), 2) AS sr_pensja_bez_zer, 
        ROUND(AVG(NVL(pensja, 1800)), 2) AS sr_pensja_1800_zamiast_zer 
        FROM pracownicy;

-- Zad.6 
SELECT ROUND(AVG(pensja*0.81), -2) AS srednia_pensja_netto FROM pracownicy;