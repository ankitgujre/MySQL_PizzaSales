create database pizzahut;
use pizzahut;
select * from pizzas;
select * from pizza_types;

create table orders(order_id int primary key,
order_date date not null,
order_time time not null);


create table order_details(order_details_id int primary key,
pizza_id text not null,
quantity int not null);

select * from order_details;

-- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2)
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id; 
    
-- Identify the highest-priced pizza

select pizza_types.name, pizzas.price from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id order by pizzas.price desc limit 1;