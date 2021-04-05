#use sakila

#2
#select *
#from actor

#select *
#from address

#3
#select title
#from film

#4
#select l.name as language
#from language l

#5
#select count(r.return_date) as number_of_returns
#from rental r

#select count(sto.store_id) as number_of_stores, count(sto.manager_staff_id) as number_of_staff
#from store sto
#there are 2 staff members and 2 stores

#select sta.first_name 
#from staff sta
#there are 2 staff members with the following names

#6
select distinct count(r.rental_date) as number_unique_rental_days
from rental r
#there are 16.044 unique rental days



