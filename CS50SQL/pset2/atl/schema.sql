CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK("age" != 0),
    PRIMARY KEY("id")
);

CREATE TABLE "check-ins" (
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departure_airport_code" TEXT NOT NULL,
    "destination_airport_code" TEXT NOT NULL,
    "expected_departure" NUMERIC NOT NULL,
    "expected_arrival" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
