import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(host="localhost",user="root",password ="admin",database = "sakila")
    
    if connection.is_connected():
        db_info = connection.get_server_info()
        print("you are connected to Mysql",db_info)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM actor")
        records =  cursor.fetchall()
        for record in records:
            print(record)
        


        

except Exception as e:
    print("somthing went wrong while connected with database")
    print(e)

finally:
    cursor.close()
    connection.close()     