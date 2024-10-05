/*
Question 1: What are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles
- Filters job posting with specified salaries (removing nulls)
- Highlight the top-paying opportunities for Data Scientist
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LIMIT
    100;