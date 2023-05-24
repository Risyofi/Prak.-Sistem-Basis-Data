CREATE TABLE rekening (
    no_rekening int PRIMARY KEY,
    kode_cabang varchar(20),
    FOREIGN KEY (kode_cabang) REFERENCES cabang_bank(kode_cabang)
    ON DELETE CASCADE ON UPDATE CASCADE,
    pin VARCHAR(20) DEFAULT '1234' not null,
    saldo int DEFAULT 0 not null
);

INSERT INTO rekening (no_rekening, kode_cabang, pin, saldo) VALUES
(101, 'BRUS', 1111, 500000),
(102, 'BRUS', 2222, 350000),
(103, 'BRUS', 3333, 750000),
(104, 'BRUM', 4444, 900000),
(105, 'BRUM', 5555, 200000),
(106, 'BRUS', 6666, 300000),
(107, 'BRUS', 7777, 1000000),
(108, 'BRUB', 8888, 500000),
(109, 'BRUB', 9999, 0),
(110, 'BRUY', 1234, 550000),
(111, 'BRUK', 4321, 150000),
(112, 'BRUK', 0123, 300000),
(113, 'BRUY', 8888, 255000);
