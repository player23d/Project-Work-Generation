create database ProjectWork;
use ProjectWork;

CREATE TABLE utente (
    id_utente INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    pwd VARCHAR(50) NOT NULL,
    nome VARCHAR(50) ,
    cognome VARCHAR(50) ,
    telefono VARCHAR(15) 
);

CREATE TABLE citta (
    id_citta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    provincia VARCHAR(50),
    stato VARCHAR(50)
);


CREATE TABLE zone(
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    id_citta INT NOT NULL,
    nome_zona VARCHAR(100),
    FOREIGN KEY (id_citta) REFERENCES citta(id_citta)
);




CREATE TABLE azienda (
    id_azienda INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipologia ENUM('Impresa Edile', 'Agenzia Immobiliare'),
    indirizzo VARCHAR(150),
	idcitta INT NOT NULL,
	FOREIGN KEY (idcitta) REFERENCES citta(id_citta)
);


CREATE TABLE agente (
    id_azienda INT NOT NULL,
    idutente INT NOT NULL,
    partita_iva VARCHAR(20),
    PRIMARY KEY (id_azienda, idutente),
    FOREIGN KEY (id_azienda) REFERENCES azienda(id_azienda),
    FOREIGN KEY (idutente) REFERENCES utente(id_utente)
);


CREATE TABLE indirizzi  (
	via VARCHAR(150),
	id_zona INT,
	FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
);


CREATE TABLE tipologia (
id_tipologia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descrizione VARCHAR(100)
);

CREATE TABLE affitti (
    id_camera INT AUTO_INCREMENT PRIMARY KEY,
    idzona INT NOT NULL,
    idtipologia INT NOT NULL,
    prezzo DECIMAL(10, 2),
    spese_condominiali DECIMAL(10, 2),
    cauzione DECIMAL(10, 2),
    data_disponibilita DATE,
    indirizzo VARCHAR(255),
    superficie DECIMAL(10, 2),
    locali INT,
    bagni INT,
    piano INT,
    altre_caratteristiche TEXT,
    classe_energetica VARCHAR(50),
    FOREIGN KEY (idzona) REFERENCES zone(id_zona),
	FOREIGN KEY (idtipologia) REFERENCES tipologia(id_tipologia)
);


CREATE TABLE annuncio (
    id_annuncio INT AUTO_INCREMENT PRIMARY KEY,
    id_utente INT NOT NULL,
    id_casa INT NOT NULL,
    titolo VARCHAR(100),
    descrizione TEXT,
    data_pubblicazione DATE,
    immagine VARCHAR(300),
    FOREIGN KEY (id_utente) REFERENCES utente(id_utente),
    FOREIGN KEY (id_casa) REFERENCES affitti(id_camera)
);

CREATE TABLE preferenze (
    utente INT NOT NULL,
    annuncio INT NOT NULL,
    PRIMARY KEY (utente, annuncio),
    FOREIGN KEY (utente) REFERENCES utente(id_utente),
    FOREIGN KEY (annuncio) REFERENCES annuncio(id_annuncio)
);



INSERT INTO citta (nome, provincia, stato)
VALUES ('Milano', 'MI', 'Italia'),
('Pavia', 'PV', 'Italia');

INSERT INTO zone (id_citta, nome_zona)
VALUES (1, 'Centro Storico'),
       (1, 'Brera'),
       (1, 'Navigli'),
       (1, 'Città Studi'),
       (1, 'Isola'),
       (1, 'Corso Como'),
       (1, 'Loreto'),
       (1, 'Garibaldi'),
       (1, 'Fiera'),
       (1, 'Sempione'),
       (1, 'Bicocca'),
       (1, 'Affori'),
       (1, 'Barona'),
       (1, 'Greco'),
       (1, 'Maggiolina'),
       (1, 'Mecenate'),
       (1, 'Monluè'),
       (1, 'Niguarda'),
       (1, 'Quarto Oggiaro'),
       (1, 'Quinto Romano'),
       (1, 'Rogoredo'),
       (1, 'Sarpi'),
       (1, 'Scalo Romana'),
       (1, 'Stadera'),
       (1, 'Ticinese'),
       (1, 'Turro'),
       (1, 'Vigentino'),
       (1, 'Villapizzone'),
       (1, 'Bovisa'),
       (1, 'Forlanini'),
       (1, 'Portello'),
       (1, 'Giambellino'),
       (1, 'Gratosoglio'),
       (1, 'Ortica'),
       (1, 'Ponte Lambro'),
       (1, 'Crescenzago'),
       (1, 'Dergano'),
       (1, 'Gallaratese'),
       (1, 'Chiaravalle'),
       (1, 'Precotto');

INSERT INTO zone (id_citta, nome_zona)
VALUES (2, 'Centro storico'),
       (2, 'Stazione'),
       (2, 'Corso Strada Nuova'),
       (2, 'Ponte Coperto'),
       (2, 'Borgo Ticino'),
       (2, 'Pavia Nord'),
       (2, 'San Martino Siccomario'),
       (2, 'Zona Sud'),
       (2, 'Zona Ovest');


INSERT INTO tipologia (descrizione)
VALUES ('Appartamento'),
       ('Monolocale'),
       ('Bilocale'),
       ('Trilocale'),
       ('Quadrilocale'),
       ('Attico'),
       ('Loft'),
       ('Villa'),
       ('Casa indipendente'),
       ('Casa semindipendente'),
       ('Rustico'),
       ('Chalet'),
       ('Palazzo'),
       ('Dependance'),
       ('Castello'),
       ('Mansarda'),
       ('Open space'),
       ('Casa a schiera'),
       ('Duplex'),
       ('Multiproprietà');


