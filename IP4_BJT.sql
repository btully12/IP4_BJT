# File Name: IP4 
## Author: Brett Tully
### SQL 
#### Class: DS-160-01
##### Semester: Spring '22


USE henry;


##1 First and Last name of the Author
SELECT firstName, lastName
FROM author; 



##2 Title of the books and the type of book
select title, TYPE 
FROM book;


##3 Listing each publisher code once
select DISTINCT publisherCode 
from publisher;



##4 Title and price of each book with discounted price included
select title, price as 'original price', ROUND((price-(price*.25)),2) as 'discounted price'
from book
LIMIT 5;

##5 Title and price of book that is higher than $20 
SELECT title,price 
FROM book 
WHERE price >= 20;

##6 Name of publishers that are in New York"
SELECT publisherName as "Publishers from NY"
FROM publisher 
WHERE city = 'New York' 
;


##7 Name of publishers that are not in New York"
SELECT publisherName as "Publishers not from NY"
FROM publisher 
WHERE city!= 'New York';


##8 Book code and onhand amounts between 2-4 at all branch
SELECT bookCode,onHand,branchNum
FROM inventory
WHERE onHand BETWEEN 2 and 4;


##9 Count of number of books published by Penguin USA 
SELECT count(title) as 'Penguin Books'
FROM publisher,book
WHERE publisher.publisherName = 'Penguin USA';

##10 Number of books whose prices is $20 or lower
SELECT count(title) as '$20 or lower'
FROM book 
WHERE price<= 20;



##11 Columns from book and publishers joined
SELECT * 
from book as b
join publisher as p where b.publisherCode = p.publisherCode;

##12 Same as above, but with ON clause 
SELECT *
FROM book as b
JOIN publisher as p on b.publisherCode = p.publisherCode;


##13 Title and city using JOIN
select title, city 
from book as b
join publisher as p on b.publisherCode=p.publisherCode
order by title;




##14 Title and amount onhand for each book
select title as 'book name',branchNum,onHand
from book as b
join inventory as i on b.bookCode=i.bookCode
order by title; 


##15 Title and total inventory in descending order
select title,sum(onHand) as 'Inventory'
from book as b
join inventory as i on b.bookCode=i.bookCode
group by b.title
order by Inventory desc
LIMIT 2; 



##16 First and Last name and title for all paperback books
select firstName as 'first', lastName as 'last', title
from author as a
join wrote as w on w.authorNum = a.authorNum
join book as b on b.bookCode = w.bookCode 
where b.paperback = 'Y'
order by last, title
;



##bonus Title and Last name
select title as 'Book Name', lastName
from author as a
join wrote as w on w.authorNum = a.authorNum
join book as b on b.bookCode = w.bookCode 
order by lastName;



