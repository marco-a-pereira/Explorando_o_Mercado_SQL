/*
Pergunta: Quais são as habilidades mais vantajosas para aprender? 
(ou seja, que estão em alta demanda e têm boa remuneração)

- Identifica habilidades com alta demanda e alto salário médio para cargos de Analista de Dados
- Foco em vagas remotas com salário especificado
- Por quê? Aponta habilidades que oferecem segurança profissional (alta demanda) e retorno financeiro (altos salários),
  sendo informações estratégicas para o desenvolvimento de carreira na área de análise de dados
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS habilidade,
    COUNT(skills_job_dim.job_id) AS quantidade_demandada,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salario_medio_anual
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    salario_medio_anual DESC,
    quantidade_demandada DESC
LIMIT 25;



/*
Resumo das habilidades mais vantajosas para Analistas de Dados em 2023:

- Linguagens de Programação em Alta Demanda: Python e R se destacam com demandas de 236 e 148 respectivamente. Apesar da ampla procura, seus salários médios (cerca de $101.397 para Python e $100.499 para R) mostram que são habilidades essenciais, porém amplamente difundidas.

- Ferramentas e Tecnologias em Nuvem: Snowflake, Azure, AWS e BigQuery aparecem com boa demanda e salários médios elevados, indicando a valorização crescente de competências ligadas a Big Data e cloud computing.

- Inteligência de Negócios e Visualização de Dados: Tableau e Looker se destacam tanto em número de vagas quanto em salários, reforçando a importância da visualização como ferramenta de apoio à tomada de decisão.

- Tecnologias de Banco de Dados: Habilidades em bancos relacionais e NoSQL (como Oracle, SQL Server e NoSQL) continuam sendo bem pagas, com salários entre $97.786 e $104.534, evidenciando a demanda contínua por domínio em armazenamento e manipulação de dados.

RESULTADOS
=========
[
  {
    "skill_id": 8,
    "habilidade": "go",
    "quantidade_demandada": "27",
    "salario_medio_anual": "115320"
  },
  {
    "skill_id": 234,
    "habilidade": "confluence",
    "quantidade_demandada": "11",
    "salario_medio_anual": "114210"
  },
  {
    "skill_id": 97,
    "habilidade": "hadoop",
    "quantidade_demandada": "22",
    "salario_medio_anual": "113193"
  },
  {
    "skill_id": 80,
    "habilidade": "snowflake",
    "quantidade_demandada": "37",
    "salario_medio_anual": "112948"
  },
  {
    "skill_id": 74,
    "habilidade": "azure",
    "quantidade_demandada": "34",
    "salario_medio_anual": "111225"
  },
  {
    "skill_id": 77,
    "habilidade": "bigquery",
    "quantidade_demandada": "13",
    "salario_medio_anual": "109654"
  },
  {
    "skill_id": 76,
    "habilidade": "aws",
    "quantidade_demandada": "32",
    "salario_medio_anual": "108317"
  },
  {
    "skill_id": 4,
    "habilidade": "java",
    "quantidade_demandada": "17",
    "salario_medio_anual": "106906"
  },
  {
    "skill_id": 194,
    "habilidade": "ssis",
    "quantidade_demandada": "12",
    "salario_medio_anual": "106683"
  },
  {
    "skill_id": 233,
    "habilidade": "jira",
    "quantidade_demandada": "20",
    "salario_medio_anual": "104918"
  },
  {
    "skill_id": 79,
    "habilidade": "oracle",
    "quantidade_demandada": "37",
    "salario_medio_anual": "104534"
  },
  {
    "skill_id": 185,
    "habilidade": "looker",
    "quantidade_demandada": "49",
    "salario_medio_anual": "103795"
  },
  {
    "skill_id": 2,
    "habilidade": "nosql",
    "quantidade_demandada": "13",
    "salario_medio_anual": "101414"
  },
  {
    "skill_id": 1,
    "habilidade": "python",
    "quantidade_demandada": "236",
    "salario_medio_anual": "101397"
  },
  {
    "skill_id": 5,
    "habilidade": "r",
    "quantidade_demandada": "148",
    "salario_medio_anual": "100499"
  },
  {
    "skill_id": 78,
    "habilidade": "redshift",
    "quantidade_demandada": "16",
    "salario_medio_anual": "99936"
  },
  {
    "skill_id": 187,
    "habilidade": "qlik",
    "quantidade_demandada": "13",
    "salario_medio_anual": "99631"
  },
  {
    "skill_id": 182,
    "habilidade": "tableau",
    "quantidade_demandada": "230",
    "salario_medio_anual": "99288"
  },
  {
    "skill_id": 197,
    "habilidade": "ssrs",
    "quantidade_demandada": "14",
    "salario_medio_anual": "99171"
  },
  {
    "skill_id": 92,
    "habilidade": "spark",
    "quantidade_demandada": "13",
    "salario_medio_anual": "99077"
  },
  {
    "skill_id": 13,
    "habilidade": "c++",
    "quantidade_demandada": "11",
    "salario_medio_anual": "98958"
  },
  {
    "skill_id": 186,
    "habilidade": "sas",
    "quantidade_demandada": "63",
    "salario_medio_anual": "98902"
  },
  {
    "skill_id": 7,
    "habilidade": "sas",
    "quantidade_demandada": "63",
    "salario_medio_anual": "98902"
  },
  {
    "skill_id": 61,
    "habilidade": "sql server",
    "quantidade_demandada": "35",
    "salario_medio_anual": "97786"
  },
  {
    "skill_id": 9,
    "habilidade": "javascript",
    "quantidade_demandada": "20",
    "salario_medio_anual": "97587"
  }
]
*/
