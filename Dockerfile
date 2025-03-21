# Este Dockerfile define a configuração para construir uma imagem Docker para uma aplicação Flask.
# Ele utiliza a imagem base 'python:3.9-slim' e realiza as seguintes etapas:
# 1. Define o diretório de trabalho como '/'.
# 2. Copia o arquivo 'requirements.txt' do diretório 'app' para o diretório de trabalho.
# 3. Instala as dependências listadas no 'requirements.txt' usando pip.
# 4. Copia todo o conteúdo do diretório 'app' para o diretório de trabalho.
# 5. Define o comando padrão para executar a aplicação Flask, que é 'python crudCateg.py'.

FROM python:3.9-slim

WORKDIR /app

COPY app/ /app/
COPY app/Util/paramsBD.yml /app/Util/paramsBD.yml

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY ./app /app

EXPOSE 5000

CMD ["python", "crudAlunos.py"]