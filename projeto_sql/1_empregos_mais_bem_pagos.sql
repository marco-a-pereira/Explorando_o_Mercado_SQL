/*
Pergunta: Quais são os cargos de Analista de Dados mais bem pagos?
- Identificar os 10 cargos de Analista de Dados com os maiores salários, disponíveis para trabalho remoto
- Focar apenas em vagas com salário especificado (remover valores nulos)
- BÔNUS: Incluir o nome das empresas dessas 10 principais vagas
- Por quê? Destacar as melhores oportunidades de remuneração para Analistas de Dados, oferecendo uma visão sobre o mercado e a flexibilidade de local de trabalho.
*/

SELECT	
	job_id AS id_vaga,
	job_title AS titulo_vaga,
	job_location AS local_vaga,
	job_schedule_type AS tipo_carga_horaria,
	salary_year_avg AS salario_medio_anual,
	job_posted_date AS data_publicacao,
    name AS nome_empresa
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salario_medio_anual DESC
LIMIT 10;

/*
Resumo dos principais cargos de Analista de Dados em 2023:
Faixa Salarial Ampla: Os 10 cargos mais bem pagos vão de $184.000 a $650.000 por ano, mostrando um grande potencial de remuneração na área.
Diversidade de Empresas: Empresas como SmartAsset, Meta e AT&T estão entre as que oferecem os maiores salários, indicando interesse em múltiplos setores.
Variedade de Títulos: Há grande diversidade nos nomes dos cargos, desde "Data Analyst" até "Director of Analytics", refletindo diferentes níveis e especializações dentro da análise de dados.

RESULTADOS
=========
[
  {
    "id_vaga": 226942,
    "titulo_vaga": "Data Analyst",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "650000.0",
    "data_publicacao": "2023-02-20 15:13:33",
    "nome_empresa": "Mantys"
  },
  {
    "id_vaga": 547382,
    "titulo_vaga": "Director of Analytics",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "336500.0",
    "data_publicacao": "2023-08-23 12:04:42",
    "nome_empresa": "Meta"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "255829.5",
    "data_publicacao": "2023-06-18 16:03:12",
    "nome_empresa": "AT&T"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "232423.0",
    "data_publicacao": "2023-12-05 20:00:40",
    "nome_empresa": "Pinterest Job Advertisements"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "217000.0",
    "data_publicacao": "2023-01-17 00:17:23",
    "nome_empresa": "Uclahealthcareers"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "205000.0",
    "data_publicacao": "2023-08-09 11:00:01",
    "nome_empresa": "SmartAsset"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "189309.0",
    "data_publicacao": "2023-12-07 15:00:13",
    "nome_empresa": "Inclusively"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "189000.0",
    "data_publicacao": "2023-01-05 00:00:25",
    "nome_empresa": "Motional"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "186000.0",
    "data_publicacao": "2023-07-11 16:00:05",
    "nome_empresa": "SmartAsset"
  },
  {
    "id_vaga": 387860,
    "titulo_vaga": "ERM Data Analyst",
    "local_vaga": "Anywhere",
    "tipo_carga_horaria": "Full-time",
    "salario_medio_anual": "184000.0",
    "data_publicacao": "2023-06-09 08:01:04",
    "nome_empresa": "Get It Recruit - Information Technology"
  }
]
*/