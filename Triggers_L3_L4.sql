CREATE TABLE Departamentos (
  codigo INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  orcamento DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (codigo)
);

ALTER TABLE Departamentos ALTER COLUMN orcamento TYPE REAL;

CREATE TABLE Salas (
  numero_sala INT NOT NULL,
  area_metros_quadrados DECIMAL(10,2) NOT NULL,
  num_computadores INT NOT NULL,
  PRIMARY KEY (numero_sala)
);

CREATE TABLE Empregados (
  carteira_trabalho INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco_residencial VARCHAR(100) NOT NULL,	
  telefone_residencial VARCHAR(20) NOT NULL,
  data_contratacao DATE NOT NULL,
  data_nascimento DATE NOT NULL,
  cod_departamento INT NOT NULL,
  salario real NOT NULL,
  num_sala INT NOT NULL,
  supervisor INT NOT NULL REFERENCES Empregados,	
  PRIMARY KEY (carteira_trabalho),
  FOREIGN KEY (cod_departamento) REFERENCES Departamentos(codigo),
  FOREIGN KEY (num_sala) REFERENCES Salas(numero_sala)
);

ALTER TABLE Empregados ALTER COLUMN supervisor DROP NOT NULL;



CREATE TABLE Projetos (
  codigo INT NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  orcamento DECIMAL(10,2) NOT NULL,
  data_inicio DATE NOT NULL,
  duracao_prevista_meses INT NOT NULL,
  PRIMARY KEY (codigo)
);


CREATE TABLE Participacao_Projetos (
  carteira_trabalho INT NOT NULL,
  codigo_projeto INT NOT NULL,
  horas_mensais INT NOT NULL,
  PRIMARY KEY (carteira_trabalho, codigo_projeto),
  FOREIGN KEY (carteira_trabalho) REFERENCES Empregados(carteira_trabalho),
  FOREIGN KEY (codigo_projeto) REFERENCES Projetos(codigo)
);


ALTER TABLE Departamentos ADD COLUMN qtd_empregados integer DEFAULT 0;





-- Inserindo dados na tabela Departamentos
INSERT INTO Departamentos (codigo, nome, endereco, orcamento) VALUES
(100, 'Departamento de Vendas', 'Rua dos Vendedores, 123', 50000),
(200, 'Departamento de Marketing', 'Avenida das Propagandas, 456', 75000),
(300, 'Departamento de Tecnologia', 'Rua dos Programadores, 789', 100000);


-- Inserindo dados na tabela Salas
INSERT INTO Salas (numero_sala, area_metros_quadrados, num_computadores) VALUES
(101, 25.0, 10),
(102, 30.0, 15),
(103, 20.0, 8),
(104, 35.0, 12),
(105, 40.0, 20);

-- Inserindo dados na tabela Empregados
INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao, data_nascimento, cod_departamento,salario ,num_sala, supervisor) VALUES
(10001, 'João Silva', 'Rua dos Funcionários, 123', '(11) 1234-5678', '2022-01-15', '2000-05-01', 100, 23.4,101, NULL),
(10002, 'Maria Santos', 'Rua das Flores, 456', '(11) 2345-6789', '2022-01-15', '1998-10-10', 100, 45.8,101, NULL),
(10003, 'Pedro Souza', 'Avenida dos Trabalhadores, 789', '(11) 3456-7890', '2022-02-01', '2002-01-20', 200,12344 ,102, NULL),
(10004, 'Lucas Oliveira', 'Rua dos Profissionais, 101', '(11) 4567-8901', '2022-02-01', '2001-03-15', 200, 10000,102 , NULL),
(10005, 'Ana Pereira', 'Rua das Amoras, 654', '(11) 5678-9012', '2022-03-01', '2000-12-30', 300, 4564,103 , NULL),
(10006, 'Gustavo Souza', 'Avenida das Árvores, 987', '(11) 6789-0123', '2022-03-01', '2003-07-07', 300,424242 ,103 , NULL),
(10007, 'Leticia Rodrigues', 'Rua das Pedras, 555', '(11) 7890-1234', '2022-04-01', '2000-01-01', 300,5567 ,104 , NULL),
(10008, 'Marcos Santos', 'Rua das Oliveiras, 789', '(11) 8901-2345', '2022-04-01', '1999-06-20', 300, 24242,105 , NULL);

INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao,
						data_nascimento, cod_departamento,salario ,num_sala, supervisor) 
						VALUES(100010, 'Narcos Santos', 'Rua das Oliveiras, 789', '(11) 8901-2345', 
							   '2022-04-01', '1999-06-20', 100, 24242,105,NULL);

SELECT * FROM EMPREGADOS;

UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10001;
UPDATE Empregados SET supervisor = 10001 WHERE carteira_trabalho = 10002;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10003;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10004;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10005;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10006;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10007;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 10008;
UPDATE Empregados SET supervisor = 10002 WHERE carteira_trabalho = 100010;


INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao,
						data_nascimento, cod_departamento,salario ,num_sala, supervisor) 
						VALUES(100043, 'Santiago', 'Rua das Oliveiras, 789', '(11) 8901-2345', 
							   '2022-04-01', '1999-06-20', 100, 2424,105,10007);





-- Inserindo dados na tabela Projetos
INSERT INTO Projetos (codigo, descricao, orcamento, data_inicio, duracao_prevista_meses) VALUES 
(1, 'Desenvolvimento de software', 50000.00, '2023-01-01', 6),
(2, 'Expansão de mercado', 75000.00, '2022-07-01', 12),
(3, 'Melhoria de processos', 35000.00, '2022-11-01', 4);

-- Inserindo dados na tabela Participacao_Projetos
INSERT INTO Participacao_Projetos (carteira_trabalho, codigo_projeto, horas_mensais) VALUES 
(10001, 1, 160),
(10005, 1, 120),
(10007, 2, 180),
(10001, 2, 200),
(10006, 3, 100),
(10004, 3, 80);


CREATE TABLE Dependentes (
  id_dependente INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  data_nascimento DATE NOT NULL,
  grau_parentesco VARCHAR(20) NOT NULL,
  carteira_trabalho_empregado INT NOT NULL,
  PRIMARY KEY (id_dependente),
  FOREIGN KEY (carteira_trabalho_empregado) REFERENCES Empregados(carteira_trabalho)
);


INSERT INTO Dependentes (id_dependente, nome, data_nascimento, grau_parentesco, carteira_trabalho_empregado)
VALUES (1, 'João', '1995-05-10', 'Filho', 10001),
(2, 'Joca', '1995-05-10', 'Filho', 10002),
(3, 'Maria', '1995-05-10', 'Filho', 10003),
(4, 'Rui', '1995-05-10', 'Filho', 10004),
(5, 'Dudu', '1995-05-10', 'Filho', 10005),
(6, 'carla', '1995-05-10', 'Filho', 10006),
(7, 'JUs', '1995-05-10', 'Filho', 10007),
(8, 'Pok', '1995-05-10', 'Filho', 10008),
(10, 'Apolinario', '1995-05-10', 'Filho', 100010);






---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------- LISTA 3 -----------





-- 2) - Faça um trigger para manter a faixa salarial em valores mínimo e máximo pré-estabelecidos
-- (mesmos do exercício 1). 



CREATE OR REPLACE FUNCTION piso()
	RETURNS  trigger AS $$

	
	BEGIN 

		IF NEW.salario < 4000
		
		THEN 
		
		UPDATE Empregados SET salario = 4000 where carteira_trabalho = NEW.carteira_trabalho;
		RAISE NOTICE 'Salario: tiveram o piso atualizado';
		
		
		 ELSE
			 RAISE NOTICE 'Salario: já esta no piso ou acima';
		
		END IF;

	
		RETURN NEW;

	END;


$$ LANGUAGE 'plpgsql';



CREATE OR REPLACE TRIGGER check_salario BEFORE
INSERT OR UPDATE 
ON Empregados FOR EACH ROW EXECUTE PROCEDURE piso();



