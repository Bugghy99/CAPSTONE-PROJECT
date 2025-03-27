CREATE DATABASE gestione_affitti;
USE gestione_affitti;
CREATE TABLE IMMOBILI (
    Immo_id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Indirizzo VARCHAR(255) NOT NULL,
    Citta VARCHAR(100) NOT NULL,
    Regione VARCHAR(100),
    Tipologia VARCHAR(50),
    Proprietario VARCHAR(100),
    Capacita INT,
    Classe_energetica VARCHAR(10),
    Condominio BOOLEAN,
    Tassa_soggiorno INT
);

CREATE TABLE CLIENTI (
    Id_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cognome VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Telefono VARCHAR(20),
    Eta INT,
    Stato VARCHAR(50),
    Piattaforma VARCHAR(50)
);
CREATE TABLE PRENOTAZIONI (
    Id_prenotazione INT PRIMARY KEY AUTO_INCREMENT,
    Immo_id INT,
    Data_in DATE NOT NULL,
    Data_out DATE NOT NULL,
    N_Ospiti INT,
    Piattaforma VARCHAR(50),
    Stato_prenotazione VARCHAR(50),
    Recensione TEXT,
    FOREIGN KEY (Immo_id) REFERENCES IMMOBILI(Immo_id)
);
CREATE TABLE FATTURAZIONE (
    Fatturazione_Id INT PRIMARY KEY AUTO_INCREMENT,
    Id_prenotazione INT UNIQUE,
    Importo_lordo DECIMAL(10,2) NOT NULL,
    Data_Ricavo DATE NOT NULL,
    Piattaforma VARCHAR(50),
    Percentuale_commissione DECIMAL(5,2),
    FOREIGN KEY (Id_prenotazione) REFERENCES PRENOTAZIONI(Id_prenotazione)
);
CREATE TABLE CHECK_IN (
    Id_Pratica INT PRIMARY KEY AUTO_INCREMENT,
    Id_Prenotazione INT,
    Id_Cliente INT,
    Data_Checkin DATE NOT NULL,
    Data_Checkout DATE NOT NULL,
    Stato_invio VARCHAR(50),
    Data_invio DATE,
    Invio_Documento BOOLEAN,
    FOREIGN KEY (Id_Prenotazione) REFERENCES PRENOTAZIONI(Id_prenotazione),
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTI(Id_Cliente)
);
CREATE TABLE COSTI (
    Costo_id INT PRIMARY KEY AUTO_INCREMENT,
    Immo_id INT,
    Id_Tipo INT,
    Importo DECIMAL(10,2) NOT NULL,
    Fornitore VARCHAR(100),
    Data DATE NOT NULL,
    Fattura BOOLEAN,
    FOREIGN KEY (Immo_id) REFERENCES IMMOBILI(Immo_id)
);
CREATE TABLE TIPO_COSTO (
    Id_Tipo INT PRIMARY KEY AUTO_INCREMENT,
    Descrizione VARCHAR(255) NOT NULL
);

INSERT INTO immobili (Immo_id, Nome, Indirizzo, Citta, Regione, Tipologia, Proprietario, Capacita, Classe_energetica, Condominio) 
VALUES 
(1, 'Casa Clelia', 'Via Russi 8', 'Lido di Savio', 'Emilia-Romagna', 'Bilocale', 'Meloni', 5, 'G', TRUE),
(2, 'Casa Piadina', 'Via Moretti 40', 'Riccione', 'Emilia-Romagna', 'Bilocale', 'Conti', 4, 'F', TRUE),
(3, 'Casa Eia', 'Via Barbieri 56', 'Villasimius', 'Sardegna', 'Bilocale', 'Esposito', 4, 'G', TRUE),
(4, 'Casa Mondello', 'Via Moretti 87', 'Mondello', 'Sicilia', 'Monolocale', 'Ricci', 2, 'A', FALSE),
(5, 'Casa Mare', 'Via Bianchi 71', 'Sciacca', 'Sicilia', 'Monolocale', 'Barbieri', 2, 'G', FALSE),
(6, 'Villa Costanza', 'Via Ferrari 100', 'Gallipoli', 'Puglia', 'Villa', 'Barbieri', 7, 'E', FALSE);

