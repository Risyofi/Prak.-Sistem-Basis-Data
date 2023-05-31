## Teori
## IN
SELECT * FROM rekening
WHERE kode_cabang IN ('BRUM', 'BRUL');

SELECT * FROM rekening
WHERE kode_cabang = 'BRUM' OR kode_cabang = 'BRUL';

## NOT IN
SELECT * FROM rekening
where kode_cabang NOT IN ('BRUS', 'BRUM');

SELECT * FROM rekening
WHERE kode_cabang <> 'BRUS' AND kode_cabang <> 'BRUM';

## BETWEEN
SELECT * FROM rekening
WHERE saldo BETWEEN 500000 AND 1000000;

SELECT * FROM rekening
WHERE saldo >= 500000 AND saldo <= 1000000;

## NOT BETWEEN
SELECT * FROM rekening
WHERE saldo NOT BETWEEN 500000 AND 1000000;

SELECT * FROM rekening
WHERE saldo < 500000 or saldo > 1000000;

## AGGREGATE FUNCTIONS
## MIN()
SELECT MIN(saldo)
FROM rekening;

SELECT MIN(saldo) FROM rekening
WHERE kode_cabang = 'BRUS';

## MAX()
SELECT MAX(saldo) FROM rekening;

SELECT MAX(saldo) FROM rekening
WHERE kode_cabang = 'BRUS';

## COUNT()
SELECT COUNT(*) FROM nasabah;

SELECT COUNT(nama_nasabah) FROM nasabah;

SELECT COUNT(alamat_nasabah) FROM nasabah;

SELECT COUNT(DISTINCT alamat_nasabah) FROM nasabah;

## SUM()
SELECT SUM(saldo) FROM rekening;

SELECT SUM(saldo) FROM rekening
WHERE kode_cabang = 'BRUS';

## AVG()
SELECT AVG(saldo) FROM rekening;

SELECT AVG(saldo) FROM rekening
WHERE kode_cabang = 'BRUS';

SELECT MIN(saldo), MAX(saldo) FROM rekening;

SELECT SUM(saldo + 1000) FROM rekening;
SELECT SUM(saldo) + 1000 FROM rekening;
SELECT MAX(saldo) - MIN(saldo) FROM rekening;

## GROUP BY
SELECT jenis_transaksi
FROM transaksi
GROUP BY jenis_transaksi;

SELECT jenis_transaksi, tanggal
FROM transaksi
GROUP BY jenis_transaksi, tanggal;

SELECT DISTINCT jenis_transaksi, tanggal FROM transaksi;

SELECT jenis_transaksi, tanggal FROM transaksi
GROUP BY jenis_transaksi;

SELECT jenis_transaksi, tanggal FROM transaksi
GROUP BY tanggal;

SELECT jenis_transaksi, tanggal FROM transaksi
GROUP BY jenis_transaksi, tanggal;

## HAVING
SELECT jenis_transaksi, tanggal FROM transaksi
GROUP BY jenis_transaksi, tanggal
HAVING jenis_transaksi = 'kredit';

SELECT jenis_transaksi, tanggal FROM transaksi
WHERE jenis_transaksi = 'kredit'
GROUP BY jenis_transaksi, tanggal;

SELECT jenis_transaksi, tanggal FROM transaksi
GROUP BY jenis_transaksi, tanggal
HAVING jumlah = 500000;

SELECT jenis_transaksi, tanggal FROM transaksi
WHERE jumlah = 500000
GROUP BY jenis_transaksi, tanggal;

## GROUP BY dan AGGREGATE
SELECT kode_cabang, MIN(saldo), MAX(saldo), COUNT(*), SUM(saldo), AVG(saldo)
FROM rekening
GROUP BY kode_cabang;

SELECT nama_cabang, SUM(saldo)
FROM rekening
NATURAL JOIN cabang_bank
GROUP BY nama_cabang
ORDER BY nama_cabang;

SELECT nama_cabang, COUNT(DISTINCT id_nasabah)
FROM cabang_bank
NATURAL JOIN rekening
NATURAL JOIN nasabah_has_rekening
GROUP BY nama_cabang
ORDER BY nama_cabang;

SELECT kode_cabang, SUM(saldo), COUNT(*)
FROM rekening
GROUP BY kode_cabang
HAVING SUM(saldo) > 500000
ORDER BY kode_cabang;

## No 5
SELECT transaksi.tanggal, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah, transaksi
WHERE nasabah.id_nasabah = transaksi.id_nasabah AND nasabah.nama_nasabah IN ('Sutopo', 'Canka Lokananta')
ORDER BY transaksi.tanggal;

## No 6
SELECT transaksi.tanggal, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah, transaksi
WHERE transaksi.tanggal BETWEEN '2009-11-15' AND '2009-11-20' 
AND nasabah.id_nasabah = transaksi.id_nasabah
ORDER BY transaksi.tanggal, nasabah.nama_nasabah;

## No 7
SELECT transaksi.jenis_transaksi AS "Jenis Transaksi", SUM(jumlah) AS "Jumlah (Rp)"
FROM transaksi
GROUP BY transaksi.jenis_transaksi
ORDER BY transaksi.jenis_transaksi;

## No 8
SELECT jenis_transaksi AS "Jenis Transaksi", MAX(jumlah) AS "Transaksi Terbesar", MIN(jumlah) AS "Transaksi Terkecil"
FROM transaksi
GROUP BY transaksi.jenis_transaksi
ORDER BY transaksi.jenis_transaksi;

## No 9
SELECT jenis_transaksi AS "Jenis Transaksi", SUM(jumlah) AS "Jumlah (Rp)", COUNT(jumlah) AS "Jumlah Transaksi"
FROM transaksi
WHERE tanggal BETWEEN '2009-11-1' AND '2009-11-30'
GROUP BY transaksi.jenis_transaksi
ORDER BY transaksi.jenis_transaksi;