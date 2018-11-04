-- Polecenia dotycza nastepujacych tabel:
-- Pracownicy(id, imie, nazwisko, id_dzialu, pensja, projekt)
-- Projekty(p_id, szef_projektu, nazwa, termin_oddania)
-- Klienci(k_id, nazwa, telefon, prac_kontaktowy)

-- Zad.1 Dla kazdego pracownika wyswietl jego nazwisko, pensje i informacje o tym, czy jego pensja jest mniejsza (z opisem slownym "mniejsza"), rowna (slowo "rowna") lub wieksza (słowo "wieksza") od 1800 zlotych.
SELECT nazwisko, pensja, 'mniejsza' AS informacja FROM Pracownicy
    WHERE pensja < 1800
UNION
SELECT nazwisko, pensja, 'rowna' AS informacja FROM Pracownicy
    WHERE pensja = 1800
UNION
SELECT nazwisko, pensja, 'wieksza' AS informacja FROM Pracownicy
    WHERE pensja > 1800;
    
-- Zad.2 Do tabeli Projekty dodaj wpis o nastepujacym projekcie: id = 'odi', szef = 17, nazwa = 'Inwentaryzacja oddzialu Turzno', termin = '2017-12-30'.
INSERT INTO Projekty(p_id, szef_projektu, nazwa, termin_oddania)
    VALUES ('oid', 17, 'Inwentaryzacja oddzialu Turzno', '2017-12-30');
    
-- Zad.3 Dla kazdego projektu wyswietl dwie kolumny: nazwe oraz jedno ze słow "ukonczony"/"trwajacy" w zaleznosci czy termin ukonczenia wypada przed czy po dacie biezacej (systemowej).
SELECT nazwa, 'ukonczony' AS stan_projektu FROM Projekty
    WHERE termin_oddania < SYSDATE
UNION
SELECT nazwa, 'trwajacy' AS stan_projektu FROM Projekty
    WHERE termin_oddania > SYSDATE;

-- Zad.4 Korzystajac z operatorow teorii zbiorow wyswietl te identyfikatory pracownikow zarabiajacych powyzej 3000, ktorzy nie sa kierownikami projektow.
SELECT id AS id_pracownika FROM Pracownicy
    WHERE pensja > 3000
MINUS
SELECT szef_projektu FROM Projekty;

-- Zad.5 Korzystajac z operatorow teorii zbiorow, wyswietl te identyfikatory pracownikow zarabiajacych ponizej 2000, ktorzy sa pracownikami kontaktowymi dla Klientow.
SELECT id AS id_pracownika FROM Pracownicy
    WHERE pensja < 2000
INTERSECT
SELECT prac_kontaktowy FROM Klienci;