INSERT INTO utente (nome, cognome, email, pwd, telefono) VALUES
('Alessandro', 'Marino', 'alessandro.marino1@example.com', 'pGf19NYu5T', '4337631292'),
('Martina', 'Ferrari', 'martina.ferrari2@example.com', 'RaTA9bfOkO', '2030909555'),
('Antonio', 'Russo', 'antonio.russo3@example.com', 'XUuDSaItqq', '5745819778'),
('Sofia', 'Rossi', 'sofia.rossi4@example.com', 'JMNiw02MhX', '9607243760'),
('Martina', 'Russo', 'martina.russo5@example.com', 's3fRs8noWk', '0255844946'),
('Luigi', 'Marino', 'luigi.marino6@example.com', 'cYGiVdX97o', '1297663826'),
('Luigi', 'Marino', 'luigi.marino7@example.com', 'SCJOvM8cZE', '2026157844'),
('Luigi', 'Rossi', 'luigi.rossi8@example.com', 'Dc4UsWZ9wP', '3204623283'),
('Sofia', 'Marino', 'sofia.marino9@example.com', 'kZNYf83dUl', '2408769894'),
('Lorenzo', 'Russo', 'lorenzo.russo10@example.com', 'UfzEt8VyaE', '6727494267'),
('Giulia', 'Ferrari', 'giulia.ferrari11@example.com', '0SRKJZUwX5', '3096290077'),
('Mario', 'Esposito', 'mario.esposito12@example.com', 'd5GYT2vjHS', '2007244679'),
('Sofia', 'Bianchi', 'sofia.bianchi13@example.com', '4ffm8yyZtD', '0169397528'),
('Mario', 'Esposito', 'mario.esposito14@example.com', 'gm091QKaHD', '0368500559'),
('Francesca', 'Esposito', 'francesca.esposito15@example.com', 'plkIcddw3b', '9515303679'),
('Lorenzo', 'Romano', 'lorenzo.romano16@example.com', '9akxeD8ady', '8607229963'),
('Sofia', 'Romano', 'sofia.romano17@example.com', 'p0TBaCEss0', '2586746710'),
('Martina', 'Rossi', 'martina.rossi18@example.com', 'he9ZVm2QjB', '0764827642'),
('Francesca', 'Ricci', 'francesca.ricci19@example.com', 'FLBAZCowWJ', '1519236534'),
('Giulia', 'Greco', 'giulia.greco20@example.com', '1pMQh5mCUy', '6221607376'),
('Francesca', 'Ricci', 'francesca.ricci21@example.com', 'VC4eTlNAID', '6104853136'),
('Sofia', 'Greco', 'sofia.greco22@example.com', 'CVMUvZum6T', '3753324897'),
('Alessandro', 'Russo', 'alessandro.russo23@example.com', 'Aunl2W3DiR', '7894224806'),
('Antonio', 'Bianchi', 'antonio.bianchi24@example.com', '2jYjhqW2we', '7835450076'),
('Alessandro', 'Ferrari', 'alessandro.ferrari25@example.com', 'UpJxT5af3h', '2725053367'),
('Sofia', 'Esposito', 'sofia.esposito26@example.com', 'mKLm1PF5vK', '5235163997'),
('Lorenzo', 'Ferrari', 'lorenzo.ferrari27@example.com', 'E17tuWqpRF', '9715458779'),
('Mario', 'Colombo', 'mario.colombo28@example.com', 'OM65hzdFMc', '6556631847'),
('Antonio', 'Greco', 'antonio.greco29@example.com', 'Mm7thiuwI7', '5208141184'),
('Martina', 'Marino', 'martina.marino30@example.com', 'y5OoMX8Xbw', '6144607613'),
('Sofia', 'Rossi', 'sofia.rossi31@example.com', 'Nmvo9XjbPA', '2023930037'),
('Alessandro', 'Esposito', 'alessandro.esposito32@example.com', 'A1COZPKpis', '6701875096'),
('Giulia', 'Bianchi', 'giulia.bianchi33@example.com', 'JzJqkjWgt1', '0837644659'),
('Giulia', 'Bianchi', 'giulia.bianchi34@example.com', 'xaiejBccj5', '5524715417'),
('Francesca', 'Rossi', 'francesca.rossi35@example.com', 'Muwu5g50oc', '0312208942'),
('Alessandro', 'Marino', 'alessandro.marino36@example.com', 's8WuR8OU2b', '7493092882'),
('Francesca', 'Esposito', 'francesca.esposito37@example.com', 'XY56XaIy3v', '7503726746'),
('Giulia', 'Greco', 'giulia.greco38@example.com', 'nAmzlED5kk', '6441486715'),
('Sofia', 'Marino', 'sofia.marino39@example.com', 'wAEUyLWkoR', '9159459333'),
('Sofia', 'Greco', 'sofia.greco40@example.com', 'Ik6aH3MKKW', '8346402202'),
('Sofia', 'Greco', 'sofia.greco41@example.com', '2N6uCB5zXx', '2698103035'),
('Antonio', 'Ferrari', 'antonio.ferrari42@example.com', '4j6RfQYWLA', '3999662247'),
('Francesca', 'Marino', 'francesca.marino43@example.com', 'KwO3H6mnIu', '3361613045'),
('Martina', 'Ferrari', 'martina.ferrari44@example.com', 'sscyCJQrwU', '7653426109'),
('Sofia', 'Colombo', 'sofia.colombo45@example.com', 'G5HVQodbLi', '6717424485'),
('Mario', 'Greco', 'mario.greco46@example.com', 'HNBu8uLk5V', '1485616883'),
('Lorenzo', 'Bianchi', 'lorenzo.bianchi47@example.com', 'uyJzPnaBxP', '5820518181'),
('Lorenzo', 'Rossi', 'lorenzo.rossi48@example.com', 'XzZVpqACeA', '4317435415'),
('Antonio', 'Ferrari', 'antonio.ferrari49@example.com', 'sUgCiNbUjZ', '2667622915'),
('Mario', 'Greco', 'mario.greco50@example.com', 'ZSAYxKxH1O', '0316136385'),
('Sofia', 'Bianchi', 'sofia.bianchi51@example.com', '649bXWmPvB', '6279444662'),
('Giulia', 'Colombo', 'giulia.colombo52@example.com', '5omA8atuJ7', '6576063864'),
('Mario', 'Rossi', 'mario.rossi53@example.com', 'mizPRnsBlZ', '7906724302'),
('Mario', 'Ricci', 'mario.ricci54@example.com', 'DiIMtT6114', '9515034934'),
('Giuseppe', 'Romano', 'giuseppe.romano55@example.com', 'R0ITqMAzpC', '6226288088'),
('Giulia', 'Colombo', 'giulia.colombo56@example.com', 'AD0jOXk8xk', '9536441319'),
('Luigi', 'Russo', 'luigi.russo57@example.com', 'RXhWgzLGfV', '2811535082'),
('Antonio', 'Ricci', 'antonio.ricci58@example.com', 'EQIAS6KC71', '7663900356'),
('Giuseppe', 'Greco', 'giuseppe.greco59@example.com', 'wPO3QA8K2M', '5865544738'),
('Antonio', 'Bianchi', 'antonio.bianchi60@example.com', 'yiUW1PdayM', '0760514775'),
('Luigi', 'Bianchi', 'luigi.bianchi61@example.com', '2omwZP1b94', '8745999500'),
('Alessandro', 'Rossi', 'alessandro.rossi62@example.com', 'qXoAZAYh6U', '0301191857'),
('Martina', 'Romano', 'martina.romano63@example.com', 'A7h0Yr9No3', '4819677485'),
('Mario', 'Rossi', 'mario.rossi64@example.com', 'm4lFYqK2uE', '0701166903'),
('Mario', 'Marino', 'mario.marino65@example.com', '94XMZlzApR', '6817697856'),
('Francesca', 'Greco', 'francesca.greco66@example.com', 'aJ1Kn7waTA', '1830731003'),
('Martina', 'Greco', 'martina.greco67@example.com', 'DehEY8dty4', '9853736554'),
('Alessandro', 'Ricci', 'alessandro.ricci68@example.com', '4FJny07w7W', '0461836860'),
('Mario', 'Romano', 'mario.romano69@example.com', 'mZ8JRGhKoh', '9656988987'),
('Sofia', 'Colombo', 'sofia.colombo70@example.com', 'qlYlkqWzAj', '6092091611');