INSERT INTO prenotazioni (Id_prenotazione, Immo_Id, Data_in, Data_out, N_Ospiti, Piattaforma, Stato_prenotazione, Recensione) 
VALUES 
(1, 5, '2023-05-25', '2023-05-29', 2, 'BOOKING', 'CONFERMATA', 5),
(2, 1, '2023-05-29', '2023-06-04', 3, 'AIRBNB', 'CONFERMATA', 5),
(3, 3, '2023-03-21', '2023-03-25', 2, 'BOOKING', 'CONFERMATA', 5),
(4, 2, '2023-06-07', '2023-06-13', 4, 'VRBO', 'CONFERMATA', 5),
(5, 6, '2023-02-09', '2023-02-13', 4, 'VRBO', 'CONFERMATA', 5),
(6, 2, '2023-06-27', '2023-07-03', 4, 'VRBO', 'CONFERMATA', 5),
(7, 3, '2023-08-08', '2023-08-13', 4, 'BOOKING', 'CONFERMATA', 5),
(8, 4, '2023-12-28', '2024-01-02', 2, 'BOOKING', 'CONFERMATA', 4),
(9, 1, '2023-06-13', '2023-06-18', 4, 'AIRBNB', 'CONFERMATA', 5),
(10, 5, '2023-07-04', '2023-07-09', 2, 'VRBO', 'CONFERMATA', 5),
(11, 1, '2023-07-23', '2023-07-30', 4, 'BOOKING', 'CONFERMATA', 4),
(12, 5, '2023-07-25', '2023-07-30', 2, 'AIRBNB', 'CONFERMATA', 2),
(13, 4, '2024-06-27', '2024-07-03', 2, 'BOOKING', 'CONFERMATA', 3),
(14, 1, '2023-08-17', '2023-08-25', 2, 'BOOKING', 'CONFERMATA', 5),
(15, 2, '2023-07-15', '2023-07-22', 3, 'BOOKING', 'CONFERMATA', 5),
(16, 3, '2023-08-15', '2023-08-19', 4, 'AIRBNB', 'CONFERMATA', 3),
(17, 3, '2023-08-29', '2023-09-04', 2, 'VRBO', 'CONFERMATA', 5),
(18, 1, '2023-08-23', '2023-08-30', 3, 'AIRBNB', 'CONFERMATA', 5),
(19, 6, '2024-06-08', '2024-06-15', 4, 'BOOKING', 'CONFERMATA', 4),
(20, 2, '2023-08-12', '2023-08-19', 2, 'AIRBNB', 'CONFERMATA', 5),
(21, 1, '2023-09-02', '2023-09-12', 2, 'AIRBNB', 'CONFERMATA', 5),
(22, 4, '2024-10-05', '2024-10-12', 2, 'VRBO', 'CONFERMATA', 5),
(23, 5, '2023-08-15', '2023-08-22', 2, 'AIRBNB', 'CONFERMATA', 5),
(24, 5, '2024-02-15', '2024-02-22', 2, 'VRBO', 'CONFERMATA', 4),
(25, 3, '2024-03-07', '2024-03-11', 3, 'VRBO', 'CONFERMATA', 5),
(26, 2, '2024-10-05', '2024-10-15', 2, 'BOOKING', 'DA CONFERMARE', NULL);

INSERT INTO CLIENTI (Id_Cliente, Nome, Cognome, Stato, Eta, Piattaforma, Telefono, Email)
VALUES
(1, 'David', 'Silva', 'Spagna', 54, 'AIRBNB', '+393547639891', 'd.silva@email.com'),
(2, 'Davide', 'Rossi', 'Italia', 41, 'VRBO', '+393415859786', 'davide.rossi@email.com'),
(3, 'Claudio', 'Ramirez', 'Spagna', 29, 'BOOKING', '+393844131021', 'cl.rami@email.com'),
(4, 'Dolores', 'Ricci', 'Spagna', 22, 'VRBO', '+393139005973', 'dol.ricci@email.com'),
(5, 'Max', 'Maher', 'Germania', 20, 'VRBO', '+393145038245', 'm.maher@email.com'),
(6, 'Marc', 'White', 'USA', 42, 'BOOKING', '+393907731873', 'marc.white@email.com'),
(7, 'Alessia', 'Leto', 'Italia', 24, 'AIRBNB', '+393595113162', 'a.leto@email.com'),
(8, 'Marta', 'Lebas', 'Francia', 38, 'AIRBNB', '+393305698342', 'marta.lebas@email.com'),
(9, 'Giulia', 'Rossi', 'Italia', 53, 'VRBO', '+393979347263', 'giulia.rossi@email.com'),
(10, 'Genevieve', 'Menez', 'Francia', 47, 'AIRBNB', '+393727720244', 'g.menez@email.com'),
(11, 'Samuel', 'Cash', 'UK', 62, 'BOOKING', '+393150483966', 's.cash@email.com'),
(12, 'Julia', 'Fischer', 'Germania', 45, 'AIRBNB', '+393669510806', 'Ju.fish@email.com'),
(13, 'Giulia', 'Desvignes', 'Francia', 21, 'AIRBNB', '+393668813069', 'giulia.dv@email.com'),
(14, 'Jorge', 'Martinez', 'Spagna', 47, 'BOOKING', '+393983944560', 'J.marti@email.com'),
(15, 'John', 'Mclane', 'USA', 29, 'VRBO', '+393464316019', 'j.mcl@email.com'),
(16, 'Luke', 'Rollins', 'USA', 56, 'VRBO', '+393486630282', 'Luke.roll@email.com'),
(17, 'Mike', 'Preston', 'USA', 18, 'AIRBNB', '+393007477803', 'mk.prst@email.com'),
(18, 'Joao', 'Ramirez', 'Mexico', 30, 'VRBO', '+393856857317', 'J.rami@email.com'),
(19, 'Helena', 'Muller', 'Germania', 63, 'BOOKING', '+393961977884', 'Hele.mull@email.com'),
(20, 'Francesca', 'Conti', 'Spagna', 25, 'BOOKING', '+393316027658', 'francesca.conti@email.com'),
(21, 'Bastian', 'Weber', 'Germania', 43, 'VRBO', '+393329516028', 'b.web@email.com'),
(22, 'Alvaro', 'Benitez', 'Spagna', 60, 'AIRBNB', '+393808774331', 'alva.beni@email.com'),
(23, 'Max', 'Foster', 'UK', 40, 'VRBO', '+393839968449', 'm.fstr@email.com'),
(24, 'Valentina', 'Esposito', 'Italia', 60, 'VRBO', '+393721991420', 'valentina.esposito@email.com'),
(25, 'Giorgio', 'Bianchi', 'Italia', 23, 'AIRBNB', '+393722489419', 'giorgio.bianchi@email.com'),
(26, 'Ferran', 'Gonzalez', 'Spagna', 61, 'BOOKING', '+393587954536', 'frgr@email.com');