SELECT nome, salario, carteira_trabalho FROM Empregados;

UPDATE Empregados SET salario = 4000 where carteira_trabalho = 100023;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 3) - Faça um trigger para não permitir a diminuição de salário, ou um aumento superior a 50% do
-- salário atual, emitindo uma mensagem de erro.



CREATE OR REPLACE FUNCTION permicion()
RETURNS  trigger AS $$
BEGIN 
	
	IF NEW.salario > OLD.salario
	THEN 
	  
	  IF new.salario < (old.salario +(old.salario *0.5))
	  
	  	THEN 
			RAISE Notice 'Salario atualizado %', new.salario;
			
  	  ELSE
	 	RAISE EXCEPTION 'aumento superior a 50 do salário atual %', new.salario +(new.salario *0.5);	
 	END IF;
 		 	
		
	ELSE	
		RAISE EXCEPTION 'Não é possivel fazer a atualização do salario, pois não é permitido salarios menores %', old.salario;
	  
	 
	 
	END IF;
	
	RETURN NEW;

END; $$ language plpgsql;




CREATE OR REPLACE TRIGGER check_permicion BEFORE
UPDATE 
ON Empregados FOR EACH ROW EXECUTE PROCEDURE permicion();


SELECT nome, salario, carteira_trabalho FROM Empregados;

UPDATE Empregados SET salario = 7777 where carteira_trabalho = 10001;








---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4) - Faça um trigger para derivar automaticamente o valor do número de empregados em um
-- determinado departamento. Para resolver este exercício pode ser necessário a inclusão de uma nova
-- coluna na tabela departamento com a quantidade de funcionários deste departamento.


CREATE OR REPLACE FUNCTION atualiza_qtd_empregados() 
RETURNS trigger AS $$
BEGIN
    
	IF TG_OP = 'INSERT' THEN
        UPDATE Departamentos SET qtd_empregados = qtd_empregados + 1 WHERE codigo = NEW.cod_departamento;
    
	ELSIF TG_OP = 'DELETE' THEN
        UPDATE Departamentos SET qtd_empregados = qtd_empregados - 1 WHERE codigo = OLD.cod_departamento;
    
	ELSIF TG_OP = 'UPDATE' THEN
        
		IF NEW.cod_departamento <> OLD.cod_departamento THEN
            UPDATE Departamentos SET qtd_empregados = qtd_empregados - 1 WHERE codigo = OLD.cod_departamento;
            UPDATE Departamentos SET qtd_empregados = qtd_empregados + 1 WHERE codigo = NEW.cod_departamento;
        END IF;
    
	
	END IF;
    
	
	RETURN NULL;

END;

$$ LANGUAGE plpgsql;





CREATE OR REPLACE TRIGGER check_derivar_auto
AFTER
INSERT OR DELETE OR UPDATE 
ON Empregados
FOR EACH ROW EXECUTE PROCEDURE atualiza_qtd_empregados()




INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao,
						data_nascimento, cod_departamento,salario ,num_sala, supervisor) 
						VALUES(10004676, 'Santiago', 'Rua das Oliveiras, 789', '(11) 8901-2345', 
							   '2022-04-01', '1999-06-20', 100, 2424,105,10007);
							   
INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao,
						data_nascimento, cod_departamento,salario ,num_sala, supervisor) 
						VALUES(1000653, 'Santiago', 'Rua das Oliveiras, 789', '(11) 8901-2345', 
							   '2022-04-01', '1999-06-20', 100, 2424,105,10007);							   
							   
SELECT qtd_empregados, codigo FROM Departamentos;


UPDATE Empregados SET cod_departamento = 300 WHERE carteira_trabalho = 10004676

DELETE FROM Empregados WHERE carteira_trabalho = 10004676;

DELETE FROM Empregados WHERE carteira_trabalho = 1000653;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





-- 5) Faça um trigger para manter o mínimo de 10 horas que um funcionário deverá trabalhar em
-- cada projeto. 


