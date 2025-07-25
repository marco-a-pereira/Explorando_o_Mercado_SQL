/*
Pergunta: Quais são as habilidades com os maiores salários médios?
- Analisa o salário médio associado a cada habilidade em vagas de Analista de Dados
- Considera apenas vagas com salário especificado, independentemente da localização
- Por quê? Revela como diferentes habilidades impactam os níveis salariais para Analistas de Dados,
  ajudando a identificar quais competências são mais financeiramente vantajosas para adquirir ou aprimorar
*/

SELECT 
    skills_dim.skills AS habilidade,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salario_medio_anual
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    salario_medio_anual DESC
LIMIT 25;

/*
Resumo dos resultados sobre as habilidades mais bem remuneradas para Analistas de Dados:

- Alta demanda por habilidades em Big Data e Machine Learning: As maiores médias salariais estão associadas a profissionais com domínio em tecnologias como PySpark e Couchbase, ferramentas de aprendizado de máquina como DataRobot e Jupyter, além de bibliotecas Python como Pandas e NumPy. Isso demonstra o alto valor atribuído à modelagem preditiva e ao processamento de grandes volumes de dados.

- Proficiência em Desenvolvimento e Implantação de Software: Habilidades com ferramentas como GitLab, Kubernetes e Airflow indicam um perfil híbrido entre análise e engenharia de dados, com valorização de competências que otimizam a automação e a gestão de pipelines de dados.

- Especialização em Computação em Nuvem: O domínio de ferramentas e plataformas como Elasticsearch, Databricks e Google Cloud Platform (GCP) destaca a crescente importância de ambientes analíticos baseados em nuvem, sugerindo que essa competência aumenta significativamente o potencial de remuneração na área.

RESULTADOS
=========
[
  {
    "habilidade": "pyspark",
    "salario_medio_anual": "208172"
  },
  {
    "habilidade": "bitbucket",
    "salario_medio_anual": "189155"
  },
  {
    "habilidade": "couchbase",
    "salario_medio_anual": "160515"
  },
  {
    "habilidade": "watson",
    "salario_medio_anual": "160515"
  },
  {
    "habilidade": "datarobot",
    "salario_medio_anual": "155486"
  },
  {
    "habilidade": "gitlab",
    "salario_medio_anual": "154500"
  },
  {
    "habilidade": "swift",
    "salario_medio_anual": "153750"
  },
  {
    "habilidade": "jupyter",
    "salario_medio_anual": "152777"
  },
  {
    "habilidade": "pandas",
    "salario_medio_anual": "151821"
  },
  {
    "habilidade": "elasticsearch",
    "salario_medio_anual": "145000"
  },
  {
    "habilidade": "golang",
    "salario_medio_anual": "145000"
  },
  {
    "habilidade": "numpy",
    "salario_medio_anual": "143513"
  },
  {
    "habilidade": "databricks",
    "salario_medio_anual": "141907"
  },
  {
    "habilidade": "linux",
    "salario_medio_anual": "136508"
  },
  {
    "habilidade": "kubernetes",
    "salario_medio_anual": "132500"
  },
  {
    "habilidade": "atlassian",
    "salario_medio_anual": "131162"
  },
  {
    "habilidade": "twilio",
    "salario_medio_anual": "127000"
  },
  {
    "habilidade": "airflow",
    "salario_medio_anual": "126103"
  },
  {
    "habilidade": "scikit-learn",
    "salario_medio_anual": "125781"
  },
  {
    "habilidade": "jenkins",
    "salario_medio_anual": "125436"
  },
  {
    "habilidade": "notion",
    "salario_medio_anual": "125000"
  },
  {
    "habilidade": "scala",
    "salario_medio_anual": "124903"
  },
  {
    "habilidade": "postgresql",
    "salario_medio_anual": "123879"
  },
  {
    "habilidade": "gcp",
    "salario_medio_anual": "122500"
  },
  {
    "habilidade": "microstrategy",
    "salario_medio_anual": "121619"
  }
]
*/