from flask import Flask, request, jsonify
import psycopg2
import yaml

app = Flask(__name__)

# Carregar parâmetros de conexão do arquivo paramsBD.yml
with open('app/Util/paramsBD.yml', 'r') as file:
   params = yaml.safe_load(file)

# Conectar ao banco de dados
def get_db_connection():
    conn = psycopg2.connect(
        dbname=params['db_name'],
        user=params['db_user'],
        password=params['db_password'],
        host=params['db_host'],
        port=params['db_port']
    )
    return conn

# Listar todos os alunos
@app.route('/alunos', methods=['GET'])
def get_alunos():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM alunos;')
    alunos = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(alunos)

# Cadastrar um novo aluno
@app.route('/alunos', methods=['POST'])
def create_aluno():
    new_aluno = request.get_json()
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('INSERT INTO alunos (aluno_id, nome, endereco, cidade, estado, cep, pais, telefone) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                (new_aluno['aluno_id'], new_aluno['nome'], new_aluno['endereco'], new_aluno['cidade'], new_aluno['estado'], new_aluno['cep'], new_aluno['pais'], new_aluno['telefone']))
    conn.commit()
    cur.close()
    conn.close()
    return jsonify(new_aluno), 201

# Alterar dados de um aluno cadastrado
@app.route('/alunos/<aluno_id>', methods=['PUT'])
def update_aluno(aluno_id):
    updated_aluno = request.get_json()
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('UPDATE alunos SET nome = %s, endereco = %s, cidade = %s, estado = %s, cep = %s, pais = %s, telefone = %s WHERE aluno_id = %s',
                (updated_aluno['nome'], updated_aluno['endereco'], updated_aluno['cidade'], updated_aluno['estado'], updated_aluno['cep'], updated_aluno['pais'], updated_aluno['telefone'], aluno_id))
    conn.commit()
    cur.close()
    conn.close()
    return jsonify(updated_aluno)

# Excluir um aluno
@app.route('/alunos/<aluno_id>', methods=['DELETE'])
def delete_aluno(aluno_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('DELETE FROM alunos WHERE aluno_id = %s', (aluno_id,))
    conn.commit()
    cur.close()
    conn.close()
    return '', 204

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)