import psycopg2


# Insert the new data on the database
def insert(veic):

    con = None
    try:
        con = psycopg2.connect(user="postgres",
                               password="ribamar",
                               host="localhost",
                               port="15432",
                               database="bd_mudanca")

    except (Exception, psycopg2.DatabaseError) as error:
        print("Database Error: ", error)
        return "Erro de conexão"

    cursor = con.cursor()

    # First search if the model and the year of the veicule already exists
    search = "SELECT V.NRO_EIXOS, V.CAPACIDADE FROM VEICULO_INFO V WHERE UPPER(V.MODELO) = UPPER(%s) AND UPPER(V.ANO) = UPPER(%s);"
    data_to_search = [veic["modelo"], veic["ano"]]

    try:
        cursor.execute(search, data_to_search)
        v_info = cur.fetchone()

    except (Exception, psycopg2.DatabaseError) as error:
        print("Database Error: ", error)
        return "Erro na consulta das infromações do modelo e ano do veículo"

    if v_info == None:
        insert_query = "INSERT INTO VEICULO_INFO (MODELO, ANO, NRO_EIXOS, CAPACIDADE) VALUES (%s,%s,%s,%s)"
        # Estamos deixando hardcoded por simplicidade. Na aplicação real, popularíamos a tabela
        # "VEICULO_INFO" com dados de uma API para evitar que esse tipo de situação acontecesse
        data_to_insert = [veic["modelo"], veic["ano"], 2, 1000]
        cursor.execute(insert_query, data_to_insert)
        con.commit()

    # Inserting the vehicle
    insert_query = " INSERT INTO VEICULO (PLACA, PRESTADOR, MARCA, MODELO, ANO, FOTO1, FOTO2, FOTO3, FOTO4) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s);"
    data_to_insert = []
    data_to_insert = [value for key, value in veic.items()]
    # Insert the last 3 photos
    [data_to_insert.append(None) for i in range(3)]

    cursor.execute(insert_query, data_to_insert)

    con.commit()
    cursor.close()

    finally:
        # closing database connection.
        if con is not None:
            con.close()
            print("PostgreSQL connection is closed")


# search the data and return the result
def search(capacidade):

    con = None
    transp = []
    try:
        con = psycopg2.connect(user="postgres",
                               password="ribamar",
                               host="localhost",
                               port="15432",
                               database="bd_mudanca")

        cursor = con.cursor()

        search = "SELECT MODELO, ANO, CAPACIDADE, N.NOME, N.EMAIL, N.TELEFONE FROM NEGOCIANTE N JOIN VEICULO V ON N.CPF = V.PRESTADOR NATURAL JOIN VEICULO_INFO WHERE CAPACIDADE > %s;"
        data_to_search = [capacidade]

        cursor.execute(search, data_to_search)
        transp = cursor.fetchall()

        cursor.close()

    except (Exception, psycopg2.DatabaseError) as error:
        print("Database Error: ", error)

    finally:
        # closing database connection.
        if con is not None:
            con.close()
            print("PostgreSQL connection is closed")
            return transp
