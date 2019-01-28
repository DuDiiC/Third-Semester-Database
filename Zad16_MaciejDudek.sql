-- Zad.1 

-- Nowa transakcje rozpoczynam poprzez zatwierdzenie poprzedniej poleceniem COMMIT.
COMMIT;

-- Zwieksz pensje pracownika Bryan o 100
UPDATE Pracownicy
    SET pensja = pensja+100
    WHERE nazwisko='Bryan';
    
-- Utworz punkt bezpieczenstwa Save1
SAVEPOINT Save1;

-- Ustaw Jamesowi Potterowi pensje na 3000
UPDATE Pracownicy
    SET pensja = 3000
    WHERE imie='James' AND nazwisko='Potter';
    
-- Utworz punkt bezpieczenstwa Save2
SAVEPOINT Save2;

-- Usun pracownika o nazwisku Newton
DELETE FROM Pracownicy
    WHERE nazwisko='Newton';
    
-- Wycofaj transakcje do Save1
ROLLBACK TO SAVEPOINT Save1;
-- Po tej operacji zostaly cofniete wszystkie zmiany po poleceniu 'SAVEPOINT Save1', czyli powroci Newton i stara
-- pensja Jamesa Pottera.

-- Wycofaj transakcje do Save2
ROLLBACK TO SAVEPOINT Save2;
-- Nie ma mozliwosci wykonania tego polecenia, poniewaz wycofanie do punktu bezpieczenstwa usuwa wszystkie zmiany,
-- lacznie z ustawieniem kolejnych punktow bezpieczenstwa. Zatem nie mozna cofnac sie do punktu, ktory nie istnieje.

-- Wycofaj cala transakcje
ROLLBACK;
-- Zostaly wycofane wszystkie zmiany wprowadzone od ostatniego polecenia COMMIT.

-- Zad.2

-- Rozpocznij nowa transakcje
COMMIT;

-- Usun Newtona
DELETE FROM Pracownicy
    WHERE nazwisko='Newton';
    
-- Utworz punkt bezpieczenstwa Save1
SAVEPOINT Save1;

-- Zmien typ atrybutu NAZWA w relacji Projekty na VARCHAR(40)
ALTER TABLE Projekty
    MODIFY nazwa VARCHAR(40);
    
-- Wycofaj transakcje do Save1
ROLLBACK TO SAVEPOINT Save1;
-- Nie ma mozliwosci wycofania transakcji, poniewaz wykonane przed chwila polecenie nalezy do grupy polecen
-- zatwierdzajacych aktualna transakcje, zatem punkt bezpieczenstwa o nazwie 'Save1' nie zostal jeszcze zdefiniowany
-- w aktualnej transakcji

-- Zad.3 

-- Zwieksz pensje Potterow o 10%
UPDATE Pracownicy
    SET pensja = pensja*1.1
    WHERE nazwisko='Potter';
    
-- W drugiej sesji zwieksz o 20%
UPDATE Pracownicy
    SET pensja = pensja*1.2
    WHERE nazwisko='Potter';
-- W drugiej sesji pojawial sie blad niepozwalajacy na modyfikacje danych, ktore zostale wczesniej modyfikowane w pierwszej.
-- Dopiero po wykonaniu polecenia COMMIT w pierwszej sesji, Oracle SQL Developer zapytal, czy zmiany z drugiej sesji
-- zacommitowac, czy odrzucic
    
-- W pierwszej sesji 
COMMIT;
-- W drugiej sesji
COMMIT;

-- *Odczytanie placy pracownika James Potter poleceniem
SELECT pensja FROM Pracownicy
    WHERE imie='James' AND nazwisko='Potter';

-- Nie ma mozliwosci modyfikowania tych samych danych w dwoch roznych niezatwierdzonych sesjach, aby uniknac bledow
-- i niescislosc. Zmiany dokonane w pierwszej sesji, w drugiej nie byly wydoczne dopoki nie zostaly zatwierdzone, analogicznie
-- sytuacja wygladala w druga strone - po dokonaniu zmian w sesji pierwszej, zatwierdzeniu ich, a potem dokonaniu zmian w sesji
-- drugiej, zanim nastapilo zatwierdzenie, zmiany nie byly widoczne.

-- Zad.4

-- W pierwszej sesji okresl poziom izolacji na serializable
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- W pierwszej sekcji odczytaj informacje o pracownikach
SELECT * FROM Pracownicy;

-- W drugiej sesji zmniejsz o 15% pensje Bryana
UPDATE Pracownicy
    SET pensja = pensja-(pensja*0.15)
    WHERE nazwisko='Bryan';

-- W tym momencie w pierwszej sesji nie obserwujemy zadnych zmian w pensji Bryana, zmiany z drugiej sesji, sa dla pierwszej
-- jeszcze niewidoczne.

-- W pierwszej sesji sprobuj zwiekszyc pensje Bryana o 50%
UPDATE Pracownicy
    SET pensja = pensja+(pensja*0.5)
    WHERE nazwisko='Bryan';
-- Oracle SQL Developer nie pozwolil na wprowadzenie tych zmian przed zatwierdzeniem/odrzuceniem wczesniejszych zmian tych
-- samych danych w drugiej sesji. 

-- Wycofaj wprowadzone zmiany w sesji pierwszej i sesji drugiej
ROLLBACK;