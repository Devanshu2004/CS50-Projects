CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "price_per_unit" INTEGER NOT NULL CHECK("price_per_unit" != 0),
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "is_gluten" TEXT NOT NULL,
    "price_per_donut" NUMERIC NOT NULL CHECK("price_per_donut" != 0),
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "order_number" INTEGER NOT NULL,
    "donut_ordered" INTEGER,
    "customer_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "previous_orders" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("previous_orders") REFERENCES "orders"("id")
);
