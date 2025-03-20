import csv
import pymysql

# MySQL database connection details
host = 'localhost'
user = 'root'
password = 'admin'
database = 'sakila'

# Connect to the MySQL database
connection = pymysql.connect(host=host, user=user, password=password, database=database)

try:
    with connection.cursor() as cursor:
        # SQL query to fetch data from your table
        sql = "SELECT * FROM actor"
        
        # Execute the query
        cursor.execute(sql)
        
        # Fetch all the rows
        rows = cursor.fetchall()
        
        # Write the data to a CSV file
        with open('output.csv', 'w', newline='') as csvfile:
            csv_writer = csv.writer(csvfile)
            
            # Write the column headers
            csv_writer.writerow([i[0] for i in cursor.description])
            
            # Write the data rows
            csv_writer.writerows(rows)
            
        print("CSV file created successfully.")
        
finally:
    # Close the database connection
    connection.close()