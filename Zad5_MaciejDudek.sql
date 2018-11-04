-- Zad.1 Utworz nastepująca tabele: Zlecenia(id, data_rozpoczęcia, nazwa, zespol, termin, ukonczone, koszt)
-- W trakcie tworzenia tabeli następujace cechy powinny zostac uwzglednione:
-- > data rozpoczecia domyslnie powinna ustawiac się na biezaca (systemowa)
-- > termin nie moze byc wartoscia NULL oraz nie moze byc mniejszy (wczesniejszy) od daty rozpoczecia
-- > kolumna ukonczone nie moze byc pusta i moze przyjmowac tylko dwie wartosci: "tak" oraz "nie"
-- > koszt nie moze byc ujemny
-- > kolumna zespol powinna wskazywac na id dzialu z tabelki Dzialy
-- > id to klucz glowny
CREATE TABLE Zlecenia (
    id integer PRIMARY KEY,
    data_rozpoczecia date DEFAULT SYSDATE,
    nazwa varchar(80),
    zespol integer REFERENCES dzialy (id_dzialu),
    termin date NOT NULL,
    ukonczone varchar(4) NOT NULL CHECK( ukonczone IN('tak', 'nie') ), 
    koszt float CHECK (koszt >= 0),
    CHECK (termin >= data_rozpoczecia)
);

-- Zad.2 Utworz tabele Wlasciciele(id, nazwa, telefon, uwagi)
-- > nazwa nie moze byc wartoscia NULL
-- > id to klucz glowny
-- > deklaracje klucza glownego umiesc w klauzuli Constraint
CREATE TABLE Wlasciciele (
    id integer,
    nazwa varchar(80) NOT NULL,
    telefon varchar(25),
    uwagi varchar(200),
    CONSTRAINT PK_wlasciciele PRIMARY KEY (id)
);

-- Zad.3 Utworz tabele Pojazdy(id, Vin, marka, kolor, wlasciciel,uwagi)
-- > Vin nie jest kluczem glownym, ale i tak musi być wartoscia unikalna
-- > wlasciciel to klucz obcy wskazujacy na tabele Wlasciciele; deklaracja tego klucza powinna zostac umieszczona w klauzuli Constraint
-- > kolumny marka i kolor nie moga byc puste
-- > id to klucz glowny
CREATE TABLE Pojazdy (
    id integer PRIMARY KEY,
    Vin integer UNIQUE,
    marka varchar(40) NOT NULL,
    kolor varchar(40) NOT NULL,
    wlasciciel integer,
    uwagi varchar(200),
    CONSTRAINT FK_wlasciciele FOREIGN KEY (wlasciciel) REFERENCES wlasciciele (id)
);

-- Zad.4 Utworz tabele Naprawy (id, pojazd,data_rozp, data_naprawy, koszt, opis_zgloszenia)
-- > data rozpoczecia domyslnie powinna ustawiac sie na biezaca (systemowa) i nie moze zawierac wartosci NULL
-- > data naprawy nie moze byc mniejsza (wczesniejsza) od daty rozpoczecia
-- > koszt nie moze byc ujemny
-- > kolumna pojazd powinna byc kluczem obcym wskazujacym na tabele Pojazdy i nie moze zawierac Nulli
-- > kolumna opis_zgloszenia nie moze zawierac Nulli
-- > id to klucz glowny
CREATE TABLE Naprawy (
    id integer PRIMARY KEY,
    pojazd integer NOT NULL REFERENCES pojazdy,
    data_rozp date  DEFAULT SYSDATE NOT NULL,
    data_naprawy date,
    koszt float CHECK (koszt >= 0),
    opis_zgloszenia varchar(200) NOT NULL,
    CHECK (data_naprawy >= data_rozp)
);

-- Zad.5 Utworz tabele Czesci(id, nazwa, cena, producent, dostawca)
-- > nazwa nie moze byc pusta
-- > cena nie moze byc ujemna
-- > id to klucz glowny
-- > wszystkie ograniczenia powinny zostac umieszczone w klauzulach Constraint (tzn. nie mozna umiescic np. definicji klucza glownego jako fragmentu deklaracji kolumny)
CREATE TABLE Czesci (
    id integer,
    nazwa varchar(80),
    cena float,
    producent varchar(80),
    dostawca varchar(80),
    CONSTRAINT PK_czesci PRIMARY KEY (id),
    CONSTRAINT podana_nazwa CHECK (nazwa IS NOT NULL),
    CONSTRAINT nieujemna_cena CHECK (cena >= 0) 
);

-- Zad.6 Utworz tabele UzyteCzesci(id_cz, id_naprawy, ilosc, uwagi)
-- > ilosc nie moze byc wartoscia NULL i nie moze byc ujemna
-- > kolumna id_cz powinna wskazywac na kolumne id z tabeli Czesci
-- > kolumna id_naprawy powinna wskazywac na kolumne id z tabeli Naprawy
-- > Klucz glowny tworza wspolnie kolumny id_cz i id_naprawy
CREATE TABLE Uzyte_czesci(
    id_cz integer REFERENCES czesci (id),
    id_naprawy integer REFERENCES naprawy (id),
    ilosc integer NOT NULL CHECK (ilosc >= 0),
    uwagi varchar(200),
    CONSTRAINT PK_uzyte_czesci PRIMARY KEY (id_cz, id_naprawy) 
);