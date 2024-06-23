CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT,
    "founding_year" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "industry" TEXT NOT NULL,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "user_id" INTEGER,
    "user_connection_id" INTEGER,
    "user_school_id" INTEGER,
    "user_school_joining_date" NUMERIC NOT NULL,
    "user_school_end_date" NUMERIC,
    "user_degree" TEXT NOT NULL,
    "user_company_id" INTEGER,
    "user_company_joining_date" NUMERIC NOT NULL,
    "user_company_leaving_date" NUMERIC,
    "user_job_title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_connection_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("user_company_id") REFERENCES "companies"("id")
);
