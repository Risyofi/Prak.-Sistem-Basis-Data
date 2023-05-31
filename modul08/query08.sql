## No 1
SELECT jenis_transaksi AS "Jenis Transaksi",
       CONCAT('Rp', FORMAT(jumlah, 0)) AS "Jumlah Transaksi (Rp)",
       CONCAT('Rp', FORMAT(SUM(jumlah), 0)) AS "Total Transaksi (Rp)"
FROM transaksi
JOIN nasabah ON transaksi.id_nasabah = nasabah.id_nasabah
WHERE nasabah.nama_nasabah LIKE '%Kartika Padmasari'
GROUP BY jenis_transaksi;

## No 2
SELECT nasabah.nama_nasabah, SUM(rekening.saldo) AS "Total Saldo"
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
WHERE nasabah.nama_nasabah = 'Maryati'
GROUP BY nasabah.nama_nasabah;

## No 3
SELECT cabang_bank.kode_cabang, cabang_bank.nama_cabang, COUNT(transaksi.no_transaksi) AS "Jumlah Transaksi"
FROM cabang_bank
LEFT JOIN rekening ON cabang_bank.kode_cabang = rekening.kode_cabang
LEFT JOIN transaksi ON rekening.no_rekening = transaksi.no_rekening
GROUP BY cabang_bank.kode_cabang, cabang_bank.nama_cabang;

## No 4
SELECT nasabah.nama_nasabah, rekening.saldo
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
WHERE rekening.saldo BETWEEN 500000 AND 2000000;

## No 5
SELECT nasabah.nama_nasabah, transaksi.tanggal, CONCAT('Rp', FORMAT(transaksi.jumlah, 0)) AS "Jumlah Transaksi (Rp)"
FROM nasabah
JOIN transaksi ON nasabah.id_nasabah = transaksi.id_nasabah
WHERE transaksi.jumlah > 100000
ORDER BY transaksi.jumlah DESC;

## No 6
SELECT cabang_bank.nama_cabang,
       SUM(rekening.saldo) AS "Jumlah Saldo Total"
FROM cabang_bank
JOIN rekening ON cabang_bank.kode_cabang = rekening.kode_cabang
JOIN nasabah_has_rekening ON rekening.no_rekening = nasabah_has_rekening.no_rekening
JOIN nasabah ON nasabah_has_rekening.id_nasabah = nasabah.id_nasabah
GROUP BY cabang_bank.kode_cabang;

## no 7
SELECT cabang_bank.nama_cabang AS "Nama Cabang Bank",
       COUNT(CASE WHEN transaksi.jenis_transaksi = 'debit' THEN 1 ELSE NULL END) AS "Jumlah Transaksi Debit",
       COUNT(CASE WHEN transaksi.jenis_transaksi = 'kredit' THEN 1 ELSE NULL END) AS "Jumlah Transaksi Kredit"
FROM cabang_bank
LEFT JOIN rekening ON cabang_bank.kode_cabang = rekening.kode_cabang
LEFT JOIN transaksi ON rekening.no_rekening = transaksi.no_rekening
GROUP BY cabang_bank.nama_cabang;
