-- Manufacturer
INSERT INTO Manufacturer (ID, Name, City, State, Country, "Establishing Year", Rating) VALUES
(1, 'Alpha Corp', 'New York', 'NY', 'USA', 1995, 4.5),
(2, 'Beta Ltd', 'Los Angeles', 'CA', 'USA', 2000, 4.2),
(3, 'Gamma Inc', 'Chicago', 'IL', 'USA', 2010, 4.0),
(4, 'Delta LLC', 'San Francisco', 'CA', 'USA', 2005, 4.8),
(5, 'Epsilon Enterprises', 'Seattle', 'WA', 'USA', 2012, 4.1),
(6, 'Zeta Manufacturing', 'Houston', 'TX', 'USA', 2008, 4.3),
(7, 'Eta Products', 'Boston', 'MA', 'USA', 2003, 4.6),
(8, 'Theta Goods', 'Denver', 'CO', 'USA', 2015, 4.4),
(9, 'Iota Supplies', 'Miami', 'FL', 'USA', 2011, 4.7),
(10, 'Kappa Innovations', 'Atlanta', 'GA', 'USA', 2006, 4.2),
(11, 'Lambda Solutions', 'Orlando', 'FL', 'USA', 2014, 4.5),
(12, 'Mu Resources', 'Dallas', 'TX', 'USA', 2001, 4.3),
(13, 'Nu Components', 'Austin', 'TX', 'USA', 2009, 4.6),
(14, 'Xi Technologies', 'Phoenix', 'AZ', 'USA', 2013, 4.4),
(15, 'Omicron Products', 'Philadelphia', 'PA', 'USA', 2007, 4.8);

-- Shipping_Company
INSERT INTO Shipping_Company (ID, Name, City, State, Country, "Establishing Year", "Number of Driver", Rating) VALUES
(1, 'FastEx', 'New York', 'NY', 'USA', 1980, 100, 4.7),
(2, 'Speedy Delivery', 'Los Angeles', 'CA', 'USA', 1975, 80, 4.5),
(3, 'QuickShip', 'Chicago', 'IL', 'USA', 1988, 120, 4.6),
(4, 'ShipItNow', 'San Francisco', 'CA', 'USA', 1992, 90, 4.8),
(5, 'RapidTransport', 'Seattle', 'WA', 'USA', 2000, 110, 4.4),
(6, 'SwiftCouriers', 'Dallas', 'TX', 'USA', 1995, 130, 4.9),
(7, 'DeliveryPros', 'Gotham', 'NY', 'USA', 1965, 70, 4.3),
(8, 'ParcelService', 'Orlando', 'FL', 'USA', 1970, 95, 4.2),
(9, 'ExpressDelivery', 'Cleveland', 'OH', 'USA', 1983, 85, 4.1),
(10, 'FastTrack', 'Phoenix', 'AZ', 'USA', 1990, 105, 4.7),
(11, 'QuickDispatch', 'Houston', 'TX', 'USA', 1985, 115, 4.5),
(12, 'EfficientDelivery', 'Newark', 'NJ', 'USA', 1982, 125, 4.6),
(13, 'TimelyTransport', 'Metropolis', 'NY', 'USA', 1968, 140, 4.8),
(14, 'OnTimeShipping', 'Denver', 'CO', 'USA', 1986, 75, 4.4),
(15, 'ReliableCouriers', 'Miami', 'FL', 'USA', 2001, 150, 4.9);

