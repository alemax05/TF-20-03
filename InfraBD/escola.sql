CREATE database escola;
use escola;
CREATE TABLE alunos (
    aluno_id character varying(5) NOT NULL,
    nome character varying(40) NOT NULL,
    endereco character varying(60),
    cidade character varying(15),
    estado character varying(15),
    cep character varying(10),
    pais character varying(15),
    telefone character varying(24)
);

INSERT INTO alunos VALUES ('A001', 'João Silva', 'Rua A, 123', 'São Paulo', 'SP', '01000-000', 'Brasil', '(11) 1234-5678');
INSERT INTO alunos VALUES ('A002', 'Maria Oliveira', 'Rua B, 456', 'Rio de Janeiro', 'RJ', '02000-000', 'Brasil', '(21) 2345-6789');
INSERT INTO alunos VALUES ('A003', 'Pedro Santos', 'Rua C, 789', 'Belo Horizonte', 'MG', '03000-000', 'Brasil', '(31) 3456-7890');
INSERT INTO alunos VALUES ('A004', 'Ana Costa', 'Rua D, 101', 'Curitiba', 'PR', '04000-000', 'Brasil', '(41) 4567-8901');
INSERT INTO alunos VALUES ('A005', 'Carlos Lima', 'Rua E, 202', 'Porto Alegre', 'RS', '05000-000', 'Brasil', '(51) 5678-9012');
INSERT INTO alunos VALUES ('A006', 'Fernanda Souza', 'Rua F, 303', 'Salvador', 'BA', '06000-000', 'Brasil', '(71) 6789-0123');
INSERT INTO alunos VALUES ('A007', 'Lucas Pereira', 'Rua G, 404', 'Fortaleza', 'CE', '07000-000', 'Brasil', '(85) 7890-1234');
INSERT INTO alunos VALUES ('A008', 'Juliana Rocha', 'Rua H, 505', 'Manaus', 'AM', '08000-000', 'Brasil', '(92) 8901-2345');
INSERT INTO alunos VALUES ('A009', 'Rafael Almeida', 'Rua I, 606', 'Recife', 'PE', '09000-000', 'Brasil', '(81) 9012-3456');
INSERT INTO alunos VALUES ('A010', 'Beatriz Fernandes', 'Rua J, 707', 'Florianópolis', 'SC', '10000-000', 'Brasil', '(48) 0123-4567');