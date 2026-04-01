use swiggydb;

Select name from customers 
where city="Delhi";

Select avg(rating) as rating
from restaurants
where city="Mumbai";

Select distinct customers.name 
from customers join orders
using(customer_id);

Select customers.name,count(order_id) as total_orders
from customers left join orders
using(customer_id)
group by customers.name;

Select restaurants.restaurant_id, restaurants.name, 
ifnull(sum(total_amount),0) as total_revenue
from restaurants left join orders 
using(restaurant_id)
group by restaurants.restaurant_id, restaurants.name;

Select name, avg(rating)
from restaurants 
group by name
order by avg(rating) desc
limit 5;

Select customers.name, orders.order_id
from customers left join orders
using(customer_id)
where orders.order_id is null;

Select customers.name, count(orders.order_id) from customers join orders
using(customer_id)
where customers.city="Mumbai"
group by customers.name;

Select order_id, order_date from orders 
where order_date between date_add("2024-08-15", interval -30 day)
and "2024-08-15";

Select max(order_date) from orders;

Select d.name, count(o.order_delivery_id) as no_of_deliveries
from deliverypartners d join orderdelivery o
using(partner_id)
group by d.name
having count(o.order_delivery_id)>1;

Select customers.name 
from customers join orders 
using(customer_id)
group by customers.name
having count(distinct order_date)=3;

Select d.name
from deliverypartners d join orderdelivery
using(partner_id)
join orders using(order_id)
join customers c using(customer_id)
group by d.name
having count( distinct c.customer_id)
order by count( distinct c.customer_id) desc
limit 1;

Select c1.name, c1.city, o1.order_date, restaurants.name, 
c2.name, c2.city, o2.order_date
from customers as c1 join orders as o1
on c1.customer_id=o1.customer_id
join restaurants using(restaurant_id)
join orders as o2 using(restaurant_id)
join customers as c2 
on o2.customer_id=c2.customer_id 
where c1.city=c2.city and c1.name<>c2.name and o1.order_date<>o2.order_date;

