INSERT INTO affitti (idzona, idtipologia, prezzo, spese_condominiali, cauzione, data_disponibilita, indirizzo, superficie, locali, bagni, piano, altre_caratteristiche, classe_energetica)
VALUES
(1, 1, 1200.00, 100.00, 2400.00, '2024-07-01', 'Corso Como 14', 85.00, 3, 1, 2, 'Arredato, Balcone', 'A'),
(1, 4, 800.00, 80.00, 1600.00, '2024-08-01', 'Corso di Porta Ticinese 2', 45.00, 1, 1, 1, 'Arredato', 'B'),
(2, 5, 950.00, 90.00, 1900.00, '2024-09-01', 'Via Brera 3', 60.00, 2, 1, 3, 'Balcone', 'C'),
(2, 6, 1100.00, 150.00, 2200.00, '2024-07-10', 'Via Fiori Chiari 10', 70.00, 3, 2, 5, 'Ascensore', 'A'),
(3, 7, 900.00, 120.00, 1800.00, '2024-08-15', 'Via Tortona 5', 50.00, 2, 1, 2, 'Terrazzo, Cantina', 'B'),
(3, 9, 750.00, 85.00, 1500.00, '2024-07-20', 'Via Navigli 6', 40.00, 1, 1, 1, 'Balcone', 'C'),
(4, 2, 950.00, 95.00, 1900.00, '2024-08-20', 'Via Città Studi 7', 65.00, 2, 1, 2, 'Ascensore', 'A'),
(4, 3, 1300.00, 140.00, 2600.00, '2024-09-01', 'Via Politecnico 8', 90.00, 3, 2, 4, 'Balcone, Arredato', 'B'),
(5, 3, 850.00, 100.00, 1700.00, '2024-07-15', 'Via Thaon di Revel 9', 55.00, 2, 1, 3, 'Balcone, Arredato', 'C'),
(5, 4, 1000.00, 110.00, 2000.00, '2024-08-01', 'Via Isola 10', 75.00, 2, 1, 5, 'Ascensore', 'A'),
(6, 1, 900.00, 95.00, 1800.00, '2024-07-25', 'Via Loreto 11', 60.00, 2, 1, 2, 'Ascensore, Piscina', 'B'),
(6, 2, 950.00, 100.00, 1900.00, '2024-08-15', 'Via Padova 12', 65.00, 2, 1, 3, 'Balcone', 'C'),
(7, 2, 1050.00, 130.00, 2100.00, '2024-07-05', 'Via Garibaldi 13', 80.00, 3, 2, 4, 'Cantina', 'A'),
(7, 1, 800.00, 90.00, 1600.00, '2024-09-05', 'Via Garibaldi 14', 50.00, 1, 1, 2, 'Arredato', 'B'),
(8, 4, 1100.00, 120.00, 2200.00, '2024-08-25', 'Via Fiera 15', 70.00, 2, 1, 4, 'Ascensore', 'C'),
(8, 5, 950.00, 105.00, 1900.00, '2024-07-10', 'Via Procaccini 16', 60.00, 2, 1, 2, 'Balcone', 'A'),
(9, 4, 850.00, 95.00, 1700.00, '2024-08-10', 'Via Sempione 17', 55.00, 2, 1, 1, 'Terrazzo', 'B'),
(10, 8, 1000.00, 110.00, 2000.00, '2024-09-20', 'Via Bicocca 18', 75.00, 3, 2, 5, 'Balcone, Arredato', 'C'),
(11, 9, 900.00, 90.00, 1800.00, '2024-07-20', 'Via Affori 19', 65.00, 2, 1, 3, 'Ascensore', 'A'),
(12, 6, 950.00, 95.00, 1900.00, '2024-08-20', 'Via Barona 20', 70.00, 2, 1, 4, 'Arredato, Terrazza', 'B'),
(12, 4, 1050.00, 125.00, 2100.00, '2024-09-25', 'Via Barona 21', 85.00, 3, 2, 5, 'Piscina, Arredato', 'C'),
(12, 3, 850.00, 100.00, 1700.00, '2024-07-15', 'Via Barona 22', 55.00, 1, 1, 2, 'Terrazza', 'A'),
(13, 4, 1100.00, 130.00, 2200.00, '2024-08-15', 'Via Greco 23', 90.00, 3, 2, 4, 'Balcone, Ascensore', 'B'),
(14, 4, 750.00, 85.00, 1500.00, '2024-09-10', 'Via Cadolini 24', 40.00, 1, 1, 1, 'Arredato', 'C'),
(15, 5, 950.00, 95.00, 1900.00, '2024-07-05', 'Via Padova 25', 65.00, 2, 1, 3, 'Cantina', 'A'),
(15, 6, 850.00, 90.00, 1700.00, '2024-08-05', 'Via Padova 26', 55.00, 1, 1, 2, 'Piscina', 'B'),
(16, 7, 1000.00, 105.00, 2000.00, '2024-09-05', 'Via Niguarda 27', 75.00, 3, 2, 4, 'Terrazzo', 'C'),
(16, 8, 900.00, 100.00, 1800.00, '2024-07-25', 'Via Val di Sole 28', 60.00, 2, 1, 3, 'Cantina, Arredato', 'A'),
(17, 9, 950.00, 95.00, 1900.00, '2024-08-25', 'Via Pellegrino Rossi 29', 70.00, 2, 1, 2, 'Balcone, Arredato', 'B'),
(17, 3, 850.00, 90.00, 1700.00, '2024-09-25', 'Via Pellegrino Rossi 30', 55.00, 1, 1, 1, 'Terrazza', 'C'),
(18, 1, 1100.00, 120.00, 2200.00, '2024-07-15', 'Via Muratori 31', 80.00, 3, 2, 5, 'Balcone', 'A'),
(18, 3, 950.00, 105.00, 1900.00, '2024-08-15', 'Via Muratori 32', 65.00, 2, 1, 2, 'Arredato, Piscina', 'B'),
(19, 3, 800.00, 85.00, 1600.00, '2024-09-15', 'Via Rogoredo 33', 50.00, 1, 1, 1, 'Balcone', 'C'),
(20, 4, 850.00, 95.00, 1700.00, '2024-07-25', 'Via Paolo Sarpi 34', 55.00, 1, 1, 2, 'Balcone', 'A'),
(21, 5, 1000.00, 110.00, 2000.00, '2024-08-25', 'Via della Chiesa Rossa 35', 75.00, 3, 2, 3, 'Ascensore, Cantina', 'B'),
(22, 6, 900.00, 100.00, 1800.00, '2024-09-25', 'Via Idro 36', 60.00, 2, 1, 4, 'Balcone, Arredato', 'C'),
(23, 4, 1100.00, 125.00, 2200.00, '2024-07-05', 'Via Conca del Naviglio 37', 85.00, 3, 2, 5, 'Terrazzo', 'A'),
(24, 8, 950.00, 105.00, 1900.00, '2024-08-05', 'Via Bassini 38', 65.00, 2, 1, 2, 'Arredato, Ascensore', 'B'),
(24, 9, 850.00, 90.00, 1700.00, '2024-09-05', 'Via Bassini 39', 55.00, 1, 1, 1, 'Balcone', 'C'),
(25, 10, 1000.00, 110.00, 2000.00, '2024-07-15', 'Via Vigentino 40', 75.00, 3, 2, 3, 'Balcone, Arredato', 'A'),
(25, 5, 900.00, 100.00, 1800.00, '2024-08-15', 'Via Vigentino 41', 60.00, 2, 1, 2, 'Piscina', 'B'),
(26, 4, 1100.00, 125.00, 2200.00, '2024-09-15', 'Via Pellegrino Rossi 42', 85.00, 3, 2, 5, 'Terrazzo, Balcone', 'C'),
(27, 3, 800.00, 85.00, 1600.00, '2024-07-25', 'Via Varesina 43', 50.00, 1, 1, 1, 'Arredato', 'A'),
(27, 4, 950.00, 95.00, 1900.00, '2024-08-25', 'Via Varesina 44', 65.00, 2, 1, 3, 'Balcone, Ascensore', 'B'),
(28, 5, 850.00, 90.00, 1700.00, '2024-09-25', 'Via Mecenate 45', 55.00, 1, 1, 1, 'Terrazzo, Ascensore, Arredato', 'C'),
(29, 6, 1000.00, 110.00, 2000.00, '2024-07-05', 'Via Andrea Doria 46', 75.00, 3, 2, 4, 'Arredato', 'A'),
(29, 7, 900.00, 100.00, 1800.00, '2024-08-05', 'Via Andrea Doria 47', 60.00, 2, 1, 2, 'Terrazza, Arredato', 'B'),
(30, 8, 1100.00, 125.00, 2200.00, '2024-09-05', 'Via Giambellino 48', 85.00, 3, 2, 3, 'Balcone', 'C'),
(31, 9, 850.00, 90.00, 1700.00, '2024-07-15', 'Via Gratosoglio 49', 55.00, 1, 1, 1, 'Cantina', 'A'),
(32, 2, 1000.00, 110.00, 2000.00, '2024-08-15', 'Via Rubattino 50', 75.00, 3, 2, 5, 'Arredato, Balcone', 'B');


