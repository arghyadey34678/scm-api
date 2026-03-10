-- Insert 10 orders with varying statuses
-- Orders with status 2 (3 orders)
INSERT INTO scm.orders VALUES (1000000001, TO_DATE('2026-03-01', 'YYYY-MM-DD'), 2, TO_DATE('2026-03-05', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 299.99, '6777');
INSERT INTO scm.orders VALUES (1000000002, TO_DATE('2026-03-02', 'YYYY-MM-DD'), 2, TO_DATE('2026-03-06', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 459.50, '6777');
INSERT INTO scm.orders VALUES (1000000003, TO_DATE('2026-03-03', 'YYYY-MM-DD'), 2, TO_DATE('2026-03-07', 'YYYY-MM-DD'), TO_DATE('2026-03-12', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 125.75, '6777');

-- Orders with status 3 (3 orders)
INSERT INTO scm.orders VALUES (1000000004, TO_DATE('2026-03-01', 'YYYY-MM-DD'), 3, TO_DATE('2026-03-04', 'YYYY-MM-DD'), TO_DATE('2026-03-08', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 850.00, '6777');
INSERT INTO scm.orders VALUES (1000000005, TO_DATE('2026-03-02', 'YYYY-MM-DD'), 3, TO_DATE('2026-03-05', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 675.25, '6777');
INSERT INTO scm.orders VALUES (1000000006, TO_DATE('2026-03-03', 'YYYY-MM-DD'), 3, TO_DATE('2026-03-06', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 320.40, '6777');

-- Orders with status 4 (2 orders)
INSERT INTO scm.orders VALUES (1000000007, TO_DATE('2026-02-28', 'YYYY-MM-DD'), 4, TO_DATE('2026-03-03', 'YYYY-MM-DD'), TO_DATE('2026-03-07', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 1250.00, '6777');
INSERT INTO scm.orders VALUES (1000000008, TO_DATE('2026-02-29', 'YYYY-MM-DD'), 4, TO_DATE('2026-03-04', 'YYYY-MM-DD'), TO_DATE('2026-03-08', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 445.80, '6777');

-- Orders with status 5 (2 orders)
INSERT INTO scm.orders VALUES (1000000009, TO_DATE('2026-02-25', 'YYYY-MM-DD'), 5, TO_DATE('2026-02-28', 'YYYY-MM-DD'), TO_DATE('2026-03-04', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 899.99, '6777');
INSERT INTO scm.orders VALUES (1000000010, TO_DATE('2026-02-26', 'YYYY-MM-DD'), 5, TO_DATE('2026-03-01', 'YYYY-MM-DD'), TO_DATE('2026-03-05', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 560.00, '6777');

-- Insert order lines for order 1000000001 (status 2, 3 items)
INSERT INTO scm.order_line VALUES (1000000001, TO_DATE('2026-03-01', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 123456, 'Wireless Mouse', 29.99, 2, 2);
INSERT INTO scm.order_line VALUES (1000000001, TO_DATE('2026-03-01', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 7891234567, 'USB-C Cable 6ft', 15.99, 5, 2);
INSERT INTO scm.order_line VALUES (1000000001, TO_DATE('2026-03-01', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 456789, 'Laptop Stand', 49.99, 1, 2);

-- Insert order lines for order 1000000002 (status 2, 2 items)
INSERT INTO scm.order_line VALUES (1000000002, TO_DATE('2026-03-02', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 9876543210, 'Mechanical Keyboard', 129.99, 1, 2);
INSERT INTO scm.order_line VALUES (1000000002, TO_DATE('2026-03-02', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 234567, 'Mouse Pad XL', 24.99, 3, 2);

-- Insert order lines for order 1000000003 (status 2, 3 items)
INSERT INTO scm.order_line VALUES (1000000003, TO_DATE('2026-03-03', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 345678, 'HDMI Cable 10ft', 18.99, 2, 2);
INSERT INTO scm.order_line VALUES (1000000003, TO_DATE('2026-03-03', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 5678901234, 'Webcam HD 1080p', 79.99, 1, 2);
INSERT INTO scm.order_line VALUES (1000000003, TO_DATE('2026-03-03', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 567890, 'Phone Charger', 12.99, 2, 2);

-- Insert order lines for order 1000000004 (status 3, 2 items)
INSERT INTO scm.order_line VALUES (1000000004, TO_DATE('2026-03-01', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 6789012345, 'Gaming Monitor 27in', 399.99, 2, 3);
INSERT INTO scm.order_line VALUES (1000000004, TO_DATE('2026-03-01', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 678901, 'Display Port Cable', 25.00, 2, 3);

-- Insert order lines for order 1000000005 (status 3, 3 items)
INSERT INTO scm.order_line VALUES (1000000005, TO_DATE('2026-03-02', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 789012, 'Ergonomic Chair', 299.99, 1, 3);
INSERT INTO scm.order_line VALUES (1000000005, TO_DATE('2026-03-02', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 7890123456, 'Desk Lamp LED', 45.50, 3, 3);
INSERT INTO scm.order_line VALUES (1000000005, TO_DATE('2026-03-02', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 890123, 'Desk Organizer', 22.99, 4, 3);

-- Insert order lines for order 1000000006 (status 3, 2 items)
INSERT INTO scm.order_line VALUES (1000000006, TO_DATE('2026-03-03', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 8901234567, 'Bluetooth Speaker', 89.99, 2, 3);
INSERT INTO scm.order_line VALUES (1000000006, TO_DATE('2026-03-03', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 901234, 'Phone Case', 19.99, 7, 3);

-- Insert order lines for order 1000000007 (status 4, 3 items)
INSERT INTO scm.order_line VALUES (1000000007, TO_DATE('2026-02-28', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 9012345678, 'Laptop 15in i7', 999.99, 1, 4);
INSERT INTO scm.order_line VALUES (1000000007, TO_DATE('2026-02-28', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 102345, 'Laptop Bag', 49.99, 1, 4);
INSERT INTO scm.order_line VALUES (1000000007, TO_DATE('2026-02-28', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 1234567890, 'Wireless Headphones', 149.99, 1, 4);

-- Insert order lines for order 1000000008 (status 4, 2 items)
INSERT INTO scm.order_line VALUES (1000000008, TO_DATE('2026-02-29', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 213456, 'Graphics Tablet', 199.99, 2, 4);
INSERT INTO scm.order_line VALUES (1000000008, TO_DATE('2026-02-29', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 2345678901, 'Stylus Pen', 22.99, 2, 4);

-- Insert order lines for order 1000000009 (status 5, 3 items)
INSERT INTO scm.order_line VALUES (1000000009, TO_DATE('2026-02-25', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 3456789012, 'Smart Watch', 299.99, 2, 5);
INSERT INTO scm.order_line VALUES (1000000009, TO_DATE('2026-02-25', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 324567, 'Watch Band', 29.99, 5, 5);
INSERT INTO scm.order_line VALUES (1000000009, TO_DATE('2026-02-25', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 4567890123, 'Screen Protector', 9.99, 10, 5);

-- Insert order lines for order 1000000010 (status 5, 2 items)
INSERT INTO scm.order_line VALUES (1000000010, TO_DATE('2026-02-26', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 435678, 'Portable SSD 1TB', 149.99, 2, 5);
INSERT INTO scm.order_line VALUES (1000000010, TO_DATE('2026-02-26', 'YYYY-MM-DD'), SYSTIMESTAMP, SYSTIMESTAMP, 'admin', 'admin', 5678901234, 'USB Hub 7-Port', 34.99, 4, 5);

COMMIT;
EXIT;
