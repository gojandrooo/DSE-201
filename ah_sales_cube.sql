--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-23 01:37:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- TOC entry 3347 (class 1262 OID 13754)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 3347
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 5 (class 2615 OID 16394)
-- Name: SalesCube; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "SalesCube";


ALTER SCHEMA "SalesCube" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16416)
-- Name: dim_category; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".dim_category (
    category_id integer NOT NULL,
    category_name character varying NOT NULL,
    category_description character varying NOT NULL
);


ALTER TABLE "SalesCube".dim_category OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16395)
-- Name: dim_customer; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".dim_customer (
    customer_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    state_id integer
);


ALTER TABLE "SalesCube".dim_customer OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16435)
-- Name: dim_discount; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".dim_discount (
    discount_id integer NOT NULL,
    discount_name character varying NOT NULL,
    discount_description character varying NOT NULL,
    discount_percent numrange NOT NULL
);


ALTER TABLE "SalesCube".dim_discount OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16409)
-- Name: dim_product; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".dim_product (
    product_id integer NOT NULL,
    product_name character varying NOT NULL,
    list_price numeric NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE "SalesCube".dim_product OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16402)
-- Name: dim_state; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".dim_state (
    state_id integer NOT NULL,
    state_name character varying NOT NULL
);


ALTER TABLE "SalesCube".dim_state OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16430)
-- Name: fact_order_item; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".fact_order_item (
    order_item_id integer NOT NULL,
    product_id integer NOT NULL,
    product_quantity integer NOT NULL,
    discount_id integer,
    order_id integer NOT NULL,
    product_sales_total numeric
);


ALTER TABLE "SalesCube".fact_order_item OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16423)
-- Name: fact_order_summary; Type: TABLE; Schema: SalesCube; Owner: postgres
--

CREATE TABLE "SalesCube".fact_order_summary (
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    order_sales_total numeric NOT NULL
);


ALTER TABLE "SalesCube".fact_order_summary OWNER TO postgres;

--
-- TOC entry 3196 (class 2606 OID 16422)
-- Name: dim_category dim_category_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".dim_category
    ADD CONSTRAINT dim_category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3190 (class 2606 OID 16401)
-- Name: dim_customer dim_customer_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3202 (class 2606 OID 16441)
-- Name: dim_discount dim_discount_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".dim_discount
    ADD CONSTRAINT dim_discount_pkey PRIMARY KEY (discount_id);


--
-- TOC entry 3194 (class 2606 OID 16415)
-- Name: dim_product dim_product_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".dim_product
    ADD CONSTRAINT dim_product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3192 (class 2606 OID 16408)
-- Name: dim_state dim_state_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".dim_state
    ADD CONSTRAINT dim_state_pkey PRIMARY KEY (state_id);


--
-- TOC entry 3200 (class 2606 OID 16434)
-- Name: fact_order_item fact_order_item_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".fact_order_item
    ADD CONSTRAINT fact_order_item_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 3198 (class 2606 OID 16429)
-- Name: fact_order_summary fact_order_pkey; Type: CONSTRAINT; Schema: SalesCube; Owner: postgres
--

ALTER TABLE ONLY "SalesCube".fact_order_summary
    ADD CONSTRAINT fact_order_pkey PRIMARY KEY (order_id);


-- Completed on 2022-01-23 01:37:33

--
-- PostgreSQL database dump complete
--