INSERT INTO CHECK_IN (
    ID_PRATICA, ID_PRENOTAZIONE, DATA_CHECKIN, DATA_CHECKOUT, ID_CLIENTE, INVIO_DOCUMENTO, DATA_INVIO, STATO_INVIO
) VALUES
(1, 1, '2023-05-25', '2023-05-29', 1, TRUE, '2023-05-25', 'CONFERMATO'),
(2, 2, '2023-05-29', '2023-06-04', 2, TRUE, '2023-05-29', 'CONFERMATO'),
(3, 3, '2023-03-21', '2023-03-25', 3, TRUE, '2023-03-21', 'CONFERMATO'),
(4, 4, '2023-06-07', '2023-06-13', 4, TRUE, '2023-06-07', 'CONFERMATO'),
(5, 5, '2023-02-09', '2023-02-13', 5, TRUE, '2023-02-09', 'CONFERMATO'),
(6, 6, '2023-06-27', '2023-07-03', 6, TRUE, '2023-06-27', 'CONFERMATO'),
(7, 7, '2023-08-08', '2023-08-13', 7, TRUE, '2023-08-08', 'CONFERMATO'),
(8, 8, '2023-12-28', '2024-01-02', 8, TRUE, '2024-01-04', 'CONFERMATO'),
(9, 9, '2023-06-13', '2023-06-18', 9, TRUE, '2023-06-13', 'CONFERMATO'),
(10, 10, '2023-07-04', '2023-07-09', 10, TRUE, '2023-07-04', 'CONFERMATO'),
(11, 11, '2023-07-23', '2023-07-30', 11, TRUE, '2023-07-23', 'CONFERMATO'),
(12, 12, '2023-07-25', '2023-07-30', 12, TRUE, '2023-07-25', 'CONFERMATO'),
(13, 13, '2024-06-27', '2024-07-03', 13, TRUE, '2024-06-27', 'CONFERMATO'),
(14, 14, '2023-08-17', '2023-08-25', 14, TRUE, '2023-08-17', 'CONFERMATO'),
(15, 15, '2023-07-15', '2023-07-22', 15, TRUE, '2023-07-15', 'CONFERMATO'),
(16, 16, '2023-08-15', '2023-08-19', 16, TRUE, '2023-08-15', 'CONFERMATO'),
(17, 17, '2023-08-29', '2023-09-04', 17, TRUE, '2023-08-29', 'CONFERMATO'),
(18, 18, '2023-08-23', '2023-08-30', 18, TRUE, '2023-08-23', 'CONFERMATO'),
(19, 19, '2024-06-08', '2024-06-15', 19, TRUE, '2024-06-08', 'CONFERMATO'),
(20, 20, '2023-08-12', '2023-08-19', 20, TRUE, '2023-08-12', 'CONFERMATO'),
(21, 21, '2023-09-02', '2023-09-12', 21, TRUE, '2023-09-02', 'CONFERMATO'),
(22, 22, '2024-10-05', '2024-10-12', 22, TRUE, '2024-10-05', 'CONFERMATO'),
(23, 23, '2023-08-15', '2023-08-22', 23, TRUE, '2023-08-15', 'CONFERMATO'),
(24, 24, '2024-02-15', '2024-02-22', 24, TRUE, '2024-02-15', 'CONFERMATO'),
(25, 25, '2024-03-07', '2024-03-11', 25, TRUE, '2024-03-07', 'CONFERMATO');

INSERT INTO fatturazione (FATTURAZIONE_ID, DATA_RICAVO, IMPORTO_LORDO, PIATTAFORMA, ID_PRENOTAZIONE, PERCENTUALE_COMMISSIONE) 
VALUES 
(1, '2023-05-18', 450, 'BOOKING', 1, 0.2),
(2, '2023-05-22', 350, 'AIRBNB', 2, 0.22),
(3, '2023-03-14', 330, 'BOOKING', 3, 0.2),
(4, '2023-05-31', 728.58, 'VRBO', 4, 0.25),
(5, '2023-02-07', 1100, 'VRBO', 5, 0.25),
(6, '2023-06-20', 760, 'VRBO', 6, 0.25),
(7, '2023-08-01', 700, 'BOOKING', 7, 0.2),
(8, '2023-12-24', 500, 'BOOKING', 8, 0.2),
(9, '2023-06-06', 400, 'AIRBNB', 9, 0.22),
(10, '2023-06-27', 550, 'VRBO', 10, 0.25),
(11, '2023-07-16', 550, 'BOOKING', 11, 0.2),
(12, '2023-07-18', 650, 'AIRBNB', 12, 0.22),
(13, '2024-06-20', 600, 'BOOKING', 13, 0.2),
(14, '2023-08-10', 900, 'BOOKING', 14, 0.2),
(15, '2023-07-08', 950, 'BOOKING', 15, 0.2),
(16, '2023-08-08', 770, 'AIRBNB', 16, 0.22),
(17, '2023-08-22', 890, 'VRBO', 17, 0.25),
(18, '2023-08-16', 950, 'AIRBNB', 18, 0.22),
(19, '2024-06-01', 1500, 'BOOKING', 19, 0.2),
(20, '2023-08-05', 1100, 'AIRBNB', 20, 0.22),
(21, '2023-08-25', 900, 'AIRBNB', 21, 0.22),
(22, '2024-09-28', 550, 'VRBO', 22, 0.25),
(23, '2023-08-07', 720, 'AIRBNB', 23, 0.22),
(24, '2024-02-08', 400, 'VRBO', 24, 0.25),
(25, '2024-02-27', 330, 'VRBO', 25, 0.25);

