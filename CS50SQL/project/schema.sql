CREATE TABLE Manufacturer (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "City" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Country" TEXT NOT NULL,
    "Establishing Year" INTEGER NOT NULL,
    "Rating" NUMERIC NOT NULL CHECK("Rating" >= 0),
    PRIMARY KEY ("ID")
);

CREATE TABLE Ideal_Product (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "Price Per Unit" NUMERIC NOT NULL CHECK("Price Per Unit" > 0),
    "Manufacturer ID" INTEGER NOT NULL,
    "Manufacturing Date" NOT NULL DEFAULT TIMESTAMP,
    "Material Used" TEXT NOT NULL,
    "Weight" NUMERIC NOT NULL CHECK("Weight" > 0),
    "Dimensions" TEXT NOT NULL,
    "Density" NUMERIC NOT NULL CHECK("Density" > 0),
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("Manufacturer ID") REFERENCES "Manufacturer"("ID")
);

CREATE TABLE Delivery_Product (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "Price Per Unit" NUMERIC NOT NULL CHECK("Price Per Unit" > 0),
    "Manufacturer ID" INTEGER NOT NULL,
    "Manufacturing Date" NOT NULL DEFAULT TIMESTAMP,
    "Material Used" TEXT NOT NULL,
    "Weight" NUMERIC NOT NULL CHECK("Weight" > 0),
    "Dimensions" TEXT NOT NULL,
    "Density" NUMERIC NOT NULL CHECK("Density" > 0),
    "Accuracy Results" NUMERIC NOT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("Manufacturer ID") REFERENCES "Manufacturer"("ID")
);

CREATE TABLE Product (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "Price Per Unit" NUMERIC NOT NULL CHECK("Price Per Unit" > 0),
    "Manufacturer ID" INTEGER NOT NULL,
    "Delivered Product" INTEGER NOT NULL UNIQUE,
    "Manufacturing Date" NOT NULL DEFAULT TIMESTAMP,
    "Material Used" TEXT NOT NULL,
    "Weight" NUMERIC NOT NULL CHECK("Weight" > 0),
    "Dimensions" TEXT NOT NULL,
    "Density" NUMERIC NOT NULL CHECK("Density" > 0),
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("Manufacturer ID") REFERENCES "Manufacturer"("ID"),
    FOREIGN KEY ("Delivered Product") REFERENCES "Delivery_Product"("ID")
);

CREATE TABLE Shipping_Company (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "City" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Country" TEXT NOT NULL,
    "Establishing Year" INTEGER NOT NULL,
    "Number of Driver" INTEGER NOT NULL,
    "Rating" INTEGER NOT NULL CHECK("Rating" >= 0),
    PRIMARY KEY ("ID")
);

CREATE TABLE Driver (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "Age" INTEGER NOT NULL CHECK("Age" > 18),
    "Salary" NUMERIC,
    "Driving License Number" TEXT NOT NULL UNIQUE,
    "Working For" INTEGER NOT NULL,
    "Vehicle Type" TEXT NOT NULL,
    "Insurance Policy Number" TEXT NOT NULL UNIQUE,
    "Martial Status" TEXT CHECK("Martial Status" IN ("Yes", "No", "")),
    "City" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Country" TEXT NOT NULL,
    "Rating" NUMERIC NOT NULL CHECK("Rating" >= 0),
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("Working For") REFERENCES "Shipping_Company"("ID")
);

CREATE TABLE Delivery (
    "ID" INTEGER,
    "Product ID" INTEGER NOT NULL,
    "Manufacturer ID" INTEGER NOT NULL,
    "Driver ID" INTEGER NOT NULL,
    "Shipping Company ID" INTEGER NOT NULL,
    "Customer ID" INTEGER NOT NULL,
    "Delivery Departure Date" NUMERIC NOT NULL,
    "Delivery Receiving Date" NUMERIC NOT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("Product ID") REFERENCES "Product"("ID"),
    FOREIGN KEY ("Manufacturer ID") REFERENCES "Manufacturer"("ID"),
    FOREIGN KEY ("Driver ID") REFERENCES "Driver"("ID"),
    FOREIGN KEY ("Shipping Company ID") REFERENCES "Shipping_Company"("ID"),
    FOREIGN KEY ("Customer ID") REFERENCES "Customer"("ID")
);

CREATE TABLE Customer (
    "ID" INTEGER,
    "Name" TEXT NOT NULL,
    "Age" INTEGER CHECK("Age" > 0),
    "City" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Country" TEXT NOT NULL,
    "Purchased Product ID" INTEGER NOT NULL UNIQUE,
    "Delivery Man ID" INTEGER NOT NULL UNIQUE,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("Purchased Product ID") REFERENCES "Product"("ID"),
    FOREIGN KEY ("Delivery Man ID") REFERENCES "Driver"("ID")
);

CREATE INDEX "Manufacturer_Index" ON "Manufacturer"("Name");
CREATE INDEX "Shipper_Index" ON "Shipping_Company"("Name");
CREATE INDEX "Product_Index" ON "Product"("Name");
CREATE INDEX "Customer_Index" ON "Customer"("Name");
CREATE INDEX "Driver_Index" ON "Driver"("Name");