-- Driver
INSERT INTO Driver (ID, Name, Age, Salary, "Driving License Number", "Working For", "Vehicle Type", "Insurance Policy Number", "Martial Status", City, State, Country, Rating) VALUES
(1, 'John Doe', 30, 50000, 'DL12345', 1, 'Truck', 'IP12345', 'Yes', 'New York', 'NY', 'USA', 4.5),
(2, 'Jane Smith', 35, 55000, 'DL67890', 2, 'Van', 'IP67890', 'No', 'Los Angeles', 'CA', 'USA', 4.7),
(3, 'Mike Johnson', 40, 60000, 'DL11121', 3, 'Truck', 'IP11121', 'Yes', 'Chicago', 'IL', 'USA', 4.6),
(4, 'Emily Davis', 28, 52000, 'DL31415', 4, 'Van', 'IP31415', 'No', 'San Francisco', 'CA', 'USA', 4.8),
(5, 'Chris Brown', 32, 53000, 'DL16171', 5, 'Truck', 'IP16171', 'Yes', 'Seattle', 'WA', 'USA', 4.4),
(6, 'Patricia Wilson', 37, 58000, 'DL27182', 6, 'Van', 'IP27182', 'No', 'Dallas', 'TX', 'USA', 4.9),
(7, 'Robert Miller', 45, 62000, 'DL31416', 7, 'Truck', 'IP31416', 'Yes', 'Gotham', 'NY', 'USA', 4.3),
(8, 'Linda Anderson', 29, 54000, 'DL41592', 8, 'Van', 'IP41592', 'No', 'Orlando', 'FL', 'USA', 4.2),
(9, 'James Thomas', 31, 51000, 'DL53589', 9, 'Truck', 'IP53589', 'Yes', 'Cleveland', 'OH', 'USA', 4.1),
(10, 'Barbara Martinez', 33, 56000, 'DL65359', 10, 'Van', 'IP65359', 'No', 'Phoenix', 'AZ', 'USA', 4.7),
(11, 'William Rodriguez', 38, 59000, 'DL79323', 11, 'Truck', 'IP79323', 'Yes', 'Houston', 'TX', 'USA', 4.5),
(12, 'Elizabeth Garcia', 36, 57000, 'DL83832', 12, 'Van', 'IP83832', 'No', 'Newark', 'NJ', 'USA', 4.6),
(13, 'Thomas Harris', 34, 60000, 'DL95493', 13, 'Truck', 'IP95493', 'Yes', 'Metropolis', 'NY', 'USA', 4.8),
(14, 'Susan Clark', 30, 55000, 'DL97932', 14, 'Van', 'IP97932', '', 'Denver', 'CO', 'USA', 4.4),
(15, 'Steven Lewis', 41, 63000, 'DL10581', 15, 'Truck', 'IP10581', 'Yes', 'Miami', 'FL', 'USA', 4.9);

-- Ideal_Product
INSERT INTO Ideal_Product (ID, Name, "Price Per Unit", "Manufacturer ID", "Manufacturing Date", "Material Used", "Weight", "Dimensions", "Density") VALUES
(1, 'Widget A', 10.00, 1, '2024-01-01', 'Plastic', 0.5, '10x5x2', 0.1),
(2, 'Gadget B', 20.00, 2, '2024-01-02', 'Metal', 1.0, '15x7x3', 0.2),
(3, 'Doodad C', 15.00, 3, '2024-01-03', 'Rubber', 0.7, '12x6x2.5', 0.15),
(4, 'Thingamajig D', 25.00, 4, '2024-01-04', 'Wood', 1.5, '20x10x5', 0.25),
(5, 'Whatchamacallit E', 30.00, 5, '2024-01-05', 'Glass', 2.0, '25x12x6', 0.3),
(6, 'Gizmo F', 40.00, 6, '2024-01-06', 'Plastic', 0.8, '18x9x4', 0.12),
(7, 'Contraption G', 50.00, 7, '2024-01-07', 'Metal', 1.2, '22x11x5', 0.22),
(8, 'Apparatus H', 60.00, 8, '2024-01-08', 'Rubber', 0.9, '20x10x4.5', 0.18),
(9, 'Device I', 70.00, 9, '2024-01-09', 'Wood', 1.8, '30x15x7', 0.28),
(10, 'Instrument J', 80.00, 10, '2024-01-10', 'Glass', 2.5, '35x18x8', 0.35),
(11, 'Machine K', 90.00, 11, '2024-01-11', 'Plastic', 1.0, '28x14x6', 0.14),
(12, 'Mechanism L', 100.00, 12, '2024-01-12', 'Metal', 2.2, '32x16x7', 0.32),
(13, 'Tool M', 110.00, 13, '2024-01-13', 'Rubber', 1.3, '34x17x7.5', 0.19),
(14, 'Utensil N', 120.00, 14, '2024-01-14', 'Wood', 2.8, '38x19x8.5', 0.38),
(15, 'Appliance O', 130.00, 15, '2024-01-15', 'Glass', 3.0, '40x20x9', 0.4);

