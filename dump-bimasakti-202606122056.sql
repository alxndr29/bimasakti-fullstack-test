--
-- PostgreSQL database dump
--

\restrict lw72oyeZZeGezS6frTy9OXhsr64bhNc47b7xCTuRtLlDLiLFckVM0jYyyebwXj3

-- Dumped from database version 17.6 (Homebrew)
-- Dumped by pg_dump version 17.6 (Homebrew)

-- Started on 2026-06-12 20:56:59 WIB

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 4582541)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint
);


--
-- TOC entry 220 (class 1259 OID 4582540)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 220
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 218 (class 1259 OID 4582527)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4582526)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 219 (class 1259 OID 4582533)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint
);


--
-- TOC entry 223 (class 1259 OID 4582553)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint
);


--
-- TOC entry 222 (class 1259 OID 4582552)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 222
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 229 (class 1259 OID 4582599)
-- Name: providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.providers (
    id bigint NOT NULL,
    provider character varying(255) NOT NULL,
    fee_percent numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 228 (class 1259 OID 4582598)
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 228
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- TOC entry 225 (class 1259 OID 4582565)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    id_hash uuid NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint
);


--
-- TOC entry 224 (class 1259 OID 4582564)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 224
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 231 (class 1259 OID 4582609)
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    provider_id bigint NOT NULL,
    trx_id character varying(255) NOT NULL,
    product character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    amount numeric(15,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 230 (class 1259 OID 4582608)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 230
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 227 (class 1259 OID 4582577)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    id_hash uuid NOT NULL,
    role_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    phone character varying(20),
    password character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    userable_type character varying(255),
    userable_id bigint,
    is_active boolean DEFAULT true NOT NULL,
    remember_token character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint
);


--
-- TOC entry 226 (class 1259 OID 4582576)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3690 (class 2604 OID 4582544)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3689 (class 2604 OID 4582530)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3692 (class 2604 OID 4582556)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3697 (class 2604 OID 4582602)
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- TOC entry 3693 (class 2604 OID 4582568)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3699 (class 2604 OID 4582612)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 4582580)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3886 (class 0 OID 4582541)
-- Dependencies: 221
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at, created_by, updated_by, deleted_by) FROM stdin;
\.


--
-- TOC entry 3883 (class 0 OID 4582527)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_100000_create_password_resets_table	1
2	2019_08_19_000000_create_failed_jobs_table	1
3	2019_12_14_000001_create_personal_access_tokens_table	1
4	2023_02_16_145130_create_roles_table	1
5	2023_02_17_031807_create_users_table	1
6	2026_06_12_000000_create_providers_table	1
7	2026_06_12_000001_create_transactions_table	1
\.


--
-- TOC entry 3884 (class 0 OID 4582533)
-- Dependencies: 219
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_resets (email, token, created_at, created_by, updated_by, deleted_by) FROM stdin;
\.


--
-- TOC entry 3888 (class 0 OID 4582553)
-- Dependencies: 223
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at, created_by, updated_by, deleted_by) FROM stdin;
1	App\\Models\\User	2	auth_token	b5ee4f35ffdd271573bfd77f61f5ca86905cd041cbc6087273411653b137b7fc	["*"]	2026-06-12 20:55:50	2026-06-13 20:55:02	2026-06-12 20:55:02	2026-06-12 20:55:50	\N	\N	\N
\.


--
-- TOC entry 3894 (class 0 OID 4582599)
-- Dependencies: 229
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.providers (id, provider, fee_percent, created_at, updated_at) FROM stdin;
1	TELKOMSEL	1.50	2026-06-12 20:55:06	2026-06-12 20:55:06
2	XL	2.00	2026-06-12 20:55:06	2026-06-12 20:55:06
3	INDOSAT	1.80	2026-06-12 20:55:06	2026-06-12 20:55:06
4	TRI	2.20	2026-06-12 20:55:06	2026-06-12 20:55:06
5	SMARTFREN	1.70	2026-06-12 20:55:06	2026-06-12 20:55:06
\.


--
-- TOC entry 3890 (class 0 OID 4582565)
-- Dependencies: 225
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, id_hash, name, slug, is_active, created_at, updated_at, deleted_at, created_by, updated_by, deleted_by) FROM stdin;
1	a2017b62-2b00-487f-afa6-3c3ba7eb1c7f	Developer	developer	t	2026-06-12 20:54:46	2026-06-12 20:54:46	\N	\N	\N	\N
2	a2017b62-3149-471b-a9a3-236b2d71d3f1	Administrator	admin	t	2026-06-12 20:54:46	2026-06-12 20:54:46	\N	\N	\N	\N
3	a2017b62-31c7-4b5d-ae1d-1916602506e4	User	user	t	2026-06-12 20:54:46	2026-06-12 20:54:46	\N	\N	\N	\N
\.