CREATE OR REPLACE FUNCTION manterminimo()
RETURNS trigger AS $$ 

BEGIN

	IF NEW.horas_mensais < 10
		THEN
			RAISE EXCEPTION 'O funcionario deve trabalhar no minimo 10 horas mensais em cada projeto';
	ELSE
		RETURN NEW;
		
	END IF;

END; 
$$ LANGUAGE 'plpgsql'


CREATE OR REPLACE TRIGGER check_manterminimo BEFORE UPDATE OR INSERT
ON Participacao_Projetos FOR EACH ROW EXECUTE PROCEDURE manterminimo();



SELECT * FROM Participacao_Projetos;


INSERT INTO Participacao_Projetos VALUES(10007, 3, 12);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6) - Faça um trigger para exclusão em cascata de empregado, suas alocações em trabalhos de
-- projetos e de seus dependentes. Se não houver no banco informações sobre os dependentes, estas
-- informações devem ser inseridas.


CREATE OR REPLACE FUNCTION deletecascade()
RETURNS trigger AS $$

BEGIN 
	IF TG_OP = 'DELETE' THEN
		DELETE FROM Dependentes WHERE carteira_trabalho_empregado = old.carteira_trabalho;
		
		DELETE FROM Participacao_Projetos WHERE carteira_trabalho = old.carteira_trabalho;
		
	
	
	END IF;
	
	RETURN NEW;

END;


$$ LANGUAGE 'plpgsql'



CREATE OR REPLACE TRIGGER check_delete
BEFORE 
DELETE 
ON Empregados
FOR EACH ROW EXECUTE FUNCTION deletecascade();


SELECT nome,carteira_trabalho_empregado FROM Dependentes;

SELECT carteira_trabalho FROM Participacao_Projetos;


DELETE FROM Empregados WHERE carteira_trabalho = 10007;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


----------- LISTA 4 -----------



-- 3)Criar um trigger para verificar nas ocorrências de inclusão e alteração não permitindo que o CPF
-- do supervisor seja o mesmo do supervisionado. Apresentar uma mensagem de erro informando que
-- o Empregado não pode ser supervisor dele mesmo.



CREATE OR REPLACE FUNCTION not_supervisor()
RETURNS trigger AS $$

BEGIN 
	IF TG_OP = 'INSERT' THEN
		IF new.carteira_trabalho = new.supervisor THEN 
			RAISE EXCEPTION 'Um empregado não pode ser supervisor dele mesmo';		
		END IF;
		
		
	ELSIF TG_OP = 'UPDATE' THEN
		IF new.carteira_trabalho = new.supervisor THEN 
			RAISE EXCEPTION 'Um empregado não pode ser supervisor dele mesmo';		
		END IF;	
	
	END IF;
	
	
	RETURN NEW;
	
END;

$$ LANGUAGE 'plpgsql'


CREATE OR REPLACE TRIGGER check_not_supervisor 
BEFORE 
INSERT OR UPDATE 
ON Empregados
FOR EACH ROW EXECUTE FUNCTION not_supervisor();


INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao,
						data_nascimento, cod_departamento,salario ,num_sala, supervisor) 
						VALUES(100045, 'Narcos Santos', 'Rua das Oliveiras, 789', '(11) 8901-2345', 
							   '2022-04-01', '1999-06-20', 100, 24242,105,100045);
							   
						
UPDATE Empregados SET supervisor = 10001 where carteira_trabalho = 10001;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4) Criar um trigger que verifique e não permita a inserção de funcionários ou aumento de salários se
-- a soma dos salários do departamento for superior a 60% do orçamento de tal departamento.

CREATE OR REPLACE FUNCTION sum_salarios()
RETURNS trigger AS $$

DECLARE 
	sum_salarios real;
	orc_dep real;