INSERT INTO affitti (idzona, idtipologia, prezzo, spese_condominiali, cauzione, data_disponibilita, indirizzo, superficie, locali, bagni, piano, altre_caratteristiche, classe_energetica)
VALUES
(41, 4, 700.00, 50.00, 1400.00, '2024-07-01', 'Via Strada Nuova 1', 75.00, 3, 1, 2, 'Terrazzo', 'A'),
(42, 3, 600.00, 45.00, 1200.00, '2024-08-01', 'Via Damiano Chiesa 2', 65.00, 2, 1, 1, ' Balcone, Ascensore', 'B'),
(41, 5, 1100.00, 85.00, 2200.00, '2024-09-01', 'Via Roma 3', 90.00, 4, 2, 3, 'Balcone, Cantina', 'C'),
(42, 4, 950.00, 75.00, 1900.00, '2024-07-20', 'Via Stazione 4', 85.00, 3, 1, 2, 'Terrazzo, Ascensore, Cantina', 'B'),
(45, 4, 850.00, 60.00, 1700.00, '2024-08-25', 'Borgo Ticino 8', 55.00, 2, 1, 1, 'Arredato, Balcone', 'C'),
(45, 5, 950.00, 80.00, 1900.00, '2024-07-10', 'Pavia Nord 5', 60.00, 2, 1, 2, 'Arredato, Balcone,', 'A'),
(48, 4, 1000.00, 70.00, 2000.00, '2024-08-20', 'Zona Sud 6', 75.00, 3, 1, 3, 'Balcone, Cantina', 'B'),
(49, 2, 850.00, 55.00, 1700.00, '2024-09-15', 'Zona Ovest 7', 55.00, 2, 1, 1, ' Arredato, Terrazzo', 'C'),
(47, 3, 1050.00, 90.00, 2100.00, '2024-07-25', 'San Martino Siccomario 9', 80.00, 3, 2, 4, 'Arredato, Balcone', 'A'),
(45, 3, 900.00, 65.00, 1800.00, '2024-08-10', 'Via Ponte Coperto 10', 60.00, 2, 1, 2, 'Arredato, Balcone', 'B'),
(41, 5, 1100.00, 95.00, 2200.00, '2024-09-05', 'Corso Strada Nuova 11', 90.00, 3, 2, 5, 'Terrazzo, Cantina', 'C'),
(41, 2, 700.00, 50.00, 1400.00, '2024-07-20', 'Via Strada Nuova 12', 75.00, 3, 1, 2, 'Balcone, Arredato', 'A'),
(42, 4, 600.00, 45.00, 1200.00, '2024-08-25', 'Via Damiano Chiesa 13', 65.00, 2, 1, 1, 'Ascensore', 'B'),
(41, 1, 1100.00, 85.00, 2200.00, '2024-09-10', 'Via Roma 14', 90.00, 4, 2, 3, 'Terrazza, Cantina', 'C'),
(42, 3, 950.00, 75.00, 1900.00, '2024-07-30', 'Via Stazione 15', 85.00, 3, 1, 2, 'Terrazza', 'B'),
(45, 1, 850.00, 60.00, 1700.00, '2024-08-05', 'Borgo Ticino 16', 55.00, 2, 1, 1, 'Arredato, Balcone', 'C'),
(46, 3, 950.00, 80.00, 1900.00, '2024-07-15', 'Pavia Nord 17', 60.00, 2, 1, 2, 'Arredato, Balcone', 'A'),
(48, 4, 1000.00, 70.00, 2000.00, '2024-08-05', 'Zona Sud 18', 75.00, 3, 1, 3, 'Terrazza, arredato', 'B'),
(49, 3, 850.00, 55.00, 1700.00, '2024-09-25', 'Zona Ovest 19', 55.00, 2, 1, 1, 'Arredato', 'C'),
(47, 4, 1050.00, 90.00, 2100.00, '2024-07-10', 'San Martino Siccomario 20', 80.00, 3, 2, 4, 'Terrazzo, Cantina', 'A'),
(45, 4, 900.00, 65.00, 1800.00, '2024-08-15', 'Via Ponte Coperto 21', 60.00, 2, 1, 2, 'Terrazzo, Cantina', 'B'),
(41, 1, 1100.00, 95.00, 2200.00, '2024-09-01', 'Corso Strada Nuova 22', 90.00, 3, 2, 5, 'Terrazzo, Cantina', 'C'),
(42, 3, 700.00, 50.00, 1400.00, '2024-07-15', 'Via Strada Nuova 23', 75.00, 3, 1, 2, 'Arredato', 'A'),
(42, 2, 600.00, 45.00, 1200.00, '2024-08-20', 'Via Damiano Chiesa 24', 65.00, 2, 1, 1, 'Arredato, Balcone', 'B'),
(41, 5, 1100.00, 85.00, 2200.00, '2024-09-20', 'Via Roma 25', 90.00, 4, 2, 3, 'Terrazza, Arredato, Cantina', 'C'),
(42, 4, 950.00, 75.00, 1900.00, '2024-07-05', 'Via Stazione 26', 85.00, 3, 1, 2, 'Terrazza', 'B'),
(45, 4, 850.00, 60.00, 1700.00, '2024-08-05', 'Borgo Ticino 27', 55.00, 2, 1, 1, 'Arredato, ', 'C'),
(46, 4, 950.00, 80.00, 1900.00, '2024-07-25', 'Pavia Nord 28', 60.00, 2, 1, 2, 'Balcone', 'A'),
(48, 10, 1000.00, 70.00, 2000.00, '2024-08-25', 'Zona Sud 29', 75.00, 3, 1, 3, 'Arredato, Cantina, Piscina', 'B'),
(49, 1, 850.00, 55.00, 1700.00, '2024-09-25', 'Zona Ovest 30', 55.00, 2, 1, 1, 'Arredato, Terrazzo', 'C'),
(47, 6, 1050.00, 90.00, 2100.00, '2024-07-15', 'San Martino Siccomario 31', 80.00, 3, 2, 4, 'Cantina, Terrazzo', 'A'),
(45, 4, 900.00, 65.00, 1800.00, '2024-08-15', 'Via Ponte Coperto 32', 60.00, 2, 1, 2, 'Balcone', 'B'),
(41, 5, 1100.00, 95.00, 2200.00, '2024-09-05', 'Corso Strada Nuova 33', 90.00, 3, 2, 5, 'Ascensore, Balcone', 'C'),
(41, 3, 700.00, 50.00, 1400.00, '2024-07-25', 'Via Strada Nuova 34', 75.00, 3, 1, 2, 'Ascensore, Terrazzo', 'A'),
(42, 3, 600.00, 45.00, 1200.00, '2024-08-25', 'Via Damiano Chiesa 35', 65.00, 2, 1, 1, 'Arredato', 'B'),
(41, 5, 1100.00, 85.00, 2200.00, '2024-09-25', 'Via Roma 36', 90.00, 4, 2, 3, 'Terrazza, Cantina, Ascensore', 'C'),
(42, 3, 950.00, 75.00, 1900.00, '2024-07-10', 'Via Stazione 37', 85.00, 3, 1, 2, 'Ascensore, Arredato', 'B'),
(45, 3, 850.00, 60.00, 1700.00, '2024-08-10', 'Borgo Ticino 38', 55.00, 2, 1, 1, 'Arredato, Balcone', 'C'),
(46, 1, 950.00, 80.00, 1900.00, '2024-09-10', 'Pavia Nord 39', 60.00, 2, 1, 2, 'Ascensore, Balcone', 'A'),
(48, 10, 1000.00, 70.00, 2000.00, '2024-07-05', 'Zona Sud 40', 75.00, 3, 1, 3, 'Terrazzo', 'B'),
(49, 5, 850.00, 55.00, 1700.00, '2024-08-05', 'Zona Ovest 41', 55.00, 2, 1, 1, 'Arredato, Terrazzo', 'C'),
(47, 5, 1050.00, 90.00, 2100.00, '2024-09-05', 'San Martino Siccomario 42', 80.00, 3, 1, 2, 'Balcone, Arredato', 'A'),
(45, 1, 900.00, 65.00, 1800.00, '2024-07-15', 'Via Ponte Coperto 43', 60.00, 2, 1, 2, 'Ascensore, Terrazzo', 'B'),
(41, 5, 1100.00, 95.00, 2200.00, '2024-08-15', 'Corso Strada Nuova 44', 90.00, 3, 2, 5, 'Balcone, Cantina', 'C'),
(41, 4, 700.00, 50.00, 1400.00, '2024-09-15', 'Via Strada Nuova 45', 75.00, 3, 1, 2, 'Balcone, Cantina', 'A'),
(42, 3, 600.00, 45.00, 1200.00, '2024-07-25', 'Via Damiano Chiesa 46', 65.00, 2, 1, 1, 'Ascensore', 'B'),
(41, 1, 1100.00, 85.00, 2200.00, '2024-08-25', 'Via Roma 47', 90.00, 2, 1, 1, 'Terrazzo, Cantina', 'C');



