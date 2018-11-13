-- Zad.1
SELECT nazwisko, imie FROM Pracownicy p1
    WHERE pensja > 0.5*(
        SELECT MAX(pensja) FROM Pracownicy p2
            WHERE p1.id_dzialu = p2.id_dzialu
    );
        
-- Zad.2 zle?
SELECT * FROM Dzialy
    WHERE NOT EXISTS (
        SELECT * FROM Pracownicy 
            WHERE projekt = 'p1'
    );
    
-- Zad.3
SELECT nazwisko, pensja FROM Pracownicy p
    WHERE 3 > (
        SELECT COUNT(*) FROM Pracownicy
            WHERE pensja < p.pensja
    ) AND pensja IS NOT NULL;
    
-- Zad.4 nie dziala
SELECT * From Pracownicy p1
    WHERE SYSDATE > (
        SELECT termin_oddania FROM Projekty p2
            WHERE p1.projekt = p2
    ) AND p1.projekt IS NOT NULL;