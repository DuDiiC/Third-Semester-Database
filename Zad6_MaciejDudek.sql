-- Jako typ danych dla kolumny _ukonczone_ uznalem typ varchar(1), 'tak' jest oznaczone jako '1', 'nie' jako '0'

-- Zad.1 Napisz polecenie kasujace wszystkie projekty, ktorym miesiac temu uplynal termin i maja status ukonczenia ustawiony na "tak". Podaj sugerowany typ kolumny ukonczone, tak aby byl jak najmniejszy. Podaj oznaczenia "tak" i "nie" (podejdz do tego problemu jak projektant aplikacji bazodanowej, ktory ma duzo mozliwosci - uzycie liczb, tekstu, wartosci logicznych itp., ale musi się zdecydowac na najbardziej optymalna).

-- AD: (polecenie zrozumialem jako usuniecie wszystkich tych projektow, ktore sa zakonczone i termin minal WCZESNIEJ
-- niz miesiac temu, gdyby chodzilo o dokladnie miesiac, w miejscu '>=' zostalby tylko znak '=')
DELETE FROM Projekty2
    WHERE (MONTHS_BETWEEN(SYSDATE, termin)>=1) AND ukonczone LIKE '1';

-- Zad.2 Napisz polecenie zmieniajace wszystkim nieukonczonym projektom, ktorym uplynal termin, nowy termin - 25 dni od dzis
UPDATE Projekty2
    SET termin = SYSDATE+25
    WHERE (ukonczone = '0') AND (termin < SYSDATE);
    
-- Zad.3 Projektom, ktore sa ukonczone (kolumna ukonczone ma wartosc "tak") na 2 miesiace przed terminem (porownaj date systemowa z kolumna termin) obnizyc koszt o 20%
UPDATE Projekty2
    SET koszt = koszt*0.8
    WHERE (ukonczone = '1') AND (termin <= Add_Months(SYSDATE, -1));