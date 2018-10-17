-- Zad.1 Dla kazdego klienta posiadajacego niepusty wpis w polu telefon wyswietl tekst skladajacy sie z nazwy klienta dolaczonej 
-- na poczatku do tekstu ' jest dostepny pod numerem tel.: ' do ktorego dolaczony jest jeszcze na koncu numer telefonu. 
-- Przykladowy wpis moze wygladac nastepujaco "Pixar Arts jest dostepny pod numerem tel.: 111-111-11-11".
SELECT CONCAT(nazwa, CONCAT(' jest dostepny pod numerem tel.: ', telefon)) AS tekst_kontaktowy
    FROM klienci
    WHERE telefon IS NOT NULL;

-- Zad.2 Zakladajac, ze od kazdej pensji nalezy odprowadzic 19% podatku VAT, wyswietl ile dla kazdego pracownika nalezy przelac 
-- pieniedzy do Urzedu Skarbowego. Wynik zaokraglij do 2 miejsca po przecinku.
SELECT imie, nazwisko, ROUND(pensja*0.19, 2) AS pieniadze_dla_US
    FROM pracownicy;

-- Zad.3 Dla kazdego Klienta wyswietl jego nazwe oraz id pracownika kontaktowego. Jezeli klient nie ma przypisanego pracownika powinno wyswietlic sie 0.
SELECT nazwa, COALESCE(prac_kontaktowy, 0) FROM klienci;

-- Zad.4 Do tabeli Pracownicy dodaj wpis o Janie Kowalskim pracujacym w dziale 5. Jako wartosc pensji oraz projekt ma miec wpisane wartosci NULL.
INSERT INTO pracownicy (id, imie, nazwisko, id_dzialu)
    VALUES ((SELECT MAX(id) + 1 FROM pracownicy), 'Jan', 'Kowalski', 5, NULL, NULL);

-- Zad.5 Napisz zapytanie SQL ktore wyswietli 3 wartosci 

-- 1) srednia z pensji; 
SELECT AVG(pensja) AS srednia_pensja FROM pracownicy;

-- 2) srednia z pensji przy uzyciu funkcji zamieniajacej NULL na 0;
SELECT ROUND(AVG(NVL(pensja, 0)), 2) AS srednia_pensja FROM pracownicy;

-- 3) srednia z pensji przy zamianie NULL na 1800.
SELECT ROUND(AVG(NVL(pensja, 1800)), 2) AS srednia_pensja FROM pracownicy;

-- Zad.6 Napisz zapytanie, ktore podliczy ile srednio zarabiaja "na reke" (pensja -19%) pracownicy w naszej "firmie". Wynik zaokraglij do pelnych setek.
SELECT ROUND(AVG(pensja*0.81), -2) AS srednia_pensja_netto FROM pracownicy;