
#Work Showing proficiency with SQL language, creating
#and editing a table with information


CREATE TABLE public.customers
(
   	 "ID" bigserial NOT NULL,
    	"Name" character varying NOT NULL,
   	 email character varying NOT NULL,
   	 PRIMARY KEY ("ID")
);

ALTER TABLE IF EXISTS public.customers
  	  OWNER to postgres;





ADT Table
Code for ADT Customers table:
CREATE TABLE public.adt_customers
(
	"Name" character varying NOT NULL,
	"Email" character varying NOT NULL,
	"City" character varying NOT NULL,
	"Has Cameras" character varying NOT NULL,
	"Has Motion Sensors" character varying NOT NULL,
	"Has ADT Sign" character varying NOT NULL,
	"ID" bigint NOT NULL,
	PRIMARY KEY ("ID")
);

ALTER TABLE IF EXISTS public.adt_customers
	OWNER to postgres;

#Add columns for door and window contacts:

ALTER TABLE IF EXISTS public.adt_customers
	ADD COLUMN “Has Door Sensors” character varying, NOT NULL

ALTER TABLE IF EXISTS public.adt_customers
	ADD COLUMN “Has Window Sensors” character varying, NOT NULL

#Need primary key field to edit tables in PostgreSQL

#Code I typed to add columns:

ALTER TABLE public.adt_customers
	ADD COLUMN "Door Contacts" character varying;

ALTER TABLE public.adt_customers
	ADD COLUMN "Window Contacts" character varying;

ALTER TABLE public.adt_customers	
	ADD COLUMN "Motion Sensors" character varying;

ALTER TABLE public.adt_customers
	ADD COLUMN "Cameras" character varying;

ALTER TABLE public.adt_customers	
	ADD COLUMN "Glassbreaks" character varying;

ALTER TABLE public.adt_customers	
	ADD COLUMN "Door Locks" character varying;

ALTER TABLE public.adt_customers	
	ADD COLUMN "ADT Sign" character varying;



#Select Wildcard

#Select statement w/ where and wildcard:

SELECT "Name" FROM public.adt_customers
WHERE "Name" like 'J%'

#Select statement w/email and wildcard:

SELECT "Email" FROM public.adt_customers
WHERE "Email" like '%yahoo%'



#LIMIT

SELECT * FROM public.adt_customers
LIMIT 5

SELECT * FROM public.adt_customers
LIMIT 5 OFFSET 5

SELECT * FROM public.adt_customers
OFFSET 5

#Tablespaces - where your data is held
#Schema - container for tables


#Foreign Key

#Constraints —> Foreign Key
#Reference another table and primary key of that table. 
#Any action such as DROP will affect both tables if shared ID is referenced

ALTER TABLE IF EXISTS public.customers
    ADD CONSTRAINT id FOREIGN KEY ("ID")
    REFERENCES public.customer_orders ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_id
    ON public.customers("ID");




#Inner Join

SELECT "Name", *
FROM public.customers
JOIN public.customer_orders ON public.customers.customer_id = public.customer_orders.customer_id

#This pulls the name from customers table and everything from 
#customer_orders table and joins them matching them up by the ID primary key

SELECT "Name", "Cookies", "Pies", "Muffins", "Donuts"
FROM public.customers
JOIN public.customer_orders ON public.customers.customer_id = public.customer_orders.customer_id

#This only pulls the items ordered from 2nd table

#Remember the first column name with the SELECT statement should be from the 1st table, or left table. Of course the FROM statement should reflect that as well

#Join Where

SELECT "Name", "Cookies"
FROM public.customers, public.customer_orders
where public.customers.customer_id = public.customer_orders.customer_id

#Import/Export

#Had to set binary path
#C —> Program Files —> PostgreSQL —> 14 —> bin

