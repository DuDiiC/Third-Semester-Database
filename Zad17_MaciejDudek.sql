-- Zapytania pisane na podstawie uzytkownika 'G2_KOWALSKI'

-- Zad. 1
GRANT SELECT, UPDATE ON Pracownicy TO G2_KOWALSKI;

-- Zad.2
REVOKE UPDATE ON Pracownicy FROM G2_KOWALSKI;

-- Zad.3
CREATE ROLE nowa_rola IDENTIFIED BY haslo123;

-- Zad.4
GRANT SELECT, DELETE, UPDATE ON Klienci TO nowa_rola;

-- Zad.5
GRANT nowa_rola TO G2_KOWALSKI;

-- Zad.6
SET ROLE nowa_rola IDENTIFIED BY haslo123;