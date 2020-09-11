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

/*Manager & Department & City*/

select d.department_name, j.job_title, e.employee_id , e.first_name, e.last_name , l.city
from hr.employees e 
left join hr.jobs j on e.job_id = j.job_id
left join hr.departments d on d.department_id = e.department_id
left join hr.locations l on l.location_id = d.location_id
where e.employee_id in (select distinct(manager_id) from hr.employees)
order by d.department_name, j.job_title

/* Managers & Department & City & Country*/

select d.department_name, j.job_title, e.employee_id , e.first_name, e.last_name , l.city , c.country_name
from hr.employees e 
left join hr.jobs j on e.job_id = j.job_id
left join hr.departments d on d.department_id = e.department_id
left join hr.locations l on l.location_id = d.location_id
left join hr.countries c on l.country_id = c.country_id
where e.employee_id in (select distinct(manager_id) from hr.employees)
order by d.department_name, j.job_title

/*Countries with departments*/

select distinct(c.country_name)
from hr.departments d
inner join hr.locations l on l.location_id = d.location_id
inner join hr.countries c on c.country_id = l.country_id 

/*Countries without departments*/

select distinct(country_name) from hr.countries where country_name not in (
select distinct(c.country_name)
from hr.departments d
inner join hr.locations l on l.location_id = d.location_id
inner join hr.countries c on c.country_id = l.country_id )



