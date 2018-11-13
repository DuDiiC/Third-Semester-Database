-- Zad.1 
SELECT * FROM Pracownicy
    WHERE projekt IN 
        (SELECT p_id FROM Projekty
        WHERE nazwa LIKE 'Statistica'
        );
        
-- Zad.2 (zrozumialem polecenie jako: 'wyswietlic wszystkich z tego samego dzialu poza nim')
SELECT nazwisko, pensja FROM Pracownicy
    WHERE id_dzialu LIKE
        (SELECT id_dzialu FROM Pracownicy
        WHERE imie LIKE 'Ian' AND nazwisko LIKE 'Cook'
        ) 
    AND imie NOT LIKE 'Ian' AND nazwisko NOT LIKE 'Cook';
    
-- Zad.3
SELECT nazwa FROM Projekty
    WHERE p_id = ANY
        (SELECT projekt FROM Pracownicy
        WHERE id_dzialu = ANY
            (SELECT id_dzialu FROM Dzialy
            WHERE nazwa LIKE 'Programisci'
            )
        );

-- Zad.4
SELECT nazwa FROM Dzialy
    WHERE id_dzialu = ANY
        (SELECT id_dzialu FROM Pracownicy
        WHERE projekt = ANY
            (SELECT p_id FROM Projekty
            WHERE nazwa LIKE 'Inwentaryzacja'
            )
        );

-- Zad.5 
SELECT * FROM Pracownicy
    WHERE (pensja, id_dzialu) IN
        (SELECT MIN(pensja), id_dzialu FROM Pracownicy
        WHERE pensja IS NOT NULL
        GROUP BY id_dzialu
        );

-- Zad.6
SELECT * FROM Projekty
    WHERE p_id NOT IN 
        (SELECT projekt FROM Pracownicy
        WHERE projekt IS NOT NULL
        );

-- Zad.7
SELECT nazwisko FROM Pracownicy
    WHERE id IN
        (SELECT szef_projektu FROM Projekty
        WHERE szef_projektu IN 
            (SELECT id FROM Pracownicy
            WHERE id_dzialu NOT IN
                (SELECT id_dzialu FROM Dzialy
                WHERE nazwa LIKE 'Programisci'
                )
            )
        );

-- Zad.8
SELECT id_dzialu FROM Dzialy
    WHERE id_dzialu IN
        (SELECT id_dzialu FROM Pracownicy
        GROUP BY id_dzialu
        HAVING SUM(pensja) IN
            (SELECT MAX(SUM(pensja)) FROM Pracownicy
            GROUP BY id_dzialu
            )
        );

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