-- Delivery_Product
INSERT INTO Delivery_Product (ID, Name, "Price Per Unit", "Manufacturer ID", "Manufacturing Date", "Material Used", "Weight", "Dimensions", "Density", "Accuracy Results") VALUES
(1, 'Widget A', 10.00, 1, '2024-01-01', 'Plastic', 0.5, '10x5x2', 0.1, 0.98),
(2, 'Gadget B', 20.00, 2, '2024-01-02', 'Metal', 1.0, '15x7x3', 0.2, 0.77),
(3, 'Doodad C', 15.00, 3, '2024-01-03', 'Rubber', 0.7, '12x6x2.5', 0.15, 0.81),
(4, 'Thingamajig D', 25.00, 4, '2024-01-04', 'Wood', 1.5, '20x10x5', 0.25, 0.90),
(5, 'Whatchamacallit E', 30.00, 5, '2024-01-05', 'Glass', 2.0, '25x12x6', 0.3, 0.91),
(6, 'Gizmo F', 40.00, 6, '2024-01-06', 'Plastic', 0.8, '18x9x4', 0.12, 0.98),
(7, 'Contraption G', 50.00, 7, '2024-01-07', 'Metal', 1.2, '22x11x5', 0.22, 1.00),
(8, 'Apparatus H', 60.00, 8, '2024-01-08', 'Rubber', 0.9, '20x10x4.5', 0.18, 0.28),
(9, 'Device I', 70.00, 9, '2024-01-09', 'Wood', 1.8, '30x15x7', 0.28, 0.50),
(10, 'Instrument J', 80.00, 10, '2024-01-10', 'Glass', 2.5, '35x18x8', 0.35, 0.50),
(11, 'Machine K', 90.00, 11, '2024-01-11', 'Plastic', 1.0, '28x14x6', 0.14, 0.81),
(12, 'Mechanism L', 100.00, 12, '2024-01-12', 'Metal', 2.2, '32x16x7', 0.32, 0.81),
(13, 'Tool M', 110.00, 13, '2024-01-13', 'Rubber', 1.3, '34x17x7.5', 0.19, 0.91),
(14, 'Utensil N', 120.00, 14, '2024-01-14', 'Wood', 2.8, '38x19x8.5', 0.38, 0.33),
(15, 'Appliance O', 130.00, 15, '2024-01-15', 'Glass', 3.0, '40x20x9', 0.4, 0.45);

-- Product
INSERT INTO Product (ID, Name, "Price Per Unit", "Manufacturer ID", "Delivered Product", "Manufacturing Date", "Material Used", "Weight", "Dimensions", "Density") VALUES
(1, 'Widget A', 10.00, 1, 1, '2024-01-01', 'Plastic', 0.5, '10x5x2', 0.1),
(2, 'Gadget B', 20.00, 2, 2, '2024-01-02', 'Metal', 1.0, '15x7x3', 0.2),
(3, 'Doodad C', 15.00, 3, 3, '2024-01-03', 'Rubber', 0.7, '12x6x2.5', 0.15),
(4, 'Thingamajig D', 25.00, 4, 4, '2024-01-04', 'Wood', 1.5, '20x10x5', 0.25),
(5, 'Whatchamacallit E', 30.00, 5, 5, '2024-01-05', 'Glass', 2.0, '25x12x6', 0.3),
(6, 'Gizmo F', 40.00, 6, 6, '2024-01-06', 'Plastic', 0.8, '18x9x4', 0.12),
(7, 'Contraption G', 50.00, 7, 7, '2024-01-07', 'Metal', 1.2, '22x11x5', 0.22),
(8, 'Apparatus H', 60.00, 8, 8, '2024-01-08', 'Rubber', 0.9, '20x10x4.5', 0.18),
(9, 'Device I', 70.00, 9, 9, '2024-01-09', 'Wood', 1.8, '30x15x7', 0.28),
(10, 'Instrument J', 80.00, 10, 10, '2024-01-10', 'Glass', 2.5, '35x18x8', 0.35),
(11, 'Machine K', 90.00, 11, 11, '2024-01-11', 'Plastic', 1.0, '28x14x6', 0.14),
(12, 'Mechanism L', 100.00, 12, 12, '2024-01-12', 'Metal', 2.2, '32x16x7', 0.32),
(13, 'Tool M', 110.00, 13, 13, '2024-01-13', 'Rubber', 1.3, '34x17x7.5', 0.19),
(14, 'Utensil N', 120.00, 14, 14, '2024-01-14', 'Wood', 2.8, '38x19x8.5', 0.38),
(15, 'Appliance O', 130.00, 15, 15, '2024-01-15', 'Glass', 3.0, '40x20x9', 0.4);

