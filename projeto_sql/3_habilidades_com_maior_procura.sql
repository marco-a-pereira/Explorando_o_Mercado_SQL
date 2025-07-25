/*
Pergunta: Quais são as habilidades mais demandadas para Analistas de Dados?
- Junta os dados de vagas com a tabela de habilidades (como na consulta anterior)
- Identifica as 5 habilidades mais requisitadas para cargos de Analista de Dados
- Considera todas as vagas, desde que sejam para trabalho remoto
- Por quê? Recupera as 5 habilidades com maior demanda no mercado de trabalho, oferecendo uma visão clara sobre as competências mais valorizadas atualmente
*/

SELECT 
    skills_dim.skills AS habilidade,
    COUNT(skills_job_dim.job_id) AS quantidade_demandada
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    quantidade_demandada DESC
LIMIT 5;

/*
Resumo das habilidades mais demandadas para Analistas de Dados em 2023:

- SQL e Excel continuam sendo fundamentais, destacando a importância de uma base sólida em manipulação de dados e planilhas.
- Ferramentas de Programação e Visualização, como Python, Tableau e Power BI, são essenciais, refletindo a crescente necessidade de contar histórias com dados e apoiar decisões com base em análises.

RESULTADOS
=========
[
  {
    "habilidade": "sql",
    "quantidade_demandada": "7291"
  },
  {
    "habilidade": "excel",
    "quantidade_demandada": "4611"
  },
  {
    "habilidade": "python",
    "quantidade_demandada": "4330"
  },
  {
    "habilidade": "tableau",
    "quantidade_demandada": "3745"
  },
  {
    "habilidade": "power bi",
    "quantidade_demandada": "2609"
  }
]
*/