BEGIN 

	IF TG_OP = 'INSERT' THEN
	
	SELECT INTO sum_salarios SUM(salario) FROM Empregados WHERE cod_departamento = new.cod_departamento;
	SELECT INTO orc_dep orcamento FROM Departamentos WHERE codigo = new.cod_departamento;
		 
		IF sum_salarios > (orc_dep * 0.6) THEN 
            RAISE EXCEPTION 'A soma dos salários do departamento é superior a 60 por cento';
        END IF;
		

	ELSIF TG_OP = 'UPDATE' AND NEW.salario > OLD.salario THEN 
		SELECT INTO sum_salarios SUM(salario) FROM Empregados WHERE cod_departamento = new.cod_departamento;
		SELECT INTO orc_dep orcamento FROM Departamentos WHERE codigo = new.cod_departamento;
		 
		IF sum_salarios > (orc_dep * 0.6) THEN 
            RAISE EXCEPTION 'A soma dos salários do departamento é superior a 60 por cento';
       END IF;
	

	END IF; 

	

	RETURN NEW;


END;

$$ LANGUAGE 'plpgsql'


CREATE OR REPLACE TRIGGER verifica_sum_salario 
BEFORE 
INSERT OR UPDATE
ON Empregados
FOR EACH ROW EXECUTE FUNCTION sum_salarios();




SELECT  SUM(salario) FROM Empregados WHERE cod_departamento = 100;
SELECT orcamento from Departamentos WHERE codigo = 100;


INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao,
						data_nascimento, cod_departamento,salario ,num_sala, supervisor) 
						VALUES(100046, 'Santo Borbinho', 'Rua das Oliveiras, 789', '(11) 8901-2345', 
							   '2022-04-01', '1999-06-20', 100, 2427,105,10007);
							   
UPDATE Empregados SET salario = 1 where carteira_trabalho = 100043;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 6) Criar uma tabela auxiliar que registra o histórico de alterações que ocorra na tabela de
-- funcionário. A nova tabela deverá conter todas as informações da tabela funcionário, qual o evento
-- que ocasionou (insert, update ou delete) e a data. No caso de inserção preencher com os dados
-- inseridos, na deleção com os dados que foram removidos e na alteração com os dados antigos. 

CREATE TABLE historico_funcionarios (
    evento CHAR(1) NOT NULL,
    data_hora timestamp with time zone NOT NULL,
    carteira_trabalho INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    endereco_residencial VARCHAR(100) NOT NULL,    
    telefone_residencial VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL,
    data_nascimento DATE NOT NULL,
    cod_departamento INT NOT NULL,
    salario REAL NOT NULL,
    num_sala INT NOT NULL
);

ALTER TABLE historico_funcionarios ALTER COLUMN evento TYPE TEXT;

 

CREATE OR REPLACE FUNCTION historico()
RETURNS trigger AS $$ 


BEGIN 

	IF TG_OP = 'DELETE'
		THEN 
		INSERT INTO historico_funcionarios(evento, data_hora, carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao, data_nascimento, cod_departamento, salario, num_sala)
		VALUES('DELETE', now(), OLD.carteira_trabalho, OLD.nome, OLD.endereco_residencial, OLD.telefone_residencial, OLD.data_contratacao, OLD.data_nascimento, OLD.cod_departamento, OLD.salario, OLD.num_sala);
			   
		
	
	ELSIF TG_OP = 'UPDATE' THEN
	
		INSERT INTO historico_funcionarios(evento, data_hora, carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao, data_nascimento, cod_departamento, salario, num_sala)
		VALUES('UPDATE', now(), OLD.carteira_trabalho, OLD.nome, OLD.endereco_residencial, OLD.telefone_residencial, OLD.data_contratacao, OLD.data_nascimento, OLD.cod_departamento, OLD.salario, OLD.num_sala);
		
				   
	
	
	ELSIF TG_OP = 'INSERT' THEN
	
		INSERT INTO historico_funcionarios(evento, data_hora, carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao, data_nascimento, cod_departamento, salario, num_sala)
		VALUES('INSERT', now(), NEW.carteira_trabalho, NEW.nome, NEW.endereco_residencial, NEW.telefone_residencial, NEW.data_contratacao, NEW.data_nascimento, NEW.cod_departamento, NEW.salario, NEW.num_sala);
				  
	
	
	END IF;

	RETURN NULL;

