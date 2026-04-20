SELECT
    skills,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where
    job_title_short = 'Data Analyst' 
    and salary_year_avg is not null
    -- AND job_work_from_home = true
group by skills
order by avg_salary DESC
limit 20;

/*
SVN is a Massive Outlier
Blockchain Pays Extremely Well
High-Paying Backend / Infra Skills
AI / ML Skills Are Valuable
DevOps Skills Stay in Demand
*/