--
-- TOC entry 3896 (class 0 OID 4582609)
-- Dependencies: 231
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transactions (id, provider_id, trx_id, product, status, amount, created_at, updated_at) FROM stdin;
1	2	TRX202606121	Data 1GB	PENDING	10000.00	2026-06-12 00:55:06	2026-06-12 20:55:06
2	2	TRX202606122	Pulsa 25K	FAILED	10000.00	2026-06-12 16:55:06	2026-06-12 20:55:06
3	2	TRX202606123	Pulsa 5K	PENDING	10000.00	2026-06-12 18:55:06	2026-06-12 20:55:06
4	5	TRX202606124	Pulsa 25K	SUCCESS	100000.00	2026-06-12 08:55:06	2026-06-12 20:55:06
5	4	TRX202606125	Pulsa 10K	SUCCESS	50000.00	2026-06-12 14:55:06	2026-06-12 20:55:06
6	2	TRX202606126	Pulsa 10K	FAILED	10000.00	2026-06-12 01:55:06	2026-06-12 20:55:06
7	5	TRX202606127	Pulsa 5K	PENDING	100000.00	2026-06-12 12:55:06	2026-06-12 20:55:06
8	3	TRX202606128	Pulsa 50K	FAILED	25000.00	2026-06-12 04:55:06	2026-06-12 20:55:06
9	5	TRX202606129	Pulsa 10K	PENDING	100000.00	2026-06-12 09:55:06	2026-06-12 20:55:06
10	1	TRX2026061210	Pulsa 10K	FAILED	5000.00	2026-06-12 16:55:06	2026-06-12 20:55:06
11	3	TRX2026061211	Data 1GB	FAILED	25000.00	2026-06-12 04:55:06	2026-06-12 20:55:06
12	4	TRX2026061212	Data 10GB	SUCCESS	50000.00	2026-06-12 14:55:06	2026-06-12 20:55:06
13	3	TRX2026061213	Pulsa 50K	PENDING	25000.00	2026-06-12 15:55:06	2026-06-12 20:55:06
14	2	TRX2026061214	Pulsa 50K	SUCCESS	10000.00	2026-06-12 14:55:06	2026-06-12 20:55:06
15	2	TRX2026061215	Data 5GB	SUCCESS	10000.00	2026-06-12 20:55:06	2026-06-12 20:55:06
16	5	TRX2026061216	Pulsa 10K	SUCCESS	100000.00	2026-06-12 08:55:06	2026-06-12 20:55:06
17	2	TRX2026061217	Pulsa 25K	SUCCESS	10000.00	2026-06-12 14:55:06	2026-06-12 20:55:06
18	3	TRX2026061218	Data 5GB	SUCCESS	25000.00	2026-06-12 20:55:06	2026-06-12 20:55:06
19	1	TRX2026061219	Pulsa 25K	SUCCESS	5000.00	2026-06-12 08:55:06	2026-06-12 20:55:06
20	1	TRX2026061220	Pulsa 50K	SUCCESS	5000.00	2026-06-12 11:55:06	2026-06-12 20:55:06
21	4	TRX2026061221	Pulsa 10K	FAILED	50000.00	2026-06-12 10:55:06	2026-06-12 20:55:06
22	2	TRX2026061222	Data 5GB	PENDING	10000.00	2026-06-12 15:55:06	2026-06-12 20:55:06
23	1	TRX2026061223	Data 1GB	PENDING	5000.00	2026-06-12 03:55:06	2026-06-12 20:55:06
24	2	TRX2026061224	Pulsa 50K	PENDING	10000.00	2026-06-11 21:55:06	2026-06-12 20:55:06
25	4	TRX2026061225	Pulsa 10K	FAILED	50000.00	2026-06-12 10:55:06	2026-06-12 20:55:06
26	3	TRX2026061226	Data 1GB	PENDING	25000.00	2026-06-12 06:55:06	2026-06-12 20:55:06
27	4	TRX2026061227	Data 5GB	SUCCESS	50000.00	2026-06-12 05:55:06	2026-06-12 20:55:06
28	3	TRX2026061228	Data 1GB	PENDING	25000.00	2026-06-12 03:55:06	2026-06-12 20:55:06
29	4	TRX2026061229	Pulsa 25K	SUCCESS	50000.00	2026-06-12 14:55:06	2026-06-12 20:55:06
30	3	TRX2026061230	Pulsa 10K	FAILED	25000.00	2026-06-12 10:55:06	2026-06-12 20:55:06
31	5	TRX2026061231	Pulsa 10K	PENDING	100000.00	2026-06-12 18:55:06	2026-06-12 20:55:06
32	2	TRX2026061232	Data 10GB	PENDING	10000.00	2026-06-12 09:55:06	2026-06-12 20:55:06
33	4	TRX2026061233	Pulsa 10K	SUCCESS	50000.00	2026-06-12 17:55:06	2026-06-12 20:55:06
34	4	TRX2026061234	Data 1GB	SUCCESS	50000.00	2026-06-12 11:55:06	2026-06-12 20:55:06
35	3	TRX2026061235	Pulsa 10K	PENDING	25000.00	2026-06-12 00:55:06	2026-06-12 20:55:06
36	3	TRX2026061236	Data 5GB	FAILED	25000.00	2026-06-11 22:55:06	2026-06-12 20:55:06
37	3	TRX2026061237	Pulsa 50K	FAILED	25000.00	2026-06-12 07:55:06	2026-06-12 20:55:06
38	5	TRX2026061238	Pulsa 5K	SUCCESS	100000.00	2026-06-12 05:55:06	2026-06-12 20:55:06
39	2	TRX2026061239	Data 5GB	PENDING	10000.00	2026-06-12 15:55:06	2026-06-12 20:55:06
40	1	TRX2026061240	Pulsa 5K	SUCCESS	5000.00	2026-06-12 20:55:06	2026-06-12 20:55:06
41	1	TRX2026061241	Pulsa 50K	PENDING	5000.00	2026-06-11 21:55:06	2026-06-12 20:55:06
42	2	TRX2026061242	Data 10GB	SUCCESS	10000.00	2026-06-11 23:55:06	2026-06-12 20:55:06
43	2	TRX2026061243	Data 10GB	SUCCESS	10000.00	2026-06-12 08:55:06	2026-06-12 20:55:06
44	4	TRX2026061244	Data 10GB	FAILED	50000.00	2026-06-11 22:55:06	2026-06-12 20:55:06
45	1	TRX2026061245	Data 5GB	PENDING	5000.00	2026-06-12 00:55:06	2026-06-12 20:55:06
46	4	TRX2026061246	Data 1GB	PENDING	50000.00	2026-06-12 18:55:06	2026-06-12 20:55:06
47	2	TRX2026061247	Data 5GB	FAILED	10000.00	2026-06-11 22:55:06	2026-06-12 20:55:06
48	3	TRX2026061248	Data 5GB	SUCCESS	25000.00	2026-06-12 17:55:06	2026-06-12 20:55:06
49	2	TRX2026061249	Pulsa 5K	PENDING	10000.00	2026-06-12 09:55:06	2026-06-12 20:55:06
50	5	TRX2026061250	Pulsa 10K	SUCCESS	100000.00	2026-06-12 02:55:06	2026-06-12 20:55:06
51	5	TRX2026061251	Pulsa 50K	FAILED	100000.00	2026-06-12 07:55:06	2026-06-12 20:55:06
52	4	TRX2026061252	Pulsa 10K	PENDING	50000.00	2026-06-12 09:55:06	2026-06-12 20:55:06
53	5	TRX2026061253	Data 10GB	PENDING	100000.00	2026-06-12 03:55:06	2026-06-12 20:55:06
54	4	TRX2026061254	Pulsa 5K	FAILED	50000.00	2026-06-12 19:55:06	2026-06-12 20:55:06
55	3	TRX2026061255	Data 10GB	SUCCESS	25000.00	2026-06-12 14:55:06	2026-06-12 20:55:06
56	3	TRX2026061256	Pulsa 10K	FAILED	25000.00	2026-06-12 01:55:06	2026-06-12 20:55:06
57	2	TRX2026061257	Data 10GB	FAILED	10000.00	2026-06-11 22:55:06	2026-06-12 20:55:07
58	5	TRX2026061258	Pulsa 5K	PENDING	100000.00	2026-06-12 15:55:06	2026-06-12 20:55:07
59	1	TRX2026061259	Data 10GB	PENDING	5000.00	2026-06-12 15:55:06	2026-06-12 20:55:07
60	5	TRX2026061260	Pulsa 25K	SUCCESS	100000.00	2026-06-11 23:55:06	2026-06-12 20:55:07
61	5	TRX2026061261	Data 10GB	SUCCESS	100000.00	2026-06-12 11:55:06	2026-06-12 20:55:07
62	4	TRX2026061262	Pulsa 10K	PENDING	50000.00	2026-06-12 00:55:06	2026-06-12 20:55:07
63	3	TRX2026061263	Pulsa 25K	PENDING	25000.00	2026-06-12 18:55:06	2026-06-12 20:55:07
64	5	TRX2026061264	Pulsa 5K	SUCCESS	100000.00	2026-06-12 02:55:06	2026-06-12 20:55:07
65	2	TRX2026061265	Pulsa 25K	FAILED	10000.00	2026-06-12 13:55:06	2026-06-12 20:55:07
66	5	TRX2026061266	Pulsa 25K	PENDING	100000.00	2026-06-12 12:55:06	2026-06-12 20:55:07
67	4	TRX2026061267	Data 5GB	PENDING	50000.00	2026-06-12 00:55:06	2026-06-12 20:55:07
68	5	TRX2026061268	Pulsa 25K	SUCCESS	100000.00	2026-06-11 23:55:06	2026-06-12 20:55:07
69	5	TRX2026061269	Data 1GB	FAILED	100000.00	2026-06-12 04:55:06	2026-06-12 20:55:07
70	5	TRX2026061270	Pulsa 5K	FAILED	100000.00	2026-06-12 01:55:06	2026-06-12 20:55:07
71	4	TRX2026061271	Data 1GB	SUCCESS	50000.00	2026-06-12 02:55:06	2026-06-12 20:55:07
72	2	TRX2026061272	Pulsa 5K	FAILED	10000.00	2026-06-12 19:55:06	2026-06-12 20:55:07
73	1	TRX2026061273	Pulsa 25K	FAILED	5000.00	2026-06-12 04:55:06	2026-06-12 20:55:07
74	5	TRX2026061274	Data 10GB	PENDING	100000.00	2026-06-12 12:55:06	2026-06-12 20:55:07
75	5	TRX2026061275	Data 5GB	PENDING	100000.00	2026-06-12 12:55:06	2026-06-12 20:55:07
76	3	TRX2026061276	Data 1GB	SUCCESS	25000.00	2026-06-12 05:55:06	2026-06-12 20:55:07
77	3	TRX2026061277	Pulsa 50K	PENDING	25000.00	2026-06-12 09:55:06	2026-06-12 20:55:07
78	5	TRX2026061278	Pulsa 25K	FAILED	100000.00	2026-06-12 01:55:06	2026-06-12 20:55:07
79	5	TRX2026061279	Pulsa 50K	SUCCESS	100000.00	2026-06-12 20:55:06	2026-06-12 20:55:07
80	4	TRX2026061280	Pulsa 10K	FAILED	50000.00	2026-06-12 16:55:06	2026-06-12 20:55:07
81	2	TRX2026061281	Data 5GB	PENDING	10000.00	2026-06-12 09:55:06	2026-06-12 20:55:07
82	1	TRX2026061282	Data 10GB	SUCCESS	5000.00	2026-06-12 11:55:06	2026-06-12 20:55:07
83	1	TRX2026061283	Pulsa 50K	PENDING	5000.00	2026-06-12 06:55:06	2026-06-12 20:55:07
84	3	TRX2026061284	Pulsa 10K	FAILED	25000.00	2026-06-12 19:55:06	2026-06-12 20:55:07
85	4	TRX2026061285	Data 5GB	PENDING	50000.00	2026-06-12 09:55:06	2026-06-12 20:55:07
86	2	TRX2026061286	Data 1GB	PENDING	10000.00	2026-06-12 06:55:06	2026-06-12 20:55:07
87	1	TRX2026061287	Pulsa 10K	PENDING	5000.00	2026-06-12 15:55:06	2026-06-12 20:55:07
88	3	TRX2026061288	Data 1GB	PENDING	25000.00	2026-06-12 03:55:06	2026-06-12 20:55:07
89	3	TRX2026061289	Data 1GB	FAILED	25000.00	2026-06-12 10:55:06	2026-06-12 20:55:07
90	3	TRX2026061290	Data 5GB	PENDING	25000.00	2026-06-12 03:55:06	2026-06-12 20:55:07
91	5	TRX2026061291	Pulsa 10K	FAILED	100000.00	2026-06-12 10:55:06	2026-06-12 20:55:07
92	5	TRX2026061292	Pulsa 50K	FAILED	100000.00	2026-06-12 13:55:06	2026-06-12 20:55:07
93	3	TRX2026061293	Pulsa 25K	PENDING	25000.00	2026-06-12 00:55:06	2026-06-12 20:55:07
94	3	TRX2026061294	Pulsa 10K	FAILED	25000.00	2026-06-12 04:55:06	2026-06-12 20:55:07
95	5	TRX2026061295	Pulsa 5K	SUCCESS	100000.00	2026-06-12 02:55:06	2026-06-12 20:55:07
96	1	TRX2026061296	Pulsa 50K	PENDING	5000.00	2026-06-12 12:55:06	2026-06-12 20:55:07
97	4	TRX2026061297	Pulsa 10K	SUCCESS	50000.00	2026-06-12 08:55:06	2026-06-12 20:55:07
98	4	TRX2026061298	Data 10GB	PENDING	50000.00	2026-06-12 09:55:06	2026-06-12 20:55:07
99	1	TRX2026061299	Data 1GB	SUCCESS	5000.00	2026-06-12 14:55:06	2026-06-12 20:55:07
100	4	TRX20260612100	Data 1GB	PENDING	50000.00	2026-06-11 21:55:06	2026-06-12 20:55:07
101	1	TRX20260612101	Data 1GB	FAILED	5000.00	2026-06-12 07:55:06	2026-06-12 20:55:07
\.


