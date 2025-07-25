/*
Pergunta: Quais habilidades são exigidas nos cargos de Analista de Dados mais bem pagos?
- Utiliza as 10 vagas de Analista de Dados com os maiores salários da primeira consulta
- Adiciona as habilidades específicas requeridas para essas vagas
- Por quê? Fornece uma visão detalhada das habilidades demandadas em vagas de alta remuneração,
  ajudando profissionais a identificar quais competências desenvolver para alcançar melhores salários
*/

WITH vagas_mais_bem_pagas AS (
    SELECT	
        job_id AS id_vaga,
        job_title AS titulo_vaga,
        salary_year_avg AS salario_medio_anual,
        name AS nome_empresa
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    vagas_mais_bem_pagas.*,
    skills AS habilidade
FROM vagas_mais_bem_pagas
INNER JOIN skills_job_dim ON vagas_mais_bem_pagas.id_vaga = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salario_medio_anual DESC;

/*
Resumo das habilidades mais exigidas para Analistas de Dados em 2023, com base nas vagas analisadas:
- SQL aparece em 8 das 10 vagas, sendo a habilidade mais requisitada.
- Python está presente em 7 vagas, demonstrando alta relevância.
- Tableau também se destaca, sendo exigido em 6 vagas.
- Outras habilidades como R, Snowflake, Pandas e Excel aparecem com diferentes níveis de demanda.

RESULTADOS
=========
[
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "sql"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "python"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "r"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "azure"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "databricks"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "aws"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "pandas"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "pyspark"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "jupyter"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "excel"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "tableau"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "power bi"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_medio_anual": "255829.5",
    "nome_empresa": "AT&T",
    "habilidade": "powerpoint"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_medio_anual": "232423.0",
    "nome_empresa": "Pinterest Job Advertisements",
    "habilidade": "sql"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_medio_anual": "232423.0",
    "nome_empresa": "Pinterest Job Advertisements",
    "habilidade": "python"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_medio_anual": "232423.0",
    "nome_empresa": "Pinterest Job Advertisements",
    "habilidade": "r"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_medio_anual": "232423.0",
    "nome_empresa": "Pinterest Job Advertisements",
    "habilidade": "hadoop"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_medio_anual": "232423.0",
    "nome_empresa": "Pinterest Job Advertisements",
    "habilidade": "tableau"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_medio_anual": "217000.0",
    "nome_empresa": "Uclahealthcareers",
    "habilidade": "sql"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_medio_anual": "217000.0",
    "nome_empresa": "Uclahealthcareers",
    "habilidade": "crystal"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_medio_anual": "217000.0",
    "nome_empresa": "Uclahealthcareers",
    "habilidade": "oracle"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_medio_anual": "217000.0",
    "nome_empresa": "Uclahealthcareers",
    "habilidade": "tableau"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_medio_anual": "217000.0",
    "nome_empresa": "Uclahealthcareers",
    "habilidade": "flow"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "sql"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "python"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "go"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "snowflake"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "pandas"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "numpy"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "excel"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "tableau"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_medio_anual": "205000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "gitlab"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "sql"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "python"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "azure"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "aws"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "oracle"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "snowflake"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "tableau"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "power bi"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "sap"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "jenkins"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "bitbucket"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "atlassian"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "jira"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_medio_anual": "189309.0",
    "nome_empresa": "Inclusively",
    "habilidade": "confluence"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "sql"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "python"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "r"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "git"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "bitbucket"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "atlassian"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "jira"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_medio_anual": "189000.0",
    "nome_empresa": "Motional",
    "habilidade": "confluence"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "sql"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "python"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "go"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "snowflake"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "pandas"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "numpy"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "excel"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "tableau"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_medio_anual": "186000.0",
    "nome_empresa": "SmartAsset",
    "habilidade": "gitlab"
  },
  {
    "id_vaga": 387860,
    "titulo_vaga": "ERM Data Analyst",
    "salario_medio_anual": "184000.0",
    "nome_empresa": "Get It Recruit - Information Technology",
    "habilidade": "sql"
  },
  {
    "id_vaga": 387860,
    "titulo_vaga": "ERM Data Analyst",
    "salario_medio_anual": "184000.0",
    "nome_empresa": "Get It Recruit - Information Technology",
    "habilidade": "python"
  },
  {
    "id_vaga": 387860,
    "titulo_vaga": "ERM Data Analyst",
    "salario_medio_anual": "184000.0",
    "nome_empresa": "Get It Recruit - Information Technology",
    "habilidade": "r"
  }
]
*/