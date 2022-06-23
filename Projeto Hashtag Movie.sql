-------------------- HASHTAG MOVIE - Case de Análise de Dados no SQL ---------------------------------

--- A hashtagmovie é um banco de dados que tem como principal objetivo armazenar as informações de aluguéis e de desempenho dos filmes alugados pelo serviço de streaming da empresa ao longo do período. Esse banco de dados é composto por 5 tabelas: alugueis, atores, atuacoes, clientes, filmes. 



#Analisando os dados:

SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

#CASE 1. Você deverá começar fazendo uma análise para descobrir o preço médio de aluguel dos filmes.

SELECT AVG(preco_aluguel) AS PRECO_MEDIO
FROM filmes;

# CASE 2. Agora que você sabe o preço médio para se alugar filmes na hashtagmovie, você deverá ir além na sua análise e descobrir qual é o preço médio para cada gênero de filme.

SELECT genero, 
ROUND(AVG(preco_aluguel),2) AS preco_medio
FROM filmes
GROUP BY genero
ORDER BY preco_medio DESC;


# CASE 3: Fazer a mesma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.

SELECT genero, 
ROUND(AVG(preco_aluguel),2) AS preco_medio
FROM filmes
WHERE ano_lancamento = '2011'
GROUP BY genero
ORDER BY preco_medio DESC;

# CASE 4. Você precisará fazer uma análise de desempenho dos alugueis. Para isso, uma análise comum é identificar quais aluguéis tiveram nota acima da média. Você seria capaz de fazer isso?
SELECT AVG(nota) FROM alugueis;
# média: 7,94

# Fazendo subquery:
SELECT * FROM alugueis 
WHERE nota > (SELECT AVG(nota) FROM alugueis)
ORDER BY nota;


# CASE 5: Crie uma view para guardar o resultado de uma consulta no nosso banco de dados
CREATE VIEW resultados AS
SELECT genero, 
ROUND(AVG(preco_aluguel),2) AS preco_medio
FROM filmes
GROUP BY genero
ORDER BY preco_medio DESC;

SELECT * FROM resultados;
