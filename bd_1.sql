--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2026-03-19 18:26:04

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 336861)
-- Name: Заказ_покупателя; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Заказ_покупателя" (
    "номер_заказа" integer NOT NULL,
    "дата_заказа" date NOT NULL,
    "исполнитель" character varying,
    "заказчик" character varying
);


ALTER TABLE public."Заказ_покупателя" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 336860)
-- Name: Заказ_покупателя_Номер_заказа_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Заказ_покупателя_Номер_заказа_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Заказ_покупателя_Номер_заказа_seq" OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 228
-- Name: Заказ_покупателя_Номер_заказа_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Заказ_покупателя_Номер_заказа_seq" OWNED BY public."Заказ_покупателя"."номер_заказа";


--
-- TOC entry 217 (class 1259 OID 336753)
-- Name: Контрагент; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Контрагент" (
    id character varying NOT NULL,
    "наименование" text NOT NULL,
    "инн" character varying,
    "адрес" text,
    "телефон" character varying,
    "продавец" boolean,
    "покупатель" boolean
);


ALTER TABLE public."Контрагент" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 336800)
-- Name: Материалы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Материалы" (
    "код_материала" integer NOT NULL,
    "наименование" text NOT NULL,
    "ед_изм" character varying(10)
);


ALTER TABLE public."Материалы" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 336799)
-- Name: Материалы_Код_материала_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Материалы_Код_материала_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Материалы_Код_материала_seq" OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 222
-- Name: Материалы_Код_материала_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Материалы_Код_материала_seq" OWNED BY public."Материалы"."код_материала";


--
-- TOC entry 219 (class 1259 OID 336761)
-- Name: Продукция; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Продукция" (
    "код_продукции" integer NOT NULL,
    "наименование" text NOT NULL,
    "ед_изм" character varying(10),
    "жирность" character varying,
    "вес" character varying
);


ALTER TABLE public."Продукция" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 336760)
-- Name: Продукция_Код_продукции_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Продукция_Код_продукции_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Продукция_Код_продукции_seq" OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 218
-- Name: Продукция_Код_продукции_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Продукция_Код_продукции_seq" OWNED BY public."Продукция"."код_продукции";


--
-- TOC entry 233 (class 1259 OID 336897)
-- Name: Производство; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Производство" (
    "номер_производства" integer NOT NULL,
    "дата" date,
    "спецификация" integer
);


ALTER TABLE public."Производство" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 336896)
-- Name: Производство_Номер_производств_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Производство_Номер_производств_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Производство_Номер_производств_seq" OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 232
-- Name: Производство_Номер_производств_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Производство_Номер_производств_seq" OWNED BY public."Производство"."номер_производства";


--
-- TOC entry 231 (class 1259 OID 336880)
-- Name: Содержание_заказа; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Содержание_заказа" (
    id integer NOT NULL,
    "номер_заказа" integer NOT NULL,
    "код_продукции" integer NOT NULL,
    "количество" integer,
    "цена" integer,
    "сумма" integer
);


ALTER TABLE public."Содержание_заказа" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 336879)
-- Name: Содержание_заказа_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Содержание_заказа_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Содержание_заказа_ID_seq" OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 230
-- Name: Содержание_заказа_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Содержание_заказа_ID_seq" OWNED BY public."Содержание_заказа".id;


--
-- TOC entry 224 (class 1259 OID 336809)
-- Name: Состав_спецификации; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Состав_спецификации" (
    "id_спецификации" integer NOT NULL,
    "код_материала" integer NOT NULL,
    "количество" numeric NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public."Состав_спецификации" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 337069)
-- Name: Состав спецификации_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Состав спецификации_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Состав спецификации_id_seq" OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 234
-- Name: Состав спецификации_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Состав спецификации_id_seq" OWNED BY public."Состав_спецификации".id;


--
-- TOC entry 221 (class 1259 OID 336779)
-- Name: Спецификация; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Спецификация" (
    id integer NOT NULL,
    "наименование" text,
    "код_продукции" integer NOT NULL
);


ALTER TABLE public."Спецификация" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 336778)
-- Name: Спецификация_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Спецификация_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Спецификация_ID_seq" OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 220
-- Name: Спецификация_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Спецификация_ID_seq" OWNED BY public."Спецификация".id;


--
-- TOC entry 225 (class 1259 OID 336826)
-- Name: Цена_материала; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Цена_материала" (
    "код_материала" integer NOT NULL,
    "дата_начала" date,
    id integer NOT NULL,
    "цена" integer
);


