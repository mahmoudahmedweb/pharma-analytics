-- --------------------------
-- Table structure for Pharmacy
-- --------------------------
CREATE TABLE `Pharmacy` (
    `pharmacy_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`pharmacy_id`)
);

-- --------------------------
-- Table structure for Customer
-- --------------------------
CREATE TABLE `Customer` (
    `customer_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `dob` DATE NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`customer_id`)
);

-- --------------------------
-- Table structure for Medicine
-- --------------------------
CREATE TABLE `Medicine` (
    `medicine_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `brand` VARCHAR(100) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    `stock_quantity` INT NOT NULL,
    `expiry_date` DATE NOT NULL,
    PRIMARY KEY (`medicine_id`)
);

-- --------------------------
-- Table structure for Employee
-- --------------------------
CREATE TABLE `Employee` (
    `employee_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `role` VARCHAR(50) NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`employee_id`)
);

-- --------------------------
-- Table structure for Sales
-- --------------------------
CREATE TABLE `Sales` (
    `sale_id` INT NOT NULL AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    `pharmacy_id` INT NOT NULL,
    `sale_date` DATE NOT NULL,
    `total_amount` DECIMAL(10,2) NOT NULL,
    `employee_id` INT NOT NULL,
    PRIMARY KEY (`sale_id`),
    CONSTRAINT `fk_Sales_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`),
    CONSTRAINT `fk_Sales_pharmacy_id` FOREIGN KEY (`pharmacy_id`) REFERENCES `Pharmacy`(`pharmacy_id`),
    CONSTRAINT `fk_Sales_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`)
);

-- --------------------------
-- Table structure for Sale_Items
-- --------------------------
CREATE TABLE `Sale_Items` (
    `sale_item_id` INT NOT NULL AUTO_INCREMENT,
    `sale_id` INT NOT NULL,
    `medicine_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`sale_item_id`),
    CONSTRAINT `fk_Sale_Items_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `Sales`(`sale_id`),
    CONSTRAINT `fk_Sale_Items_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `Medicine`(`medicine_id`)
);

-- --------------------------
-- Table structure for Supplier
-- --------------------------
CREATE TABLE `Supplier` (
    `supplier_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `contact_person` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`supplier_id`)
);

-- --------------------------
-- Table structure for Medicine_Supplier
-- --------------------------
CREATE TABLE `Medicine_Supplier` (
    `medicine_id` INT NOT NULL,
    `supplier_id` INT NOT NULL,
    `supply_price` DECIMAL(10,2) NOT NULL,
    `delivery_date` DATE NOT NULL,
    PRIMARY KEY (`medicine_id`, `supplier_id`),
    CONSTRAINT `fk_Medicine_Supplier_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `Medicine`(`medicine_id`),
    CONSTRAINT `fk_Medicine_Supplier_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier`(`supplier_id`)
);
