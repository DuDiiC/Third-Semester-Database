-- Zad.1 
SELECT * FROM Pracownicy
    WHERE projekt IN 
        (SELECT p_id FROM Projekty
        WHERE nazwa='Statistica'
        );
        
-- Zad.2 
SELECT nazwisko, pensja FROM Pracownicy
    WHERE id_dzialu LIKE
        (SELECT id_dzialu FROM Pracownicy
        WHERE imie='Ian' AND nazwisko='Cook'
        );
    
-- Zad.3
SELECT nazwa FROM Projekty
    WHERE p_id = ANY
        (SELECT projekt FROM Pracownicy
        WHERE id_dzialu = ANY
            (SELECT id_dzialu FROM Dzialy
            WHERE nazwa='Programisci'
            )
        );

-- Zad.4
SELECT nazwa FROM Dzialy
    WHERE id_dzialu = ANY
        (SELECT id_dzialu FROM Pracownicy
        WHERE projekt = ANY
            (SELECT p_id FROM Projekty
            WHERE nazwa='Inwentaryzacja'
            )
        );

-- Zad.5 ŹLE wyswietla mi przykladowo jesli najnizsza pensja w dziale 5 to 1800, to
-- dostane tez tych pracownikow co maja 1800 w dziale 1...
SELECT * FROM Pracownicy
    WHERE pensja IN
        (SELECT MIN(pensja) AS najnizsza_pensja FROM Pracownicy
        WHERE pensja IS NOT NULL
        GROUP BY id_dzialu
        )
    ORDER BY id_dzialu;
  
SELECT MIN(pensja) AS najnizsza_pensja FROM Pracownicy
    GROUP BY id_dzialu;

-- Zad.6
SELECT * FROM Projekty
    WHERE p_id NOT IN 
        (SELECT projekt FROM Pracownicy
        WHERE projekt IS NOT NULL
        );

-- Zad.7 NIE WIEM CZY DOBRZE
SELECT nazwisko FROM Pracownicy
    WHERE id IN
        (SELECT szef_projektu FROM Projekty
        WHERE szef_projektu IN 
            (SELECT id FROM Pracownicy
            WHERE id_dzialu NOT IN
                (SELECT id_dzialu FROM Dzialy
                WHERE nazwa='Programisci'
                )
            )
        );

-- Zad.8 CHYBA DOBRZE
SELECT id_dzialu FROM Dzialy
    WHERE id_dzialu IN
    (SELECT id_dzialu FROM Pracownicy
    GROUP BY id_dzialu
    HAVING SUM(pensja) IN
        (SELECT MAX(SUM(pensja)) FROM Pracownicy
        GROUP BY id_dzialu
        )
    );

-- pomoc
SELECT id_dzialu, SUM(pensja) AS suma_pensji_w_dziale FROM pracownicy
    GROUP BY id_dzialu;

-- Zad.9
SELECT imie, nazwisko, pensja FROM Pracownicy
    WHERE pensja IN
        (SELECT MAX(pensja) FROM Pracownicy
        WHERE id IN
            (SELECT szef_projektu FROM Projekty)
        );
        
-- Zad.10
SELECT nazwa FROM Dzialy
    WHERE id_dzialu IN
        (SELECT id_dzialu FROM Pracownicy
        WHERE id IN
            (SELECT id FROM Pracownicy
            WHERE pensja IN
                (SELECT MAX(pensja) FROM Pracownicy
                WHERE id IN
                    (SELECT szef_projektu FROM Projekty)
                )
            )
        );
    