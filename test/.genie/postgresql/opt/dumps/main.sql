--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_bigm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_bigm WITH SCHEMA public;


--
-- Name: EXTENSION pg_bigm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_bigm IS 'text similarity measurement and index searching based on bigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: t1; Type: TABLE; Schema: public; Owner: sample_user
--

CREATE TABLE t1 (
    seq integer NOT NULL,
    name text,
    age integer
);


ALTER TABLE t1 OWNER TO sample_user;

--
-- Name: t1_seq_seq; Type: SEQUENCE; Schema: public; Owner: sample_user
--

CREATE SEQUENCE t1_seq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t1_seq_seq OWNER TO sample_user;

--
-- Name: t1_seq_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sample_user
--

ALTER SEQUENCE t1_seq_seq OWNED BY t1.seq;


--
-- Name: t1 seq; Type: DEFAULT; Schema: public; Owner: sample_user
--

ALTER TABLE ONLY t1 ALTER COLUMN seq SET DEFAULT nextval('t1_seq_seq'::regclass);


--
-- Data for Name: t1; Type: TABLE DATA; Schema: public; Owner: sample_user
--

COPY t1 (seq, name, age) FROM stdin;
2	山田花子	88
1	山田太郎	99
\.


--
-- Name: t1_seq_seq; Type: SEQUENCE SET; Schema: public; Owner: sample_user
--

SELECT pg_catalog.setval('t1_seq_seq', 2, true);


--
-- Name: t1_name_idx; Type: INDEX; Schema: public; Owner: sample_user
--

CREATE INDEX t1_name_idx ON t1 USING gin (name gin_bigm_ops);


--
-- PostgreSQL database dump complete
--