INSERT INTO Costi (COSTO_ID, IMMO_ID, DATA, ID_Tipo, Fornitore, Importo) VALUES
(1, 1, '2023-06-04', 2, 'Pulizie Cervia', 50),
(2, 1, '2023-06-18', 2, 'Pulizie Cervia', 50),
(3, 1, '2023-07-30', 2, 'Pulizie Cervia', 50),
(4, 1, '2023-08-25', 2, 'Pulizie Cervia', 50),
(5, 1, '2023-08-30', 2, 'Pulizie Cervia', 50),
(6, 1, '2023-09-12', 2, 'Pulizie Cervia', 50),
(7, 1, '2023-11-15', 4, 'IKEA', 1000),
(8, 1, '2023-11-15', 7, 'IKEA', 250),
(9, 1, '2023-01-31', 3, 'ENEL', 90),
(10, 1, '2023-03-31', 3, 'ENEL', 90),
(11, 1, '2023-05-31', 3, 'ENEL', 90),
(12, 1, '2023-07-31', 3, 'ENEL', 120),
(13, 1, '2023-09-30', 3, 'ENEL', 150),
(14, 1, '2023-11-30', 3, 'ENEL', 90),
(15, 1, '2024-01-31', 3, 'ENEL', 90),
(16, 1, '2024-03-31', 3, 'ENEL', 90),
(17, 1, '2024-05-31', 3, 'ENEL', 90),
(18, 1, '2024-07-31', 3, 'ENEL', 120),
(19, 1, '2024-09-30', 3, 'ENEL', 150),
(20, 1, '2024-11-30', 3, 'ENEL', 90),
(21, 1, '2025-01-31', 3, 'ENEL', 90),
(22, 1, '2023-06-28', 1, 'CREDIT AGRICOLE', 600),
(23, 1, '2023-07-28', 1, 'CREDIT AGRICOLE', 600),
(24, 1, '2023-08-28', 1, 'CREDIT AGRICOLE', 600),
(25, 1, '2023-09-28', 1, 'CREDIT AGRICOLE', 600),
(26, 1, '2023-10-28', 1, 'CREDIT AGRICOLE', 600),
(27, 1, '2023-11-28', 1, 'CREDIT AGRICOLE', 600),
(28, 1, '2023-12-28', 1, 'CREDIT AGRICOLE', 600),
(29, 1, '2024-01-28', 1, 'CREDIT AGRICOLE', 600),
(30, 1, '2024-02-28', 1, 'CREDIT AGRICOLE', 600),
(31, 1, '2024-03-28', 1, 'CREDIT AGRICOLE', 600),
(32, 1, '2024-04-28', 1, 'CREDIT AGRICOLE', 600),
(33, 1, '2024-05-28', 1, 'CREDIT AGRICOLE', 600),
(34, 1, '2024-06-28', 1, 'CREDIT AGRICOLE', 600),
(35, 1, '2024-07-28', 1, 'CREDIT AGRICOLE', 600),
(36, 1, '2024-08-28', 1, 'CREDIT AGRICOLE', 600),
(37, 1, '2024-09-28', 1, 'CREDIT AGRICOLE', 600),
(38, 1, '2024-10-28', 1, 'CREDIT AGRICOLE', 600),
(39, 1, '2024-11-28', 1, 'CREDIT AGRICOLE', 600),
(40, 1, '2024-12-28', 1, 'CREDIT AGRICOLE', 600),
(41, 1, '2025-01-28', 1, 'CREDIT AGRICOLE', 600),
(42, 1, '2023-06-30', 5, 'CONDOMINIO', 200),
(43, 1, '2023-12-31', 5, 'CONDOMINIO', 200),
(44, 1, '2023-06-30', 6, 'IMU', 220),
(45, 1, '2023-12-31', 6, 'IMU', 220),
(46, 2, '2023-06-13', 2, 'Pulizie Cervia', 50),
(47, 2, '2023-07-03', 2, 'Pulizie Cervia', 50),
(48, 2, '2023-07-22', 2, 'Pulizie Cervia', 50),
(49, 2, '2023-08-19', 2, 'Pulizie Cervia', 50),
(50, 2, '2023-11-15', 7, 'IKEA', 250),
(51, 2, '2023-11-15', 8, 'IKEA', 50),
(52, 3, '2023-03-25', 2, 'Pulizie Simius', 60),
(53, 3, '2023-08-13', 2, 'Pulizie Simius', 60),
(54, 3, '2023-08-19', 2, 'Pulizie Simius', 60),
(55, 3, '2023-09-04', 2, 'Pulizie Simius', 60),
(56, 3, '2024-03-11', 2, 'Pulizie Simius', 60),
(57, 3, '2023-11-15', 7, 'IKEA', 250),
(58, 3, '2023-11-15', 8, 'IKEA', 50),
(59, 3, '2024-01-05', 4, 'IKEA', 290),
(60, 4, '2024-01-02', 2, 'Pulizie Mondello', 60),
(61, 4, '2024-07-03', 2, 'Pulizie Mondello', 60),
(62, 4, '2024-10-12', 2, 'Pulizie Mondello', 60),
(63, 4, '2024-11-15', 7, 'IKEA', 250),
(64, 4, '2025-01-05', 4, 'Grandi magazzini Palermo', 150),
(65, 5, '2023-05-29', 2, 'Pulizie Sciacca', 60),
(66, 5, '2023-07-09', 2, 'Pulizie Sciacca', 60),
(67, 5, '2023-07-30', 2, 'Pulizie Sciacca', 60),
(68, 5, '2023-08-22', 2, 'Pulizie Sciacca', 60),
(69, 5, '2024-02-22', 2, 'Pulizie Sciacca', 60),
(70, 5, '2024-11-15', 7, 'Grandi magazzini Sciacca', 200),
(71, 5, '2024-11-15', 4, 'Mercato di Sciacca', 90),
(72, 5, '2024-12-30', 9, 'Francesco Leto', 190),
(73, 1, '2024-12-01', 9, 'Fabrizio Maltesi', 140),
(74, 3, '2025-01-05', 9, 'Marco Puddu', 100),
(75, 6, '2023-02-13', 2, 'Pulizie Salento', 90),
(76, 6, '2024-06-15', 2, 'Pulizie Salento', 90),
(77, 6, '2024-09-19', 7, 'Mondo Convenienza', 180),
(78, 6, '2024-09-19', 8, 'Mondo Convenienza', 40),
(79, 6, '2024-09-19', 4, 'Mondo Convenienza', 320),
(80, 6, '2024-10-21', 9, 'Antonio Nocco', 150),
(81, 6, '2024-12-30', 9, 'Franco Piccoli', 68);

