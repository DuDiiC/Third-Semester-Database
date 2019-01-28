-- Zad.1 
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

-- Zad.2 
CREATE TABLE Wlasciciele (
    id integer,
    nazwa varchar(80) NOT NULL,
    telefon varchar(25),
    uwagi varchar(200),
    CONSTRAINT PK_wlasciciele PRIMARY KEY (id)
);

-- Zad.3 
CREATE TABLE Pojazdy (
    id integer PRIMARY KEY,
    Vin integer UNIQUE,
    marka varchar(40) NOT NULL,
    kolor varchar(40) NOT NULL,
    wlasciciel integer,
    uwagi varchar(200),
    CONSTRAINT FK_wlasciciele FOREIGN KEY (wlasciciel) REFERENCES wlasciciele (id)
);

-- Zad.4 
CREATE TABLE Naprawy (
    id integer PRIMARY KEY,
    pojazd integer NOT NULL REFERENCES pojazdy,
    data_rozp date  DEFAULT SYSDATE NOT NULL,
    data_naprawy date,
    koszt float CHECK (koszt >= 0),
    opis_zgloszenia varchar(200) NOT NULL,
    CHECK (data_naprawy >= data_rozp)
);

-- Zad.5 
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

-- Zad.6 
CREATE TABLE Uzyte_czesci(
    id_cz integer REFERENCES czesci (id),
    id_naprawy integer REFERENCES naprawy (id),
    ilosc integer NOT NULL CHECK (ilosc >= 0),
    uwagi varchar(200),
    CONSTRAINT PK_uzyte_czesci PRIMARY KEY (id_cz, id_naprawy) 
);