-- Customer
INSERT INTO Customer (ID, Name, Age, City, State, Country, "Purchased Product ID", "Delivery Man ID") VALUES
(1, 'Alice Walker', 25, 'New York', 'NY', 'USA', 1, 1),
(2, 'Bob White', 30, 'Los Angeles', 'CA', 'USA', 2, 2),
(3, 'Carol Green', 35, 'Chicago', 'IL', 'USA', 3, 3),
(4, 'Dave Black', 40, 'San Francisco', 'CA', 'USA', 4, 4),
(5, 'Eve Brown', 45, 'Seattle', 'WA', 'USA', 5, 5),
(6, 'Frank Gray', 50, 'Dallas', 'TX', 'USA', 6, 6),
(7, 'Grace Blue', 28, 'Gotham', 'NY', 'USA', 7, 7),
(8, 'Hank Red', 32, 'Orlando', 'FL', 'USA', 8, 8),
(9, 'Ivy Pink', 36, 'Cleveland', 'OH', 'USA', 9, 9),
(10, 'Jack Purple', 38, 'Phoenix', 'AZ', 'USA', 10, 10),
(11, 'Kara Yellow', 42, 'Houston', 'TX', 'USA', 11, 11),
(12, 'Leo Orange', 29, 'Newark', 'NJ', 'USA', 12, 12),
(13, 'Mia Indigo', 34, 'Metropolis', 'NY', 'USA', 13, 13),
(14, 'Nina Violet', 37, 'Denver', 'CO', 'USA', 14, 14),
(15, 'Oscar Magenta', 41, 'Miami', 'FL', 'USA', 15, 15);

INSERT INTO Delivery (ID, "Product ID", "Manufacturer ID", "Driver ID", "Shipping Company ID", "Customer ID", "Delivery Departure Date", "Delivery Receiving Date") VALUES
(1, 1, 1, 1, 1, 1, '2024-02-01', '2024-02-05'),
(2, 2, 2, 2, 2, 2, '2024-02-02', '2024-02-06'),
(3, 3, 3, 3, 3, 3, '2024-02-03', '2024-02-07'),
(4, 4, 4, 4, 4, 4, '2024-02-04', '2024-02-08'),
(5, 5, 5, 5, 5, 5, '2024-02-05', '2024-02-09'),
(6, 6, 6, 6, 6, 6, '2024-02-06', '2024-02-10'),
(7, 7, 7, 7, 7, 7, '2024-02-07', '2024-02-11'),
(8, 8, 8, 8, 8, 8, '2024-02-08', '2024-02-12'),
(9, 9, 9, 9, 9, 9, '2024-02-09', '2024-02-13'),
(10, 10, 10, 10, 10, 10, '2024-02-10', '2024-02-14'),
(11, 11, 11, 11, 11, 11, '2024-02-11', '2024-02-15'),
(12, 12, 12, 12, 12, 12, '2024-02-12', '2024-02-16'),
(13, 13, 13, 13, 13, 13, '2024-02-13', '2024-02-17'),
(14, 14, 14, 14, 14, 14, '2024-02-14', '2024-02-18'),
(15, 15, 15, 15, 15, 15, '2024-02-15', '2024-02-19');

SELECT * FROM Customer
WHERE 'State' = 'NY';

UPDATE "Customer"
SET "State" = (
    SELECT "State"
    FROM "Customer"
    WHERE "State" = 'WA'
)
WHERE "State" = (
    SELECT "State"
    FROM "Customer"
    WHERE "State" = 'NY'
);

DELETE FROM "Customer"
WHERE 'State' = 'WA';
