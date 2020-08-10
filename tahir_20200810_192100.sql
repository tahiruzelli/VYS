--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12rc1

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
-- Name: actor_last_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actor_last_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE

BEGIN

    UPDATE "actor" SET last_update = CURRENT_DATE WHERE "actor_id" = NEW."actor_id";

    RETURN NEW;
END;

$$;


ALTER FUNCTION public.actor_last_update() OWNER TO postgres;

--
-- Name: address_clear(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.address_clear() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."address" = LTRIM(NEW."address");
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.address_clear() OWNER TO postgres;

--
-- Name: count_staff(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.count_staff() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	a integer;
BEGIN
   SELECT count(*) into a FROM "staff";
   RETURN a;
END;
$$;


ALTER FUNCTION public.count_staff() OWNER TO postgres;

--
-- Name: film_count(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.film_count() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	a integer;
BEGIN
   SELECT count(*) into a FROM "film";
   RETURN a;
END;
$$;


ALTER FUNCTION public.film_count() OWNER TO postgres;

--
-- Name: good_movies(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.good_movies() RETURNS void
    LANGUAGE sql
    AS $$
	 SELECT * FROM film WHERE rating>50 ;
	$$;


ALTER FUNCTION public.good_movies() OWNER TO postgres;

--
-- Name: languege_movies(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.languege_movies() RETURNS void
    LANGUAGE sql
    AS $$
	 SELECT * FROM "film" INNER JOIN "languege" ON "film"."languege_id" =  "languege"."languege_id"
	$$;


ALTER FUNCTION public.languege_movies() OWNER TO postgres;

--
-- Name: upper_country(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.upper_country() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."country" = UPPER(NEW."country");
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.upper_country() OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    name character varying(2044) NOT NULL,
    last_update character varying(2044) NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_actor_id_seq OWNED BY public.actor.actor_id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    address character varying(2044) NOT NULL,
    city_id integer NOT NULL,
    postal_code integer NOT NULL,
    last_update character varying(2044) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(2044) NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    city character varying(2044) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    country character varying(2044) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    store_id integer NOT NULL,
    name character varying(2044) NOT NULL,
    email character varying(2044) NOT NULL,
    address_id integer NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    film_id integer NOT NULL,
    title character varying(2044) NOT NULL,
    description character varying(2044) NOT NULL,
    release_year character varying(2044) NOT NULL,
    languege_id integer NOT NULL,
    lenght integer NOT NULL,
    rating integer NOT NULL,
    last_update date
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actor (
    actor_id integer NOT NULL,
    film_id integer NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.film_actor OWNER TO postgres;

--
-- Name: film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_category (
    film_id integer NOT NULL,
    category_id integer NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.film_category OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_film_id_seq OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_film_id_seq OWNED BY public.film.film_id;


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    film_id integer NOT NULL,
    strore_id integer NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;


--
-- Name: languege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languege (
    languege_id integer NOT NULL,
    name character varying(2044) NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.languege OWNER TO postgres;

--
-- Name: languege_languege_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languege_languege_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languege_languege_id_seq OWNER TO postgres;

--
-- Name: languege_languege_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languege_languege_id_seq OWNED BY public.languege.languege_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    customer_id integer NOT NULL,
    staff_id integer NOT NULL,
    rental_id integer NOT NULL,
    amount integer NOT NULL,
    payment_date date NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    rental_id integer NOT NULL,
    rental_date date NOT NULL,
    inventory_id integer NOT NULL,
    customer_id integer NOT NULL,
    staff_id integer NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_rental_id_seq OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_rental_id_seq OWNED BY public.rental.rental_id;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    first_name character varying(2044) NOT NULL,
    last_name character varying(2044) NOT NULL,
    address_id integer NOT NULL,
    email character varying(2044) NOT NULL,
    store_id character varying(2044) NOT NULL,
    username character varying(2044) NOT NULL,
    password character varying(2044) NOT NULL,
    last_update date NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;


--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id integer NOT NULL,
    manager_staff_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_store_id_seq OWNED BY public.store.store_id;


--
-- Name: actor actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN actor_id SET DEFAULT nextval('public.actor_actor_id_seq'::regclass);


--
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: city city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: film film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN film_id SET DEFAULT nextval('public.film_film_id_seq'::regclass);


--
-- Name: inventory inventory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);


--
-- Name: languege languege_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languege ALTER COLUMN languege_id SET DEFAULT nextval('public.languege_languege_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: rental rental_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental ALTER COLUMN rental_id SET DEFAULT nextval('public.rental_rental_id_seq'::regclass);


--
-- Name: staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- Name: store store_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store ALTER COLUMN store_id SET DEFAULT nextval('public.store_store_id_seq'::regclass);


--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actor VALUES
	(1, 'Leonardo DiCaprio', '10.08.2020'),
	(2, 'Tom Hangs', '10.08.2020'),
	(3, 'Morgan Freeman', '10.08.2020'),
	(4, 'Christian Bale', '10.08.2020');


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address VALUES
	(1, 'adres 1', 1, 20, '10.08.2020'),
	(2, 'adres 2', 2, 30, '10.08.2020'),
	(3, 'adres 3', 3, 40, '10.08.2020'),
	(4, 'adres 4', 4, 50, '10.08.2020');


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES
	(1, 'Aksiyon', '2020-08-10'),
	(2, 'Bilim Kurgu', '2020-08-10'),
	(3, 'Korku', '2020-08-10'),
	(4, 'Belgesel', '2020-08-10'),
	(5, 'Gerilim', '2020-08-10'),
	(6, 'Fantastik', '2020-08-10');


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.city VALUES
	(1, 'İstanbul', 1),
	(2, 'Londra', 2),
	(3, 'Delhi', 3),
	(4, 'New York', 4),
	(5, 'DC', 4);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.country VALUES
	(1, 'Türkiye'),
	(2, 'İngiltere'),
	(3, 'Hindistan'),
	(4, 'ABD');


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer VALUES
	(1, 1, 'Gerardo Marsh', 'gmarsh@gmail.com', 1, '2020-08-10'),
	(2, 1, 'Caiden McLean', 'gmclean@gmail.com', 2, '2020-08-10'),
	(3, 2, 'Jakob Robinson', 'jrobinson@gmail.com', 3, '2020-08-10'),
	(4, 2, 'Ingrid Goode', 'igroode@gmail.com', 4, '2020-08-10');


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film VALUES
	(1, 'Esaretin Bedeli', 'esaretten kurtulan adamın hikayesi', '1994', 1, 120, 92, '2020-08-10'),
	(2, 'Baba', 'Mafya olan bir ailenin hikayesi', '1972', 1, 180, 91, '2020-08-10'),
	(3, 'Dövüş Kulübü', 'Çift karakterli bir insanın ülkeyi bir isyana sürüklemesini anlatır', '1999', 1, 140, 88, '2020-08-10'),
	(4, 'Forrest Gump', 'Zihinsel geriliği olan aynı zamanda çok iyi bir koşucu olan karakterin hikayesi', '1994', 1, 150, 88, '2020-08-10'),
	(5, 'Yeşil Yol', 'İzlemedim bilmiyorum', '1999', 1, 180, 85, '2020-08-10');


--
-- Data for Name: film_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film_actor VALUES
	(1, 1, '2020-08-10'),
	(2, 2, '2020-08-10'),
	(3, 3, '2020-08-10');


--
-- Data for Name: film_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film_category VALUES
	(1, 1, '2020-08-10'),
	(2, 2, '2020-08-10'),
	(3, 3, '2020-08-10');


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory VALUES
	(1, 1, 1, '2020-08-10'),
	(2, 3, 1, '2020-08-10'),
	(3, 5, 1, '2020-08-10');


--
-- Data for Name: languege; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.languege VALUES
	(1, 'English', '2020-08-10'),
	(2, 'Türkçe', '2020-08-10'),
	(3, 'Español', '2020-08-10'),
	(4, 'Português', '2020-08-10');


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment VALUES
	(1, 1, 1, 1, 100, '2020-08-10'),
	(2, 2, 2, 2, 150, '2020-08-10'),
	(3, 3, 3, 3, 200, '2020-08-10');


--
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rental VALUES
	(1, '2020-08-10', 1, 1, 1, '2020-08-10'),
	(2, '2020-08-10', 2, 2, 2, '2020-08-10'),
	(3, '2020-08-10', 3, 3, 3, '2020-08-10');


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff VALUES
	(1, 'Draven', 'Wentworth', 1, 'dwentworth@gmail.com', '1', 'draven', '123', '2020-08-10'),
	(2, 'Braedon ', 'McWilliams', 2, 'bmcwilliams@gmail.com', '2', 'breadon', '123', '2020-08-10'),
	(3, 'Alice', 'Reid', 3, 'areid@gmail.com', '3', 'alice', '123', '2020-08-10');


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.store VALUES
	(1, 1, 3),
	(2, 2, 4),
	(3, 3, 2);


--
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 4, true);


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 4, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 6, true);


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 5, true);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 4, true);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 4, true);


--
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_film_id_seq', 10, true);


--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 3, true);


--
-- Name: languege_languege_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languege_languege_id_seq', 4, true);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 3, true);


--
-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_rental_id_seq', 3, true);


--
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 3, true);


--
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 3, true);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: film_actor film_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);