--
-- TOC entry 3892 (class 0 OID 4582577)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, id_hash, role_id, name, email, username, phone, password, email_verified_at, userable_type, userable_id, is_active, remember_token, deleted_at, created_at, updated_at, created_by, updated_by, deleted_by) FROM stdin;
1	a2017b62-5c30-4c9e-b6d5-d58b42ba6897	1	Developer	developer@email.co.id	developer	\N	$2y$10$8Sh9iMKO5PpV99ksbhWvreNxG4ABLosJA8l3nY4XOKkj3JG80vBKG	\N	\N	\N	t	\N	\N	2026-06-12 20:54:47	2026-06-12 20:54:47	\N	\N	\N
2	a2017b62-7323-4139-83c0-53b8dd366f0c	2	Administrator	administrator@email.co.id	administrator	\N	$2y$10$8Sh9iMKO5PpV99ksbhWvreNxG4ABLosJA8l3nY4XOKkj3JG80vBKG	\N	\N	\N	t	\N	\N	2026-06-12 20:54:47	2026-06-12 20:54:47	\N	\N	\N
3	a2017b62-7715-4a82-8fcd-15b012ecb183	3	User	user@email.co.id	user	\N	$2y$10$8Sh9iMKO5PpV99ksbhWvreNxG4ABLosJA8l3nY4XOKkj3JG80vBKG	\N	\N	\N	t	\N	\N	2026-06-12 20:54:47	2026-06-12 20:54:47	\N	\N	\N
\.


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 220
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 222
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, true);


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 228
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.providers_id_seq', 5, true);


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 224
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, false);


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 230
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transactions_id_seq', 101, true);


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, false);