INSERT INTO tipo_costo (ID_TIPO, DESCRIZIONE)
VALUES
(1, 'RATA MUTUO'),
(2, 'PULIZIE'),
(3, 'BOLLETTA ENEL'),
(4, 'ARREDAMENTO'),
(5, 'SPESE CONDOMINIO'),
(6, 'IMU'),
(7, 'ESTINTORE'),
(8, 'RILEVATORE DI FUMO'),
(9, 'ARTIGIANI');

UPDATE immobili
SET Tassa_soggiorno=
    CASE 
        WHEN Immo_id = 1 THEN 5
        WHEN Immo_id = 2 THEN 5
        WHEN Immo_id = 3 THEN 8
        WHEN Immo_id = 4 THEN 8
        WHEN Immo_id = 5 THEN 8
        WHEN Immo_id = 6 THEN 10
    END
    where Immo_id in (1,2,3,4,5,6);
    
    UPDATE immobili
SET CAP=
    CASE 
        WHEN Immo_id = 1 THEN 48125
        WHEN Immo_id = 2 THEN 47838
        WHEN Immo_id = 3 THEN 09049
        WHEN Immo_id = 4 THEN 90151
        WHEN Immo_id = 5 THEN 92019
        WHEN Immo_id = 6 THEN 73014
    END
    where Immo_id in (1,2,3,4,5,6);
    
    UPDATE immobili
