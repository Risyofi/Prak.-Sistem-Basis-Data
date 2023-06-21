import mysql.connector

# Establish a connection to the database
cnx = mysql.connector.connect(user='root', database='perbankan')
cursor = cnx.cursor()

# Get data of customers
customers_query = "SELECT * FROM nasabah"
cursor.execute(customers_query)
customers_data = cursor.fetchall()
print("Data Nasabah:")
for customer in customers_data:
    print(customer)

# Get data of customers with transactions between October and December
transactions_query = ("SELECT n.*, t.* FROM nasabah n "
                     "JOIN transaksi t ON n.id_nasabah = t.id_nasabahFK "
                     "WHERE MONTH(t.tanggal) BETWEEN 10 AND 12")
cursor.execute(transactions_query)
transactions_data = cursor.fetchall()
print("\nData Nasabah dengan Transaksi antara Oktober dan Desember:")
for data in transactions_data:
    formatted_date = data[7].strftime("%H:%M, %d %B %Y")
    print(f"{data[0]}, {data[1]}, {data[2]}, {data[3]}, {data[4]}, {data[5]}, {data[6]}, {formatted_date}, {data[8]}")

# Close the cursor and connection
cursor.close()
cnx.close()
