-- Zad.1 
SELECT * FROM pracownicy
    WHERE nazwisko LIKE '%s'
    ORDER BY nazwisko;
    
-- Zad.2
SELECT * FROM pracownicy
    WHERE projekt = 'p2'
    ORDER BY pensja;
    
-- Zad.3
SELECT * FROM projekty
    WHERE termin_oddania < '2009-03-01';

-- Zad.4 
SELECT * FROM pracownicy
    WHERE pensja < 2000
    ORDER BY nazwisko;