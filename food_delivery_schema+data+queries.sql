-- create statements 
CREATE TABLE students(
  student_id numeric(9),
  name varchar(30) NOT NULL,
  balance numeric(8,2) NOT NULL CHECK (balance >= 0) DEFAULT 0,
  PRIMARY KEY (student_id));

CREATE TABLE drivers(
  driver_id numeric(9),
  name varchar(30) NOT NULL,
  PRIMARY KEY (driver_id));

CREATE TABLE establishments(
  establishment_name varchar(50),
  establishment_address varchar(50),
  PRIMARY KEY (establishment_name, establishment_address));

CREATE TABLE orders(
  order_id serial,
  student_id numeric(9),
  driver_id numeric(9), 
  establishment_name varchar(50),
  establishment_address varchar(50),
  drop_off_address varchar(50) NOT NULL,
  status varchar(20),
  CHECK (status IN ('Preparing', 'On the way', 'Delivered')),
  PRIMARY KEY (order_id, establishment_name, establishment_address),
  FOREIGN KEY (student_id) references students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (driver_id) references drivers(driver_id) ON DELETE CASCADE,
  FOREIGN KEY (establishment_name, establishment_address) references establishments(establishment_name, establishment_address) ON DELETE CASCADE);

CREATE TABLE items(
  item_id serial, 
  name varchar(30), 
  establishment_address varchar(50),
  establishment_name varchar(50) , 
  cost_per_item numeric(8,2) CHECK (cost_per_item > 0),
  gluten_free numeric(1),
  vegan numeric(1),
  common_allergen numeric(1),
  CHECK (gluten_free in (1,0)), 
  CHECK (vegan in (1,0)),
  CHECK (common_allergen in (1,0)),
  PRIMARY KEY(item_id, establishment_name, establishment_address),
  FOREIGN KEY (establishment_name, establishment_address) references establishments(establishment_name, establishment_address) ON DELETE CASCADE);

CREATE TABLE ordered_items (
  item_id int,
  order_id int,
  establishment_name varchar(50),
  establishment_address varchar(50),
  PRIMARY KEY (item_id, order_id, establishment_name, establishment_address),
  FOREIGN KEY (item_id, establishment_name, establishment_address) REFERENCES items(item_id, establishment_name, establishment_address) ON DELETE CASCADE,
  FOREIGN KEY (order_id, establishment_name, establishment_address) REFERENCES orders(order_id, establishment_name, establishment_address) ON DELETE CASCADE
); 

-- ESTABLISHMENT
INSERT INTO establishments VALUES(
  'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185');

INSERT INTO establishments VALUES(
  'Caf', '651 Ukrop Way Williamsburg, VA 23188');

INSERT INTO establishments VALUES(
  'Tribe Market', '651 Ukrop Way Williamsburg, VA 23188');

INSERT INTO establishments VALUES(
  'Sadler', '200 Stadium Drive Williamsburg, VA 23185');

-- ITEMS
-- Chick-Fil-A (1, 1-4)
INSERT INTO items VALUES(DEFAULT, '8ct Nuggets', '249 Richmond Road Williamsburg, VA 23185', 'Chick-Fil-A', 8.99, 0,0,0); 

INSERT INTO items VALUES(DEFAULT, 'Milkshake', '249 Richmond Road Williamsburg, VA 23185', 'Chick-Fil-A', 4.65, 0,0,0);

INSERT INTO items VALUES (DEFAULT, 'Chicken Sandwich', '249 Richmond Road Williamsburg, VA 23185', 'Chick-Fil-A', 4.75, 0,0,0);

INSERT INTO items VALUES (DEFAULT, 'Salad', '249 Richmond Road Williamsburg, VA 23185', 'Chick-Fil-A', 9.00, 1,1,1);

-- Caf (2, 5-6)
INSERT INTO items VALUES (DEFAULT, 'Mashed Potatoes', '651 Ukrop Way Williamsburg, VA 23188', 'Caf', 2.40, 0,0,0);

INSERT INTO items VALUES (DEFAULT, 'Salad', '651 Ukrop Way Williamsburg, VA 23188', 'Caf', 4.50, 1,1,1);

-- Tribe Market (3, 7-8)
INSERT INTO items VALUES (DEFAULT, 'Chips', '651 Ukrop Way Williamsburg, VA 23188', 'Tribe Market', 4.50, 0,0,0);

INSERT INTO items VALUES (DEFAULT, 'Pocky', '651 Ukrop Way Williamsburg, VA 23188', 'Tribe Market', 2.50, 0,1,0);

-- Sadler (4, 9-10)
INSERT INTO items VALUES (DEFAULT, 'Pepperoni Pizza', '200 Stadium Drive Williamsburg, VA 23185', 'Sadler', 2.40, 0,0,0);

