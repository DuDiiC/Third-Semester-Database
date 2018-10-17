-- Zad.1 Dla kazdego pracownika wygeneruj kod skladajacy sie z dwoch pierwszych liter jego nazwiska, pierwszej litery imienia i jego numeru identyfikacyjnego (id)
SELECT CONCAT(SUBSTR( nazwisko, 1, 2), CONCAT(SUBSTR( imie, 1, 1), SUBSTR( id, 1))) AS kod FROM pracownicy;

-- Zad.2 Wyswietl zmodyfikowane nazwiska pracownikow, w ktorych zamien wszystkie litery "K", "W", "S" (rowniez male) na litere "x"
SELECT REGEXP_REPLACE( nazwisko, 'K|W|S|k|w|s', 'x') AS nowe_nazwisko FROM pracownicy;

-- Zad.3 Wyswietl nazwiska i place podstawowe pracownikow powiekszone o 15% i zaokraglone do liczb calkowitych
SELECT nazwisko, ROUND(pensja*1,15) AS wyzsza_pensja FROM pracownicy;

-- Zad.4. Policz, ile lat oraz ile dokladnie miesiecy (np. 57) minelo od terminu oddania do dnia dzisiejszego dla kazdego projektu, 
-- ktorego termin uplynal przed biezaca data systemowa. Dla testow zmien przy pomocy SQL Developera jeden z terminow tak, aby data wypadala w przyszlym roku
SELECT  nazwa, FLOOR(MONTHS_BETWEEN(SYSDATE, termin_oddania)/12) AS lata, 
        (FLOOR(MONTHS_BETWEEN(SYSDATE, termin_oddania))) AS miesiace 
        FROM projekty
        WHERE termin_oddania <= SYSDATE;
        
-- Zad.5. Wyswietl nazwe dnia tygodnia, w ktorym nastapi zakonczenie (planowane) projektu p1
SELECT nazwa, TO_CHAR(termin_oddania, 'Day') FROM projekty
    WHERE p_id = 'p1';
    
-- Zad.6. Wyswietl numery szefow projektow (kolumna szef_projektu), ktore koncza sie pomiedzy 2009-08-15 a 2010-03-30
SELECT szef_projektu FROM projekty
    WHERE termin_oddania >= '09/08/15' and termin_oddania <= '10/03/30';