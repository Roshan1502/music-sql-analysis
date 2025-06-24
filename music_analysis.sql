create database Music;
use music;
select * from employee
order by levels desc
limit 1;

Select count(invoice_id),billing_country from invoice
group by billing_country;
select * from invoice
order by total desc
limit 3;
select sum(total),billing_city from invoice
group by billing_city
order by sum(total);
select * from customer;
select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1;
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    SUM(invoice.total) AS total
FROM 
    customer
JOIN 
    invoice ON customer.customer_id = invoice.customer_id
GROUP BY 
    customer.customer_id, customer.first_name, customer.last_name
ORDER BY 
    total DESC
LIMIT 1;
select customer_id,sum(total) from invoice
group by customer_id
order by sum(total) desc;
select * from genre;
select * from track;
select distinct email,first_name,last_name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in(
 select track_id from track 
 join genre on track.genre_id=genre.genre_id
 where genre.name like 'Rock'
 );
/* inner join*/
select * from track
inner join album2 on track.album_id=album2.album_id;
/*left join*/
select * from invoice;
select * from customer;
SELECT i.customer_id, c.first_name, SUM(i.total) AS total_amount
FROM invoice AS i
LEFT JOIN customer AS c ON c.customer_id = i.customer_id
GROUP BY i.customer_id, c.first_name;
SELECT t.composer 
FROM track AS t
JOIN genre AS g ON g.genre_id = t.genre_id
WHERE g.name LIKE 'Jazz';
/*title of Rock genre songs */
select Distinct a.album_id, a.title from album2 as a
join track as t on a.album_id=t.album_id
join genre as g  on g.genre_id = t.genre_id
where g.name like 'Rock';
/*total sum of each country*/
select billing_country,sum(total) from invoice
group by billing_country
order by billing_country desc;
select * from invoice;
/* total no.of orders from each country */
select billing_country,count(invoice_id) as total_orders  from invoice
group by billing_country
order by billing_country desc;
/* count of invoices in each country of 2017 year */
select year(invoice_date),billing_country,count(invoice_id) from invoice 
group by year(invoice_date),billing_country
order by year(invoice_date);
/* count of invoice in each year*/
select year(invoice_date),count(invoice_id) as invoice_count from invoice 
group by year(invoice_date)
order by year(invoice_date);
/* title of album and name of artist */
select a.title,ar.name from album2 as a
join artist as ar on a.artist_id=ar.artist_id;
/* count of albums the artist whose name start with a*/
select ar.name,count(a.album_id) as album_count from album2 as a
join artist as ar on a.artist_id=ar.artist_id
where ar.name like 'A%'
group by ar.name;
select * from invoice_line;
/* sum of quantity of each track*/
select t.name,sum(i.quantity) as track_Quantity from track as t
join invoice_line as i on t.track_id=i.track_id
group by t.name
order by track_Quantity desc;
/* sum of quantity from each country */
select i.billing_country , sum(il.quantity) as total_quantity from invoice as i
join invoice_line as il on i.invoice_id=il.invoice_id
group by i.billing_country
order by total_quantity desc;
/* total_revenue from each track*/
SELECT t.name, SUM(i.quantity) AS total_quantity, SUM(t.unit_price * i.quantity) AS revenue FROM track AS t
JOIN invoice_line AS i ON t.track_id = i.track_id
GROUP BY t.name
ORDER BY revenue DESC;
/* total revenue of each country if total is not given */
SELECT i.billing_country, SUM(il.quantity) AS total_quantity, SUM(il.unit_price * il.quantity) AS Revenue FROM invoice AS i
JOIN invoice_line AS il ON i.invoice_id = il.invoice_id
GROUP BY i.billing_country
ORDER BY Revenue DESC;
/*  we can genreate revenue with total */
select sum(total),billing_country from invoice
group by billing_country 
order by sum(total) desc;
/* revenue of each genre */
select g.name,sum(il.quantity) as total_genre_quantity,sum(il.unit_price*il.quantity) as Total_revenue from invoice_line as il
join track as t on t.track_id=il.track_id
join genre as g on g.genre_id=t.genre_id
group by g.name 
order by Total_revenue desc;
/* revenue for each album*/
select * from artist;
SELECT ar.name AS artist_name,SUM(i.quantity) AS total_quantity,SUM(i.quantity * i.unit_price) AS total_revenue
FROM invoice_line AS i
JOIN track ON i.track_id = track.track_id
JOIN album2 ON track.album_id = album2.album_id
JOIN artist AS ar ON album2.artist_id = ar.artist_id
GROUP BY ar.name
ORDER BY total_revenue DESC;
/* avg min by each album */
SELECT a.title,AVG(t.milliseconds) AS average_ms,AVG(t.milliseconds) / 60000 AS average_minutes
FROM track AS t
JOIN album2 AS a ON t.album_id = a.album_id
GROUP BY a.title
order by average_minutes desc;
/* avg min by each genre */
SELECT g.name,AVG(t.milliseconds) AS average_ms,AVG(t.milliseconds) / 60000 AS average_minutes
FROM track AS t
JOIN genre AS g ON t.genre_id = g.genre_id
GROUP BY g.name
order by average_minutes desc;
/* customer who purchase metal genre */
select c.first_name,c.last_name,c.email from customer as c
join invoice as i on c.customer_id=i.customer_id
join invoice_line as il on il.invoice_id=i.invoice_id
where track_id in(
select track_id from track
join genre on genre.genre_id=track.genre_id
where genre.name like 'Metal'
);
/* customer who purchase aerosmith artist track*/
select c.first_name,c.last_name,c.email from customer as c
join invoice as i on c.customer_id=i.customer_id
join invoice_line as il on il.invoice_id=i.invoice_id
where track_id in(
select track_id from track
join album2 as a on a.album_id=track.album_id
join artist as ar on ar.artist_id=a.artist_id
where ar.name like 'Aerosmith'
);



 