--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: test1; Type: SCHEMA; Schema: -; Owner: intern
--

CREATE SCHEMA test1;


ALTER SCHEMA test1 OWNER TO intern;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: intern
--

CREATE TABLE public.orders (
    "Row ID" integer NOT NULL,
    "Order ID" character varying(255) NOT NULL,
    "Order Date" date NOT NULL,
    "Ship Date" date NOT NULL,
    "Ship Mode" character varying(50),
    "Customer ID" character varying(50),
    "Customer Name" character varying(255),
    "Segment" character varying(50),
    "Country" character varying(50),
    "City" character varying(50),
    "State" character varying(50),
    "Postal Code" character varying(20),
    "Region" character varying(50),
    "Product ID" character varying(50),
    "Category" character varying(50),
    "Sub-Category" character varying(50),
    "Product Name" character varying(255),
    "Sales" numeric(10,2),
    "Quantity" integer,
    "Discount" numeric(5,2),
    "Profit" numeric(10,2),
    "Row ID;Order ID;Order Date;Ship Date;Ship Mode;Customer ID;Cust" character varying(256)
);


ALTER TABLE public.orders OWNER TO intern;

--
-- Name: orders_Row ID_seq; Type: SEQUENCE; Schema: public; Owner: intern
--

CREATE SEQUENCE public."orders_Row ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."orders_Row ID_seq" OWNER TO intern;

--
-- Name: orders_Row ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: intern
--

ALTER SEQUENCE public."orders_Row ID_seq" OWNED BY public.orders."Row ID";


--
-- Name: people; Type: TABLE; Schema: public; Owner: intern
--

CREATE TABLE public.people (
    "Person" character varying(255) NOT NULL,
    "Region" character varying(50) NOT NULL
);


ALTER TABLE public.people OWNER TO intern;

--
-- Name: returns; Type: TABLE; Schema: public; Owner: intern
--

CREATE TABLE public.returns (
    "Returned" character varying(3),
    "Order ID" character varying(255) NOT NULL,
    CONSTRAINT "returns_Returned_check" CHECK ((("Returned")::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


ALTER TABLE public.returns OWNER TO intern;

--
-- Name: table_name; Type: TABLE; Schema: test1; Owner: intern
--

CREATE TABLE test1.table_name (
    column1 integer
);


ALTER TABLE test1.table_name OWNER TO intern;

--
-- Name: orders Row ID; Type: DEFAULT; Schema: public; Owner: intern
--

ALTER TABLE ONLY public.orders ALTER COLUMN "Row ID" SET DEFAULT nextval('public."orders_Row ID_seq"'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: intern
--

COPY public.orders ("Row ID", "Order ID", "Order Date", "Ship Date", "Ship Mode", "Customer ID", "Customer Name", "Segment", "Country", "City", "State", "Postal Code", "Region", "Product ID", "Category", "Sub-Category", "Product Name", "Sales", "Quantity", "Discount", "Profit", "Row ID;Order ID;Order Date;Ship Date;Ship Mode;Customer ID;Cust") FROM stdin;
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: intern
--

COPY public.people ("Person", "Region") FROM stdin;
\.


--
-- Data for Name: returns; Type: TABLE DATA; Schema: public; Owner: intern
--

COPY public.returns ("Returned", "Order ID") FROM stdin;
\.


--
-- Data for Name: table_name; Type: TABLE DATA; Schema: test1; Owner: intern
--

COPY test1.table_name (column1) FROM stdin;
\.


--
-- Name: orders_Row ID_seq; Type: SEQUENCE SET; Schema: public; Owner: intern
--

SELECT pg_catalog.setval('public."orders_Row ID_seq"', 1, true);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: intern
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("Row ID");


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: intern
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY ("Person");


--
-- Name: returns returns_pkey; Type: CONSTRAINT; Schema: public; Owner: intern
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY ("Order ID");


--
-- PostgreSQL database dump complete
--