INSERT INTO azienda (nome, tipologia, indirizzo, idcitta)
VALUES
("Agenzia Immobiliare tempocasa Pavia", "Agenzia Immobiliare", "Via Umberto Olevano 1B", 2),
("Immobiliare Campari", "Agenzia Immobiliare", "Via Contardo Ferrini n 40", 2),
("ABITO La tua casa su misura", "Agenzia Immobiliare", "Piazzale Ferruccio Ghinaglia 3", 2),
("Brambilla Servizi Immobiliari Pavia di Valle Maria Luisa", "Agenzia Immobiliare", "Via Palestro 22", 2),
("Agenzia Immobiliare RE/MAX Vita", "Agenzia Immobiliare", "Corso Alessandro Manzoni 18", 2),
("Agenzia Immobiliare Tempocasa Milano", "Agenzia Immobiliare" ,"Via Giovanni Pacini 66", 1),
("Agenzia Immobiliare Tempocasa Milano", "Agenzia Immobiliare", "Viale Piave 41", 1),
("Engel Volkers Milano", "Agenzia Immobiliare", "Via Vittor Pisani 9", 1),
("Gabetti Milano Duomo", "Agenzia Immobiliare", "Via Giovanni Battista Morgagni 4", 1),
("Santa Lucia Immobiliare", "Agenzia Immobiliare", "Via Santa Lucia 1", 1),
("GM Edilizia Ristrutturazioni Chiavi", "Impresa Edile", "Via Contardo Ferrini 69", 2),
("Impresa Dedi Costruzioni e Ristrutturazioni", "Impresa Edile", "Viale Cremona 141", 2),
("A.P. COSTRUZIONI s.r.l.", "Impresa Edile", "P.za Ercole Marelli 14", 2),
("Edil Power srls", "Impresa Edile", "Via Antonio Giovanni Scopoli 12", 2),
("ETICA Costruzioni Srl", "Impresa Edile", "Corso Giuseppe Garibaldi 24c", 2),
("EdilService Milano Ristrutturazioni interni", "Impresa Edile", "Viale Piceno 8", 1),
("MP Costruzioni Edili", "Impresa Edile", "Via Innocenzo Isimbardi 29", 1),
( "Milano Impresa Edile Edilfag Srl", "Impresa Edile", "Via Lucio Cornelio Silla 110", 1),
("Artedile Due", "Impresa Edile", "Via Corrado II il Salico 8", 1),
("EDILIA COSTRUZIONI", "Impresa Edile", "Via Mac Mahon 48", 1);


