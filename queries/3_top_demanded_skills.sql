/*
Question 3: What are the most in-demand skills for Data Scientist?
- Join job postings to inner join table in query 2
- Identify the top 7 in-demand skills for Data Scientist
- Filtered on all job postings
- Purpose: To retrieve the top 7 skills that is currently in demand within the job market
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 7

-- same query for 'Data Analyst' roles

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 7