SET STATO=
    CASE 
        WHEN Immo_id = 1 THEN 'ITALIA'
        WHEN Immo_id = 2 THEN 'ITALIA'
        WHEN Immo_id = 3 THEN 'ITALIA'
        WHEN Immo_id = 4 THEN 'ITALIA'
        WHEN Immo_id = 5 THEN 'ITALIA'
        WHEN Immo_id = 6 THEN 'ITALIA'
    END
    where Immo_id in (1,2,3,4,5,6);
    
    INSERT INTO prenotazioni (
    ID_PRENOTAZIONE, IMMO_ID, DATA_IN, DATA_OUT, N_Ospiti, PIATTAFORMA, STATO_PRENOTAZIONE, RECENSIONE
) VALUES
(27, 1, '2024-04-22', '2024-04-29', 3, 'BOOKING', 'CONFERMATA', 5),
(28, 1, '2024-05-05', '2024-05-09', 2, 'BOOKING', 'CONFERMATA', 5),
(29, 1, '2024-06-03', '2024-06-20', 2, 'AIRBNB', 'CONFERMATA', 4),
(30, 1, '2024-06-27', '2024-07-03', 3, 'AIRBNB', 'CONFERMATA', 5),
(31, 1, '2024-07-10', '2024-07-25', 2, 'BOOKING', 'CONFERMATA', 4),
(32, 1, '2024-07-28', '2024-08-10', 3, 'AIRBNB', 'CONFERMATA', 5),
(33, 1, '2024-08-12', '2024-08-19', 2, 'BOOKING', 'CONFERMATA', 5),
(34, 1, '2024-08-21', '2024-08-29', 2, 'AIRBNB', 'CONFERMATA', 5),
(35, 1, '2024-09-01', '2024-09-09', 3, 'BOOKING', 'CONFERMATA', 4),
(36, 1, '2024-09-11', '2024-09-15', 1, 'AIRBNB', 'CONFERMATA', 5),
(37, 1, '2024-09-20', '2024-09-25', 3, 'BOOKING', 'CONFERMATA', 3),
(38, 2, '2024-07-10', '2024-07-17', 2, 'VRBO', 'CONFERMATA', 5),
(39, 2, '2024-07-24', '2024-07-31', 2, 'BOOKING', 'CONFERMATA', 5),
(40, 2, '2024-08-02', '2024-08-10', 2, 'BOOKING', 'CONFERMATA', 4),
(41, 2, '2024-08-12', '2024-08-19', 2, 'AIRBNB', 'CONFERMATA', 5),
(42, 2, '2024-08-22', '2024-08-29', 2, 'AIRBNB', 'CONFERMATA', 5),
(43, 2, '2024-09-01', '2024-09-10', 2, 'VRBO', 'CONFERMATA', 5),
(44, 3, '2024-07-01', '2024-07-08', 2, 'BOOKING', 'CONFERMATA', 5),
(45, 3, '2024-07-15', '2024-07-22', 2, 'BOOKING', 'CONFERMATA', 5),
(46, 3, '2024-07-23', '2024-07-30', 2, 'VRBO', 'CONFERMATA', 5),
(47, 3, '2024-08-02', '2024-08-16', 2, 'VRBO', 'CONFERMATA', 4),
(48, 3, '2024-08-20', '2024-08-30', 2, 'VRBO', 'CONFERMATA', 5),
(49, 4, '2024-07-10', '2024-07-20', 2, 'BOOKING', 'CONFERMATA', 5),
(50, 4, '2024-08-10', '2024-08-20', 2, 'BOOKING', 'CONFERMATA', 5),
(51, 5, '2024-06-20', '2024-06-27', 2, 'AIRBNB', 'CONFERMATA', 5),
(52, 5, '2024-07-03', '2024-07-10', 2, 'AIRBNB', 'CONFERMATA', 5),
(53, 5, '2024-07-15', '2024-07-22', 2, 'AIRBNB', 'CONFERMATA', 5),
(54, 5, '2024-08-02', '2024-08-10', 2, 'BOOKING', 'CONFERMATA', 5),
(55, 5, '2024-08-17', '2024-08-25', 2, 'BOOKING', 'CONFERMATA', 5),
(56, 5, '2024-08-26', '2024-09-03', 2, 'VRBO', 'CONFERMATA', 3),
(57, 5, '2024-09-10', '2024-09-20', 2, 'VRBO', 'CONFERMATA', 5),
(58, 6, '2024-07-02', '2024-07-09', 5, 'VRBO', 'CONFERMATA', 5),
(59, 6, '2024-07-30', '2024-08-15', 4, 'BOOKING', 'CONFERMATA', 5),
(60, 6, '2024-08-20', '2024-08-30', 4, 'BOOKING', 'CONFERMATA', 5);

INSERT INTO clienti (
    ID_CLIENTE, NOME, COGNOME, STATO, ETA, PIATTAFORMA, TELEFONO, EMAIL
) VALUES
(27, 'Lorenza', 'Spaga', 'Italia', 56, 'BOOKING', '+393596258447', 'lsp@gmail.com'),
(28, 'Guglielmo', 'Sofi', 'Italia', 40, 'BOOKING', '+393395896992', 'GLMSFI@GMAIL.COM'),
(29, 'Natasha', 'Olmi', 'Italia', 35, 'AIRBNB', '+393502622301', 'natolm@gmail.com'),
(30, 'Yasmine', 'Zalin', 'USA', 29, 'AIRBNB', '+393802524469', 'YZALI@GMAIL.COM'),
(31, 'Benedict', 'Britting', 'UK', 47, 'BOOKING', '+393802524468', 'bb@gmail.com'),
(32, 'Ferdinando', 'Orsi', 'Italia', 60, 'AIRBNB', '+393802524124', 'f.orsi@gmail.com'),
(33, 'Letizia', 'Nosta', 'Italia', 25, 'BOOKING', '+393802522020', 'lnost@gmail.com'),
(34, 'Samantha', 'Green', 'USA', 22, 'AIRBNB', '+393802524236', 'samig@gmail.com'),
(35, 'Jose', 'Leche', 'Spagna', 28, 'BOOKING', '+393802547894', 'jlech@gmail.com'),
(36, 'Clarice', 'Croissant', 'Francia', 20, 'AIRBNB', '+393396584789', 'cross@gmail.com'),
(37, 'Mattia', 'Lordini', 'Italia', 38, 'BOOKING', '+393802544789', 'lordo@gmail.com'),
(38, 'Fernanda', 'Lupe', 'Spagna', 43, 'VRBO', '+393802417895', 'lupee@gmail.com'),
(39, 'Asia', 'Pinna', 'Italia', 20, 'BOOKING', '+393802154110', 'pinna@gmail.com'),
(40, 'Susanna', 'Cresta', 'Italia', 27, 'BOOKING', '+393802524404', 'cress@gmail.com'),
(41, 'Marco', 'Scarpa', 'Italia', 32, 'AIRBNB', '+393802147820', 'scar@gmail.com'),
(42, 'Francesca', 'Clori', 'Italia', 18, 'AIRBNB', '+393800145852', 'cloclo@gmail.com'),
(43, 'Massimo', 'Belga', 'Italia', 58, 'VRBO', '+393802524469', 'belgi@gmail.com'),
(44, 'Lucrezia', 'Saggi', 'Italia', 23, 'BOOKING', '+393802524252', 'sassa@gmail.com'),
(45, 'Anthony', 'Brooklyn', 'USA', 20, 'BOOKING', '+393802500012', 'brooks@gmail.com'),
(46, 'Leandro', 'Zavier', 'Spagna', 40, 'VRBO', '+393802536981', 'zavi@gmail.com'),
(47, 'Victoria', 'McGreen', 'UK', 33, 'VRBO', '+393802014125', 'mcmc@gmail.com'),
(48, 'Eleanor', 'Tea', 'UK', 30, 'VRBO', '+393802525336', 'teate@gmail.com'),
(49, 'James', 'Buddy', 'USA', 39, 'BOOKING', '+393802525896', 'bud@gmail.com'),
(50, 'Jean Pierre', 'Omelette', 'Francia', 38, 'BOOKING', '+393802014589', 'omejp@gmail.com');

