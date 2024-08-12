--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-12 17:56:43

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
-- TOC entry 246 (class 1259 OID 16656)
-- Name: Communications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Communications" (
    communication_id integer NOT NULL,
    order_id integer NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public."Communications" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16655)
-- Name: Communications_communication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Communications_communication_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Communications_communication_id_seq" OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 245
-- Name: Communications_communication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Communications_communication_id_seq" OWNED BY public."Communications".communication_id;


--
-- TOC entry 248 (class 1259 OID 16666)
-- Name: Feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Feedbacks" (
    feedback_id integer NOT NULL,
    user_id integer NOT NULL,
    order_id integer NOT NULL,
    rating integer NOT NULL,
    comment text,
    created_at timestamp with time zone
);


ALTER TABLE public."Feedbacks" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16665)
-- Name: Feedbacks_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Feedbacks_feedback_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Feedbacks_feedback_id_seq" OWNER TO postgres;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 247
-- Name: Feedbacks_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Feedbacks_feedback_id_seq" OWNED BY public."Feedbacks".feedback_id;


--
-- TOC entry 240 (class 1259 OID 16629)
-- Name: OrderItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItems" (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    customization_requests json
);


ALTER TABLE public."OrderItems" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16628)
-- Name: OrderItems_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderItems_order_item_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderItems_order_item_id_seq" OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 239
-- Name: OrderItems_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderItems_order_item_id_seq" OWNED BY public."OrderItems".order_item_id;


--
-- TOC entry 238 (class 1259 OID 16622)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    total_price numeric(10,2) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16621)
-- Name: Orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_order_id_seq" OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 237
-- Name: Orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_order_id_seq" OWNED BY public."Orders".order_id;


--
-- TOC entry 242 (class 1259 OID 16638)
-- Name: Payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payments" (
    payment_id integer NOT NULL,
    order_id integer NOT NULL,
    status character varying(255) NOT NULL,
    proof_of_payment character varying(255),
    transaction_id character varying(255),
    created_at timestamp with time zone
);


ALTER TABLE public."Payments" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16637)
-- Name: Payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Payments_payment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Payments_payment_id_seq" OWNER TO postgres;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 241
-- Name: Payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Payments_payment_id_seq" OWNED BY public."Payments".payment_id;


--
-- TOC entry 236 (class 1259 OID 16613)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    category character varying(255) NOT NULL,
    material character varying(255) NOT NULL,
    images json NOT NULL,
    base_length double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16612)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 235
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 244 (class 1259 OID 16647)
-- Name: Shippings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Shippings" (
    shipping_id integer NOT NULL,
    order_id integer NOT NULL,
    address text NOT NULL,
    courier character varying(255),
    tracking_number character varying(255),
    status character varying(255) NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public."Shippings" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16646)
-- Name: Shippings_shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Shippings_shipping_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Shippings_shipping_id_seq" OWNER TO postgres;

--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 243
-- Name: Shippings_shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Shippings_shipping_id_seq" OWNED BY public."Shippings".shipping_id;


--
-- TOC entry 234 (class 1259 OID 16602)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    contact_number character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16601)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 233
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 230 (class 1259 OID 16529)
-- Name: communications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communications (
    communication_id integer NOT NULL,
    order_id integer NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.communications OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16528)
-- Name: communications_communication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.communications_communication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.communications_communication_id_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 229
-- Name: communications_communication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.communications_communication_id_seq OWNED BY public.communications.communication_id;


--
-- TOC entry 220 (class 1259 OID 16453)
-- Name: customizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customizations (
    customization_id integer NOT NULL,
    type character varying(50) NOT NULL,
    options json NOT NULL,
    CONSTRAINT customizations_type_check CHECK (((type)::text = ANY ((ARRAY['size'::character varying, 'neck_model'::character varying, 'sleeve_model'::character varying, 'length'::character varying])::text[])))
);


ALTER TABLE public.customizations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16452)
-- Name: customizations_customization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customizations_customization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customizations_customization_id_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 219
-- Name: customizations_customization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customizations_customization_id_seq OWNED BY public.customizations.customization_id;


--
-- TOC entry 232 (class 1259 OID 16544)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    feedback_id integer NOT NULL,
    user_id integer NOT NULL,
    order_id integer NOT NULL,
    rating integer NOT NULL,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16543)
-- Name: feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_feedback_id_seq OWNER TO postgres;