ALTER TABLE public."Цена_материала" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 337078)
-- Name: Цена_материала_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Цена_материала_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Цена_материала_id_seq" OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 235
-- Name: Цена_материала_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Цена_материала_id_seq" OWNED BY public."Цена_материала".id;


--
-- TOC entry 227 (class 1259 OID 336838)
-- Name: Цена_продукции; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Цена_продукции" (
    "код_цены" integer NOT NULL,
    "код_продукции" integer NOT NULL,
    "цена" character varying NOT NULL,
    "дата_начала" date
);


ALTER TABLE public."Цена_продукции" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 336837)
-- Name: Цена_продукции_код_цены_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Цена_продукции_код_цены_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Цена_продукции_код_цены_seq" OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 226
-- Name: Цена_продукции_код_цены_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Цена_продукции_код_цены_seq" OWNED BY public."Цена_продукции"."код_цены";


--
-- TOC entry 4691 (class 2604 OID 336864)
-- Name: Заказ_покупателя номер_заказа; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ_покупателя" ALTER COLUMN "номер_заказа" SET DEFAULT nextval('public."Заказ_покупателя_Номер_заказа_seq"'::regclass);


--
-- TOC entry 4687 (class 2604 OID 336803)
-- Name: Материалы код_материала; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Материалы" ALTER COLUMN "код_материала" SET DEFAULT nextval('public."Материалы_Код_материала_seq"'::regclass);


--
-- TOC entry 4685 (class 2604 OID 336764)
-- Name: Продукция код_продукции; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Продукция" ALTER COLUMN "код_продукции" SET DEFAULT nextval('public."Продукция_Код_продукции_seq"'::regclass);


--
-- TOC entry 4693 (class 2604 OID 336900)
-- Name: Производство номер_производства; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Производство" ALTER COLUMN "номер_производства" SET DEFAULT nextval('public."Производство_Номер_производств_seq"'::regclass);


--
-- TOC entry 4692 (class 2604 OID 336883)
-- Name: Содержание_заказа id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Содержание_заказа" ALTER COLUMN id SET DEFAULT nextval('public."Содержание_заказа_ID_seq"'::regclass);


--
-- TOC entry 4688 (class 2604 OID 337070)
-- Name: Состав_спецификации id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав_спецификации" ALTER COLUMN id SET DEFAULT nextval('public."Состав спецификации_id_seq"'::regclass);


--
-- TOC entry 4686 (class 2604 OID 336782)
-- Name: Спецификация id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Спецификация" ALTER COLUMN id SET DEFAULT nextval('public."Спецификация_ID_seq"'::regclass);


--
-- TOC entry 4689 (class 2604 OID 337079)
-- Name: Цена_материала id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена_материала" ALTER COLUMN id SET DEFAULT nextval('public."Цена_материала_id_seq"'::regclass);


--
-- TOC entry 4690 (class 2604 OID 336841)
-- Name: Цена_продукции код_цены; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена_продукции" ALTER COLUMN "код_цены" SET DEFAULT nextval('public."Цена_продукции_код_цены_seq"'::regclass);


--
-- TOC entry 4881 (class 0 OID 336861)
-- Dependencies: 229
-- Data for Name: Заказ_покупателя; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Заказ_покупателя" ("номер_заказа", "дата_заказа", "исполнитель", "заказчик") FROM stdin;
2	2025-06-06	000000001	000000010
\.


--
-- TOC entry 4869 (class 0 OID 336753)
-- Dependencies: 217
-- Data for Name: Контрагент; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Контрагент" (id, "наименование", "инн", "адрес", "телефон", "продавец", "покупатель") FROM stdin;
000000001	ООО Поставка		г.Пятигорск	+79198634592	t	t
000000002	ООО Кинотеатр Квант	26320045123	г. Железноводск, ул. Мира, 123	+79884581555	t	f
000000008	ООО Новый JDTO	26320045111	г. Железноводсу	+79884581555	t	f
000000003	ООО Ромашка	4140784214	г. Омск, ул. Строителей, 294	+79882584546	f	t
000000009	ООО Ипподром	5874045632	г. Уфа, ул. Набережная,  37	+79627486389	t	t
000000010	ООО Ассоль	2629011278	г. Калуга, ул. Пушкина, 94	+79184572398	f	t
\.