--
-- TOC entry 3706 (class 2606 OID 4582549)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 4582551)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3702 (class 2606 OID 4582532)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3704 (class 2606 OID 4582539)
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (email);


--
-- TOC entry 3710 (class 2606 OID 4582560)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3712 (class 2606 OID 4582563)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3728 (class 2606 OID 4582605)
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 4582607)
-- Name: providers providers_provider_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_provider_unique UNIQUE (provider);


--
-- TOC entry 3715 (class 2606 OID 4582575)
-- Name: roles roles_id_hash_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_id_hash_unique UNIQUE (id_hash);


--
-- TOC entry 3717 (class 2606 OID 4582573)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 4582617)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3734 (class 2606 OID 4582624)
-- Name: transactions transactions_trx_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_trx_id_unique UNIQUE (trx_id);


--
-- TOC entry 3719 (class 2606 OID 4582595)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3721 (class 2606 OID 4582593)
-- Name: users users_id_hash_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_hash_unique UNIQUE (id_hash);


--
-- TOC entry 3723 (class 2606 OID 4582585)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3726 (class 2606 OID 4582597)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 3713 (class 1259 OID 4582561)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3724 (class 1259 OID 4582591)
-- Name: users_userable_type_userable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_userable_type_userable_id_index ON public.users USING btree (userable_type, userable_id);


--
-- TOC entry 3736 (class 2606 OID 4582618)
-- Name: transactions transactions_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.providers(id) ON DELETE RESTRICT;


--
-- TOC entry 3735 (class 2606 OID 4582586)
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-06-12 20:56:59 WIB

--
-- PostgreSQL database dump complete
--

\unrestrict lw72oyeZZeGezS6frTy9OXhsr64bhNc47b7xCTuRtLlDLiLFckVM0jYyyebwXj3

