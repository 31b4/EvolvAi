--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO admin_user;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.profiles (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.profiles OWNER TO admin_user;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profiles_id_seq OWNER TO admin_user;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO admin_user;

--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-12-27 14:13:46.033549	2024-12-27 14:13:46.033553
schema_sha1	c53736d9de4ffadded05e3ed7aed6b06ebf9f539	2024-12-27 14:13:46.045171	2024-12-27 14:13:46.045173
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.profiles (id, name, email, password_digest, created_at, updated_at) FROM stdin;
1	John Doe	john@example.com	$2a$12$u8nI6VcNfsHuLEZfaz5LieAsz0gg1apEjRQoOVsmbxqsP3d6LUXyy	2024-12-28 12:19:48.197461	2024-12-28 12:19:48.197461
2	sadasda	jankailorinc1@gmail.com	$2a$12$NMXQjfIvwllSTjPYDXD0kOLb37IP2OpK8ALvev1IKb4As9qAOEfs2	2024-12-28 12:35:12.248813	2024-12-28 12:35:12.248813
3	adsasdasdasd	jankai.lool@lollo.com	$2a$12$r0F7hwZ3on4tD3HVMUOTwOpmoDgwomrF8xQRdhp7jCzmaBwTxBxu6	2024-12-28 12:35:38.289102	2024-12-28 12:35:38.289102
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.schema_migrations (version) FROM stdin;
20241227135144
20241228115354
\.


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.profiles_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

