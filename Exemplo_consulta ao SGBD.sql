# Exemplo de consulta ao banco de dados

def query_example():
    connection = connect_db()
    if connection:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Alunos")
        alunos = cursor.fetchall()
        connection.close()
        return alunos
    return "Erro ao conectar ao banco de dados."

if __name__ == "__main__":
    resultado = query_example()
    print(resultado)