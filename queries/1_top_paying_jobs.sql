/*
Question 1: What are the top-paying data scientist jobs?
- Identify the top 15 highest-paying Data Scientist roles
- Filters job posting with specified salaries (removing nulls)
- Identify which job locations have the highest paying Data Scientist roles.
- Purpose: To generalized our search for subsequent queries based on the top-paying roles
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location IN 
        ('San Diego, CA', 
        'San Francisco, CA', 
        'Seattle, WA', 
        'Washington, DC', 
        'New York, NY') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 15;

-- same query for 'Data Analyst' roles

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location IN 
        ('San Diego, CA', 
        'San Francisco, CA', 
        'Seattle, WA', 
        'Washington, DC', 
        'New York, NY') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 15;