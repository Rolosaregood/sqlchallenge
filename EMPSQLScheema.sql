-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sP1qA4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
ALTER DATABASE employee_db SET datestyle TO "ISO, MDY";

CREATE TABLE "departments" (
    "dept_no" VARCHAR (10)   NOT NULL,
    "dept_name" VARCHAR (255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR (10)  NOT NULL,
    "title" VARCHAR (255)  NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INTEGER  NOT NULL,
    "emp_title_id" VARCHAR (25)  NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR (255)   NOT NULL,
    "last_name" VARCHAR (255)  NOT NULL,
    "sex" VARCHAR (1)  NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "department_manager" (
    "dept_no" VARCHAR (10)  NOT NULL,
    "emp_no" INTEGER   NOT NULL
);

CREATE TABLE "department_employee" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR (10)  NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


