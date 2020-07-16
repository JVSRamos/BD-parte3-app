import psycopg2

con = None
try:
    con = psycopg2.connect(user="postgres",
                           password="ribamar",
                           host="localhost",
                           port="15432",
                           database="bd_mudanca")

    print('Connected to the PostgreSQL database!')

    # create a cursor
    cur = con.cursor()

    # execute a statement
    print('PostgreSQL database version:')
    cur.execute('SELECT version()')

    # display the PostgreSQL database server version
    db_version = cur.fetchone()
    print(db_version)

    cur.close()

except (Exception, psycopg2.DatabaseError) as error:
    print("Database Error: ", error)

finally:
    # closing database connection.
    if con is not None:
        con.close()
        print("PostgreSQL connection is closed")
