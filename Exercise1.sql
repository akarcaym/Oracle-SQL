/*Find the managers*/

select employee_id , manager_id, first_name, last_name 
from hr.employees 
where employee_id in (select distinct(manager_id) from hr.employees)   

/*Job titles of employees*/

select e.employee_id , e.first_name, e.manager_id, j.job_title
from hr.employees e, hr.jobs j
where e.job_id = j.job_id

select e.employee_id , e.first_name, e.manager_id, j.job_title
from hr.employees e, hr.jobs j
where e.job_id = j.job_id

/*Titles of managers*/

select e.employee_id , e.first_name, e.manager_id, j.job_title
from hr.employees e left join hr.jobs j on e.job_id = j.job_id
where e.employee_id in (select distinct(manager_id) from hr.employees)

/*Managers' departments*/

select d.department_name, j.job_title, e.employee_id , e.first_name, e.last_name 
from hr.employees e 
left join hr.jobs j on e.job_id = j.job_id
left join hr.departments d on d.department_id = e.department_id
where e.employee_id in (select distinct(manager_id) from hr.employees)
order by d.department_name, j.job_title