END;


$$ LANGUAGE 'plpgsql'


CREATE OR REPLACE TRIGGER check_historico_funcionarios AFTER 
INSERT OR UPDATE OR DELETE ON Empregados
FOR EACH ROW EXECUTE PROCEDURE historico();

-- 
SELECT nome, salario, carteira_trabalho FROM Empregados;
SELECT * FROM historico_funcionarios;
-- 

DELETE FROM Empregados WHERE carteira_trabalho = 10003;

UPDATE Empregados SET nome = 'Duduzim', salario = 10000 where carteira_trabalho = 10003;


INSERT INTO Empregados (carteira_trabalho, nome, endereco_residencial, telefone_residencial, data_contratacao, data_nascimento, cod_departamento,salario ,num_sala,supervisor) VALUES
(1000146, 'Coão Silva', 'Rua dos Funcionários, 123', '(11) 1234-5678', '2022-01-15', '2000-05-01', 100, 4500,101, 100010);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 7) Crie uma tabela de registro de alterações de funcionários na empresa. Devem estar armazenadas
-- as informações: cpf do funcionário, salário antigo e novo, departamento antigo e novo e supervisor
-- antigo e novo. As informações que não tiveram alteração devem ficar com o valor null. Armazenar
-- também a data em que as alterações ocorreram e o usuário que realizou.





CREATE TABLE alteracao_func(
	
  carteira_trabalho INT,
  salario_novo real,
  salario_antigo real,
  cod_departamento_antigo INT,
  cod_departamento_novo INT,
  superior_antigo text,
  superior_novo text, 
  data_hora timestamp with time zone,
  usuario text

);


CREATE OR REPLACE FUNCTION alt()
RETURNS trigger AS $$

DECLARE 
    carteira_trabalho_aux INT;
    salario_novo_aux real;
    salario_antigo_aux real;
    cod_departamento_antigo_aux INT;
    cod_departamento_novo_aux INT;
    superior_antigo_aux text;
    superior_novo_aux text;
BEGIN 
    IF TG_OP = 'UPDATE' THEN
        IF new.carteira_trabalho = old.carteira_trabalho  THEN 
            carteira_trabalho_aux = new.carteira_trabalho;
        END IF;

        IF new.salario = old.salario THEN 
            salario_novo_aux = null;
            salario_antigo_aux = null;
        ELSE 
            salario_novo_aux = new.salario;
            salario_antigo_aux = old.salario;
        END IF;

        IF new.cod_departamento = old.cod_departamento THEN 
            cod_departamento_antigo_aux = null;
            cod_departamento_novo_aux = null;
        ELSE 
            cod_departamento_antigo_aux = old.cod_departamento;
            cod_departamento_novo_aux = new.cod_departamento;
        END IF;

        IF new.supervisor = old.supervisor THEN 
            superior_antigo_aux  = null;
            superior_novo_aux = null;
        ELSE 
            superior_antigo_aux = old.supervisor;
            superior_novo_aux = new.supervisor;
        END IF;

        INSERT INTO alteracao_func (carteira_trabalho, salario_novo, salario_antigo, cod_departamento_antigo, cod_departamento_novo, superior_antigo, superior_novo, data_hora, usuario)
        VALUES (carteira_trabalho_aux, salario_novo_aux, salario_antigo_aux, cod_departamento_antigo_aux, cod_departamento_novo_aux, superior_antigo_aux, superior_novo_aux , now(), CURRENT_USER);
    END IF;
    RETURN new;
END;

$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE TRIGGER check_alt 
AFTER 
UPDATE ON Empregados
FOR EACH ROW EXECUTE PROCEDURE alt();



UPDATE Empregados SET cod_departamento = 200,salario = 8888,supervisor = 10003 WHERE carteira_trabalho = 100010; 


SELECT * FROM alteracao_func ;





