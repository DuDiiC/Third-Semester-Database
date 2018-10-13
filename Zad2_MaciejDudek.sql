-- Napisz zapytanie wyszukujace w bazie, ktore znajdzie (w zapytaniach w klauzuli SELECT uzyj *):

-- 1. Pszystkich pracownikow, ktorych nazwisko konczy sie na 's'. Wyniki posortuj wedlug nazwisk.
SELECT * FROM pracownicy
    WHERE nazwisko LIKE '%s'
    ORDER BY nazwisko;
    
-- 2. Pracownikow pracujacych przy projekcie 'p2'. Wyniki posortuj wg. pensji.
SELECT * FROM pracownicy
    WHERE projekt = 'p2'
    ORDER BY pensja;
    
-- 3. Projekty, ktorych data zakonczenia uplynela przed 1 marca 2009
SELECT * FROM projekty
    WHERE termin_oddania < '2009-03-01';

-- 4. Pracownikow zarabiajacych mniej niz 2000. Wyniki posortuj po nazwisku
SELECT * FROM pracownicy
    WHERE pensja < 2000
    ORDER BY nazwisko;