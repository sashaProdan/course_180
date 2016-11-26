--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_pkey;
ALTER TABLE public.expenses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.expenses_id_seq;
DROP TABLE public.expenses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: Sasha
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO "Sasha";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Sasha
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: Sasha
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    memo text NOT NULL,
    created_on date NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE expenses OWNER TO "Sasha";

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: Sasha
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO "Sasha";

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Sasha
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Sasha
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: Sasha
--

INSERT INTO expenses VALUES (4, 14.56, 'Pencils', '2016-11-26');
INSERT INTO expenses VALUES (5, 3.29, 'Coffee', '2016-11-26');
INSERT INTO expenses VALUES (6, 49.99, 'Text Editor', '2016-11-26');
INSERT INTO expenses VALUES (7, 3.59, 'Books', '2016-11-26');
INSERT INTO expenses VALUES (8, 30.78, 'More Coffee', '2016-11-26');
INSERT INTO expenses VALUES (9, 30.78, 'Gas for Karen''s Car', '2016-11-26');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Sasha
--

SELECT pg_catalog.setval('expenses_id_seq', 9, true);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: Sasha
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Sasha
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Sasha";
GRANT ALL ON SCHEMA public TO "Sasha";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

