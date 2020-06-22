Create DATABASE demo_tr;
use demo_tr;

Create table `passports` (
	`passport_id` INT PRIMARY KEY,
    `passport_number` VARCHAR(10) UNIQUE
);

INSERT INTO `passports`
VALUES (101, 'N34FG21B'),
 (102, 'K65LO4R7'),
 (103, 'ZE657QP2');
 
 CREATE TABLE `persons`(
 `person_id` INT PRIMARY KEY AUTO_INCREMENT,
 `first_name` VARCHAR(20),
 `salary` DECIMAL(10,2),
 `passport_id` INT UNIQUE
 );
 
 INSERT INTO `persons`
 VALUES 
 (1, 'Roberto', 43300.00, 102),
 (2, 'Tom', 56100.00, 103),
 (3, 'Yana', 60200.00, 101);
 
 
 ALTER TABLE `persons`
 ADD CONSTRAINT fk_persons_passports
 FOREIGN KEY `persons`(`passport_id`)
 references `passports`(`passport_id`);
 
 
 
 
 
 CREATE TABLE `manufacturers`(
	manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20),
    established_on DATE
 );
 
 INSERT INTO `manufacturers`(`name`,`established_on`)
 VALUES
 ('BMW', '1916-03-06'),
 ('Tesla', '2003-01-01'),
 ('Lada', '1966-05-01');
 
 CREATE TABLE `models`(
  model_id INT PRIMARY KEY,
  `name` VARCHAR(20),
  manufacturer_id INT,
  
  CONSTRAINT fK_models_manufacturers
  FOREIGN KEY (`manufacturer_id`)
  REFERENCES manufacturers(manufacturer_id)
 );
 
 INSERT INTO `models`
 VALUES
 (101,'X1', 1),
 (102,'i6', 1) ,
 (103,'Model S', 2) ,
 (104,'Model X', 2) ,
 (105,'Model 3', 2) ,
 (106,'Nova', 3) ;
 
 
 CREATE TABLE `students` (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30)
 );
 
 CREATE TABLE exams(
	exam_id INT PRIMARY KEY,
    `name` VARCHAR (30)
 );
 
 CREATE TABLE `students_exams`(
	student_id INT,
    exam_id INT,
    
	CONSTRAINT pk_students_exams
    PRIMARY KEY (`student_id`, `exam_id`),
    
    CONSTRAINT fk_students_exams_students
    FOREIGN KEY (student_id)
    references students(student_id),
    
    constraint fk_students_exams_exams
    FOREIGN KEY (exam_id)
    references exams(exam_id)
 );
 
 
 CREATE TABLE teachers(
	teacher_id INT PRIMARY KEY,
    `name` VARCHAR(20),
    manager_id INT,
    
    CONSTRAINT fk_teachers_teachers
    foreign key (manager_id)
    REFERENCES teachers(teacher_id)
 );
 
 CREATE TABLE cities (
	city_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
 );
 
 CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    birthday DATE,
    city_id INT,
    
    CONSTRAINT fk_customers_cities
    FOREIGN KEY customers(city_id)
    references cities(city_id)
 );
 
 CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    
    CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
 );
 
 CREATE TABLE item_types(
	item_type_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
 );
 
 CREATE TABLE items(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    item_type_id INT,
    
    CONSTRAINT fk_items_item_types
    FOREIGN KEY (item_type_id)
    references item_types(item_type_id)
 );
 
 CREATE TABLE order_items (
	order_id INT,
    item_id INT,
    
    CONSTRAINT pk_order_items
    primary key (order_id, item_id),
    
    CONSTRAINT fk_order_items_orders
    foreign key order_items(order_id)
    references orders(order_id),
    
    
    CONSTRAINT fk_order_items_items
    foreign key order_items(item_id)
    references items(item_id)
 );