INSERT INTO CHECK_IN (
    ID_PRENOTAZIONE, DATA_CHECKIN, DATA_CHECKOUT, ID_CLIENTE, INVIO_DOCUMENTO, DATA_INVIO, STATO_INVIO
) VALUES
(27, '2024-04-22', '2024-04-29', 27, 1, '2024-04-22', 'CONFERMATO'),
(28, '2024-05-05', '2024-05-09', 28, 1, '2024-05-05', 'CONFERMATO'),
(29, '2024-06-03', '2024-06-20', 29, 1, '2024-06-03', 'CONFERMATO'),
(30, '2024-06-27', '2024-07-03', 30, 1, '2024-06-27', 'CONFERMATO'),
(31, '2024-07-10', '2024-07-25', 31, 1, '2024-07-10', 'CONFERMATO'),
(32, '2024-07-28', '2024-08-10', 32, 1, '2024-07-28', 'CONFERMATO'),
(33, '2024-08-12', '2024-08-19', 33, 1, '2024-08-12', 'CONFERMATO'),
(34, '2024-08-21', '2024-08-29', 34, 1, '2024-08-21', 'CONFERMATO'),
(35, '2024-09-01', '2024-09-09', 35, 1, '2024-09-01', 'CONFERMATO'),
(36, '2024-09-11', '2024-09-15', 36, 1, '2024-09-11', 'CONFERMATO'),
(37, '2024-09-20', '2024-09-25', 37, 1, '2024-09-20', 'CONFERMATO'),
(38, '2024-07-10', '2024-07-17', 38, 1, '2024-07-10', 'CONFERMATO'),
(39, '2024-07-24', '2024-07-31', 39, 1, '2024-07-24', 'CONFERMATO'),
(40, '2024-08-02', '2024-08-10', 40, 1, '2024-08-02', 'CONFERMATO'),
(41, '2024-08-12', '2024-08-19', 41, 1, '2024-08-12', 'CONFERMATO'),
(42, '2024-08-22', '2024-08-29', 42, 1, '2024-08-22', 'CONFERMATO'),
(43, '2024-09-01', '2024-09-10', 43, 1, '2024-09-01', 'CONFERMATO'),
(44, '2024-07-01', '2024-07-08', 3, 1, '2024-07-01', 'CONFERMATO'),
(45, '2024-07-15', '2024-07-22', 19, 1, '2024-07-15', 'CONFERMATO'),
(46, '2024-07-23', '2024-07-30', 23, 1, '2024-07-23', 'CONFERMATO'),
(47, '2024-08-02', '2024-08-16', 5, 1, '2024-08-02', 'CONFERMATO'),
(48, '2024-08-20', '2024-08-30', 16, 1, '2024-08-20', 'CONFERMATO'),
(49, '2024-07-10', '2024-07-20', 6, 1, '2024-07-10', 'CONFERMATO'),
(50, '2024-08-10', '2024-08-20', 14, 1, '2024-08-10', 'CONFERMATO'),
(51, '2024-06-20', '2024-06-27', 17, 1, '2024-06-20', 'CONFERMATO'),
(52, '2024-07-03', '2024-07-10', 22, 1, '2024-07-03', 'CONFERMATO'),
(53, '2024-07-15', '2024-07-22', 1, 1, '2024-07-15', 'CONFERMATO'),
(54, '2024-08-02', '2024-08-10', 44, 1, '2024-08-02', 'CONFERMATO'),
(55, '2024-08-17', '2024-08-25', 45, 1, '2024-08-17', 'CONFERMATO'),
(56, '2024-08-26', '2024-09-03', 46, 1, '2024-08-26', 'CONFERMATO'),
(57, '2024-09-10', '2024-09-20', 47, 1, '2024-09-10', 'CONFERMATO'),
(58, '2024-07-02', '2024-07-09', 48, 1, '2024-07-02', 'CONFERMATO'),
(59, '2024-07-30', '2024-08-15', 49, 1, '2024-07-30', 'CONFERMATO'),
(60, '2024-08-20', '2024-08-30', 50, 1, '2024-08-20', 'CONFERMATO');

