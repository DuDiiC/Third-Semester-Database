-- Zad.1
SELECT p1.imie, p2.nazwisko, p3.pensja 
    FROM Pracownicy p1  CROSS JOIN Pracownicy p2 
                        CROSS JOIN Pracownicy p3;

-- Zad.2
SELECT Projekty.nazwa AS projekt, Pracownicy.nazwisko AS szef_projektu, Pracownicy.pensja AS pensja_kierownika
    FROM Projekty JOIN Pracownicy
    ON Projekty.szef_projektu = Pracownicy.id;
    
-- Zad.3
SELECT Dzialy.nazwa, COUNT(Pracownicy.id) AS pracownicy_w_dziale
    FROM Dzialy JOIN Pracownicy
    ON Dzialy.id_dzialu = Pracownicy.id_dzialu
    GROUP BY Dzialy.nazwa
    ORDER BY pracownicy_w_dziale ASC;
    
-- Zad.4 
SELECT Pracownicy.nazwisko, Pracownicy.pensja, Projekty.nazwa
    FROM Pracownicy LEFT OUTER JOIN Projekty
    ON Pracownicy.projekt = Projekty.p_id JOIN Dzialy
    ON Pracownicy.id_dzialu = Dzialy.id_dzialu 
    WHERE Dzialy.nazwa LIKE 'Programisci';
    
-- Zad.5
SELECT p1.imie, p1.nazwisko, p2.nazwisko AS Szef
    FROM Pracownicy p1 LEFT OUTER JOIN Projekty proj
    ON p1.projekt = proj.p_id LEFT OUTER JOIN Pracownicy p2
    ON proj.szef_projektu = p2.id JOIN Dzialy 
    ON p1.id_dzialu = Dzialy.id_dzialu
    WHERE Dzialy.nazwa LIKE 'Programisci';
    
-- Zad.6 
SELECT Klienci.nazwa AS klient, Pracownicy.imie, Pracownicy.nazwisko, Dzialy.nazwa AS Dzial
    FROM Klienci JOIN Pracownicy
    ON Klienci.prac_kontaktowy = pracownicy.id JOIN Dzialy
    ON pracownicy.id_dzialu = Dzialy.id_dzialu;

-- Zad.7
SELECT p1.nazwa,  p2.nazwisko AS "szef projektu",  COUNT(DISTINCT p3.id_dzialu) AS ilosc_dzialow
    FROM projekty p1 JOIN pracownicy p2 
    ON p1.szef_projektu=p2.id JOIN pracownicy p3 
    ON p1.p_id=p3.projekt
    GROUP BY p1.nazwa, p2.nazwisko;
    