with skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.skill_id) as skill_count
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not null
         AND
        job_work_from_home = true
    group by skills_dim.skill_id
   -- order by skill_count DESC
   -- limit 5
), avg_sal as (
    SELECT
        skills_job_dim.skill_id,   
        round(avg(job_postings_fact.salary_year_avg),0) as avg_sal
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where
        job_title_short = 'Data Analyst' 
        and salary_year_avg is not null
        -- AND job_work_from_home = true
    group by skills_job_dim.skill_id
   -- order by avg_salary DESC
  --  limit 20
    )

select 
    skills_demand.skill_id,
    skills_demand.skills,
    skill_count,
    avg_sal
from skills_demand
inner join avg_sal on skills_demand.skill_id = avg_sal.skill_id
where skill_count > 10
ORDER BY avg_sal DESC,
    skill_count DESC
limit 10;

/*
Snowflake Has the Highest Demand
AWS is #2 in Demand
Hadoop Still Matters
*/