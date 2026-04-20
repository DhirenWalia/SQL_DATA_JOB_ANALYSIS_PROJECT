with top_payjobs as (
    SELECT
        job_id,
        job_title,
        job_schedule_type,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    left join company_dim on job_postings_fact.company_id = company_dim.company_id  
    where job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere'and
        salary_year_avg is not null
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

select top_payjobs.*, skills
from top_payjobs
INNER JOIN skills_job_dim on top_payjobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by salary_year_avg DESC

/*
SQL appears the most. This confirms that querying, cleaning, and handling data is still the core of data analyst work.
Python is nearly tied with SQL. Companies increasingly expect analysts to automate tasks, perform analysis, and use libraries like Pandas.
Visualization tools are everywhere:
Modern companies use cloud platforms and warehouses:
Skills like:Jira,Confluence,Git,Bitbucket---show that analysts work in teams, not isolation.
*/
