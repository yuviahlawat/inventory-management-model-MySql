
-- 1. Products Below Reorder Level
SELECT 
  p.name AS product,
  i.quantity,
  p.reorder_level,
  w.location AS warehouse
FROM 
  inventory i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE 
  i.quantity < p.reorder_level;

-- 2. Total Inventory by Warehouse
SELECT 
  w.location AS warehouse,
  SUM(i.quantity) AS total_quantity
FROM 
  inventory i
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
GROUP BY 
  w.location;

-- 3. Top Suppliers by Quantity Supplied
SELECT 
  s.name AS supplier,
  SUM(pu.quantity) AS total_supplied
FROM 
  purchases pu
JOIN suppliers s ON pu.supplier_id = s.supplier_id
GROUP BY 
  s.name
ORDER BY 
  total_supplied DESC;

-- 4. Inventory Value by Product
SELECT 
  pr.name AS product,
  SUM(i.quantity * pu.cost_per_unit) AS total_value
FROM 
  inventory i
JOIN products pr ON i.product_id = pr.product_id
JOIN purchases pu ON pr.product_id = pu.product_id
GROUP BY 
  pr.name;