--
-- TOC entry 4875 (class 0 OID 336800)
-- Dependencies: 223
-- Data for Name: Материалы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Материалы" ("код_материала", "наименование", "ед_изм") FROM stdin;
1	Молоко нормализованное	кг
2	Закваска сметанная	кг
\.


--
-- TOC entry 4871 (class 0 OID 336761)
-- Dependencies: 219
-- Data for Name: Продукция; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Продукция" ("код_продукции", "наименование", "ед_изм", "жирность", "вес") FROM stdin;
1	Кефир	шт	2,5%	900г.
2	Кефир	шт	3,2%	900г.
3	Молоко	шт	2,5%	900г.
4	Сметана классическая	шт	15%	540г.
\.


--
-- TOC entry 4885 (class 0 OID 336897)
-- Dependencies: 233
-- Data for Name: Производство; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Производство" ("номер_производства", "дата", "спецификация") FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 336880)
-- Dependencies: 231
-- Data for Name: Содержание_заказа; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Содержание_заказа" (id, "номер_заказа", "код_продукции", "количество", "цена", "сумма") FROM stdin;
10	2	1	12	80	960
11	2	2	9	82	738
12	2	3	10	79	790
13	2	4	10	79	790
\.


--
-- TOC entry 4876 (class 0 OID 336809)
-- Dependencies: 224
-- Data for Name: Состав_спецификации; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Состав_спецификации" ("id_спецификации", "код_материала", "количество", id) FROM stdin;
1	1	0.900	13
1	2	0.070	14
2	1	0.900	15
3	1	0.900	16
4	1	0.900	17
\.


--
-- TOC entry 4873 (class 0 OID 336779)
-- Dependencies: 221
-- Data for Name: Спецификация; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Спецификация" (id, "наименование", "код_продукции") FROM stdin;
1	Основная Сметана 15%	4
2	Спецификация для продукта 1	1
3	Спецификация для продукта 2	2
4	Спецификация для продукта 3	3
\.


--
-- TOC entry 4877 (class 0 OID 336826)
-- Dependencies: 225
-- Data for Name: Цена_материала; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Цена_материала" ("код_материала", "дата_начала", id, "цена") FROM stdin;
1	2025-06-01	15	40
2	2025-06-01	16	10
\.


--
-- TOC entry 4879 (class 0 OID 336838)
-- Dependencies: 227
-- Data for Name: Цена_продукции; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Цена_продукции" ("код_цены", "код_продукции", "цена", "дата_начала") FROM stdin;
13	1	80.00	2025-06-01
14	2	82.00	2025-06-01
15	3	79.00	2025-06-01
16	4	36.70	2025-06-01
\.


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 228
-- Name: Заказ_покупателя_Номер_заказа_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Заказ_покупателя_Номер_заказа_seq"', 1, false);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 222
-- Name: Материалы_Код_материала_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Материалы_Код_материала_seq"', 1, false);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 218
-- Name: Продукция_Код_продукции_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Продукция_Код_продукции_seq"', 1, false);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 232
-- Name: Производство_Номер_производств_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Производство_Номер_производств_seq"', 1, false);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 230
-- Name: Содержание_заказа_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Содержание_заказа_ID_seq"', 13, true);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 234
-- Name: Состав спецификации_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Состав спецификации_id_seq"', 17, true);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 220
-- Name: Спецификация_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Спецификация_ID_seq"', 1, false);


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 235
-- Name: Цена_материала_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Цена_материала_id_seq"', 16, true);


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 226
-- Name: Цена_продукции_код_цены_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Цена_продукции_код_цены_seq"', 16, true);


--
-- TOC entry 4709 (class 2606 OID 336868)
-- Name: Заказ_покупателя Заказ_покупателя_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ_покупателя"
    ADD CONSTRAINT "Заказ_покупателя_pkey" PRIMARY KEY ("номер_заказа");


--
-- TOC entry 4695 (class 2606 OID 336759)
-- Name: Контрагент Контрагент_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Контрагент"
    ADD CONSTRAINT "Контрагент_pkey" PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 336807)
-- Name: Материалы Материалы_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Материалы"
    ADD CONSTRAINT "Материалы_pkey" PRIMARY KEY ("код_материала");


--
-- TOC entry 4697 (class 2606 OID 336768)
-- Name: Продукция Продукция_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Продукция"
    ADD CONSTRAINT "Продукция_pkey" PRIMARY KEY ("код_продукции");


