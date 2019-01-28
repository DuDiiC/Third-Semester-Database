-- Zad.1  
SELECT  MIN(pensja) AS najnizsza_pensja, 
        MAX(pensja) AS najwyzsza_pensja,
        MAX(pensja)-MIN(pensja) AS roznica_pensji
    FROM pracownicy;
    
-- Zad.2
SELECT ROUND(AVG(pensja), 2) AS srednia_pensja_w_dziale FROM pracownicy
    GROUP BY id_dzialu
    ORDER BY srednia_pensja_w_dziale DESC;
    
-- Zad.3
SELECT COUNT(*) AS pracownicy_przy_projekcie_p2 FROM pracownicy
    WHERE projekt = 'p2';

-- Zad.4 
SELECT id_dzialu, SUM(pensja) AS wyplaty_miesieczne_w_dziale FROM pracownicy
    GROUP BY id_dzialu;

-- Zad.5
SELECT id_dzialu, COUNT(*) AS pracownicy_w_dziale FROM pracownicy
    GROUP BY id_dzialu
    HAVING COUNT(*) < 10
    ORDER BY pracownicy_w_dziale DESC;

-- Zad.6
SELECT  ROUND(AVG(pensja), 2) AS srednia_pensja_w_projekcie,
        COUNT(*) AS pracownicy_przy_projekcie 
    FROM pracownicy
    WHERE projekt IS NOT NULL
    GROUP BY projekt;