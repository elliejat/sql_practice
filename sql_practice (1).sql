select
*
from customers as c
join orders as o
on c.id= o.cust_id
order by c.id
limit 10
;

select 
*
from bcg_employees as be
join bcg_emp_project as bep
on be.id = bep.emp_id
join bcg_projects as bp
on bep.project_id = bp.id
;

select
*
from customers as c
left join orders as o
on c.id= o.cust_id
where o.id is null
order by o.id
;

select
*
from facebook_posts as fp
join facebook_reactions as fr
on fp.poster_id = fr.poster
order by fp.poster_id
; 
------------

select
*
from facebook_employees as fe
join facebook_hack_survey as fhs
on fe.id = fhs.employee_id
order by fe.id
;
------------------
select
*
from employee as emp
inner join bonus as bon
on emp.id = bon.worker_ref_id
order by emp.bonus;
----------------------------
select
*
from worker as w
join title as t
on w.worker_id = t.worker_ref_id
order by w.worker_id 
;
---------------------------
select
*
from playbook_experiments as pex
join playbook_events as pev
on pex.user_id = pev.user_id
join playbook_emails as pemail 
on pev.user_id = pemail.user_id
;
-------------------------------
select
*
from google_gmail_emails as ggmail
join google_gmail_labels as gglabel
on ggmail.id = gglabel.email_id
order by ggmail.id 
;
-----------------------
select
*
from airbnb_reviews as ar
join airbnb_guests as ag
on ar.from_user = ag.guest_id
order by ar.from_user;
------------------------------
select
*
from airbnb_hosts as ah
left join  airbnb_apartments as aa
on ah.host_id = aa.host_id
order by ah.host_id
; 
--------------------------------
select
gcs.id as id,
team,
avg(score)
from google_competition_participants as gcp
join google_competition_scores as gcs
on gcp.id = gcs.id
;

-------------------
select 
 apartment_type,
 country,
 count(*) as num_host,
 ah.host_id as host_id,
 nationality
 from airbnb_apartments as aa
 join airbnb_hosts as ah
 on aa.host_id = ah.host_id
 where apartment_type like '%apartment%'
 and nationality != country
 order by aa.host_id 
 ;
 ---------------------------
 select * from facebook_posts
where post_id IN (select post_id from facebook_reactions WHERE reaction = 'heart');
 
WITH tab AS(
SELECT * FROM facebook_reactions
    WHERE reaction LIKE 'heart'
    GROUP BY post_id
)
SELECT distinct * FROM facebook_posts as fp
    INNER JOIN tab
        ON tab.post_id = fp.post_id;
-------------------------  
select * from customers where customer.id not in (select cust_id from orders); 

select count(first_name) num_didnt_order from customers
where id not in (select cust_id from orders)
order by num_didnt_order;
-------------------------
select 
count(distinct aa.host_id) tot_num_host_pernat
from airbnb_apartments aa
inner join airbnb_hosts ah
on aa.host_id = ah.host_id
where aa.apartment_type like '%apartment%' is not null 
and ah.nationality <> aa.country
;
---------------
select
distinct ggmail.from_user, gglabel.label
from google_gmail_emails as ggmail
join google_gmail_labels as gglabel
on ggmail.id = gglabel.email_id
order by ggmail.id 
;
-----------
select c.id, c.first_name, c.last_name, c.city, order_details
from customers c
join orders o
on c.id = o.cust_id
order by first_name, order_details;

select	id, first_name, last_name, city from customers where id in
 ( select cust_id, order_details from orders );
 ----------------

SELECT (select(SUM(consumption)) FROM facebook_na_energy_consumption) + (SELECT (SUM(consumption)) FROM facebook_asia_energy_consumption)+ (SELECT (SUM(consumption)) FROM facebook_europe_energy_consumption) as avg_consumption;
-----------
select 
distinct song_name, year 
from billboard_top_100_year_end
where year > 1992
order by year desc
;
-----------
select
artist, song_name, year_rank 
from billboard_top_100_year_end
where year_rank <= 10
order by year_rank
;
----------------
select
artist, song_name, year_rank, year
from billboard_top_100_year_end
where year_rank <= 100 and year >= 2003
order by year_rank, year desc
;
----------
select
artist, song_name,year, year_rank
from billboard_top_100_year_end 
where year_rank = 1 and year >= 1963
order by year_rank, year
;

