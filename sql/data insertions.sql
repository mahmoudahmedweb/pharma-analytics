-- Pharmacy
INSERT INTO Pharmacy (pharmacy_id, name, address, phone_number, email) VALUES
(1, 'HealthPlus Pharmacy', '123 Main St', '555-1234567', 'contact@healthplus.com'),
(2, 'CityCare Pharmacy', '45 Oak Avenue', '555-9876543', 'info@citycare.com'),
(3, 'Wellness Hub Pharmacy', '98 Pine Street', '555-4567890', 'hello@wellnesshub.com'),
(4, 'MediTrust Pharmacy', '210 Maple Ave', '555-5432198', 'support@meditrust.com'),
(5, 'CarePoint Pharmacy', '67 Hill Road', '555-6785432', 'care@carepoint.com');

-- Customer
INSERT INTO Customer (customer_id, first_name, last_name, dob, phone_number, email, address) VALUES
(1, 'John', 'Doe', '1985-03-15', '555-1112222', 'john.doe@email.com', '12 Park Lane'),
(2, 'Sarah', 'Smith', '1990-06-21', '555-3334444', 'sarah.smith@email.com', '78 Elm Street'),
(3, 'Michael', 'Johnson', '1978-11-02', '555-5556666', 'michael.j@email.com', '5 King Street'),
(4, 'Emma', 'Williams', '1995-01-10', '555-7778888', 'emma.w@email.com', '22 Green Avenue'),
(5, 'David', 'Brown', '1982-07-25', '555-9990000', 'david.b@email.com', '90 Oak Lane'),
(6, 'Olivia', 'Taylor', '1988-09-30', '555-1212121', 'olivia.t@email.com', '14 River Street'),
(7, 'James', 'Anderson', '1993-05-14', '555-3434343', 'james.a@email.com', '56 Willow Drive'),
(8, 'Sophia', 'Thomas', '1987-02-19', '555-5656565', 'sophia.t@email.com', '33 Birch Road');

-- Medicine
INSERT INTO Medicine (medicine_id, name, brand, type, price, stock_quantity, expiry_date) VALUES
(1, 'Amoxicillin', 'MedPharma', 'Capsule', 5.50, 200, '2026-01-15'),
(2, 'Paracetamol', 'HealthCare', 'Tablet', 2.00, 500, '2027-05-30'),
(3, 'Cough Syrup', 'MediRelief', 'Syrup', 4.75, 150, '2025-12-01'),
(4, 'Ibuprofen', 'PainAway', 'Tablet', 3.20, 300, '2026-08-20'),
(5, 'Vitamin C', 'NutriBoost', 'Tablet', 1.50, 400, '2027-03-10'),
(6, 'Antihistamine', 'AllerFree', 'Tablet', 2.80, 250, '2025-11-15'),
(7, 'Insulin', 'GlucoCare', 'Injection', 25.00, 100, '2026-05-05'),
(8, 'Antacid', 'DigestRelief', 'Tablet', 1.80, 350, '2025-09-25');

-- Employee
INSERT INTO Employee (employee_id, first_name, last_name, role, phone_number, email) VALUES
(1, 'Emily', 'Brown', 'Pharmacist', '555-5551111', 'emily.brown@pharmacy.com'),
(2, 'Daniel', 'Lee', 'Cashier', '555-5552222', 'daniel.lee@pharmacy.com'),
(3, 'Grace', 'Miller', 'Pharmacist', '555-5553333', 'grace.miller@pharmacy.com'),
(4, 'Liam', 'Davis', 'Manager', '555-5554444', 'liam.davis@pharmacy.com'),
(5, 'Ava', 'Wilson', 'Technician', '555-5555555', 'ava.wilson@pharmacy.com');

-- Sales
INSERT INTO Sales (sale_id, customer_id, pharmacy_id, sale_date, total_amount, employee_id) VALUES
(1, 1, 1, '2025-08-10', 7.50, 1),
(2, 2, 2, '2025-08-12', 4.75, 2),
(3, 3, 3, '2025-08-13', 25.00, 3),
(4, 4, 4, '2025-08-14', 6.00, 4),
(5, 5, 5, '2025-08-15', 12.50, 5),
(6, 6, 1, '2025-08-15', 3.20, 1),
(7, 7, 2, '2025-08-16', 1.50, 2),
(8, 8, 3, '2025-08-16', 27.80, 3),
(9, 1, 4, '2025-08-17', 2.80, 4),
(10, 2, 5, '2025-08-17', 9.30, 5);

-- Sale_Items
INSERT INTO Sale_Items (sale_item_id, sale_id, medicine_id, quantity, price) VALUES
(1, 1, 1, 1, 5.50),
(2, 1, 2, 1, 2.00),
(3, 2, 3, 1, 4.75),
(4, 3, 7, 1, 25.00),
(5, 4, 4, 2, 3.00),
(6, 5, 5, 5, 1.50),
(7, 6, 4, 1, 3.20),
(8, 7, 5, 1, 1.50),
(9, 8, 7, 1, 25.00),
(10, 8, 6, 1, 2.80),
(11, 9, 6, 1, 2.80),
(12, 10, 4, 2, 3.20),
(13, 10, 8, 1, 1.80),
(14, 3, 2, 3, 2.00),
(15, 4, 6, 1, 2.80),
(16, 5, 1, 1, 5.50),
(17, 6, 8, 2, 1.80),
(18, 7, 2, 1, 2.00),
(19, 9, 5, 3, 1.50),
(20, 10, 3, 1, 4.75);

-- Supplier
INSERT INTO Supplier (supplier_id, name, contact_person, phone_number, email, address) VALUES
(1, 'Global MedSupply', 'Alice Green', '555-7778888', 'sales@globalmed.com', '50 Market Street'),
(2, 'Pharma Direct', 'Bob Taylor', '555-9990000', 'contact@pharmadirect.com', '85 River Road'),
(3, 'MediWorld Distributors', 'Carol White', '555-2223333', 'info@mediworld.com', '34 Bay Avenue'),
(4, 'HealthLine Suppliers', 'David King', '555-4445555', 'orders@healthline.com', '72 Cherry Street');

-- Medicine_Supplier
INSERT INTO Medicine_Supplier (medicine_id, supplier_id, supply_price, delivery_date) VALUES
(1, 1, 3.20, '2025-07-01'),
(2, 1, 1.20, '2025-07-05'),
(3, 2, 2.80, '2025-07-03'),
(4, 3, 2.00, '2025-06-20'),
(5, 3, 0.90, '2025-06-25'),
(6, 4, 1.50, '2025-06-28'),
(7, 2, 18.00, '2025-07-10'),
(8, 4, 1.00, '2025-07-15'),
(1, 3, 3.10, '2025-07-18'),
(2, 4, 1.15, '2025-07-20');
