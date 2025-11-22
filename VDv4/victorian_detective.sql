
DROP TABLE IF EXISTS osoby;
DROP TABLE IF EXISTS lokalizacje;
DROP TABLE IF EXISTS zdarzenia;
DROP TABLE IF EXISTS uczestnicy_zdarzen;

CREATE TABLE osoby (
    id INT PRIMARY KEY,
    imie_nazwisko VARCHAR(255),
    rola VARCHAR(255)
);

CREATE TABLE lokalizacje (
    id INT PRIMARY KEY,
    nazwa VARCHAR(255)
);

CREATE TABLE zdarzenia (
    id INT PRIMARY KEY,
    typ VARCHAR(255),
    data DATE,
    lokalizacja_id INT,
    opis TEXT
);

CREATE TABLE uczestnicy_zdarzen (
    zdarzenie_id INT,
    osoba_id INT
);

INSERT INTO osoby VALUES
(1,'Arthur Pembroke','zegarmistrz'),
(2,'Clara Whitfield','nauczycielka muzyki'),
(3,'Dr Nathaniel Crowhurst','aptekarz'),
(4,'Evelyn Marsh','wdowa'),
(5,'Samuel Byrne','woźnica'),
(6,'Agatha Bellamy','sklepikarka'),
(7,'Reverend Josiah Alden','pastor'),
(8,'Beatrice Morton','gospodyni'),
(9,'Jonas Wick','marynarz'),
(10,'Gerald Norridge','urzędnik miejski'),
(11,'Henry Blackwood','kupiec'); -- morderca

INSERT INTO lokalizacje VALUES
(1,'Cooper’s Lane'),
(2,'Most Stonemoor'),
(3,'Targ Saddle Row'),
(4,'Herbaciarnia Golden Finch'),
(5,'Biblioteka Whitlock'),
(6,'Magazyn Portowy nr 4'),
(7,'Nabrzeże Węglowe'),
(8,'Dom Aukcyjny Harrington & Sons');

INSERT INTO zdarzenia VALUES
(1,'transakcja','1889-04-01',3,'Zakup drobiazgów na targu'),
(2,'spotkanie','1889-04-02',4,'Rozmowa przy herbacie'),
(3,'korespondencja','1889-04-03',5,'Odebrano list'),
(4,'transakcja','1889-04-04',1,'Zakup bliżej nieokreślonej substancji'),
(5,'obserwacja','1889-04-05',7,'Osoba widziana późną nocą'),
(6,'transport','1889-04-06',6,'Przewóz pakunku z portu'),
(7,'raport medyczny','1889-04-07',1,'Substancja znaleziona na miejscu śmierci'),
(8,'wpis w księdze','1889-04-08',8,'Korekta wcześniejszej transakcji'),
(9,'zeznanie','1889-04-09',2,'Świadek widział podejrzaną postać'),
(10,'korespondencja','1889-04-10',5,'Odszyfrowany list ujawnia motyw');

INSERT INTO uczestnicy_zdarzen VALUES
(1,11),(1,2),
(2,11),(2,6),
(3,11),
(4,11),(4,3),
(5,11),
(6,11),(6,9),
(7,11),
(8,11),(8,10),
(9,11),(9,5),
(10,11);
