CREATE TABLE rekening (
    no_rekening int PRIMARY KEY,
    kode_cabang varchar(20),
    FOREIGN KEY (kode_cabang) REFERENCES cabang_bank(kode_cabang)
    ON DELETE CASCADE ON UPDATE CASCADE,
    pin VARCHAR(20) DEFAULT '1234' not null,
    saldo int DEFAULT 0 not null
);
