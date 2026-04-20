with remote_job_skills as (
select 
    skill_id,
    count(*) as skill_count
from skills_job_dim
inner join job_postings_fact on job_postings_fact.job_id = skills_job_dim.job_id
where job_postings_fact.job_work_from_home = true and job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skill_id
limit 10
)
select 
    remote_job_skills.skill_id,
    skills,
    skill_count
from remote_job_skills  
inner join skills_dim on skills_dim.skill_id = remote_job_skills.skill_id
order by skill_count DESC
limit 5;      
/*
SQL Dominates the Market
 Python is the Strong #2
 R Still Holds Strong Value
 SAS Still Relevant but Niche
 Go is Emerging
-- alernate code fro the same result:::::
 SELECT
    skills,
    count(skills_job_dim.skill_id) as skill_count
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where
    job_title_short = 'Data Analyst' AND
    job_work_from_home = true
group by skills
order by skill_count DESC
limit 5;
 */
