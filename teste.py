import psycopg2


def connect():
    """ Connect to the PostgreSQL database server """
    with psycopg2.connect(
        host="localhost",
        port="15432",
        database="bd_mudanca",
        user="postgres",
        password="ribamar"
    ) as conn:

        print('Connected to the PostgreSQL database!')

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)

        # close the communication with the PostgreSQL
        cur.close()


if __name__ == '__main__':
    connect()
