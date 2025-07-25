# Introdução

💡Esse projeto foi desenvolvido como parte do curso de SQL do [Luke Barousse](https://lukebarousse.com/sql), durante o curso fui desafiado a aplicar técnicas de análise em dados do mercado de trabalho da área de dados. As perguntas já estavam definidas no conteúdo, mas foi na execução das queries e na interpretação dos resultados que realmente pus a mão na massa.

Cada script SQL aqui é uma etapa da minha jornada de aprendizado onde pratiquei conceitos importantes como JOINs, CTEs, GROUP BY, além de aprender como transformar dados brutos em insights com sentido.

Esse projeto não é sobre criar algo do zero, mas sim sobre mostrar que sei aplicar o que aprendi com clareza e propósito. Este projeto é focado em vagas para **Analistas de Dados** e explora:

* 💰 As vagas mais bem pagas
* 🔥 As habilidades mais requisitadas
* 🎯 E quais habilidades oferecem o melhor custo-benefício (alta demanda + bons salários)

🔍 Todas as queries em SQL estão disponíveis aqui: [`/projeto_sql`](./projeto_sql)

# Contexto

Neste projeto trabalhei com um banco de dados realista de vagas de emprego da área de dados do ano de 2023. As análises seguem as perguntas propostas no conteúdo, com foco em entender como salário, demanda e habilidades técnicas se relacionam no mercado de trabalho.

O dataset utilizado inclui dados como título da vaga, média salarial, localização e skills exigidas ideal para exercitar o pensamento analítico com SQL na prática.

## 📌 Questões que norteiam a análise:

1. Quais são os cargos de Analista de Dados mais bem remunerados?
2. Quais habilidades são exigidas nessas vagas mais bem pagas?
3. Quais são as habilidades mais requisitadas no mercado?
4. Quais habilidades estão associadas aos maiores salários?
5. Quais são as habilidades mais estratégicas (altamente demandadas e bem remuneradas)?

---

# Ferramentas Utilizadas

* **SQL:** A linguagem principal para consulta e análise dos dados.
* **PostgreSQL:** Gerenciador de banco de dados utilizado para processar o dataset.
* **Visual Studio Code:** Editor utilizado para escrever e executar os scripts SQL.
* **Git & GitHub:** Controle de versão e compartilhamento do projeto.

---

# Análises Realizadas

### 1. Vagas de Data Analyst Mais Bem Pagas

A primeira análise foca nas oportunidades com maiores salários. Filtrei apenas vagas remotas e com salário anual informado.

```sql
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
```

🔑 **Insight**: Existem oportunidades que pagam até **\$650 mil/ano**, muitas vezes com títulos variados (de Analista a Diretor de Analytics), o que mostra a amplitude da função.

* Essas vagas geralmente trazem títulos mais amplos ou de nível sênior (ex: Director of Analytics, Data Manager), o que mostra que o campo de dados permite crescimento profissional expressivo.
* A maioria das melhores vagas permite trabalho remoto — uma tendência consolidada no mercado de tecnologia.


### 2. Habilidades Exigidas nas Vagas Mais Bem Pagas

Aqui analisei quais skills aparecem com mais frequência nas 10 vagas com maiores salários.

```sql
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
```

🔑 **Destaques**:

* Linguagens como **SQL** e **Python** aparecem com mais frequência entre as vagas mais bem pagas, mostrando que fundamentos sólidos continuam sendo valorizados.
* Ferramentas como **Tableau** e bibliotecas como **Pandas** também aparecem com frequência, reforçando a importância de saber transformar dados em visualizações e análises claras.

### 3. Habilidades Mais Demandadas no Mercado

Essa consulta identificou as skills mais comuns em todas as vagas de Data Analyst com possibilidade de trabalho remoto.

```sql
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
```
🔑 **Conclusão**: Fundamentos como **SQL** e **Excel** ainda são essenciais, mas habilidades técnicas como **Python** e ferramentas de visualização (**Tableau**, **Power BI**) ganham cada vez mais espaço.

| Habilidade | Nº de Vagas |
| ---------- | ----------- |
| SQL        | 7.291       |
| Excel      | 4.611       |
| Python     | 4.330       |
| Tableau    | 3.745       |
| Power BI   | 2.609       |


### 4. Habilidades com Maiores Salários Médios

Essa análise mostra quais skills estão associadas às maiores médias salariais.

```sql
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
```

| Skill     | Salário Médio (\$) |
| --------- | ------------------ |
| PySpark   | 208.172            |
| Bitbucket | 189.155            |
| Couchbase | 160.515            |
| DataRobot | 155.486            |
| GitLab    | 154.500            |
| Jupyter   | 152.777            |
| Pandas    | 151.821            |

🔑 **Conclusão**

* Skills ligadas a Big Data, Machine Learning, engenharia de dados e nuvem tendem a pagar mais exemplos incluem **PySpark**, **Couchbase**, **Jupyter**, entre outros.

* Esse padrão mostra que analistas com um pé em engenharia ou ciência de dados têm potencial para alcançar faixas salariais mais altas.

### 5. Habilidades Mais Estratégicas para Aprender

Cruzando **alta demanda** e **alto salário médio**, cheguei às habilidades mais estratégicas para quem quer se destacar como analista de dados.

```sql
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
```

| Skill     | Demanda | Salário Médio (\$) |
| --------- | ------- | ------------------ |
| Go        | 27      | 115.320            |
| Snowflake | 37      | 112.948            |
| Azure     | 34      | 111.225            |
| AWS       | 32      | 108.317            |
| Java      | 17      | 106.906            |
| Jira      | 20      | 104.918            |
| Python    | 236     | 101.397            |

🔑 **Conclusão**

* Algumas tecnologias oferecem o melhor dos dois mundos: alta demanda e bons salários.
* Ferramentas como **Snowflake**, **AWS**, **Azure**, **Looker** e **BigQuery** aparecem bem posicionadas nesse cruzamento — indicando que vale a pena investir tempo nelas.
* Linguagens e ferramentas amplamente utilizadas, como **SQL** e **Python**, seguem sendo altamente estratégicas, pois aparecem bem colocadas tanto em demanda quanto em média salarial.

---

# O Que Eu Aprendi

Durante o projeto, pude reforçar e expandir minhas habilidades com SQL, incluindo:

* **🔗 Joins e subqueries complexas:** para cruzar diferentes dimensões do dataset.
* **📊 Agregações e análises comparativas:** com uso de `GROUP BY`, `COUNT`, `AVG` e `HAVING`.
* **🧠 Raciocínio analítico:** transformando perguntas estratégicas em consultas práticas e acionáveis.

---

# Conclusões

1. **Salários variam muito**, especialmente em posições remotas — existem oportunidades extremamente lucrativas.
2. **SQL é indispensável**, tanto como habilidade mais exigida quanto como critério em vagas bem pagas.
3. **Especializações técnicas** (como ML, Cloud, Big Data) tendem a aumentar significativamente o salário.
4. Focar em **habilidades estratégicas**, como Python + Ferramentas de Cloud, pode alavancar sua carreira como analista de dados.

---

## 🧠 Considerações Finais

Esse projeto foi uma excelente oportunidade para aplicar conceitos de SQL em um cenário realista de mercado de trabalho. Mais do que escrever queries, foi sobre **fazer perguntas certas** e buscar respostas relevantes para decisões de carreira.

Espero que essa análise ajude outros(as) profissionais de dados a entender melhor o que o mercado valoriza — e a traçar um caminho mais consciente e estratégico.
