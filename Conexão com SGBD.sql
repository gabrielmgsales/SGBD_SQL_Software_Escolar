import mysql.connector

# Configurações do banco de dados
db_config = {
    "host": "localhost",
    "user": "seu_usuario",
    "password": "sua_senha",
    "database": "Escola XYZ"
}

# Função para conectar ao banco de dados
def connect_db():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except mysql.connector.Error as err:
        print(f"Erro na conexão com o banco de dados: {err}")
        return None