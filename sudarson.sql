#SUDARSON N


#1

SELECT customer.cust_name AS "Customer", customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer WHERE orders.customer_id=customer.custemor_id
AND orders.salesman_id=salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;

# 2
SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders 
WHERE salesman_id IN( SELECT salesman_id FROM salesman WHERE commision = (SELECT MAX(commision) FROM salesman));


#3

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE city='nagpur');
    
	
# 4
SELECT ord_date, SUM(purch_amt), SUM(purch_amt)*.15 FROM orders 
GROUP BY ord_date 
ORDER BY ord_date ASC;


# 5

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders );


#6

select * from orders ORDER BY purch_amt desc limit 4,1;


# 7

# Entities : An entity is a real-world object. 
# A university database can have entities such as Student, Lecturer, Course, Project, etc. In a DBMS, these entities are the tables.
# The attributes describe the entities. The student entity can have attributes such as id and name. 
# The course entity can have attributes such as course_code and course_name. The Lecturer can have attributes such as id, name and speciality.

# Relationships : A relationship signifies an association among the entities. There are three types of relationships that can exist between the entities. They are the binary, recursive and the ternary relationship.
# When one instance of an entity is associated with one instance of another type of entity, it is called one to one (1:1) relationship
# When one instance of an entity is associated with many instances of another type of entity, it is called one to many (1: m) relationship.
# When many instances of an entity are associated with many instances of another type of entity, it is called many to many (m : n) relationship.
# when an entity is related to itself, it is called a recursive relationship.

 #8

Select Customer_id , ba.Account_Number,
Case when ifnull(Balance_amount,0) = 0 then   Transaction_amount else Balance_amount end  as Balance_amount
from bank_account_details ba inner join bank_account_transaction bat on ba.Account_Number = bat.Account_Number and Account_type = "Credit Card";


#9 

Select ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from bank_account_details ba inner join bank_account_transaction bat on ba.Account_Number = bat.Account_Number
And 
( Transaction_Date between "2020-03-01" and "2020-04-30");
 

#10

Select ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from bank_account_details ba  Left join bank_account_transaction bat on ba.Account_Number = bat.Account_Number
And NOT 
(Transaction_Date between "2020-03-01" and "2020-03-31");

