import mysql.connector
from tkinter import Tk, Label, Scrollbar, Text, Entry, Button, font

# Create the Tkinter GUI window
window = Tk()
window.title("Banking Data")

# Set the window background color
window.configure(bg="#f2f2f2")

# Set custom fonts
title_font = font.Font(family="Helvetica", size=16, weight="bold")
data_font = font.Font(family="Helvetica", size=12)

# Function to insert customer data into the database
def insert_customer():
    # Establish a connection to the database
    cnx = mysql.connector.connect(user='root', database='perbankan')
    cursor = cnx.cursor()

    # Retrieve the input values from the entry fields
    nama = nama_entry.get()
    alamat = alamat_entry.get()
    # Add more input fields as needed
    
    # Insert the customer data into the database
    insert_query = "INSERT INTO nasabah (nama_nasabah, alamat_nasabah) VALUES (%s, %s)"
    values = (nama, alamat)
    cursor.execute(insert_query, values)
    cnx.commit()
    
    # Close the cursor and connection
    cursor.close()
    cnx.close()
    
    # Clear the input fields
    nama_entry.delete(0, "end")
    alamat_entry.delete(0, "end")
    # Add more input fields clearing as needed

# Create labels for customer data
customer_label = Label(window, text="Data Nasabah", font=title_font, bg="#f2f2f2")
customer_label.pack()

# Create entry fields for customer data
nama_label = Label(window, text="Nama:", font=data_font, bg="#f2f2f2")
nama_label.pack()
nama_entry = Entry(window, font=data_font)
nama_entry.pack()

alamat_label = Label(window, text="Alamat:", font=data_font, bg="#f2f2f2")
alamat_label.pack()
alamat_entry = Entry(window, font=data_font)
alamat_entry.pack()

# Create a button to submit customer data
submit_button = Button(window, text="Submit", command=insert_customer, font=data_font)
submit_button.pack()

# Create a Text widget for displaying customer data
customer_text = Text(window, font=data_font)
customer_text.pack()

# Establish a connection to the database
cnx = mysql.connector.connect(user='root', database='perbankan')
cursor = cnx.cursor()

# Get data of customers
customers_query = "SELECT * FROM nasabah"
cursor.execute(customers_query)
customers_data = cursor.fetchall()
customer_text.insert("end", "Data Nasabah:\n")
for customer in customers_data:
    customer_text.insert("end", f"{customer}\n")

# Close the cursor and connection
cursor.close()
cnx.close()

# Start the GUI main loop
window.mainloop()
