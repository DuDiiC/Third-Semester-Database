-- Zadania dotycza tabeli Pracownicy(id, imie, nazwisko, id_dzialu, pensja, projekt).

-- Zad. 1  Wyswietl najniższa i najwyzsza pensje oraz roznice dzielaca najlepiej i najgorzej zarabiajacych pracownikow.
SELECT  MIN(pensja) AS najnizsza_pensja, 
        MAX(pensja) AS najwyzsza_pensja,
        MAX(pensja)-MIN(pensja) AS roznica_pensji
    FROM pracownicy;
    
-- Zad. 2 Wyswietl srednie pensje dla wszystkich działow. Wyniki uporzadkuj wg malejacej sredniej pensji.
SELECT ROUND(AVG(pensja), 2) AS srednia_pensja_w_dziale FROM pracownicy
    GROUP BY id_dzialu
    ORDER BY srednia_pensja_w_dziale DESC;
    
-- Zad. 3 Wyswietl liczbe zatrudnionych osob przy projekcie "p2".
SELECT COUNT(*) AS pracownicy_przy_projekcie_p2 FROM pracownicy
    WHERE projekt = 'p2';

-- Zad. 4 Znajdz sumaryczne miesieczne place dla kazdego dzialu. (Innymi słowy - ile pieniędzy musi zgromadzic co miesiac kasa danego dzialu na wyplaty)
SELECT id_dzialu, SUM(pensja) AS wyplaty_miesieczne_w_dziale FROM pracownicy
    GROUP BY id_dzialu;

-- Zad. 5 Wyswietl numery dzialow, ktore zatrudniaja mniej niz 10 pracownikow. Wyniki uporzadkuj wg malejacej liczby pracownikow.
SELECT id_dzialu, COUNT(*) AS pracownicy_w_dziale FROM pracownicy
    GROUP BY id_dzialu
    HAVING COUNT(*) < 10
    ORDER BY pracownicy_w_dziale DESC;

-- Zad. 6 Wyswietl srednie pensje wyplacane w ramach poszczegolnych projektow i liczbe pracownikow zatrudnionych przy danym projekcie. Pomin pracownikow nie przypisanych do projektu (mają w kolumnie projekt wartosc Null).
SELECT  ROUND(AVG(pensja), 2) AS srednia_pensja_w_projekcie,
        COUNT(*) AS pracownicy_przy_projekcie 
    FROM pracownicy
    WHERE projekt IS NOT NULL
    GROUP BY projekt;