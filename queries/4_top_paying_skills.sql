/*
Question 4: What are the top skills based on salary?
- Analyze the average salary associated with a particular skill
- Filtering on job roles with a specified salaries, regardless of job location
- Purpose: Understand how different skills impact salary levels for Data Scientist
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 25

-- same query for 'Data Analyst' roles

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 25
