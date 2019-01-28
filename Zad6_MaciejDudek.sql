-- Jako typ danych dla kolumny _ukonczone_ uznalem typ varchar(1), 'tak' jest oznaczone jako '1', 'nie' jako '0'

-- Zad.1 
DELETE FROM Projekty2
    WHERE (MONTHS_BETWEEN(SYSDATE, termin)>=1) AND ukonczone LIKE '1';

-- Zad.2 
UPDATE Projekty2
    SET termin = SYSDATE+25
    WHERE (ukonczone = '0') AND (termin < SYSDATE);
    
-- Zad.3 
UPDATE Projekty2
    SET koszt = koszt*0.8
    WHERE (ukonczone = '1') AND (termin <= Add_Months(SYSDATE, -1));