--
-- TOC entry 4713 (class 2606 OID 336902)
-- Name: Производство Производство_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Производство"
    ADD CONSTRAINT "Производство_pkey" PRIMARY KEY ("номер_производства");


--
-- TOC entry 4711 (class 2606 OID 336885)
-- Name: Содержание_заказа Содержание_заказа_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Содержание_заказа"
    ADD CONSTRAINT "Содержание_заказа_pkey" PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 337075)
-- Name: Состав_спецификации Состав спецификации_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав_спецификации"
    ADD CONSTRAINT "Состав спецификации_pkey" PRIMARY KEY (id);


--
-- TOC entry 4699 (class 2606 OID 336786)
-- Name: Спецификация Спецификация_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Спецификация"
    ADD CONSTRAINT "Спецификация_pkey" PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 337084)
-- Name: Цена_материала Цена_материала_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена_материала"
    ADD CONSTRAINT "Цена_материала_pkey" PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 336845)
-- Name: Цена_продукции Цена_продукции_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена_продукции"
    ADD CONSTRAINT "Цена_продукции_pkey" PRIMARY KEY ("код_цены");


--
-- TOC entry 4719 (class 2606 OID 336869)
-- Name: Заказ_покупателя none; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ_покупателя"
    ADD CONSTRAINT "none" FOREIGN KEY ("исполнитель") REFERENCES public."Контрагент"(id);


--
-- TOC entry 4720 (class 2606 OID 336874)
-- Name: Заказ_покупателя Заказ_покупателя_Заказчик_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Заказ_покупателя"
    ADD CONSTRAINT "Заказ_покупателя_Заказчик_fkey" FOREIGN KEY ("заказчик") REFERENCES public."Контрагент"(id);


--
-- TOC entry 4723 (class 2606 OID 336903)
-- Name: Производство Производство_спецификация_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Производство"
    ADD CONSTRAINT "Производство_спецификация_fkey" FOREIGN KEY ("спецификация") REFERENCES public."Спецификация"(id);


--
-- TOC entry 4721 (class 2606 OID 336891)
-- Name: Содержание_заказа Содержание_заказ_код_продукции_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Содержание_заказа"
    ADD CONSTRAINT "Содержание_заказ_код_продукции_fkey" FOREIGN KEY ("код_продукции") REFERENCES public."Продукция"("код_продукции");


--
-- TOC entry 4722 (class 2606 OID 336886)
-- Name: Содержание_заказа Содержание_заказа_номер_заказа_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Содержание_заказа"
    ADD CONSTRAINT "Содержание_заказа_номер_заказа_fkey" FOREIGN KEY ("номер_заказа") REFERENCES public."Заказ_покупателя"("номер_заказа");


--
-- TOC entry 4715 (class 2606 OID 336815)
-- Name: Состав_спецификации Состав специфик_ID_спецификации_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав_спецификации"
    ADD CONSTRAINT "Состав специфик_ID_спецификации_fkey" FOREIGN KEY ("id_спецификации") REFERENCES public."Спецификация"(id);


--
-- TOC entry 4716 (class 2606 OID 336820)
-- Name: Состав_спецификации Состав специфика_код_материала_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав_спецификации"
    ADD CONSTRAINT "Состав специфика_код_материала_fkey" FOREIGN KEY ("код_материала") REFERENCES public."Материалы"("код_материала") NOT VALID;


--
-- TOC entry 4714 (class 2606 OID 336787)
-- Name: Спецификация Спецификация_Код_продукции_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Спецификация"
    ADD CONSTRAINT "Спецификация_Код_продукции_fkey" FOREIGN KEY ("код_продукции") REFERENCES public."Продукция"("код_продукции") NOT VALID;


--
-- TOC entry 4717 (class 2606 OID 336832)
-- Name: Цена_материала Цена_материала_Код_материала_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена_материала"
    ADD CONSTRAINT "Цена_материала_Код_материала_fkey" FOREIGN KEY ("код_материала") REFERENCES public."Материалы"("код_материала");


--
-- TOC entry 4718 (class 2606 OID 336846)
-- Name: Цена_продукции Цена_продукции_код_продукции_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Цена_продукции"
    ADD CONSTRAINT "Цена_продукции_код_продукции_fkey" FOREIGN KEY ("код_продукции") REFERENCES public."Продукция"("код_продукции");


-- Completed on 2026-03-19 18:26:04

--
-- PostgreSQL database dump complete
--