INSERT INTO annuncio (id_utente, id_casa, titolo, descrizione, data_pubblicazione, immagine) VALUES
(1, 1, 'Appartamento in centro', 'Appartamento in pieno centro città, vicino a tutti i servizi principali.', CURDATE(), 'immagine1.jpg'),
(2, 2, 'Bilocale arredato', 'Bilocale completamente arredato e pronto per essere abitato. Zona ben servita.', CURDATE(), 'immagine2.jpg'),
(3, 3, 'Monolocale economico', 'Monolocale economico e accogliente, ideale per studenti e giovani lavoratori.', CURDATE(), 'immagine3.jpg'),
(4, 4, 'Villa con giardino', 'Villa spaziosa con ampio giardino, perfetta per famiglie numerose.', CURDATE(), 'immagine4.jpg'),
(5, 5, 'Attico con vista mare', 'Attico di lusso con una splendida vista mare e terrazzo panoramico.', CURDATE(), 'immagine5.jpg'),
(6, 6, 'Appartamento ristrutturato', 'Appartamento ristrutturato di recente, con finiture moderne e di qualità.', CURDATE(), 'immagine6.jpg'),
(7, 7, 'Casa indipendente', 'Casa indipendente su due livelli con ampio spazio esterno.', CURDATE(), 'immagine7.jpg'),
(8, 8, 'Stanza singola in affitto', 'Stanza singola in appartamento condiviso. Ambiente giovane e dinamico.', CURDATE(), 'immagine8.jpg'),
(9, 9, 'Trilocale in zona tranquilla', 'Trilocale situato in una zona tranquilla, ideale per famiglie.', CURDATE(), 'immagine9.jpg'),
(10, 10, 'Monolocale centrale', 'Monolocale nel cuore della città, comodo per raggiungere tutti i servizi.', CURDATE(), 'immagine10.jpg'),
(11, 11, 'Bilocale arredato', 'Bilocale arredato con gusto, pronto per essere abitato. Zona ben servita.', CURDATE(), 'immagine11.jpg'),
(12, 12, 'Casa in centro', 'Casa nel centro della città, vicino a tutti i servizi. Ideale per famiglie.', CURDATE(), 'immagine12.jpg'),
(13, 13, 'Appartamento con terrazzo', 'Appartamento con ampio terrazzo, ideale per famiglie. Zona tranquilla.', CURDATE(), 'immagine13.jpg'),
(14, 14, 'Villa con giardino', 'Villa con ampio giardino, perfetta per famiglie. Zona residenziale.', CURDATE(), 'immagine14.jpg'),
(15, 15, 'Loft spazioso', 'Loft spazioso e luminoso, ideale per artisti e creativi. Vicino a tutti i servizi.', CURDATE(), 'immagine15.jpg'),
(16, 16, 'Appartamento nuovo', 'Appartamento di nuova costruzione, con finiture di alto livello. Zona ben servita.', CURDATE(), 'immagine16.jpg'),
(17, 17, 'Monolocale moderno', 'Monolocale moderno e arredato, pronto per essere abitato. Vicino ai mezzi pubblici.', CURDATE(), 'immagine17.jpg'),
(18, 18, 'Casa con vista', 'Casa con vista panoramica, ideale per famiglie. Zona tranquilla.', CURDATE(), 'immagine18.jpg'),
(19, 19, 'Appartamento con balcone', 'Appartamento con balcone, ideale per famiglie. Zona residenziale.', CURDATE(), 'immagine19.jpg'),
(20, 20, 'Villa moderna', 'Villa moderna con ampi spazi e giardino. Perfetta per famiglie.', CURDATE(), 'immagine20.jpg'),
(21, 21, 'Bilocale in centro', 'Bilocale nel centro della città, comodo per raggiungere tutti i servizi.', CURDATE(), 'immagine21.jpg'),
(22, 22, 'Stanza singola arredata', 'Stanza singola arredata in appartamento condiviso. Ambiente giovane e dinamico.', CURDATE(), 'immagine22.jpg'),
(23, 23, 'Monolocale economico arredato', 'Monolocale economico e arredato, vicino ai mezzi pubblici. Ideale per studenti.', CURDATE(), 'immagine23.jpg'),
(24, 24, 'Casa in affitto', 'Casa indipendente in affitto, ideale per famiglie. Zona tranquilla.', CURDATE(), 'immagine24.jpg'),
(25, 25, 'Appartamento con giardino', 'Appartamento con giardino privato, ideale per famiglie con bambini.', CURDATE(), 'immagine25.jpg'),
(26, 26, 'Stanza doppia in affitto', 'Stanza doppia in appartamento condiviso, ambiente giovane e dinamico. Ideale per studenti.', CURDATE(), 'immagine26.jpg'),
(27, 27, 'Loft centrale', 'Loft centrale e spazioso, ideale per giovani coppie o professionisti.', CURDATE(), 'immagine27.jpg'),
(28, 28, 'Appartamento ristrutturato di recente', 'Appartamento ristrutturato di recente, con finiture di pregio. Zona ben servita.', CURDATE(), 'immagine28.jpg'),
(29, 29, 'Monolocale arredato', 'Monolocale arredato con gusto, pronto per essere abitato. Vicino a tutti i servizi.', CURDATE(), 'immagine29.jpg'),
(30, 30, 'Casa in campagna', 'Casa indipendente in campagna, ideale per chi cerca tranquillità e spazio.', CURDATE(), 'immagine30.jpg'),
(31, 31, 'Appartamento arredato', 'Appartamento arredato con gusto, pronto per essere abitato. Zona ben servita.', CURDATE(), 'immagine31.jpg'),
(32, 32, 'Stanza singola', 'Stanza singola in appartamento condiviso, ambiente giovane e dinamico. Ideale per studenti.', CURDATE(), 'immagine32.jpg'),
(33, 33, 'Attico con vista mare', 'Attico con vista mare, a pochi passi dalla spiaggia. Ottimo per le vacanze.', CURDATE(), 'immagine33.jpg'),
(34, 34, 'Appartamento con garage', 'Appartamento con garage privato, ideale per famiglie con auto. Vicino a scuole e servizi.', CURDATE(), 'immagine34.jpg'),
(35, 35, 'Casa indipendente', 'Casa indipendente con ampio giardino e parcheggio. Perfetta per famiglie.', CURDATE(), 'immagine35.jpg'),
(36, 36, 'Appartamento in centro storico', 'Appartamento nel centro storico della città, a due passi dai principali monumenti.', CURDATE(), 'immagine36.jpg'),
(37, 37, 'Loft moderno', 'Loft moderno e spazioso, ideale per giovani coppie o professionisti.', CURDATE(), 'immagine37.jpg'),
(38, 38, 'Villa con piscina', 'Villa con piscina privata e ampi spazi verdi. Finiture di lusso.', CURDATE(), 'immagine38.jpg'),
(39, 39, 'Appartamento con giardino', 'Appartamento con giardino privato, ideale per famiglie con bambini.', CURDATE(), 'immagine39.jpg'),
(40, 40, 'Stanza doppia', 'Stanza doppia in appartamento condiviso, ambiente giovane e dinamico. Ideale per studenti.', CURDATE(), 'immagine40.jpg'),
(41, 41, 'Appartamento ristrutturato', 'Appartamento ristrutturato di recente, con finiture di pregio. Zona ben servita.', CURDATE(), 'immagine41.jpg'),
(42, 42, 'Monolocale arredato', 'Monolocale arredato con gusto, pronto per essere abitato. Vicino a tutti i servizi.', CURDATE(), 'immagine42.jpg'),
(43, 43, 'Casa con giardino', 'Casa con ampio giardino, ideale per famiglie con bambini. Zona tranquilla.', CURDATE(), 'immagine43.jpg'),
(44, 44, 'Appartamento di lusso', 'Appartamento di lusso con finiture di alto livello. Posizione centrale.', CURDATE(), 'immagine44.jpg'),
(45, 45, 'Stanza in affitto', 'Stanza in affitto in appartamento condiviso, ambiente giovane e dinamico. Ideale per studenti.', CURDATE(), 'immagine45.jpg'),
(46, 46, 'Loft con terrazza', 'Loft con ampia terrazza, ideale per giovani coppie. Vicino a tutti i servizi.', CURDATE(), 'immagine46.jpg'),
(47, 47, 'Casa in affitto', 'Casa indipendente in affitto, ideale per famiglie. Zona tranquilla.', CURDATE(), 'immagine47.jpg'),
(48, 48, 'Appartamento vista mare', 'Appartamento con vista mare, a pochi passi dalla spiaggia. Ideale per le vacanze.', CURDATE(), 'immagine48.jpg');