--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 231
-- Name: feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_feedback_id_seq OWNED BY public.feedback.feedback_id;


--
-- TOC entry 224 (class 1259 OID 16478)
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    customization_requests json
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16477)
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitems_order_item_id_seq OWNER TO postgres;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 223
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_order_item_id_seq OWNED BY public.orderitems.order_item_id;


--
-- TOC entry 222 (class 1259 OID 16463)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    total_price numeric(10,2) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'confirmed'::character varying, 'in_production'::character varying, 'shipped'::character varying, 'completed'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16462)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 226 (class 1259 OID 16497)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    order_id integer NOT NULL,
    status character varying(20) NOT NULL,
    proof_of_payment character varying(255),
    transaction_id character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT payments_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'confirmed'::character varying])::text[])))
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16496)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


--
-- TOC entry 218 (class 1259 OID 16443)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    category character varying(50) NOT NULL,
    material character varying(100),
    images json,
    base_length integer,
    CONSTRAINT products_category_check CHECK (((category)::text = ANY ((ARRAY['tops'::character varying, 'dresses'::character varying, 'skirts'::character varying, 'top sets with skirts'::character varying, 'top sets with culottes'::character varying])::text[])))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16442)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 228 (class 1259 OID 16513)
-- Name: shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping (
    shipping_id integer NOT NULL,
    order_id integer NOT NULL,
    address text NOT NULL,
    courier character varying(100),
    tracking_number character varying(255),
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT shipping_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'shipped'::character varying, 'delivered'::character varying])::text[])))
);


ALTER TABLE public.shipping OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16512)
-- Name: shipping_shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_shipping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_shipping_id_seq OWNER TO postgres;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 227
-- Name: shipping_shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_shipping_id_seq OWNED BY public.shipping.shipping_id;


--
-- TOC entry 216 (class 1259 OID 16429)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    contact_number character varying(20) NOT NULL,
    role character varying(20) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'customer'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16428)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4789 (class 2604 OID 16659)
-- Name: Communications communication_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Communications" ALTER COLUMN communication_id SET DEFAULT nextval('public."Communications_communication_id_seq"'::regclass);


--
-- TOC entry 4790 (class 2604 OID 16669)
-- Name: Feedbacks feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedbacks" ALTER COLUMN feedback_id SET DEFAULT nextval('public."Feedbacks_feedback_id_seq"'::regclass);


--
-- TOC entry 4786 (class 2604 OID 16632)
-- Name: OrderItems order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItems" ALTER COLUMN order_item_id SET DEFAULT nextval('public."OrderItems_order_item_id_seq"'::regclass);


--
-- TOC entry 4785 (class 2604 OID 16625)
-- Name: Orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN order_id SET DEFAULT nextval('public."Orders_order_id_seq"'::regclass);


--
-- TOC entry 4787 (class 2604 OID 16641)
-- Name: Payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments" ALTER COLUMN payment_id SET DEFAULT nextval('public."Payments_payment_id_seq"'::regclass);


--
-- TOC entry 4784 (class 2604 OID 16616)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 4788 (class 2604 OID 16650)
-- Name: Shippings shipping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shippings" ALTER COLUMN shipping_id SET DEFAULT nextval('public."Shippings_shipping_id_seq"'::regclass);


