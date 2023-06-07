## no 1
SELECT nasabah.nama_nasabah, nasabah.alamat_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening USING (id_nasabah)
JOIN rekening USING (no_rekening)
JOIN transaksi USING (no_rekening)
WHERE transaksi.jenis_transaksi = 'kredit'
ORDER BY nasabah.nama_nasabah;

SELECT nasabah.nama_nasabah, nasabah.alamat_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
JOIN transaksi ON rekening.no_rekening = transaksi.no_rekening
WHERE transaksi.jenis_transaksi = 'kredit'
ORDER BY nasabah.nama_nasabah;

SELECT nasabah.nama_nasabah, nasabah.alamat_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
NATURAL JOIN nasabah_has_rekening
NATURAL JOIN rekening
NATURAL JOIN transaksi
WHERE transaksi.jenis_transaksi = 'kredit'
ORDER BY nasabah.nama_nasabah;

## No 2
SELECT nasabah.nama_nasabah, nasabah.alamat_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening USING (id_nasabah)
JOIN rekening USING (no_rekening)
JOIN transaksi USING (no_rekening)
WHERE transaksi.jenis_transaksi = 'kredit'
ORDER BY nasabah.nama_nasabah;

SELECT nasabah.nama_nasabah, nasabah.alamat_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
JOIN transaksi ON rekening.no_rekening = transaksi.no_rekening
WHERE transaksi.jenis_transaksi = 'kredit'
ORDER BY nasabah.nama_nasabah;

SELECT nasabah.nama_nasabah, nasabah.alamat_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
NATURAL JOIN nasabah_has_rekening
NATURAL JOIN rekening
NATURAL JOIN transaksi
WHERE transaksi.jenis_transaksi = 'kredit'
ORDER BY nasabah.nama_nasabah;

## No 3
SELECT rekening.no_rekening, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening USING (id_nasabah)
JOIN rekening USING (no_rekening)
JOIN transaksi USING (no_rekening)
WHERE transaksi.tanggal = '2009-11-21'
ORDER BY nasabah.nama_nasabah;

SELECT rekening.no_rekening, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
JOIN transaksi ON rekening.no_rekening = transaksi.no_rekening
WHERE transaksi.tanggal = '2009-11-21'
ORDER BY nasabah.nama_nasabah;

SELECT rekening.no_rekening, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
NATURAL JOIN nasabah_has_rekening
NATURAL JOIN rekening
NATURAL JOIN transaksi
WHERE transaksi.tanggal = '2009-11-21'
ORDER BY nasabah.nama_nasabah;

## No 4
SELECT rekening.no_rekening, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening USING (id_nasabah)
JOIN rekening USING (no_rekening)
JOIN transaksi USING (no_rekening)
WHERE transaksi.jumlah = 20000;

SELECT rekening.no_rekening, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
JOIN transaksi ON rekening.no_rekening = transaksi.no_rekening
WHERE transaksi.jumlah = 20000;

SELECT rekening.no_rekening, nasabah.nama_nasabah, transaksi.jenis_transaksi, transaksi.jumlah
FROM nasabah
NATURAL JOIN nasabah_has_rekening
NATURAL JOIN rekening
NATURAL JOIN transaksi
WHERE transaksi.jumlah = 20000;

## No 5
SELECT rekening.no_rekening, nasabah.nama_nasabah, nasabah.alamat_nasabah
FROM nasabah
JOIN nasabah_has_rekening USING (id_nasabah)
JOIN rekening USING (no_rekening)
WHERE nasabah.nama_nasabah LIKE 'Su%';

SELECT rekening.no_rekening, nasabah.nama_nasabah, nasabah.alamat_nasabah
FROM nasabah
JOIN nasabah_has_rekening ON nasabah.id_nasabah = nasabah_has_rekening.id_nasabah
JOIN rekening ON nasabah_has_rekening.no_rekening = rekening.no_rekening
WHERE nasabah.nama_nasabah LIKE 'Su%';

SELECT rekening.no_rekening, nasabah.nama_nasabah, nasabah.alamat_nasabah
FROM nasabah
NATURAL JOIN nasabah_has_rekening
NATURAL JOIN rekening
WHERE nasabah.nama_nasabah LIKE 'Su%';
