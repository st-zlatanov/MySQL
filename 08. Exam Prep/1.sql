create schema ruk_database;

Create table branches (
id INT(11) PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE employees (
id INT(11) PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
started_on DATE NOT NULL,
branch_id INT(11) NOT NULL,
constraint fk_employees_branches
FOREIGN KEY (branch_id) REFERENCES branches(id)
);

Create table clients (
id INT(11) PRIMARY KEY AUTO_INCREMENT,
`full_name` VARCHAR(50)  NOT NULL,
age INT(11) NOT NULL
);


create table employees_clients(
employee_id INT(11),
client_id INT (11),
CONSTRAINT fk_ec_clients
FOREIGN KEY (client_id) references clients(id),
CONSTRAINT fk_ec_employees
FOREIGN KEY (employee_id) references employees(id)
);

Create table bank_accounts (
id INT(11) PRIMARY KEY AUTO_INCREMENT,
account_number VARCHAR(10) NOT NULL,
balance DECIMAL (10,2) NOT NULL,
client_id INT(11) NOT NULL unique,
CONSTRAINT fk_ba_clients
FOREIGN KEY (client_id) references clients(id)
);


CREATE TABLE `cards` (
  `id` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `card_number` VARCHAR(19) NOT NULL,
  `card_status` VARCHAR(7) NOT NULL,
  `bank_account_id` INT(11) NOT NULL,
  CONSTRAINT `fk_cards_ba`
    FOREIGN KEY (`bank_account_id`)
    REFERENCES `bank_accounts` (`id`)
 );