--
-- TOC entry 4783 (class 2604 OID 16605)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 4779 (class 2604 OID 16532)
-- Name: communications communication_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications ALTER COLUMN communication_id SET DEFAULT nextval('public.communications_communication_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 16456)
-- Name: customizations customization_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customizations ALTER COLUMN customization_id SET DEFAULT nextval('public.customizations_customization_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 16547)
-- Name: feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.feedback_feedback_id_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 16481)
-- Name: orderitems order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN order_item_id SET DEFAULT nextval('public.orderitems_order_item_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16466)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16500)
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 16446)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16516)
-- Name: shipping shipping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN shipping_id SET DEFAULT nextval('public.shipping_shipping_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 16432)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 5020 (class 0 OID 16656)
-- Dependencies: 246
-- Data for Name: Communications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Communications" (communication_id, order_id, message, created_at) FROM stdin;
\.


--
-- TOC entry 5022 (class 0 OID 16666)
-- Dependencies: 248
-- Data for Name: Feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Feedbacks" (feedback_id, user_id, order_id, rating, comment, created_at) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 16629)
-- Dependencies: 240
-- Data for Name: OrderItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItems" (order_item_id, order_id, product_id, quantity, customization_requests) FROM stdin;
2	1	1	2	{"color":"blue"}
\.


--
-- TOC entry 5012 (class 0 OID 16622)
-- Dependencies: 238
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" (order_id, user_id, total_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5016 (class 0 OID 16638)
-- Dependencies: 242
-- Data for Name: Payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payments" (payment_id, order_id, status, proof_of_payment, transaction_id, created_at) FROM stdin;
\.


--
-- TOC entry 5010 (class 0 OID 16613)
-- Dependencies: 236
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" (id, name, description, price, category, material, images, base_length, "createdAt", "updatedAt") FROM stdin;
10	Sample Product 1	This is a sample product 1.	100	tops	cotton	["https://via.placeholder.com/200x200?text=Product+1","https://via.placeholder.com/200x200?text=Product+1"]	80	2024-08-12 16:07:12.197+07	2024-08-12 16:07:12.197+07
11	Sample Product 2	This is a sample product 2.	200	dresses	silk	["https://via.placeholder.com/200x200?text=Product+2","https://via.placeholder.com/200x200?text=Product+2"]	90	2024-08-12 16:08:22.635+07	2024-08-12 16:08:22.635+07
\.


--
-- TOC entry 5018 (class 0 OID 16647)
-- Dependencies: 244
-- Data for Name: Shippings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Shippings" (shipping_id, order_id, address, courier, tracking_number, status, created_at) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 16602)
-- Dependencies: 234
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, username, password, email, contact_number, role, "createdAt", "updatedAt") FROM stdin;
1	testuser	$2a$10$5tAd1WZ8YCHStLc69teXFey6qu6rLz8EswsTk/OUyMVmrs0cFtfn6	testuser@example.com	1234567890	customer	2024-08-12 09:45:18.954+07	2024-08-12 09:45:18.954+07
3	testuser2	$2a$10$bftEvaPhWedDgn6JA0mirORij06tBLO9xmEs0y66DI6ryp/yHyv3.	testuser2@example.com	12345678901	customer	2024-08-12 16:50:59.7+07	2024-08-12 16:50:59.7+07
\.


--
-- TOC entry 5004 (class 0 OID 16529)
-- Dependencies: 230
-- Data for Name: communications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.communications (communication_id, order_id, message, created_at) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 16453)
-- Dependencies: 220
-- Data for Name: customizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customizations (customization_id, type, options) FROM stdin;
\.


--
-- TOC entry 5006 (class 0 OID 16544)
-- Dependencies: 232
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (feedback_id, user_id, order_id, rating, comment, created_at) FROM stdin;
\.


--
-- TOC entry 4998 (class 0 OID 16478)
-- Dependencies: 224
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (order_item_id, order_id, product_id, quantity, customization_requests) FROM stdin;
\.


--
-- TOC entry 4996 (class 0 OID 16463)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, user_id, total_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5000 (class 0 OID 16497)
-- Dependencies: 226
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, order_id, status, proof_of_payment, transaction_id, created_at) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 16443)
-- Dependencies: 218
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, name, description, price, category, material, images, base_length) FROM stdin;
1	Classic Top	A classic top perfect for any occasion.	29.99	tops	cotton	[{"url": "https://via.placeholder.com/300x300?text=Classic+Top"}]	70
2	Summer Dress	A lightweight summer dress.	49.99	dresses	linen	[{"url": "https://via.placeholder.com/300x300?text=Summer+Dress"}]	100
3	Office Skirt	A formal skirt suitable for office wear.	39.99	skirts	polyester	[{"url": "https://via.placeholder.com/300x300?text=Office+Skirt"}]	65
4	Evening Gown	An elegant evening gown for special occasions.	149.99	dresses	silk	[{"url": "https://via.placeholder.com/300x300?text=Evening+Gown"}]	120
5	Casual Set	A casual top and skirt set.	59.99	top sets with skirts	cotton blend	[{"url": "https://via.placeholder.com/300x300?text=Casual+Set"}]	70
6	Chic Culottes	Stylish culottes perfect for any season.	45.99	top sets with culottes	linen	[{"url": "https://via.placeholder.com/300x300?text=Chic+Culottes"}]	75
7	Formal Shirt	A formal shirt for business or evening wear.	34.99	tops	silk	[{"url": "https://via.placeholder.com/300x300?text=Formal+Shirt"}]	72
8	Party Dress	A party dress with intricate designs.	89.99	dresses	lace	[{"url": "https://via.placeholder.com/300x300?text=Party+Dress"}]	105
9	Vintage Skirt	A vintage-style skirt for a retro look.	49.99	skirts	denim	[{"url": "https://via.placeholder.com/300x300?text=Vintage+Skirt"}]	60
10	Summer Set	A cool top and culottes set for summer.	64.99	top sets with culottes	cotton	[{"url": "https://via.placeholder.com/300x300?text=Summer+Set"}]	80
\.


