import mysql.connector
db = mysql.connector.connect(host = "localhost", user = "root", passwd = "",  database = "art_gallery")
mycursor = db.cursor()


def menu():
    print("1: Print records from the DB")
    print("2: Access any record based on attribute values")
    print("3: Sort a report according to art style ")
    print("4: Customers art preference with art shows")
    print("5: Quit")

menu()
option = int(input("Option: "))
while option != 5:
    if option == 1:
        mycursor.execute("SELECT * FROM ARTIST")
        for i in mycursor.fetchall():
            print(i)
        mycursor.execute("SELECT * FROM Art_shows")
        for i in mycursor.fetchall():
            print(i)
        mycursor.execute("SELECT * FROM Art_work")
        for i in mycursor.fetchall():
            print(i)
        mycursor.execute("SELECT * FROM Customer")
        for i in mycursor.fetchall():
            print(i)
    elif option == 2:
        option2 = input("Value: ")
        if option2.isdigit():
            mycursor.execute("SELECT * FROM Art_work WHERE Price = %s", (option2, ))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
            mycursor.execute("SELECT * FROM Artist WHERE Age = %s", (option2, ))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
        elif option2.find('-') != -1: #date
            mycursor.execute("SELECT * FROM Art_shows WHERE Datewhen = %s", (option2, ))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
            mycursor.execute("SELECT * FROM Art_work WHERE Datecreation = %s OR Dateacquired = %s", (option2, option2, ))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
        elif option2.find(':') != -1: #time
            mycursor.execute("SELECT * FROM Art_shows WHERE Timewhen = %s", (option2, ))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
        else:
            mycursor.execute("SELECT * FROM Artist WHERE Artist = %s OR Phone = %s OR Address = %s OR Birth_place = %s OR Style = %s", (option2, option2, option2, option2, option2))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
            mycursor.execute("SELECT * FROM Art_shows WHERE Artist = %s OR Location = %s OR Contact = %s OR Contactphone = %s", (option2, option2, option2, option2))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
            mycursor.execute("SELECT * FROM Art_Work WHERE Artist = %s OR Title = %s OR Type_art = %s OR Location = %s", (option2, option2, option2, option2))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
            mycursor.execute("SELECT * FROM Customer WHERE CustomerID = %s OR Phone = %s OR Artpref = %s", (option2, option2, option2))
            for i in mycursor.fetchall():
                if print(i):
                    print(i)
    elif option == 3:
        mycursor.execute("SELECT * FROM ARTIST ORDER BY Style")
        for i in mycursor.fetchall():
            print(i)
        mycursor.execute("SELECT * FROM Art_work ORDER BY Type_art")
        for i in mycursor.fetchall():
            print(i)
        mycursor.execute("SELECT * FROM Customer ORDER BY Artpref")
        for i in mycursor.fetchall():
            print(i)
    elif option == 4:
        mycursor.execute("SELECT CustomerID, Customer.Phone FROM CUSTOMER, Artist, Art_shows WHERE Artpref = Style AND Artist.Artist = Art_shows.Artist")
        for i in mycursor.fetchall():
            print(i)
    else:
        print("invalid")
    print()
    menu()
    option = int(input("Option: "))