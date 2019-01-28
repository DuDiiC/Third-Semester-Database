-- Zad.1 
SELECT nazwisko, pensja, 'mniejsza' AS informacja FROM Pracownicy
    WHERE pensja < 1800
UNION
SELECT nazwisko, pensja, 'rowna' AS informacja FROM Pracownicy
    WHERE pensja = 1800
UNION
SELECT nazwisko, pensja, 'wieksza' AS informacja FROM Pracownicy
    WHERE pensja > 1800;
    
-- Zad.2 
INSERT INTO Projekty(p_id, szef_projektu, nazwa, termin_oddania)
    VALUES ('oid', 17, 'Inwentaryzacja oddzialu Turzno', '2017-12-30');
    
-- Zad.3 
SELECT nazwa, 'ukonczony' AS stan_projektu FROM Projekty
    WHERE termin_oddania < SYSDATE
UNION
SELECT nazwa, 'trwajacy' AS stan_projektu FROM Projekty
    WHERE termin_oddania > SYSDATE;

-- Zad.4 
SELECT id AS id_pracownika FROM Pracownicy
    WHERE pensja > 3000
MINUS
SELECT szef_projektu FROM Projekty;

-- Zad.5 
SELECT id AS id_pracownika FROM Pracownicy
    WHERE pensja < 2000
INTERSECT
SELECT prac_kontaktowy FROM Klienci;