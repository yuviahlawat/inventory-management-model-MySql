
-- Drop existing tables (safe reset)
DROP TABLE IF EXISTS purchases, inventory, products, suppliers, warehouses;

-- Create products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100),
  category VARCHAR(50),
  reorder_level INT
);

-- Create warehouses table
CREATE TABLE warehouses (
  warehouse_id INT PRIMARY KEY,
  location VARCHAR(100)
);

-- Create suppliers table
CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(100),
  contact_email VARCHAR(100)
);

-- Create inventory table
CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY,
  product_id INT,
  warehouse_id INT,
  quantity INT,
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Create purchases table
CREATE TABLE purchases (
  purchase_id INT PRIMARY KEY,
  product_id INT,
  supplier_id INT,
  purchase_date DATE,
  quantity INT,
  cost_per_unit DECIMAL(10, 2),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Insert sample products
INSERT INTO products VALUES 
(1, 'Laptop', 'Electronics', 10),
(2, 'Keyboard', 'Electronics', 30),
(3, 'Office Chair', 'Furniture', 5),
(4, 'Notebook', 'Stationery', 100);

-- Insert warehouses
INSERT INTO warehouses VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Bangalore');

-- Insert suppliers
INSERT INTO suppliers VALUES
(1, 'TechSource', 'techsource@email.com'),
(2, 'FurniHouse', 'support@furnihouse.com'),
(3, 'OfficeMart', 'contact@officemart.com');

-- Insert inventory
INSERT INTO inventory VALUES
(1, 1, 1, 15),
(2, 2, 1, 20),
(3, 3, 2, 3),
(4, 4, 3, 120);

-- Insert purchase records
INSERT INTO purchases VALUES
(1, 1, 1, '2024-12-01', 10, 55000.00),
(2, 2, 1, '2024-12-10', 50, 1000.00),
(3, 3, 2, '2025-01-15', 5, 4000.00),
(4, 4, 3, '2025-02-20', 150, 30.00);