INSERT INTO fatturazione (
    FATTURAZIONE_ID, DATA_RICAVO, IMPORTO_LORDO, PIATTAFORMA, ID_PRENOTAZIONE, PERCENTUALE_COMMISSIONE
) VALUES
(27, '2024-04-15', 300, 'BOOKING', 27, 0.2),
(28, '2024-04-29', 280, 'BOOKING', 28, 0.2),
(29, '2024-05-27', 900, 'AIRBNB', 29, 0.22),
(30, '2024-06-20', 900, 'AIRBNB', 30, 0.22),
(31, '2024-07-03', 700, 'BOOKING', 31, 0.2),
(32, '2024-07-21', 1600, 'AIRBNB', 32, 0.22),
(33, '2024-08-05', 1600, 'BOOKING', 33, 0.2),
(34, '2024-08-14', 1300, 'AIRBNB', 34, 0.22),
(35, '2024-08-25', 900, 'BOOKING', 35, 0.2),
(36, '2024-09-04', 400, 'AIRBNB', 36, 0.22),
(37, '2024-09-13', 400, 'BOOKING', 37, 0.2),
(38, '2024-07-03', 800, 'VRBO', 38, 0.25),
(39, '2024-07-17', 800, 'BOOKING', 39, 0.2),
(40, '2024-07-25', 800, 'BOOKING', 40, 0.2),
(41, '2024-08-05', 1000, 'AIRBNB', 41, 0.22),
(42, '2024-08-15', 1200, 'AIRBNB', 42, 0.22),
(43, '2024-08-24', 1200, 'VRBO', 43, 0.25),
(44, '2024-06-24', 800, 'BOOKING', 44, 0.2),
(45, '2024-07-08', 800, 'BOOKING', 45, 0.2),
(46, '2024-07-16', 800, 'VRBO', 46, 0.25),
(47, '2024-07-26', 1300, 'VRBO', 47, 0.25),
(48, '2024-08-13', 1200, 'VRBO', 48, 0.25),
(49, '2024-07-10', 700, 'BOOKING', 49, 0.2),
(50, '2024-08-10', 800, 'BOOKING', 50, 0.2),
(51, '2024-06-13', 500, 'AIRBNB', 51, 0.22),
(52, '2024-06-22', 500, 'AIRBNB', 52, 0.22),
(53, '2024-07-08', 700, 'AIRBNB', 53, 0.22),
(54, '2024-07-26', 700, 'BOOKING', 54, 0.2),
(55, '2024-08-10', 900, 'BOOKING', 55, 0.2),
(56, '2024-08-19', 900, 'VRBO', 56, 0.25),
(57, '2024-09-03', 900, 'VRBO', 57, 0.25),
(58, '2024-06-25', 2000, 'VRBO', 58, 0.25),
(59, '2024-07-23', 2500, 'BOOKING', 59, 0.2),
(60, '2024-08-13', 3000, 'BOOKING', 60, 0.2);

INSERT INTO costi (
    COSTO_ID, IMMO_ID, DATA, ID_TIPO, FORNITORE, IMPORTO
) VALUES
(82, 1, '2024-04-29', 2, 'Pulizie Cervia', 50),
(83, 1, '2024-05-09', 2, 'Pulizie Cervia', 50),
(84, 1, '2024-06-20', 2, 'Pulizie Cervia', 50),
(85, 1, '2024-07-03', 2, 'Pulizie Cervia', 50),
(86, 1, '2024-07-25', 2, 'Pulizie Cervia', 50),
(87, 1, '2024-08-10', 2, 'Pulizie Cervia', 50),
(88, 1, '2024-08-19', 2, 'Pulizie Cervia', 50),
(89, 1, '2024-08-29', 2, 'Pulizie Cervia', 50),
(90, 1, '2024-09-09', 2, 'Pulizie Cervia', 50),
(91, 1, '2024-09-15', 2, 'Pulizie Cervia', 50),
(92, 1, '2024-09-25', 2, 'Pulizie Cervia', 50),
(93, 2, '2024-07-17', 2, 'Pulizie Cervia', 50),
(94, 2, '2024-07-31', 2, 'Pulizie Cervia', 50),
(95, 2, '2024-08-10', 2, 'Pulizie Cervia', 50),
(96, 2, '2024-08-19', 2, 'Pulizie Cervia', 50),
(97, 2, '2024-08-29', 2, 'Pulizie Cervia', 50),
(98, 2, '2024-09-10', 2, 'Pulizie Cervia', 50),
(99, 3, '2024-07-08', 2, 'Pulizie Simius', 60),
(100, 3, '2024-07-22', 2, 'Pulizie Simius', 60),
(101, 3, '2024-07-30', 2, 'Pulizie Simius', 60),
(102, 3, '2024-08-16', 2, 'Pulizie Simius', 60),
(103, 3, '2024-08-30', 2, 'Pulizie Simius', 60),
(104, 4, '2024-07-20', 2, 'Pulizie Mondello', 60),
(105, 4, '2024-08-20', 2, 'Pulizie Mondello', 60),
(106, 5, '2024-06-27', 2, 'Pulizie Sciacca', 60),
(107, 5, '2024-07-10', 2, 'Pulizie Sciacca', 60),
(108, 5, '2024-07-22', 2, 'Pulizie Sciacca', 60),
(109, 5, '2024-08-10', 2, 'Pulizie Sciacca', 60),
(110, 5, '2024-08-25', 2, 'Pulizie Sciacca', 60),
(111, 5, '2024-09-03', 2, 'Pulizie Sciacca', 60),
(112, 5, '2024-09-20', 2, 'Pulizie Sciacca', 60),
(113, 6, '2024-07-09', 2, 'Pulizie Salento', 90),
(114, 6, '2024-08-15', 2, 'Pulizie Salento', 90),
(115, 6, '2024-08-30', 2, 'Pulizie Salento', 90),
(116, 6, '2024-07-10', 9, 'Idraulici Salentini Uniti', 450);