--
-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- Name: languege languege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languege
    ADD CONSTRAINT languege_pkey PRIMARY KEY (languege_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


--
-- Name: actor actor_last_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actor_last_update BEFORE INSERT ON public.actor FOR EACH ROW EXECUTE PROCEDURE public.actor_last_update();


--
-- Name: address address_clear; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER address_clear BEFORE INSERT ON public.address FOR EACH ROW EXECUTE PROCEDURE public.address_clear();


--
-- Name: country upper_country; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER upper_country BEFORE INSERT ON public.country FOR EACH ROW EXECUTE PROCEDURE public.upper_country();


--
-- Name: film_actor lnk_actor_film_actor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT lnk_actor_film_actor FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id) MATCH FULL;


--
-- Name: customer lnk_address_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT lnk_address_customer FOREIGN KEY (address_id) REFERENCES public.address(address_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: staff lnk_address_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT lnk_address_staff FOREIGN KEY (address_id) REFERENCES public.address(address_id) MATCH FULL;


--
-- Name: store lnk_address_store; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT lnk_address_store FOREIGN KEY (address_id) REFERENCES public.address(address_id) MATCH FULL;


--
-- Name: film_category lnk_category_film_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT lnk_category_film_category FOREIGN KEY (category_id) REFERENCES public.category(category_id) MATCH FULL;


--
-- Name: address lnk_city_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT lnk_city_address FOREIGN KEY (city_id) REFERENCES public.city(city_id) MATCH FULL;


--
-- Name: city lnk_country_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT lnk_country_city FOREIGN KEY (country_id) REFERENCES public.country(country_id) MATCH FULL;


--
-- Name: payment lnk_customer_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT lnk_customer_payment FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rental lnk_customer_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT lnk_customer_rental FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) MATCH FULL;


