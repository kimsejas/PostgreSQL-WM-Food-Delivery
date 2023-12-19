# SQL-WM-Food-Delivery
A robust food delivery service database for a group project in Database Systems William &amp; Mary


# Demo
Click [here](https://www.crunchydata.com/developers/playground?sql=https://raw.githubusercontent.com/kimsejas/PostgreSQL-WM-Food-Delivery/main/food_delivery_schema%2Bdata%2Bqueries.sql) to run sql files and view tables

<img width="1705" alt="Screenshot 2023-12-18 at 8 37 51 PM" src="https://github.com/kimsejas/PostgreSQL-WM-Food-Delivery/assets/109777428/7c39ca35-7e9b-47d1-8cfc-7c3c53f6d931">

# Database Design Process

We began brainstorming by thinking of entities such as students, drivers, and restaurants. Then we developed relationships to connect entities such as student orders, where studets can have many orders but a single order can only be attributed to one student. Below is a screenshot of the brainstorming notes. 

<img width="599" alt="Screenshot 2023-12-18 at 8 57 39 PM" src="https://github.com/kimsejas/PostgreSQL-WM-Food-Delivery/assets/109777428/aeb50cb1-a7a0-4228-8460-c73a17f00ecc">


After many iterations the final Entity-Relationship diagram was made. 
<img width="1145" alt="Screenshot 2023-12-18 at 8 59 47 PM" src="https://github.com/kimsejas/PostgreSQL-WM-Food-Delivery/assets/109777428/507f0a5b-6967-47be-9c21-550c666f085c">


To convert the diagram into a schema (to create our database) we reduced redundancy and improved data integrity through the BCNF normalization process. Lastly, we thought of any constraints 
(e.g. a food item cannot have a price below 0) for our database. 