ALTER TABLE indirizzi ADD citta VARCHAR(50);



INSERT INTO agente (id_azienda, idutente, partita_iva)
VALUES (1, 1, '12345678901'),
       (1, 2, '23456789012'),
       (2, 3, '34567890123'),
       (2, 4, '45678901234'),
       (3, 5, '56789012345'),
       (3, 6, '67890123456'),
       (4, 7, '78901234567'),
       (4, 8, '89012345678'),
       (5, 9, '90123456789'),
	   (5, 10, '01234567890'),
       (6, 11, '10987654321'),
       (6, 12, '21098765432'),
       (7, 13, '32109876543'),
       (7, 14, '43210987654'),
       (8, 15, '54321098765'),
       (8, 16, '65432109876'),
       (9, 17, '76543210987'),
       (9, 2, '87654321098'),
       (10, 3, '98765432109'),
       (10, 4, '09876543210'),
       (11, 5, '11223344556'),
       (11, 6, '22334455667'),
       (12, 7, '33445566778'),
       (12, 8, '44556677889'),
       (13, 9, '55667788990'),
	   (13, 10, '66778899001'),
       (14, 11, '77889900112'),
       (14, 12, '88990011223'),
       (15, 13, '99001122334'),
       (15, 14, '00112233445'),
       (16, 15, '11001100110'),
       (16, 16, '22112211221'),
       (17, 17, '33223322332'),
	   (17, 18, '44334433443'),
       (18, 19, '55445544554'),
       (18, 20, '66556655665'),
       (19, 21, '77667766776'),
       (19, 22, '88778877887'),
       (20, 23, '99889988998'),
       (20, 24, '00990099009');


INSERT INTO preferenze (utente, annuncio) VALUES (49, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (49, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (50, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (51, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (52, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (53, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (54, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (55, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (56, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (57, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (58, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (59, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (60, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (61, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (62, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (63, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (64, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (65, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (66, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (67, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (68, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (69, 48);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 1);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 2);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 3);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 4);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 5);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 6);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 7);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 8);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 9);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 10);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 11);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 12);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 13);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 14);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 15);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 16);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 17);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 18);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 19);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 20);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 21);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 22);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 23);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 24);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 25);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 26);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 27);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 28);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 29);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 30);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 31);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 32);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 33);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 34);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 35);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 36);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 37);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 38);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 39);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 40);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 41);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 42);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 43);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 44);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 45);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 46);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 47);
INSERT INTO preferenze (utente, annuncio) VALUES (70, 48);


