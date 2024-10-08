CREATE TABLE [company_dim] (
  [company_id] int PRIMARY KEY,
  [name] text,
  [link] text,
  [link_google] text,
  [thumbnail] text
)
GO

CREATE TABLE [skills_dim] (
  [skill_id] int PRIMARY KEY,
  [skills] text,
  [type] text
)
GO

CREATE TABLE [job_postings_fact] (
  [job_id] int PRIMARY KEY,
  [company_id] int,
  [job_title_short] varchar(255),
  [job_title] text,
  [job_location] text,
  [job_via] text,
  [job_schedule_type] text,
  [job_work_from_home] boolean,
  [search_location] text,
  [job_posted_date] timestamp,
  [job_no_degree_mention] boolean,
  [job_health_insurance] boolean,
  [job_country] text,
  [salary_rate] text,
  [salary_year_avg] numeric,
  [salary_hour_avg] numeric
)
GO

CREATE TABLE [skills_job_dim] (
  [job_id] int,
  [skill_id] int
)
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Composite primary key on job_id and skill_id',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'skills_job_dim';
GO

ALTER TABLE [job_postings_fact] ADD FOREIGN KEY ([company_id]) REFERENCES [company_dim] ([company_id])
GO

ALTER TABLE [skills_job_dim] ADD FOREIGN KEY ([job_id]) REFERENCES [job_postings_fact] ([job_id])
GO

ALTER TABLE [skills_job_dim] ADD FOREIGN KEY ([skill_id]) REFERENCES [skills_dim] ([skill_id])
GO
