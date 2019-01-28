-- Zad.1 
SELECT CONCAT(SUBSTR( nazwisko, 1, 2), CONCAT(SUBSTR( imie, 1, 1), SUBSTR( id, 1))) AS kod FROM pracownicy;

-- Zad.2 
SELECT REGEXP_REPLACE( nazwisko, 'K|W|S|k|w|s', 'x') AS nowe_nazwisko FROM pracownicy;

-- Zad.3 
SELECT nazwisko, ROUND(pensja*1.15) AS wyzsza_pensja FROM pracownicy;

-- Zad.4. 
SELECT  nazwa, FLOOR(MONTHS_BETWEEN(SYSDATE, termin_oddania)/12) AS lata, 
        (FLOOR(MONTHS_BETWEEN(SYSDATE, termin_oddania))) AS miesiace 
        FROM projekty
        WHERE termin_oddania <= SYSDATE;
        
-- Zad.5. 
SELECT nazwa, TO_CHAR(termin_oddania, 'Day') FROM projekty
    WHERE p_id = 'p1';
    
-- Zad.6. 
SELECT p_id, szef_projektu FROM projekty
    WHERE termin_oddania >= '09/08/15' and termin_oddania <= '10/03/30';