--
-- Name: film_actor lnk_film_film_actor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT lnk_film_film_actor FOREIGN KEY (film_id) REFERENCES public.film(film_id) MATCH FULL;


--
-- Name: film_category lnk_film_film_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT lnk_film_film_category FOREIGN KEY (film_id) REFERENCES public.film(film_id) MATCH FULL;


--
-- Name: inventory lnk_film_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT lnk_film_inventory FOREIGN KEY (film_id) REFERENCES public.film(film_id) MATCH FULL;


--
-- Name: rental lnk_inventory_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT lnk_inventory_rental FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id) MATCH FULL;


--
-- Name: film lnk_languege_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT lnk_languege_film FOREIGN KEY (languege_id) REFERENCES public.languege(languege_id) MATCH FULL;


--
-- Name: payment lnk_rental_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT lnk_rental_payment FOREIGN KEY (rental_id) REFERENCES public.rental(rental_id) MATCH FULL;


--
-- Name: payment lnk_staff_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT lnk_staff_payment FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id) MATCH FULL;


--
-- Name: rental lnk_staff_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT lnk_staff_rental FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id) MATCH FULL;


--
-- Name: store lnk_staff_store; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT lnk_staff_store FOREIGN KEY (manager_staff_id) REFERENCES public.staff(staff_id) MATCH FULL;


--
-- PostgreSQL database dump complete
--

