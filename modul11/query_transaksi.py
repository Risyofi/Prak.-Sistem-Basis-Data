import mysql.connector

# Establish a connection to the database
cnx = mysql.connector.connect(user='root', database='perbankan')
cursor = cnx.cursor()

# SELECT operation
def get():
    select_query = ("SELECT no_transaksi, id_nasabahFK, no_rekeningFK, jenis_transaksi, DATE_FORMAT(tanggal, '%H:%i, %e %b %Y'), jumlah "
                "FROM transaksi WHERE id_nasabahFK = %s")
    select_data = ('9',)
    cursor.execute(select_query, select_data)
    inserted_row = cursor.fetchone()
    print("record: ", inserted_row)

# INSERT operation
insert_query = ("INSERT INTO transaksi (id_nasabahFK, no_rekeningFK, jenis_transaksi, tanggal, jumlah) "
                "VALUES (%s, %s, %s, %s, %s)")
insert_data = ('9', '110', 'kredit', '2023-06-18', '50000')
cursor.execute(insert_query, insert_data)
cnx.commit()
print("INSERT operation completed.")
get()

# UPDATE operation
update_query = ("UPDATE transaksi SET jumlah = %s WHERE id_nasabahFK = %s")
update_data = ('75000', '9')
cursor.execute(update_query, update_data)
cnx.commit()
print("\nUPDATE operation completed.")
get()

# DELETE operation
delete_query = ("DELETE FROM transaksi WHERE id_nasabahFK = %s")
delete_data = ('9',)
cursor.execute(delete_query, delete_data)
cnx.commit()
print("\nDELETE operation completed.")

# Close the cursor and connection
cursor.close()
cnx.close()