--
-- TOC entry 5002 (class 0 OID 16513)
-- Dependencies: 228
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping (shipping_id, order_id, address, courier, tracking_number, status, created_at) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 16429)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, email, contact_number, role) FROM stdin;
\.


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 245
-- Name: Communications_communication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Communications_communication_id_seq"', 1, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 247
-- Name: Feedbacks_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Feedbacks_feedback_id_seq"', 1, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 239
-- Name: OrderItems_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderItems_order_item_id_seq"', 2, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 237
-- Name: Orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_order_id_seq"', 1, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 241
-- Name: Payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Payments_payment_id_seq"', 1, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 235
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_id_seq"', 11, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 243
-- Name: Shippings_shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Shippings_shipping_id_seq"', 1, true);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 233
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 3, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 229
-- Name: communications_communication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.communications_communication_id_seq', 1, false);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 219
-- Name: customizations_customization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customizations_customization_id_seq', 1, false);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 231
-- Name: feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_feedback_id_seq', 1, false);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 223
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_order_item_id_seq', 1, false);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 1, false);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 10, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 227
-- Name: shipping_shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_shipping_id_seq', 1, false);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 4835 (class 2606 OID 16663)
-- Name: Communications Communications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Communications"
    ADD CONSTRAINT "Communications_pkey" PRIMARY KEY (communication_id);


--
-- TOC entry 4837 (class 2606 OID 16673)
-- Name: Feedbacks Feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedbacks"
    ADD CONSTRAINT "Feedbacks_pkey" PRIMARY KEY (feedback_id);


--
-- TOC entry 4829 (class 2606 OID 16636)
-- Name: OrderItems OrderItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItems"
    ADD CONSTRAINT "OrderItems_pkey" PRIMARY KEY (order_item_id);


--
-- TOC entry 4827 (class 2606 OID 16627)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (order_id);


--
-- TOC entry 4831 (class 2606 OID 16645)
-- Name: Payments Payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments"
    ADD CONSTRAINT "Payments_pkey" PRIMARY KEY (payment_id);


--
-- TOC entry 4825 (class 2606 OID 16620)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 4833 (class 2606 OID 16654)
-- Name: Shippings Shippings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shippings"
    ADD CONSTRAINT "Shippings_pkey" PRIMARY KEY (shipping_id);


--
-- TOC entry 4821 (class 2606 OID 16611)
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- TOC entry 4823 (class 2606 OID 16609)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 16537)
-- Name: communications communications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications
    ADD CONSTRAINT communications_pkey PRIMARY KEY (communication_id);


--
-- TOC entry 4807 (class 2606 OID 16461)
-- Name: customizations customizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customizations
    ADD CONSTRAINT customizations_pkey PRIMARY KEY (customization_id);


--
-- TOC entry 4819 (class 2606 OID 16553)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 4811 (class 2606 OID 16485)
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 4809 (class 2606 OID 16471)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4813 (class 2606 OID 16506)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4805 (class 2606 OID 16451)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4815 (class 2606 OID 16522)
-- Name: shipping shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_pkey PRIMARY KEY (shipping_id);


--
-- TOC entry 4799 (class 2606 OID 16441)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4801 (class 2606 OID 16437)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4803 (class 2606 OID 16439)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4843 (class 2606 OID 16538)
-- Name: communications communications_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications
    ADD CONSTRAINT communications_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4844 (class 2606 OID 16559)
-- Name: feedback feedback_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4845 (class 2606 OID 16554)
-- Name: feedback feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4839 (class 2606 OID 16486)
-- Name: orderitems orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4840 (class 2606 OID 16491)
-- Name: orderitems orderitems_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4838 (class 2606 OID 16472)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4841 (class 2606 OID 16507)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4842 (class 2606 OID 16523)
-- Name: shipping shipping_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


-- Completed on 2024-08-12 17:56:43

--
-- PostgreSQL database dump complete
--