INSERT INTO items VALUES (DEFAULT, 'Peas', '200 Stadium Drive Williamsburg, VA 23185', 'Sadler', 1.50, 1,1,1);


-- DRIVERS
INSERT INTO drivers VALUES(
  931000011, 'Hiba Galani');
INSERT INTO drivers VALUES(
  931000012, 'Lake Bradford');
INSERT INTO drivers VALUES(
  931000013, 'Morgan Hughes');
INSERT INTO drivers VALUES(
  931000014, 'Stephany Cardenas');
INSERT INTO drivers VALUES(
  931000015, 'Ronaldo Lopez');
INSERT INTO drivers VALUES(
  931000016, 'Kayla Aviles');
INSERT INTO drivers VALUES(
  931000017, 'Trung Nyguen');
INSERT INTO drivers VALUES(
  931000018, 'Gelila Yimtatu');
INSERT INTO drivers VALUES(
  931000019, 'Justin Crescent');
INSERT INTO drivers VALUES(
  931000020, 'Ashley Cardenas');

-- STUDENTS
INSERT INTO students VALUES(
  931000000, 'Pippa Scroggins', 100.00);
INSERT INTO students VALUES(
  931000001, 'Stacey Lu', 100.00);
INSERT INTO students VALUES(
  931000002, 'Kimberly Sejas', 100.00);
INSERT INTO students VALUES(
  931000003, 'Jessica Smith', 55.00);
INSERT INTO students VALUES(
  931000004, 'Porter Jones', 32.00);
INSERT INTO students VALUES(
  931000005, 'Caroline Brown', 150.00);
INSERT INTO students VALUES(
  931000006, 'Christian Lowe', 300.00);
INSERT INTO students VALUES(
  931000007, 'Hannah Brown', 260.00);
INSERT INTO students VALUES(
  931000008, 'Olivia White', 45.00);

-- ORDERS
INSERT INTO orders VALUES(DEFAULT, 931000000, 931000011, 'Caf', '651 Ukrop Way Williamsburg, VA 23188', '234 Rolfe Road Williamsburg, VA 23185', 'Preparing');
INSERT INTO orders VALUES(DEFAULT, 931000003, 931000013, 'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185', '100 Richmond Road Williamsburg, VA 23185', 'Preparing');
INSERT INTO orders VALUES(DEFAULT, 931000005, 931000013, 'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185', '111 Richmond Road Williamsburg, VA 23185', 'On the way');
INSERT INTO orders VALUES(DEFAULT, 931000007, 931000015, 'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185', '610 Jamestown Road Williamsburg, VA 23185', 'On the way');
INSERT INTO orders VALUES(DEFAULT, 931000006, 931000011, 'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185', '100 Richmond Road Williamsburg, VA 23185', 'Delivered');
INSERT INTO orders VALUES(DEFAULT, 931000008, 931000016, 'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185', '111 Richmond Road Williamsburg, VA 23185', 'Delivered');

INSERT INTO orders VALUES(DEFAULT, 931000008, 931000011, 'Tribe Market', '651 Ukrop Way Williamsburg, VA 23188', '111 Richmond Road Williamsburg, VA 23185', 'Preparing');

INSERT INTO orders VALUES(DEFAULT, 931000006, 931000020, 'Sadler', '200 Stadium Drive Williamsburg, VA 23185', '400 Norfolk Street Williamsburg, VA 23185', 'Preparing');

-- ORDERED ITEMS
  -- Order 1, Salad
INSERT INTO ordered_items VALUES(6,1, 'Caf', '651 Ukrop Way Williamsburg, VA 23188');
  
  -- Order 2, 8ct Nuggets + Salad
INSERT INTO ordered_items VALUES(1,2,'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185');
INSERT INTO ordered_items VALUES(4,2,'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185');

  -- Order 3, Milkshake + Chicken Sandwich
INSERT INTO ordered_items VALUES(2,3,'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185');
INSERT INTO ordered_items VALUES(3,3,'Chick-Fil-A', '249 Richmond Road Williamsburg, VA 23185');

  -- Order 7, Pocky + Chips 
INSERT INTO ordered_items VALUES(8,7,'Tribe Market', '651 Ukrop Way Williamsburg, VA 23188');
INSERT INTO ordered_items VALUES(7,7,'Tribe Market', '651 Ukrop Way Williamsburg, VA 23188');

  -- Order 8, Pepperoni Pizza
INSERT INTO ordered_items VALUES(9,8,'Sadler', '200 Stadium Drive Williamsburg, VA 23185');


-- Queries projecting all tables 
select * from students;
select * from drivers;
select * from establishments;
select * from items;
select * from orders;
select * from ordered_items;