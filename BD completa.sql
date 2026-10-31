--
-- PostgreSQL database dump
--

\restrict vJjFbabBE35wmcys8zsaQ9sYHv1lmpGjV9jV0W3wBCUgU7LFNpdE9duEx4aMqnm

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-30 20:30:34

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
-- TOC entry 224 (class 1259 OID 25107)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    categoria_id integer NOT NULL,
    nombre character varying(80) NOT NULL,
    descripcion text,
    activa boolean DEFAULT true
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24798)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    estado_id integer NOT NULL
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25132)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    cliente_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(60) NOT NULL,
    email character varying(100),
    telefono character varying(20),
    ciudad_id integer,
    estado character varying(50),
    region_id integer,
    fecha_registro date,
    tipo_cliente character varying(20) DEFAULT 'regular'::character varying
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25075)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamento_id integer NOT NULL,
    nombre character varying(80) NOT NULL,
    presupuesto numeric(12,2),
    region_id integer
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25172)
-- Name: detalle_pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pedidos (
    detalle_id integer NOT NULL,
    pedido_id integer,
    producto_id integer,
    cantidad integer DEFAULT 1 NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    descuento_linea numeric(5,2) DEFAULT 0
);


ALTER TABLE public.detalle_pedidos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25087)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    empleado_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    email character varying(100),
    puesto character varying(60),
    salario numeric(10,2),
    fecha_contrato date,
    departamento_id integer,
    jefe_id integer
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24622)
-- Name: estados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estados OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25148)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    pedido_id integer NOT NULL,
    cliente_id integer,
    empleado_id integer,
    fecha_pedido date NOT NULL,
    fecha_entrega date,
    estado character varying(20) DEFAULT 'pendiente'::character varying,
    total numeric(12,2),
    descuento numeric(5,2) DEFAULT 0,
    metodo_pago character varying(30),
    region_id integer
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25117)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    producto_id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    marca character varying(50),
    modelo character varying(60),
    categoria_id integer,
    precio_compra numeric(10,2),
    precio_venta numeric(10,2),
    stock integer DEFAULT 0,
    stock_minimo integer DEFAULT 5,
    activo boolean DEFAULT true
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25066)
-- Name: regiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regiones (
    region_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    pais character varying(50) DEFAULT 'México'::character varying NOT NULL
);


ALTER TABLE public.regiones OWNER TO postgres;

--
-- TOC entry 5094 (class 0 OID 25107)
-- Dependencies: 224
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (categoria_id, nombre, descripcion, activa) FROM stdin;
1	Smartphones	Teléfonos inteligentes y accesorios	t
2	Laptops	Computadoras portátiles de todas las marcas	t
3	Tablets	Tabletas electrónicas	t
4	Televisores	Pantallas y televisores	t
5	Audio	Audífonos, bocinas y equipos de sonido	t
6	Gaming	Consolas, videojuegos y accesorios	t
7	Cámaras	Cámaras fotográficas y de video	t
8	Wearables	Relojes inteligentes y pulseras fitness	t
9	Hogar Inteligente	Dispositivos para el hogar conectado	t
10	Accesorios	Cables, cargadores y periféricos	t
11	Impresoras	Impresoras y escáneres	t
12	Componentes PC	Procesadores, RAM, almacenamiento	t
13	Redes	Routers, switches y equipos de red	t
14	Energía	Baterías, cargadores y UPS	t
15	Software	Licencias y suscripciones de software	f
\.


--
-- TOC entry 5090 (class 0 OID 24798)
-- Dependencies: 220
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudades (id, nombre, estado_id) FROM stdin;
1	Acapulco	7
2	Aguascalientes	1
3	Chihuahua	4
4	Ciudad de México	3
5	Culiacán	14
6	Guadalajara	8
7	Hermosillo	15
8	Juárez	4
9	León	6
10	Mérida	17
11	Mexicali	2
12	Monterrey	10
13	Morelia	9
14	Puebla	11
15	Querétaro	12
16	Saltillo	5
17	San Luis Potosí	13
18	Tijuana	2
19	Veracruz	16
20	Zapopan	8
\.


--
-- TOC entry 5096 (class 0 OID 25132)
-- Dependencies: 226
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (cliente_id, nombre, apellido, email, telefono, ciudad_id, estado, region_id, fecha_registro, tipo_cliente) FROM stdin;
16	Pablo	Vargas García	pablo16@gmail.com	5529505652	1	Guerrero	2	2023-01-29	regular
18	Alberto	Hernández Herrera	alberto18@gmail.com	5595938445	1	Guerrero	2	2023-12-25	regular
29	Carmen	Ramos Moreno	carmen29@gmail.com	5535523849	1	Guerrero	2	2022-04-24	regular
32	Claudia	Castro Castro	claudia32@gmail.com	5546874043	1	Guerrero	2	2025-06-02	nuevo
28	Valeria	López Gutiérrez	valeria28@gmail.com	5573962190	2	Aguascalientes	5	2024-06-17	regular
41	Alejandro	Morales Aguilar	alejandro41@gmail.com	5570378491	2	Aguascalientes	5	2024-12-26	regular
44	Mónica	Vargas González	mónica44@gmail.com	5595977279	2	Aguascalientes	5	2024-01-30	premium
59	Andrés	Ramírez Castillo	andrés59@gmail.com	5535204672	2	Aguascalientes	5	2026-05-03	regular
15	Fernando	Reyes Gómez	fernando15@gmail.com	5583897088	3	Chihuahua	1	2022-07-15	premium
55	Diego	Herrera Morales	diego55@hotmail.com	5549315407	3	Chihuahua	1	2025-02-23	premium
57	Fernanda	Sánchez Ramírez	fernanda57@hotmail.com	5579338228	3	Chihuahua	1	2021-12-01	premium
60	María	Rodríguez Martínez	maría60@yahoo.com	5568843284	4	CDMX	5	2025-02-20	regular
4	Adriana	Moreno Reyes	adriana4@hotmail.com	5555992559	5	Sinaloa	7	2023-02-06	regular
14	Patricia	Vega Vega	patricia14@gmail.com	5540839382	5	Sinaloa	7	2022-01-20	premium
25	Liliana	Morales Herrera	liliana25@yahoo.com	5571585593	5	Sinaloa	7	2023-02-26	mayorista
34	Manuel	Hernández Reyes	manuel34@hotmail.com	5533461307	5	Sinaloa	7	2025-10-08	premium
43	Carmen	Herrera Torres	carmen43@hotmail.com	5575430302	5	Sinaloa	7	2021-06-16	regular
53	Gabriela	Núñez Rivera	gabriela53@yahoo.com	5522019737	5	Sinaloa	7	2024-09-19	regular
61	Fernando	Flores Díaz	fernando61@hotmail.com	5559848072	5	Sinaloa	7	2022-07-15	premium
31	José	Moreno Moreno	josé31@yahoo.com	5582675403	6	Jalisco	4	2021-09-09	regular
33	Isabel	Gómez Sánchez	isabel33@gmail.com	5527212880	6	Jalisco	4	2023-07-01	premium
50	Juan	González Reyes	juan50@gmail.com	5513834774	6	Jalisco	4	2022-09-22	regular
30	Isabel	Pérez Sánchez	isabel30@yahoo.com	5593026670	7	Sonora	7	2025-07-27	premium
35	Carlos	García Moreno	carlos35@hotmail.com	5553679307	7	Sonora	7	2023-01-04	mayorista
54	Sergio	García García	sergio54@gmail.com	5528293937	7	Sonora	7	2024-11-01	regular
12	Manuel	Díaz Ortega	manuel12@yahoo.com	5563345392	8	Chihuahua	1	2024-02-16	regular
38	Isabel	Mendoza Sánchez	isabel38@gmail.com	5561121302	8	Chihuahua	1	2025-08-17	mayorista
42	Isabel	Rivera García	isabel42@yahoo.com	5591279039	8	Chihuahua	1	2023-03-18	regular
1	Patricia	Vargas Reyes	patricia1@hotmail.com	5517504382	9	Guanajuato	5	2024-12-30	vip
36	Alejandro	Sánchez Ramírez	alejandro36@hotmail.com	5559113508	9	Guanajuato	5	2023-08-25	regular
20	Ricardo	Vargas García	ricardo20@gmail.com	5521655844	10	Yucatán	8	2022-01-27	regular
5	Pablo	González Martínez	pablo5@hotmail.com	5577693989	11	Baja California	7	2021-10-23	regular
7	Juan	Castro Jiménez	juan7@gmail.com	5510161088	11	Baja California	7	2023-07-08	regular
11	Fernando	Castillo Mendoza	fernando11@yahoo.com	5530774029	11	Baja California	7	2022-10-16	regular
9	Liliana	Martínez Díaz	liliana9@yahoo.com	5541207351	12	Nuevo León	6	2024-11-08	regular
21	Fernanda	Ortega Pérez	fernanda21@gmail.com	5519209640	12	Nuevo León	6	2023-05-13	regular
47	Roberto	Vega García	roberto47@yahoo.com	5543775489	12	Nuevo León	6	2025-04-06	regular
6	Diego	Castro Jiménez	diego6@gmail.com	5581327320	13	Michoacán	2	2022-03-24	regular
39	Claudia	Mendoza García	claudia39@yahoo.com	5594644676	13	Michoacán	2	2023-06-14	premium
48	José	Núñez Castro	josé48@yahoo.com	5563286118	13	Michoacán	2	2022-02-26	nuevo
64	Miguel	Pérez Cruz	miguel64@gmail.com	5522611138	13	Michoacán	2	2022-09-17	nuevo
23	Pablo	Ortega García	pablo23@yahoo.com	5524289484	15	Querétaro	5	2026-01-14	regular
51	Claudia	Cruz Vega	claudia51@gmail.com	5546562845	15	Querétaro	5	2023-12-13	regular
62	Juan	Hernández Ramírez	juan62@gmail.com	5519581091	15	Querétaro	5	2023-10-23	regular
8	Sandra	Díaz Sánchez	sandra8@gmail.com	5574709513	16	Coahuila	6	2024-06-24	regular
17	Ricardo	Rivera López	ricardo17@gmail.com	5561583363	16	Coahuila	6	2023-01-01	premium
40	Gabriela	Ramírez Gutiérrez	gabriela40@gmail.com	5516403434	16	Coahuila	6	2025-11-21	premium
2	Fernanda	Jiménez Ortega	fernanda2@gmail.com	5598817918	17	San Luis Potosí	5	2025-12-18	regular
13	Carmen	Rivera Gutiérrez	carmen13@gmail.com	5544061458	17	San Luis Potosí	5	2023-03-16	regular
45	Laura	López Rodríguez	laura45@yahoo.com	5597645934	17	San Luis Potosí	5	2022-06-18	regular
49	Alberto	González López	alberto49@gmail.com	5562324272	17	San Luis Potosí	5	2025-02-27	regular
3	Claudia	Vega Morales	claudia3@hotmail.com	5590643207	18	Baja California	7	2021-12-27	regular
37	Eduardo	Rivera Vega	eduardo37@yahoo.com	5586693314	18	Baja California	7	2023-03-20	premium
58	Manuel	Mendoza Ramírez	manuel58@hotmail.com	5534482277	18	Baja California	7	2024-10-26	regular
10	Isabel	Pérez García	isabel10@gmail.com	5510954835	19	Veracruz	3	2023-07-07	regular
24	Luis	Mendoza Reyes	luis24@gmail.com	5582196170	19	Veracruz	3	2025-01-15	premium
46	Isabel	Castro Cruz	isabel46@gmail.com	5558743159	19	Veracruz	3	2023-07-11	nuevo
52	Verónica	Rodríguez Ortega	verónica52@gmail.com	5594697764	19	Veracruz	3	2024-01-03	regular
90	Liliana	Núñez Pérez	liliana90@gmail.com	5553579429	1	Guerrero	2	2025-06-22	regular
87	Gabriela	García Torres	gabriela87@gmail.com	5538833029	2	Aguascalientes	5	2026-04-28	premium
106	Pablo	Sánchez Gómez	pablo106@gmail.com	5523368583	2	Aguascalientes	5	2023-09-23	mayorista
114	Patricia	Vargas Núñez	patricia114@gmail.com	5531212832	2	Aguascalientes	5	2026-01-24	regular
68	Patricia	Rivera Herrera	patricia68@yahoo.com	5522267708	3	Chihuahua	1	2024-07-18	vip
74	Roberto	Castro García	roberto74@gmail.com	5558865345	3	Chihuahua	1	2025-02-07	regular
122	Pablo	Ramos Flores	pablo122@hotmail.com	5586763742	3	Chihuahua	1	2023-06-09	regular
125	Sergio	Herrera Aguilar	sergio125@yahoo.com	5549516346	3	Chihuahua	1	2026-02-20	premium
73	Sergio	Aguilar Ramírez	sergio73@gmail.com	5570945449	4	CDMX	5	2022-02-03	premium
78	Liliana	Ramírez Hernández	liliana78@hotmail.com	5519512542	4	CDMX	5	2025-04-10	premium
103	Verónica	Morales Jiménez	verónica103@gmail.com	5528971329	4	CDMX	5	2024-05-01	regular
107	Carmen	Pérez Reyes	carmen107@gmail.com	5585254207	4	CDMX	5	2026-03-22	regular
115	Sofía	Rodríguez Flores	sofía115@gmail.com	5529531743	4	CDMX	5	2022-02-25	regular
127	Verónica	González Gómez	verónica127@yahoo.com	5534008676	5	Sinaloa	7	2023-02-19	mayorista
76	David	Martínez Martínez	david76@gmail.com	5518949617	6	Jalisco	4	2021-10-05	vip
80	Eduardo	Mendoza Castillo	eduardo80@hotmail.com	5581003974	6	Jalisco	4	2022-04-30	regular
86	Daniela	Cruz Cruz	daniela86@gmail.com	5510026256	6	Jalisco	4	2024-11-06	regular
94	Manuel	Ortega González	manuel94@hotmail.com	5530561818	6	Jalisco	4	2022-09-01	premium
124	Ana	Gutiérrez Gómez	ana124@gmail.com	5594644215	6	Jalisco	4	2025-05-19	regular
84	Adriana	Cruz Núñez	adriana84@yahoo.com	5553574336	7	Sonora	7	2024-02-18	premium
105	Laura	Gómez Moreno	laura105@hotmail.com	5598597172	7	Sonora	7	2021-08-06	regular
108	Valeria	Morales Gómez	valeria108@gmail.com	5512465878	7	Sonora	7	2022-08-10	regular
70	Manuel	Mendoza Vargas	manuel70@gmail.com	5568883853	8	Chihuahua	1	2026-04-29	premium
81	Fernando	Reyes Martínez	fernando81@yahoo.com	5561718263	8	Chihuahua	1	2025-05-12	regular
100	Mónica	Jiménez González	mónica100@hotmail.com	5541338443	8	Chihuahua	1	2022-08-08	regular
102	Gabriela	Cruz Morales	gabriela102@yahoo.com	5582209870	8	Chihuahua	1	2025-04-20	regular
119	Eduardo	Rodríguez Vega	eduardo119@yahoo.com	5531983035	8	Chihuahua	1	2025-03-05	regular
120	María	Núñez Ramírez	maría120@gmail.com	5539870720	8	Chihuahua	1	2022-03-13	regular
126	Mónica	Aguilar Vargas	mónica126@hotmail.com	5525189633	9	Guanajuato	5	2022-01-29	regular
89	Juan	González Ramírez	juan89@hotmail.com	5541271945	10	Yucatán	8	2021-11-23	regular
104	Ana	Ramírez Rodríguez	ana104@yahoo.com	5592941828	10	Yucatán	8	2026-02-23	regular
109	Elena	Reyes Ramírez	elena109@gmail.com	5593992429	10	Yucatán	8	2021-07-08	regular
116	Alejandra	Torres Cruz	alejandra116@gmail.com	5595476210	10	Yucatán	8	2025-08-04	premium
117	Roberto	García Herrera	roberto117@gmail.com	5592805158	10	Yucatán	8	2023-01-18	regular
65	Sergio	Núñez Flores	sergio65@hotmail.com	5583763371	13	Michoacán	2	2025-10-04	regular
83	Alejandra	Castro Martínez	alejandra83@yahoo.com	5563896091	13	Michoacán	2	2024-07-20	premium
69	Ana	Hernández Rivera	ana69@gmail.com	5581988124	14	Puebla	3	2025-09-27	regular
92	David	Rivera Castro	david92@gmail.com	5565904597	14	Puebla	3	2021-07-26	premium
128	Mónica	López Ramírez	mónica128@hotmail.com	5532010905	14	Puebla	3	2025-12-07	regular
72	Roberto	Gutiérrez Rivera	roberto72@yahoo.com	5590353461	15	Querétaro	5	2025-07-18	regular
79	Laura	Cruz Mendoza	laura79@gmail.com	5558442674	15	Querétaro	5	2022-04-11	vip
77	Miguel	Pérez Martínez	miguel77@yahoo.com	5586639957	16	Coahuila	6	2022-10-03	regular
85	David	Jiménez Sánchez	david85@gmail.com	5538712948	16	Coahuila	6	2022-02-24	regular
93	Adriana	Núñez García	adriana93@gmail.com	5594851591	16	Coahuila	6	2026-02-21	regular
96	Juan	Flores López	juan96@hotmail.com	5583571770	16	Coahuila	6	2024-12-21	regular
71	Juan	Ramírez Castro	juan71@hotmail.com	5585031037	17	San Luis Potosí	5	2023-05-27	premium
99	Eduardo	Rivera Pérez	eduardo99@hotmail.com	5513248985	17	San Luis Potosí	5	2025-06-30	nuevo
101	Laura	Martínez Ramos	laura101@hotmail.com	5529820881	17	San Luis Potosí	5	2026-05-14	regular
75	Manuel	Aguilar Gómez	manuel75@hotmail.com	5584016756	18	Baja California	7	2023-01-03	regular
110	María	Gutiérrez Ramírez	maría110@yahoo.com	5562726977	18	Baja California	7	2025-12-14	premium
112	Adriana	Flores Cruz	adriana112@gmail.com	5537750491	18	Baja California	7	2023-03-10	regular
113	Patricia	Torres Castillo	patricia113@gmail.com	5580303981	18	Baja California	7	2024-01-13	nuevo
118	Ricardo	Sánchez Moreno	ricardo118@yahoo.com	5573968467	18	Baja California	7	2023-08-18	mayorista
67	Alejandro	Ortega Martínez	alejandro67@yahoo.com	5515636254	19	Veracruz	3	2022-01-19	premium
82	Roberto	Gutiérrez Ramos	roberto82@gmail.com	5524161873	19	Veracruz	3	2024-06-08	premium
88	Isabel	Núñez Gutiérrez	isabel88@gmail.com	5586593789	19	Veracruz	3	2025-07-30	regular
91	Liliana	Aguilar Núñez	liliana91@hotmail.com	5515015930	19	Veracruz	3	2024-04-21	regular
97	Patricia	Herrera González	patricia97@yahoo.com	5563058791	19	Veracruz	3	2025-05-06	regular
98	Sandra	Sánchez Sánchez	sandra98@hotmail.com	5553407575	19	Veracruz	3	2025-12-10	regular
146	Ramón	Jiménez García	ramón146@gmail.com	5536040330	2	Aguascalientes	5	2021-10-08	regular
167	Alberto	Sánchez Gutiérrez	alberto167@yahoo.com	5518866414	2	Aguascalientes	5	2025-04-11	mayorista
129	Eduardo	López Reyes	eduardo129@gmail.com	5578674708	3	Chihuahua	1	2025-07-19	regular
134	Alberto	García Sánchez	alberto134@gmail.com	5547327686	3	Chihuahua	1	2022-12-02	regular
150	Pablo	Vargas Gutiérrez	pablo150@gmail.com	5586635858	3	Chihuahua	1	2024-04-05	regular
160	Miguel	Martínez Gómez	miguel160@yahoo.com	5534022690	3	Chihuahua	1	2023-02-14	premium
145	Isabel	Mendoza López	isabel145@hotmail.com	5553476321	4	CDMX	5	2025-10-21	premium
171	Fernando	Aguilar González	fernando171@gmail.com	5595380301	4	CDMX	5	2022-03-14	regular
132	Rosa	García Jiménez	rosa132@gmail.com	5511638498	5	Sinaloa	7	2023-08-27	mayorista
135	Ana	Rodríguez González	ana135@yahoo.com	5529511823	6	Jalisco	4	2022-09-14	regular
190	Isabel	Mendoza Castillo	isabel190@yahoo.com	5580784933	6	Jalisco	4	2024-07-09	nuevo
192	Carmen	Pérez Ortega	carmen192@gmail.com	5556315279	6	Jalisco	4	2022-11-04	regular
173	Ramón	Mendoza Núñez	ramón173@gmail.com	5568348074	7	Sonora	7	2025-12-11	regular
181	Francisco	Ramírez Díaz	francisco181@gmail.com	5587356703	7	Sonora	7	2026-04-04	nuevo
143	Gabriela	Pérez García	gabriela143@yahoo.com	5525827722	8	Chihuahua	1	2021-12-17	premium
144	Miguel	Flores Rivera	miguel144@gmail.com	5595564277	8	Chihuahua	1	2026-05-19	premium
152	Sergio	Pérez Reyes	sergio152@yahoo.com	5515019076	8	Chihuahua	1	2025-12-04	regular
154	Luis	Aguilar Reyes	luis154@gmail.com	5527812995	8	Chihuahua	1	2022-05-20	regular
172	Manuel	Torres Gómez	manuel172@gmail.com	5570016768	8	Chihuahua	1	2025-04-16	premium
136	Valeria	Núñez López	valeria136@yahoo.com	5533924094	9	Guanajuato	5	2022-09-04	regular
176	Fernanda	Gómez Díaz	fernanda176@gmail.com	5598917575	9	Guanajuato	5	2023-10-13	regular
138	Sergio	Flores Rivera	sergio138@gmail.com	5519082067	11	Baja California	7	2021-09-18	regular
149	Verónica	Gutiérrez García	verónica149@hotmail.com	5557458790	12	Nuevo León	6	2025-08-10	regular
151	Sergio	Castillo Vega	sergio151@yahoo.com	5565548633	12	Nuevo León	6	2023-08-29	mayorista
155	Francisco	Martínez García	francisco155@yahoo.com	5589763928	12	Nuevo León	6	2024-07-29	regular
161	Mónica	Jiménez Rivera	mónica161@hotmail.com	5581603135	12	Nuevo León	6	2022-03-17	premium
168	Alejandra	Ortega Mendoza	alejandra168@hotmail.com	5533231136	12	Nuevo León	6	2022-04-19	vip
178	Patricia	Ramos Castro	patricia178@yahoo.com	5528223512	12	Nuevo León	6	2025-09-03	premium
139	Juan	Martínez Castillo	juan139@gmail.com	5554185620	13	Michoacán	2	2024-02-15	regular
140	Adriana	Hernández Martínez	adriana140@gmail.com	5594420078	13	Michoacán	2	2025-12-14	regular
141	Gabriela	Díaz Jiménez	gabriela141@gmail.com	5544850980	13	Michoacán	2	2023-03-22	nuevo
148	Valeria	Cruz Mendoza	valeria148@gmail.com	5517519183	13	Michoacán	2	2024-10-06	regular
153	Diego	Castro Reyes	diego153@yahoo.com	5574890505	13	Michoacán	2	2024-09-14	premium
182	Daniela	Martínez Ortega	daniela182@hotmail.com	5529070658	13	Michoacán	2	2021-08-17	nuevo
157	Valeria	Pérez Pérez	valeria157@hotmail.com	5569205536	14	Puebla	3	2024-11-30	regular
162	Laura	Aguilar Mendoza	laura162@gmail.com	5572850928	14	Puebla	3	2023-11-21	regular
158	Carlos	Jiménez Gutiérrez	carlos158@gmail.com	5537726346	15	Querétaro	5	2024-06-24	regular
159	Sergio	Ortega Sánchez	sergio159@yahoo.com	5555464764	15	Querétaro	5	2023-12-16	regular
166	Luis	Flores Gutiérrez	luis166@gmail.com	5550549608	15	Querétaro	5	2023-11-10	regular
169	Claudia	Martínez Ortega	claudia169@gmail.com	5553671508	15	Querétaro	5	2025-11-24	mayorista
174	Sandra	Gómez Vega	sandra174@yahoo.com	5559556257	15	Querétaro	5	2026-02-23	regular
191	Adriana	Núñez Aguilar	adriana191@yahoo.com	5565424925	16	Coahuila	6	2025-02-09	premium
131	Miguel	Díaz Torres	miguel131@hotmail.com	5569895766	17	San Luis Potosí	5	2022-12-07	regular
184	Laura	Moreno Vargas	laura184@gmail.com	5587796412	17	San Luis Potosí	5	2023-01-03	regular
130	Roberto	Núñez Flores	roberto130@gmail.com	5598520663	18	Baja California	7	2025-07-14	mayorista
147	Claudia	Mendoza Hernández	claudia147@gmail.com	5574625235	18	Baja California	7	2022-12-05	regular
177	Daniela	Aguilar Díaz	daniela177@hotmail.com	5599934747	18	Baja California	7	2025-09-09	regular
188	Francisco	López Vega	francisco188@gmail.com	5543829709	18	Baja California	7	2022-12-28	regular
189	María	Ramos Martínez	maría189@gmail.com	5589426041	18	Baja California	7	2022-10-01	regular
137	Adriana	Ortega Mendoza	adriana137@gmail.com	5571114408	19	Veracruz	3	2024-06-04	vip
156	Francisco	Herrera Moreno	francisco156@gmail.com	5513017249	19	Veracruz	3	2022-03-11	regular
165	Diego	Cruz Vega	diego165@hotmail.com	5591126594	19	Veracruz	3	2025-09-24	regular
175	Daniela	Martínez Vega	daniela175@yahoo.com	5567943873	19	Veracruz	3	2024-03-26	premium
180	Andrés	Gómez Rivera	andrés180@yahoo.com	5510997236	19	Veracruz	3	2023-08-26	mayorista
185	Carlos	Morales Cruz	carlos185@gmail.com	5572979305	19	Veracruz	3	2022-05-01	regular
186	Sergio	Torres Rodríguez	sergio186@hotmail.com	5550811697	19	Veracruz	3	2024-12-25	regular
193	Ana	Rodríguez Cruz	ana193@yahoo.com	5581473736	20	Jalisco	4	2024-04-25	premium
227	Rosa	Ramírez Hernández	rosa227@hotmail.com	5573674613	1	Guerrero	2	2025-06-15	regular
250	Roberto	Torres López	roberto250@yahoo.com	5529858055	1	Guerrero	2	2025-08-07	mayorista
209	Claudia	Martínez Ortega	claudia209@gmail.com	5558173202	2	Aguascalientes	5	2022-08-15	regular
204	Isabel	Aguilar Ramírez	isabel204@yahoo.com	5536933352	3	Chihuahua	1	2024-03-29	regular
228	Ana	Vargas Rivera	ana228@yahoo.com	5554868265	3	Chihuahua	1	2021-12-06	mayorista
243	Alberto	Gutiérrez Ortega	alberto243@gmail.com	5520866138	3	Chihuahua	1	2021-07-04	regular
198	Valeria	Gutiérrez García	valeria198@gmail.com	5519120357	4	CDMX	5	2024-02-20	regular
222	Alberto	Gómez Herrera	alberto222@hotmail.com	5520834405	4	CDMX	5	2026-05-28	regular
202	Carmen	Ramírez Torres	carmen202@hotmail.com	5595735668	5	Sinaloa	7	2024-11-22	premium
205	Juan	Gutiérrez Herrera	juan205@hotmail.com	5524260594	5	Sinaloa	7	2022-06-07	regular
217	Roberto	Vargas Hernández	roberto217@gmail.com	5523058343	5	Sinaloa	7	2023-01-07	regular
240	José	García Morales	josé240@gmail.com	5531716808	5	Sinaloa	7	2021-08-19	regular
203	Valeria	Ramírez Rodríguez	valeria203@gmail.com	5547216895	6	Jalisco	4	2024-04-19	regular
216	Ana	Ramos González	ana216@yahoo.com	5592996496	6	Jalisco	4	2025-01-30	premium
224	Andrés	Díaz Sánchez	andrés224@gmail.com	5591945021	6	Jalisco	4	2023-02-06	regular
238	María	Díaz Hernández	maría238@yahoo.com	5577674770	6	Jalisco	4	2024-01-22	regular
241	Mónica	Cruz Herrera	mónica241@hotmail.com	5534822996	7	Sonora	7	2022-12-06	regular
244	Sandra	Núñez Moreno	sandra244@yahoo.com	5561399349	7	Sonora	7	2023-11-01	premium
199	Andrés	Rivera Sánchez	andrés199@gmail.com	5543808923	8	Chihuahua	1	2026-04-03	regular
212	Eduardo	Morales López	eduardo212@gmail.com	5568785183	8	Chihuahua	1	2025-08-29	regular
232	Laura	Morales Ortega	laura232@hotmail.com	5529453688	8	Chihuahua	1	2023-01-10	regular
233	Juan	Cruz Ramos	juan233@yahoo.com	5546197787	8	Chihuahua	1	2024-07-24	regular
245	Roberto	Vargas Gutiérrez	roberto245@gmail.com	5585263692	8	Chihuahua	1	2025-09-01	nuevo
246	Luis	Vargas Morales	luis246@gmail.com	5587862305	8	Chihuahua	1	2022-03-22	premium
229	Luis	Ramos Hernández	luis229@gmail.com	5533607235	9	Guanajuato	5	2022-01-15	regular
234	Ana	Ramírez González	ana234@yahoo.com	5566133052	9	Guanajuato	5	2022-03-07	regular
235	Adriana	Rodríguez Mendoza	adriana235@gmail.com	5592077910	9	Guanajuato	5	2023-03-16	nuevo
255	Roberto	Jiménez Núñez	roberto255@hotmail.com	5534465275	9	Guanajuato	5	2021-09-27	premium
247	Eduardo	Castro Ramírez	eduardo247@gmail.com	5566764586	10	Yucatán	8	2026-02-20	regular
195	Sandra	Moreno Hernández	sandra195@hotmail.com	5557490002	11	Baja California	7	2023-01-08	vip
225	José	Vargas Aguilar	josé225@gmail.com	5556688115	11	Baja California	7	2026-06-02	regular
231	Valeria	Sánchez Herrera	valeria231@yahoo.com	5541825487	11	Baja California	7	2021-07-26	regular
239	Luis	Cruz Morales	luis239@hotmail.com	5511667385	11	Baja California	7	2025-03-22	regular
210	José	Rivera Gutiérrez	josé210@gmail.com	5555642455	12	Nuevo León	6	2021-09-23	regular
220	Rosa	Herrera Hernández	rosa220@gmail.com	5555030548	12	Nuevo León	6	2025-10-07	regular
197	Elena	Ramos Moreno	elena197@gmail.com	5536162482	13	Michoacán	2	2024-07-20	premium
226	Francisco	Martínez Jiménez	francisco226@hotmail.com	5582440371	13	Michoacán	2	2025-03-19	regular
252	Carlos	Torres Pérez	carlos252@hotmail.com	5541182544	13	Michoacán	2	2022-10-30	regular
200	Alberto	Moreno Castro	alberto200@gmail.com	5590448089	14	Puebla	3	2022-06-22	nuevo
208	Claudia	Morales Díaz	claudia208@hotmail.com	5519408620	15	Querétaro	5	2025-03-06	regular
219	Pablo	Flores Martínez	pablo219@gmail.com	5587304983	15	Querétaro	5	2025-09-03	regular
248	Diego	Reyes Reyes	diego248@gmail.com	5573104323	15	Querétaro	5	2022-08-22	mayorista
253	Valeria	Morales Ortega	valeria253@gmail.com	5581157706	15	Querétaro	5	2023-12-13	regular
214	Mónica	García Hernández	mónica214@yahoo.com	5515746469	16	Coahuila	6	2025-10-12	regular
194	Alejandro	González Reyes	alejandro194@gmail.com	5511592230	17	San Luis Potosí	5	2021-12-22	regular
211	Rosa	Rodríguez Gutiérrez	rosa211@yahoo.com	5535636010	17	San Luis Potosí	5	2022-07-17	regular
213	Ramón	Sánchez Morales	ramón213@hotmail.com	5596356711	17	San Luis Potosí	5	2023-08-23	regular
206	José	Ortega Ramos	josé206@yahoo.com	5576800348	18	Baja California	7	2022-10-13	premium
215	Sandra	Cruz Moreno	sandra215@gmail.com	5582016051	18	Baja California	7	2022-04-16	regular
223	Ramón	Castro Torres	ramón223@hotmail.com	5573889312	18	Baja California	7	2025-04-15	regular
251	María	Torres Díaz	maría251@gmail.com	5582670169	18	Baja California	7	2023-10-15	regular
256	Patricia	Rodríguez Sánchez	patricia256@hotmail.com	5587111463	18	Baja California	7	2023-12-22	regular
196	Valeria	Ramírez Ramírez	valeria196@gmail.com	5544271680	19	Veracruz	3	2024-04-01	regular
201	Alberto	González Gómez	alberto201@gmail.com	5596960449	19	Veracruz	3	2021-12-10	nuevo
207	Fernanda	Ramírez González	fernanda207@gmail.com	5562523472	19	Veracruz	3	2026-06-04	regular
230	Laura	Castro Sánchez	laura230@gmail.com	5589551741	19	Veracruz	3	2024-08-13	regular
236	Laura	Díaz Vega	laura236@gmail.com	5539050434	19	Veracruz	3	2023-10-16	mayorista
258	Verónica	Torres Martínez	verónica258@gmail.com	5564299436	1	Guerrero	2	2022-02-19	regular
271	Elena	García Mendoza	elena271@yahoo.com	5595973864	1	Guerrero	2	2025-09-30	premium
281	Andrés	Núñez López	andrés281@yahoo.com	5512332623	1	Guerrero	2	2024-06-28	regular
300	Patricia	García Martínez	patricia300@gmail.com	5519157497	1	Guerrero	2	2022-08-23	regular
291	Eduardo	Gómez Díaz	eduardo291@yahoo.com	5525145863	2	Aguascalientes	5	2025-10-01	regular
308	Eduardo	Rivera Mendoza	eduardo308@gmail.com	5513610435	2	Aguascalientes	5	2024-04-23	regular
312	Ramón	Martínez Mendoza	ramón312@hotmail.com	5537636546	2	Aguascalientes	5	2023-08-29	regular
315	Laura	Castillo Vega	laura315@gmail.com	5589438729	2	Aguascalientes	5	2024-11-29	regular
286	José	Torres Moreno	josé286@yahoo.com	5526615289	3	Chihuahua	1	2025-04-17	regular
261	Ana	González Moreno	ana261@gmail.com	5551350093	4	CDMX	5	2024-03-11	premium
289	Fernando	Torres Rodríguez	fernando289@gmail.com	5582091897	4	CDMX	5	2022-05-18	regular
311	Alejandra	Ramírez García	alejandra311@gmail.com	5588918579	4	CDMX	5	2024-09-01	regular
260	Sergio	Herrera Ortega	sergio260@gmail.com	5585864089	5	Sinaloa	7	2024-07-18	premium
265	Daniela	Gómez Rivera	daniela265@yahoo.com	5551350514	5	Sinaloa	7	2021-07-17	regular
290	Francisco	Vega Castillo	francisco290@hotmail.com	5534847161	5	Sinaloa	7	2022-09-01	nuevo
310	Gabriela	Martínez Flores	gabriela310@hotmail.com	5515016739	5	Sinaloa	7	2022-10-03	mayorista
318	Sandra	Vega Rodríguez	sandra318@gmail.com	5538582041	5	Sinaloa	7	2024-12-10	vip
285	Ana	Pérez Martínez	ana285@hotmail.com	5589614758	6	Jalisco	4	2023-10-25	regular
292	Claudia	Herrera Rivera	claudia292@gmail.com	5584777007	6	Jalisco	4	2025-12-25	regular
306	Verónica	Ortega Morales	verónica306@hotmail.com	5578006116	6	Jalisco	4	2024-04-01	regular
307	Fernanda	Jiménez Moreno	fernanda307@hotmail.com	5553014471	6	Jalisco	4	2026-04-15	regular
319	Adriana	Vega Herrera	adriana319@gmail.com	5585982862	6	Jalisco	4	2023-07-08	regular
264	Alberto	Jiménez Reyes	alberto264@gmail.com	5599491869	7	Sonora	7	2024-03-19	regular
275	Andrés	Castro Castillo	andrés275@yahoo.com	5546597195	7	Sonora	7	2024-02-03	premium
294	Alejandra	Pérez Vega	alejandra294@hotmail.com	5573844258	7	Sonora	7	2025-06-09	regular
298	Isabel	Herrera Mendoza	isabel298@gmail.com	5563718703	7	Sonora	7	2023-10-11	premium
266	Andrés	Ramos Díaz	andrés266@gmail.com	5548739802	9	Guanajuato	5	2021-12-04	premium
282	Andrés	Castro Jiménez	andrés282@gmail.com	5555908520	9	Guanajuato	5	2022-06-19	regular
273	José	Jiménez Ramos	josé273@yahoo.com	5568528124	10	Yucatán	8	2022-12-03	premium
274	Sofía	Rivera Reyes	sofía274@gmail.com	5512354860	10	Yucatán	8	2025-07-13	regular
297	Alberto	Vega Gómez	alberto297@hotmail.com	5576989425	10	Yucatán	8	2022-02-26	premium
299	Claudia	Reyes Ramírez	claudia299@yahoo.com	5526400072	10	Yucatán	8	2023-09-13	regular
303	Verónica	Gutiérrez García	verónica303@gmail.com	5514241081	11	Baja California	7	2021-07-05	vip
320	Ricardo	González Ramos	ricardo320@gmail.com	5550302318	11	Baja California	7	2024-02-22	regular
263	Rosa	García López	rosa263@gmail.com	5569788371	12	Nuevo León	6	2023-07-29	regular
284	José	Díaz Castillo	josé284@gmail.com	5524995099	12	Nuevo León	6	2026-05-04	premium
296	Sofía	Ramos Núñez	sofía296@gmail.com	5532645646	12	Nuevo León	6	2024-05-28	nuevo
301	Alberto	Moreno Flores	alberto301@hotmail.com	5522929680	12	Nuevo León	6	2022-09-27	premium
259	David	González García	david259@gmail.com	5583302419	13	Michoacán	2	2024-08-02	premium
262	Eduardo	López Flores	eduardo262@hotmail.com	5588306842	13	Michoacán	2	2025-03-14	premium
276	Ana	Torres Torres	ana276@gmail.com	5520311502	13	Michoacán	2	2025-05-11	premium
278	Sofía	Gutiérrez Ortega	sofía278@yahoo.com	5528381043	13	Michoacán	2	2024-11-12	regular
302	Mónica	Pérez Torres	mónica302@gmail.com	5575800289	13	Michoacán	2	2024-12-23	regular
316	Claudia	Díaz Pérez	claudia316@yahoo.com	5550513220	13	Michoacán	2	2021-12-08	regular
295	Sofía	Gómez Cruz	sofía295@gmail.com	5521409300	14	Puebla	3	2025-08-22	regular
305	Roberto	Morales Díaz	roberto305@hotmail.com	5575425092	14	Puebla	3	2023-04-03	premium
280	Adriana	Castillo Aguilar	adriana280@gmail.com	5581416669	15	Querétaro	5	2022-07-04	premium
304	David	Vega Gómez	david304@yahoo.com	5533738978	15	Querétaro	5	2022-09-30	mayorista
317	Valeria	Pérez Díaz	valeria317@hotmail.com	5570831313	15	Querétaro	5	2025-06-07	mayorista
268	Sandra	Flores López	sandra268@gmail.com	5589279578	16	Coahuila	6	2025-12-12	regular
314	Verónica	Pérez Torres	verónica314@yahoo.com	5586976644	16	Coahuila	6	2021-12-07	regular
277	Luis	Jiménez Herrera	luis277@yahoo.com	5552441045	17	San Luis Potosí	5	2024-12-03	premium
309	Eduardo	Díaz Rivera	eduardo309@yahoo.com	5541490443	17	San Luis Potosí	5	2023-02-14	regular
257	Manuel	Castillo Hernández	manuel257@gmail.com	5556150365	18	Baja California	7	2024-05-09	regular
267	Alejandra	González Aguilar	alejandra267@gmail.com	5521553190	18	Baja California	7	2025-04-12	regular
269	Isabel	Díaz Rodríguez	isabel269@gmail.com	5586224438	18	Baja California	7	2025-04-29	regular
270	Manuel	Morales Hernández	manuel270@gmail.com	5550532800	19	Veracruz	3	2024-09-27	regular
287	Eduardo	García López	eduardo287@hotmail.com	5547228730	19	Veracruz	3	2024-06-29	regular
288	Adriana	Sánchez Reyes	adriana288@gmail.com	5523301739	19	Veracruz	3	2022-03-01	regular
344	Francisco	Díaz Herrera	francisco344@gmail.com	5570895638	1	Guerrero	2	2025-10-12	regular
360	Valeria	González García	valeria360@hotmail.com	5598521869	1	Guerrero	2	2023-11-25	premium
375	Mónica	Castillo Gómez	mónica375@gmail.com	5590783964	1	Guerrero	2	2024-09-29	premium
337	José	Rivera Díaz	josé337@gmail.com	5583514771	2	Aguascalientes	5	2023-11-26	premium
361	Carlos	Flores Hernández	carlos361@gmail.com	5570814320	2	Aguascalientes	5	2022-05-05	nuevo
372	Roberto	Aguilar Gómez	roberto372@yahoo.com	5549949573	2	Aguascalientes	5	2023-02-25	premium
327	Sandra	Ramírez Morales	sandra327@gmail.com	5541954134	3	Chihuahua	1	2025-10-04	premium
345	Alejandro	Torres Ramos	alejandro345@yahoo.com	5537730181	3	Chihuahua	1	2025-03-27	nuevo
348	Pablo	Moreno Pérez	pablo348@gmail.com	5566813149	3	Chihuahua	1	2025-01-03	regular
349	Ana	Flores Núñez	ana349@hotmail.com	5591386202	3	Chihuahua	1	2022-06-19	premium
323	Alejandra	Vargas Castro	alejandra323@yahoo.com	5528311409	4	CDMX	5	2024-12-29	premium
324	Manuel	Rodríguez Vargas	manuel324@gmail.com	5575208604	4	CDMX	5	2026-02-18	mayorista
338	Carmen	Vargas Cruz	carmen338@gmail.com	5528265989	4	CDMX	5	2024-03-13	regular
347	Daniela	Ortega Moreno	daniela347@gmail.com	5521507650	4	CDMX	5	2023-10-25	regular
371	Isabel	Rivera Ramírez	isabel371@gmail.com	5577571186	4	CDMX	5	2025-10-21	premium
377	Luis	Aguilar García	luis377@gmail.com	5535262608	4	CDMX	5	2025-04-09	regular
342	Manuel	Vargas Jiménez	manuel342@gmail.com	5521942232	5	Sinaloa	7	2025-05-01	regular
354	Diego	Herrera González	diego354@gmail.com	5598237348	5	Sinaloa	7	2026-02-23	regular
367	Roberto	Díaz Vargas	roberto367@yahoo.com	5555868216	5	Sinaloa	7	2022-08-26	regular
331	Sergio	García Vargas	sergio331@gmail.com	5591311077	6	Jalisco	4	2021-09-22	premium
380	Ricardo	Pérez Torres	ricardo380@gmail.com	5562577566	6	Jalisco	4	2024-07-28	regular
343	Ana	Gómez Jiménez	ana343@yahoo.com	5521953600	7	Sonora	7	2025-06-28	vip
373	Mónica	Jiménez Mendoza	mónica373@hotmail.com	5535124449	8	Chihuahua	1	2025-05-28	regular
378	Ricardo	Díaz Aguilar	ricardo378@gmail.com	5582287324	8	Chihuahua	1	2025-12-17	regular
332	Ana	Castillo Núñez	ana332@gmail.com	5542168745	10	Yucatán	8	2023-05-07	regular
340	David	Cruz Morales	david340@gmail.com	5527919382	10	Yucatán	8	2025-06-21	premium
346	Fernando	Díaz Rodríguez	fernando346@yahoo.com	5548949039	10	Yucatán	8	2025-02-14	premium
352	Patricia	Ramírez Martínez	patricia352@hotmail.com	5577002914	10	Yucatán	8	2022-04-02	regular
328	Ramón	Ramos Gómez	ramón328@gmail.com	5541667072	11	Baja California	7	2025-03-22	regular
335	Andrés	Vargas Flores	andrés335@gmail.com	5596493863	11	Baja California	7	2022-01-07	regular
370	Verónica	López Núñez	verónica370@yahoo.com	5567030927	11	Baja California	7	2025-11-30	regular
325	Alberto	Torres Vega	alberto325@hotmail.com	5558779318	12	Nuevo León	6	2024-03-21	vip
358	Carlos	Reyes Herrera	carlos358@gmail.com	5565890810	12	Nuevo León	6	2025-01-23	premium
366	Andrés	Castro Gómez	andrés366@hotmail.com	5566783572	12	Nuevo León	6	2022-03-15	regular
353	Alejandro	Jiménez Aguilar	alejandro353@gmail.com	5545400991	13	Michoacán	2	2024-09-08	regular
368	Patricia	Núñez Morales	patricia368@gmail.com	5596869121	13	Michoacán	2	2025-12-22	regular
326	Patricia	Sánchez Martínez	patricia326@gmail.com	5577142220	14	Puebla	3	2023-07-09	premium
336	Claudia	Morales Ramos	claudia336@hotmail.com	5566689004	14	Puebla	3	2021-10-27	regular
355	Roberto	Hernández Morales	roberto355@hotmail.com	5568576625	14	Puebla	3	2023-09-02	regular
356	Manuel	Morales Cruz	manuel356@hotmail.com	5529871432	14	Puebla	3	2024-06-26	regular
365	Gabriela	Castro Moreno	gabriela365@gmail.com	5558190104	14	Puebla	3	2021-10-11	regular
329	Alejandro	Cruz Díaz	alejandro329@hotmail.com	5575814814	15	Querétaro	5	2024-05-05	premium
359	Valeria	García Torres	valeria359@gmail.com	5526373347	16	Coahuila	6	2024-05-07	regular
363	Verónica	Jiménez Gómez	verónica363@yahoo.com	5542223009	16	Coahuila	6	2025-12-11	regular
374	Isabel	Vega Moreno	isabel374@hotmail.com	5510784780	16	Coahuila	6	2025-10-16	regular
321	Laura	Vargas Pérez	laura321@gmail.com	5545827376	17	San Luis Potosí	5	2022-10-27	regular
322	Elena	Gómez Sánchez	elena322@yahoo.com	5542962076	17	San Luis Potosí	5	2023-11-04	regular
334	Pablo	Núñez Núñez	pablo334@yahoo.com	5541602967	17	San Luis Potosí	5	2025-04-07	mayorista
362	Liliana	González Pérez	liliana362@gmail.com	5596388439	17	San Luis Potosí	5	2024-08-19	premium
376	Daniela	Castillo Moreno	daniela376@gmail.com	5563015631	17	San Luis Potosí	5	2025-12-14	regular
381	Alejandra	Díaz Vega	alejandra381@hotmail.com	5584397493	17	San Luis Potosí	5	2026-03-28	regular
330	Manuel	Díaz Morales	manuel330@gmail.com	5547276794	18	Baja California	7	2024-05-29	regular
339	Ramón	López Martínez	ramón339@hotmail.com	5597131540	18	Baja California	7	2021-09-11	regular
350	Alejandro	Reyes Jiménez	alejandro350@hotmail.com	5559781518	18	Baja California	7	2023-04-23	regular
351	Roberto	Reyes Morales	roberto351@gmail.com	5572825287	18	Baja California	7	2025-12-10	regular
364	Pablo	Herrera Gómez	pablo364@hotmail.com	5597787024	18	Baja California	7	2025-10-08	regular
341	Gabriela	Pérez López	gabriela341@yahoo.com	5560643036	19	Veracruz	3	2025-03-09	regular
357	Carmen	Aguilar Rodríguez	carmen357@gmail.com	5546613462	19	Veracruz	3	2021-06-13	premium
384	Daniela	Cruz Castillo	daniela384@yahoo.com	5535796821	1	Guerrero	2	2024-07-07	regular
387	Carmen	Jiménez Pérez	carmen387@hotmail.com	5599530801	1	Guerrero	2	2025-09-20	regular
430	Sofía	Ramírez Hernández	sofía430@hotmail.com	5518785652	1	Guerrero	2	2026-04-13	regular
419	Mónica	Herrera Cruz	mónica419@gmail.com	5529996104	2	Aguascalientes	5	2025-12-11	premium
391	Verónica	Ramírez Castro	verónica391@hotmail.com	5579174131	3	Chihuahua	1	2022-09-09	regular
414	Roberto	Gutiérrez Rivera	roberto414@gmail.com	5525940510	3	Chihuahua	1	2021-08-31	regular
418	Andrés	Castro Flores	andrés418@gmail.com	5573783961	3	Chihuahua	1	2025-09-13	premium
423	Liliana	Reyes Pérez	liliana423@gmail.com	5577463037	4	CDMX	5	2025-10-08	premium
385	Liliana	Núñez Moreno	liliana385@hotmail.com	5598175428	5	Sinaloa	7	2025-09-16	mayorista
424	María	Ramírez Mendoza	maría424@hotmail.com	5587786253	5	Sinaloa	7	2025-12-20	mayorista
389	Daniela	Castro Ramírez	daniela389@yahoo.com	5577575794	6	Jalisco	4	2021-12-02	regular
406	Eduardo	Ramírez Vargas	eduardo406@gmail.com	5526617902	6	Jalisco	4	2022-03-15	premium
416	Diego	García Mendoza	diego416@hotmail.com	5566607262	6	Jalisco	4	2024-09-25	mayorista
417	Diego	García Martínez	diego417@gmail.com	5519068358	6	Jalisco	4	2024-02-07	regular
427	José	González Torres	josé427@gmail.com	5532708438	6	Jalisco	4	2022-12-31	nuevo
386	Fernanda	Díaz Aguilar	fernanda386@gmail.com	5597577092	7	Sonora	7	2021-12-24	regular
396	Francisco	Rodríguez López	francisco396@hotmail.com	5565701512	7	Sonora	7	2022-11-30	premium
402	Verónica	Jiménez Mendoza	verónica402@gmail.com	5569343538	7	Sonora	7	2021-06-20	mayorista
409	Ricardo	Martínez Flores	ricardo409@gmail.com	5535844329	7	Sonora	7	2023-11-24	regular
415	Ramón	Torres Hernández	ramón415@gmail.com	5525803092	7	Sonora	7	2024-09-25	nuevo
441	Mónica	Moreno Martínez	mónica441@hotmail.com	5590706579	7	Sonora	7	2024-04-10	regular
410	Alejandra	López López	alejandra410@hotmail.com	5573921605	8	Chihuahua	1	2023-12-11	regular
422	Verónica	Vargas Martínez	verónica422@gmail.com	5521428912	8	Chihuahua	1	2022-12-22	regular
432	Gabriela	Ortega Díaz	gabriela432@hotmail.com	5577166896	8	Chihuahua	1	2022-01-20	nuevo
444	Diego	Rivera Hernández	diego444@hotmail.com	5591339562	8	Chihuahua	1	2026-05-28	regular
404	José	Reyes Gutiérrez	josé404@yahoo.com	5595320264	9	Guanajuato	5	2026-04-25	regular
412	Andrés	Castillo Núñez	andrés412@gmail.com	5565958370	9	Guanajuato	5	2025-08-20	regular
426	Valeria	Gómez Ramírez	valeria426@hotmail.com	5582716383	9	Guanajuato	5	2024-11-04	regular
390	Alberto	Sánchez Martínez	alberto390@gmail.com	5575278845	10	Yucatán	8	2024-07-15	premium
411	Fernanda	Ortega Gutiérrez	fernanda411@gmail.com	5562986806	10	Yucatán	8	2023-03-03	regular
428	Miguel	Torres Gómez	miguel428@yahoo.com	5553515775	10	Yucatán	8	2024-05-03	vip
437	Francisco	Mendoza Flores	francisco437@gmail.com	5555987725	10	Yucatán	8	2022-03-23	premium
397	Francisco	Díaz Mendoza	francisco397@hotmail.com	5565486872	11	Baja California	7	2023-11-15	nuevo
405	Liliana	Ramírez Sánchez	liliana405@gmail.com	5550794416	11	Baja California	7	2023-08-12	regular
425	Fernanda	Ortega Hernández	fernanda425@hotmail.com	5555628196	11	Baja California	7	2025-06-07	regular
398	Daniela	García Cruz	daniela398@yahoo.com	5579437366	12	Nuevo León	6	2025-12-20	regular
440	Verónica	López Mendoza	verónica440@gmail.com	5597411506	12	Nuevo León	6	2023-06-04	regular
435	Pablo	Rivera Aguilar	pablo435@gmail.com	5588538733	13	Michoacán	2	2024-11-12	regular
392	Andrés	Mendoza Cruz	andrés392@gmail.com	5524888885	14	Puebla	3	2022-01-23	premium
393	Sofía	Aguilar Gutiérrez	sofía393@yahoo.com	5594547252	14	Puebla	3	2021-07-24	regular
394	Sergio	Castillo Cruz	sergio394@gmail.com	5576892907	14	Puebla	3	2025-07-31	premium
413	Andrés	González Castillo	andrés413@gmail.com	5581020117	14	Puebla	3	2022-07-20	regular
420	Alejandra	Gómez Sánchez	alejandra420@gmail.com	5555499525	15	Querétaro	5	2026-03-10	nuevo
433	Roberto	Mendoza Sánchez	roberto433@gmail.com	5566875091	15	Querétaro	5	2023-11-29	regular
436	Liliana	López Torres	liliana436@hotmail.com	5528743541	15	Querétaro	5	2024-11-16	mayorista
439	María	Castro García	maría439@gmail.com	5565453803	15	Querétaro	5	2022-07-16	premium
445	Fernanda	Martínez Vega	fernanda445@hotmail.com	5532881048	15	Querétaro	5	2025-05-11	premium
447	Sandra	Ramos Mendoza	sandra447@hotmail.com	5513102778	15	Querétaro	5	2022-12-31	regular
400	Sandra	Torres Díaz	sandra400@hotmail.com	5584304333	17	San Luis Potosí	5	2022-05-26	premium
443	Eduardo	Pérez López	eduardo443@gmail.com	5593917830	17	San Luis Potosí	5	2021-11-29	premium
399	Roberto	Díaz Hernández	roberto399@yahoo.com	5596096076	18	Baja California	7	2023-03-23	regular
401	María	Aguilar Ramírez	maría401@gmail.com	5591926643	18	Baja California	7	2022-07-08	regular
403	Rosa	Castro Torres	rosa403@hotmail.com	5562344046	18	Baja California	7	2023-07-12	nuevo
438	David	Flores Pérez	david438@hotmail.com	5512130654	18	Baja California	7	2022-10-27	vip
446	Adriana	Ortega Rodríguez	adriana446@yahoo.com	5518730772	18	Baja California	7	2024-12-27	vip
407	Sergio	Ortega Ramos	sergio407@yahoo.com	5541688446	19	Veracruz	3	2023-04-10	premium
408	Verónica	Vega Jiménez	verónica408@yahoo.com	5599512805	19	Veracruz	3	2022-09-03	regular
421	Isabel	Vargas López	isabel421@gmail.com	5513329148	19	Veracruz	3	2022-11-29	premium
449	Mario	Ramírez Martínez	mario449@gmail.com	5572624210	1	Guerrero	2	2024-06-01	regular
466	Ricardo	Castillo Sánchez	ricardo466@yahoo.com	5574524663	2	Aguascalientes	5	2021-12-01	premium
457	Luis	Jiménez Herrera	luis457@hotmail.com	5598546660	3	Chihuahua	1	2026-05-21	regular
464	Rosa	Mendoza López	rosa464@hotmail.com	5572733686	3	Chihuahua	1	2022-07-24	regular
471	Ricardo	Rivera Mendoza	ricardo471@yahoo.com	5580722909	3	Chihuahua	1	2021-07-02	regular
452	David	Torres López	david452@gmail.com	5522982357	4	CDMX	5	2023-10-03	regular
458	Mario	Castro Jiménez	mario458@gmail.com	5555582551	4	CDMX	5	2023-11-25	regular
462	Patricia	González Morales	patricia462@yahoo.com	5559503523	4	CDMX	5	2023-07-17	regular
450	Ricardo	Hernández Ramírez	ricardo450@gmail.com	5581458898	5	Sinaloa	7	2024-09-02	regular
454	Laura	Herrera Jiménez	laura454@gmail.com	5522840710	5	Sinaloa	7	2023-03-14	regular
460	Patricia	Vargas Reyes	patricia460@yahoo.com	5593329195	5	Sinaloa	7	2025-05-27	regular
486	Claudia	Sánchez Reyes	claudia486@gmail.com	5584170763	5	Sinaloa	7	2022-05-24	mayorista
494	Fernanda	Torres Pérez	fernanda494@hotmail.com	5519392480	5	Sinaloa	7	2026-02-14	regular
506	Juan	Flores Moreno	juan506@gmail.com	5575063283	5	Sinaloa	7	2026-01-23	regular
448	Mónica	García Díaz	mónica448@gmail.com	5597245556	6	Jalisco	4	2021-08-28	vip
453	David	Aguilar Ramírez	david453@yahoo.com	5555741665	6	Jalisco	4	2021-11-02	regular
463	Ana	Sánchez Reyes	ana463@gmail.com	5585088096	6	Jalisco	4	2024-01-29	regular
465	Valeria	Jiménez Torres	valeria465@yahoo.com	5570975394	6	Jalisco	4	2023-08-31	regular
461	Ana	González Torres	ana461@gmail.com	5578870570	7	Sonora	7	2024-09-12	regular
480	Francisco	Jiménez Flores	francisco480@yahoo.com	5564888712	7	Sonora	7	2021-12-07	regular
499	Ramón	Hernández Ramos	ramón499@hotmail.com	5571244438	7	Sonora	7	2022-07-08	mayorista
503	Rosa	Núñez Morales	rosa503@hotmail.com	5526271298	7	Sonora	7	2026-01-06	premium
511	Carlos	Hernández Herrera	carlos511@yahoo.com	5543514137	7	Sonora	7	2025-02-08	regular
468	Ramón	Núñez Herrera	ramón468@hotmail.com	5536725819	8	Chihuahua	1	2024-11-07	regular
469	Carmen	Flores Vega	carmen469@gmail.com	5533963425	8	Chihuahua	1	2026-04-28	regular
472	Sofía	González Castro	sofía472@gmail.com	5535453201	8	Chihuahua	1	2023-06-17	regular
483	Valeria	Pérez Moreno	valeria483@yahoo.com	5546838009	8	Chihuahua	1	2022-06-27	premium
487	José	Flores Vega	josé487@hotmail.com	5566061116	8	Chihuahua	1	2023-12-26	regular
509	Patricia	Cruz Rivera	patricia509@hotmail.com	5581443936	8	Chihuahua	1	2023-12-19	premium
507	Mónica	González Morales	mónica507@gmail.com	5531658249	9	Guanajuato	5	2021-09-28	regular
451	José	Castro Ortega	josé451@gmail.com	5540283277	11	Baja California	7	2026-01-10	vip
496	Fernanda	Castro Vega	fernanda496@hotmail.com	5551574904	11	Baja California	7	2021-11-09	premium
500	Fernanda	Jiménez Aguilar	fernanda500@gmail.com	5533505052	11	Baja California	7	2025-01-17	regular
475	José	Mendoza Morales	josé475@gmail.com	5592528662	12	Nuevo León	6	2025-07-04	regular
481	Carlos	Rodríguez Cruz	carlos481@hotmail.com	5558196637	12	Nuevo León	6	2024-10-16	mayorista
508	Sergio	Martínez Gutiérrez	sergio508@gmail.com	5532609429	12	Nuevo León	6	2022-09-05	premium
474	Juan	Flores Sánchez	juan474@hotmail.com	5526972976	13	Michoacán	2	2023-03-03	mayorista
479	Isabel	Gutiérrez López	isabel479@yahoo.com	5569660493	13	Michoacán	2	2024-06-21	regular
470	Luis	García Aguilar	luis470@gmail.com	5560858151	14	Puebla	3	2024-07-18	vip
482	Laura	Mendoza Ramírez	laura482@gmail.com	5523208247	14	Puebla	3	2026-01-16	regular
456	Sergio	Jiménez Vargas	sergio456@yahoo.com	5517488001	15	Querétaro	5	2026-02-25	regular
467	Roberto	Aguilar García	roberto467@yahoo.com	5514028892	15	Querétaro	5	2025-10-19	regular
478	Fernando	Cruz Vega	fernando478@yahoo.com	5567045601	16	Coahuila	6	2023-03-29	regular
484	Manuel	Núñez Ramírez	manuel484@yahoo.com	5556524207	16	Coahuila	6	2024-03-03	mayorista
485	María	Morales Vargas	maría485@gmail.com	5530036175	16	Coahuila	6	2025-03-02	regular
491	Liliana	Vega Gómez	liliana491@gmail.com	5537407879	16	Coahuila	6	2026-02-01	regular
505	Mónica	Gómez Flores	mónica505@gmail.com	5536092407	16	Coahuila	6	2026-03-26	regular
510	Sandra	Vargas Moreno	sandra510@gmail.com	5523796681	16	Coahuila	6	2022-07-29	regular
489	Valeria	Sánchez Díaz	valeria489@hotmail.com	5582155988	17	San Luis Potosí	5	2024-08-13	regular
492	Luis	Flores Ortega	luis492@gmail.com	5595765571	17	San Luis Potosí	5	2025-12-03	regular
502	Elena	Castro Vega	elena502@hotmail.com	5582173911	17	San Luis Potosí	5	2022-09-15	vip
455	Ana	Gómez Flores	ana455@gmail.com	5518727939	18	Baja California	7	2026-02-05	vip
495	David	Vega Núñez	david495@yahoo.com	5524863801	18	Baja California	7	2023-06-09	regular
459	Sofía	Martínez García	sofía459@gmail.com	5519065665	19	Veracruz	3	2022-01-07	mayorista
473	Alberto	Díaz Vargas	alberto473@yahoo.com	5592681879	19	Veracruz	3	2025-05-20	mayorista
477	Claudia	Morales Ramírez	claudia477@gmail.com	5595645083	19	Veracruz	3	2022-10-20	regular
490	Ana	Núñez González	ana490@hotmail.com	5554325475	19	Veracruz	3	2022-11-30	premium
501	Alejandra	Cruz Gómez	alejandra501@gmail.com	5534621479	19	Veracruz	3	2025-11-28	regular
518	Patricia	Flores Rodríguez	patricia518@gmail.com	5552676804	1	Guerrero	2	2026-01-24	regular
529	Mario	Reyes Jiménez	mario529@gmail.com	5530921653	1	Guerrero	2	2026-05-02	premium
531	Pablo	Cruz Torres	pablo531@yahoo.com	5591339346	1	Guerrero	2	2026-01-15	regular
547	Francisco	Mendoza García	francisco547@hotmail.com	5545679876	1	Guerrero	2	2023-10-16	premium
555	Manuel	Vega Cruz	manuel555@yahoo.com	5525526124	1	Guerrero	2	2022-09-23	regular
558	Sofía	Moreno González	sofía558@gmail.com	5595033398	1	Guerrero	2	2025-12-08	premium
513	Roberto	Ramos Rodríguez	roberto513@hotmail.com	5553908184	2	Aguascalientes	5	2023-04-17	premium
514	Verónica	Gómez Díaz	verónica514@yahoo.com	5557858864	2	Aguascalientes	5	2025-06-21	regular
551	Claudia	Reyes Díaz	claudia551@gmail.com	5510419981	2	Aguascalientes	5	2026-05-08	premium
515	María	Gómez Pérez	maría515@yahoo.com	5547373949	3	Chihuahua	1	2024-05-17	regular
544	Rosa	Ramírez Castro	rosa544@gmail.com	5569153839	3	Chihuahua	1	2025-10-31	mayorista
523	Sandra	Mendoza Díaz	sandra523@gmail.com	5548715788	4	CDMX	5	2025-02-27	mayorista
541	Fernanda	Castillo Torres	fernanda541@yahoo.com	5575997979	4	CDMX	5	2025-11-25	regular
568	Fernanda	Torres Aguilar	fernanda568@gmail.com	5531366552	4	CDMX	5	2023-05-16	regular
554	Sandra	Castro Ortega	sandra554@gmail.com	5577731180	6	Jalisco	4	2025-09-23	regular
565	Claudia	Moreno Cruz	claudia565@yahoo.com	5599301859	6	Jalisco	4	2023-02-01	regular
567	Ana	Mendoza Flores	ana567@hotmail.com	5540208616	6	Jalisco	4	2021-08-04	premium
570	Verónica	Gómez Martínez	verónica570@hotmail.com	5587897778	6	Jalisco	4	2021-09-05	vip
573	Roberto	Núñez Hernández	roberto573@hotmail.com	5534109916	6	Jalisco	4	2025-10-14	nuevo
528	Fernando	Ramírez Vega	fernando528@gmail.com	5520739561	7	Sonora	7	2024-03-18	regular
532	Rosa	González Núñez	rosa532@yahoo.com	5577202790	7	Sonora	7	2023-09-09	regular
542	Sandra	Díaz Vargas	sandra542@yahoo.com	5533676181	7	Sonora	7	2025-05-26	premium
525	Carmen	Cruz Vargas	carmen525@hotmail.com	5519393216	8	Chihuahua	1	2026-02-25	premium
543	Roberto	Reyes Martínez	roberto543@hotmail.com	5534915916	8	Chihuahua	1	2026-02-11	premium
562	Fernanda	Ortega Ramos	fernanda562@yahoo.com	5581887423	8	Chihuahua	1	2021-09-11	regular
566	Sofía	Ramírez Vega	sofía566@gmail.com	5574194023	8	Chihuahua	1	2023-09-02	regular
571	Roberto	Ortega González	roberto571@yahoo.com	5529437798	8	Chihuahua	1	2025-03-22	mayorista
537	Patricia	Ramírez Sánchez	patricia537@gmail.com	5598933292	9	Guanajuato	5	2026-05-17	regular
522	Alberto	Cruz Ramos	alberto522@gmail.com	5528021013	10	Yucatán	8	2024-08-30	premium
557	Valeria	Castro Gómez	valeria557@gmail.com	5539578370	10	Yucatán	8	2022-09-17	regular
534	Sofía	Gómez Núñez	sofía534@gmail.com	5536068867	11	Baja California	7	2025-01-05	premium
556	Roberto	Herrera Moreno	roberto556@gmail.com	5524155900	11	Baja California	7	2022-06-07	regular
512	Carlos	García Flores	carlos512@gmail.com	5599784876	12	Nuevo León	6	2025-03-17	nuevo
533	Pablo	Ramos Rivera	pablo533@yahoo.com	5588961498	12	Nuevo León	6	2024-02-25	mayorista
552	Valeria	Moreno Cruz	valeria552@yahoo.com	5592220752	12	Nuevo León	6	2024-06-28	regular
559	Ricardo	Núñez Ortega	ricardo559@gmail.com	5590621827	12	Nuevo León	6	2022-11-01	regular
519	Liliana	Cruz Gómez	liliana519@gmail.com	5541195619	13	Michoacán	2	2023-02-24	premium
538	Pablo	Gómez Castillo	pablo538@gmail.com	5520784168	13	Michoacán	2	2025-05-21	mayorista
563	Eduardo	Mendoza Moreno	eduardo563@gmail.com	5526952687	13	Michoacán	2	2022-09-21	premium
561	Luis	López Flores	luis561@gmail.com	5535253920	14	Puebla	3	2023-03-26	regular
516	Alejandra	Torres Herrera	alejandra516@gmail.com	5523665188	15	Querétaro	5	2022-01-03	nuevo
530	José	Herrera Núñez	josé530@gmail.com	5589884158	15	Querétaro	5	2025-08-03	regular
517	Carmen	Ramírez Martínez	carmen517@gmail.com	5594674464	16	Coahuila	6	2022-08-23	vip
521	José	Hernández González	josé521@yahoo.com	5530356881	16	Coahuila	6	2025-04-19	premium
535	Daniela	Reyes Castillo	daniela535@hotmail.com	5517744982	16	Coahuila	6	2024-01-25	premium
539	Mario	Ramírez Castillo	mario539@hotmail.com	5598380502	16	Coahuila	6	2023-02-27	regular
549	Miguel	Rivera Vega	miguel549@yahoo.com	5571326664	16	Coahuila	6	2022-05-18	mayorista
553	Claudia	Moreno Vega	claudia553@gmail.com	5523482938	16	Coahuila	6	2024-10-18	premium
575	Sergio	Castillo Jiménez	sergio575@gmail.com	5597616925	16	Coahuila	6	2022-02-04	premium
569	Diego	Rivera Herrera	diego569@yahoo.com	5547988968	17	San Luis Potosí	5	2022-07-16	vip
536	Miguel	Núñez Aguilar	miguel536@hotmail.com	5513792466	18	Baja California	7	2024-12-23	premium
540	José	Martínez Vargas	josé540@gmail.com	5556223620	18	Baja California	7	2024-12-08	premium
564	Pablo	García Gutiérrez	pablo564@gmail.com	5552402900	18	Baja California	7	2021-11-13	vip
572	Carlos	Rivera Ramos	carlos572@gmail.com	5523683207	18	Baja California	7	2024-05-01	nuevo
545	Sergio	López Gómez	sergio545@yahoo.com	5513981790	19	Veracruz	3	2025-02-16	regular
546	Sofía	García Hernández	sofía546@hotmail.com	5599298044	19	Veracruz	3	2022-01-07	nuevo
580	Manuel	Aguilar Gutiérrez	manuel580@gmail.com	5581147161	1	Guerrero	2	2026-02-01	regular
604	Juan	Reyes Rivera	juan604@gmail.com	5566736822	1	Guerrero	2	2024-04-26	regular
591	Alejandro	Martínez Gutiérrez	alejandro591@hotmail.com	5518852915	2	Aguascalientes	5	2022-11-08	regular
613	Isabel	Martínez Díaz	isabel613@yahoo.com	5527103900	2	Aguascalientes	5	2022-03-26	premium
636	Verónica	Ramírez Ramos	verónica636@hotmail.com	5549580182	2	Aguascalientes	5	2026-02-14	premium
585	David	Reyes Núñez	david585@gmail.com	5557260360	3	Chihuahua	1	2023-06-05	regular
625	Alejandro	Pérez Ortega	alejandro625@hotmail.com	5527513454	3	Chihuahua	1	2025-10-08	regular
626	Rosa	Pérez Castillo	rosa626@yahoo.com	5583360594	3	Chihuahua	1	2024-07-09	regular
592	Isabel	González Vega	isabel592@gmail.com	5546728250	4	CDMX	5	2025-11-23	regular
611	Andrés	Moreno Aguilar	andrés611@yahoo.com	5568245146	4	CDMX	5	2024-06-06	mayorista
631	Verónica	Herrera Gómez	verónica631@yahoo.com	5534704966	4	CDMX	5	2025-07-19	regular
600	José	López Ramos	josé600@yahoo.com	5587217700	6	Jalisco	4	2025-12-20	premium
612	Sofía	Pérez Torres	sofía612@yahoo.com	5554454724	6	Jalisco	4	2025-07-18	premium
615	Patricia	González Rivera	patricia615@gmail.com	5541743155	6	Jalisco	4	2022-08-22	mayorista
633	Ricardo	Torres Castillo	ricardo633@yahoo.com	5540055302	6	Jalisco	4	2023-06-15	regular
607	Mónica	Castro Jiménez	mónica607@gmail.com	5517717080	7	Sonora	7	2026-05-30	premium
608	Eduardo	Martínez García	eduardo608@hotmail.com	5563964665	7	Sonora	7	2026-05-24	regular
635	Rosa	Gutiérrez Martínez	rosa635@yahoo.com	5591223137	7	Sonora	7	2024-08-16	regular
582	Manuel	Cruz Mendoza	manuel582@yahoo.com	5587186069	8	Chihuahua	1	2022-10-14	regular
618	Luis	Castillo Ramos	luis618@gmail.com	5534318675	8	Chihuahua	1	2021-08-26	regular
622	Miguel	Rodríguez Hernández	miguel622@hotmail.com	5553169737	8	Chihuahua	1	2024-11-04	regular
579	Alejandra	Torres Ortega	alejandra579@yahoo.com	5582143514	9	Guanajuato	5	2024-03-03	mayorista
581	Sofía	Herrera Herrera	sofía581@hotmail.com	5525747238	9	Guanajuato	5	2021-08-11	regular
610	Isabel	Sánchez Morales	isabel610@yahoo.com	5567491018	9	Guanajuato	5	2023-06-09	mayorista
621	Francisco	Díaz Vargas	francisco621@yahoo.com	5558798364	10	Yucatán	8	2024-06-23	premium
637	Eduardo	Sánchez Ramos	eduardo637@gmail.com	5533721002	10	Yucatán	8	2026-05-10	regular
638	Liliana	Martínez Ramos	liliana638@gmail.com	5561268618	10	Yucatán	8	2021-07-26	premium
599	Elena	Torres Vargas	elena599@gmail.com	5551025192	11	Baja California	7	2022-02-14	regular
602	Verónica	Castillo Martínez	verónica602@hotmail.com	5510978481	11	Baja California	7	2022-07-04	regular
628	Verónica	Rivera Castro	verónica628@hotmail.com	5525761044	11	Baja California	7	2026-01-24	regular
616	Alberto	Ramos García	alberto616@yahoo.com	5575220319	12	Nuevo León	6	2022-03-06	regular
630	Fernando	Ramos Aguilar	fernando630@hotmail.com	5578919151	12	Nuevo León	6	2025-07-08	regular
577	Carlos	Martínez Martínez	carlos577@yahoo.com	5599763770	13	Michoacán	2	2025-03-08	regular
593	Fernanda	Martínez Mendoza	fernanda593@gmail.com	5533586265	13	Michoacán	2	2022-05-12	mayorista
603	Francisco	Moreno Jiménez	francisco603@yahoo.com	5532620027	13	Michoacán	2	2025-03-08	regular
632	María	Castro Núñez	maría632@gmail.com	5571128254	13	Michoacán	2	2022-06-23	premium
609	José	Reyes Reyes	josé609@gmail.com	5565125778	14	Puebla	3	2023-09-17	regular
583	Ana	López Martínez	ana583@gmail.com	5558796148	15	Querétaro	5	2025-06-25	regular
584	María	Sánchez Torres	maría584@hotmail.com	5549379055	15	Querétaro	5	2023-12-13	regular
587	Isabel	González Ramos	isabel587@gmail.com	5519980384	15	Querétaro	5	2025-01-05	regular
594	Claudia	Martínez Reyes	claudia594@hotmail.com	5547848959	15	Querétaro	5	2024-12-03	premium
595	Carmen	Flores Herrera	carmen595@yahoo.com	5581361168	15	Querétaro	5	2023-02-10	mayorista
576	Laura	Herrera Cruz	laura576@gmail.com	5597283256	16	Coahuila	6	2024-11-25	premium
590	Carmen	Díaz Aguilar	carmen590@hotmail.com	5568200448	16	Coahuila	6	2026-04-19	nuevo
598	Carmen	Cruz Rivera	carmen598@gmail.com	5577408068	17	San Luis Potosí	5	2024-11-24	nuevo
605	Valeria	Núñez Moreno	valeria605@hotmail.com	5525819626	17	San Luis Potosí	5	2024-10-07	regular
606	Carlos	Ramos Vargas	carlos606@gmail.com	5539187415	17	San Luis Potosí	5	2022-11-03	regular
623	Sofía	Díaz Rodríguez	sofía623@yahoo.com	5554866590	17	San Luis Potosí	5	2025-10-26	regular
629	Sandra	Mendoza García	sandra629@yahoo.com	5527305260	17	San Luis Potosí	5	2026-03-10	nuevo
586	Ana	Sánchez Hernández	ana586@yahoo.com	5538885391	18	Baja California	7	2023-01-25	regular
588	Carmen	Gómez Cruz	carmen588@yahoo.com	5567088619	18	Baja California	7	2023-06-10	regular
596	Ramón	González Ramírez	ramón596@hotmail.com	5530869686	18	Baja California	7	2025-08-23	regular
601	Claudia	Mendoza Vega	claudia601@hotmail.com	5578274190	18	Baja California	7	2023-10-03	regular
614	Sandra	Ramos Núñez	sandra614@gmail.com	5562190363	18	Baja California	7	2025-10-30	nuevo
619	Elena	Martínez González	elena619@yahoo.com	5535793612	18	Baja California	7	2024-01-20	regular
578	Liliana	Morales Ramírez	liliana578@gmail.com	5522690720	19	Veracruz	3	2025-06-06	regular
589	Isabel	Vargas Castillo	isabel589@gmail.com	5559948088	19	Veracruz	3	2022-10-04	premium
624	Manuel	Herrera Vega	manuel624@yahoo.com	5558504268	19	Veracruz	3	2023-06-24	premium
640	Alejandra	Rivera González	alejandra640@gmail.com	5522575001	1	Guerrero	2	2025-06-05	regular
653	Patricia	Herrera Vargas	patricia653@yahoo.com	5569954440	1	Guerrero	2	2021-11-16	regular
667	Adriana	Aguilar López	adriana667@gmail.com	5572872428	1	Guerrero	2	2024-09-08	premium
689	Adriana	Herrera Gómez	adriana689@hotmail.com	5567728351	1	Guerrero	2	2025-03-31	regular
692	Mario	Flores Herrera	mario692@yahoo.com	5566250794	1	Guerrero	2	2023-10-12	regular
687	Pablo	Herrera Díaz	pablo687@yahoo.com	5552585253	2	Aguascalientes	5	2023-01-21	regular
694	Laura	Ramos Moreno	laura694@gmail.com	5529410197	2	Aguascalientes	5	2022-09-20	nuevo
643	Sofía	Ramos Reyes	sofía643@hotmail.com	5511582229	3	Chihuahua	1	2025-11-19	regular
676	Juan	Herrera Castillo	juan676@hotmail.com	5579296719	3	Chihuahua	1	2022-10-16	regular
766	Gabriela	Pérez Hernández	gabriela766@gmail.com	5556073515	3	Chihuahua	1	2025-10-03	regular
660	Juan	Martínez Castillo	juan660@gmail.com	5560661928	4	CDMX	5	2022-07-17	nuevo
661	Luis	Moreno Ortega	luis661@hotmail.com	5531229647	4	CDMX	5	2025-08-15	regular
663	Sandra	Castillo Torres	sandra663@hotmail.com	5569589132	4	CDMX	5	2024-11-01	regular
684	Ana	Jiménez Vargas	ana684@hotmail.com	5585269356	4	CDMX	5	2025-07-30	mayorista
693	Alejandra	Rivera Núñez	alejandra693@gmail.com	5562229213	4	CDMX	5	2023-04-20	premium
698	Pablo	Pérez Rivera	pablo698@yahoo.com	5587421674	4	CDMX	5	2024-05-14	mayorista
682	Eduardo	Vega Torres	eduardo682@hotmail.com	5527311971	5	Sinaloa	7	2024-05-21	regular
683	Valeria	Rivera López	valeria683@gmail.com	5577906443	5	Sinaloa	7	2024-12-20	mayorista
699	Sergio	Reyes Aguilar	sergio699@gmail.com	5576992183	5	Sinaloa	7	2024-02-15	regular
647	Miguel	Gutiérrez Castillo	miguel647@hotmail.com	5512846476	6	Jalisco	4	2025-11-13	regular
658	Carlos	Rivera Gutiérrez	carlos658@yahoo.com	5524784930	6	Jalisco	4	2024-06-26	regular
671	Elena	Ramírez López	elena671@gmail.com	5585805745	6	Jalisco	4	2023-04-14	nuevo
677	Mónica	Mendoza González	mónica677@yahoo.com	5567834613	6	Jalisco	4	2021-06-13	premium
654	Isabel	González López	isabel654@yahoo.com	5561676160	7	Sonora	7	2024-08-27	regular
672	Miguel	Flores López	miguel672@gmail.com	5511137995	7	Sonora	7	2022-03-25	regular
670	Fernando	Jiménez García	fernando670@gmail.com	5551489399	8	Chihuahua	1	2023-05-09	regular
646	Laura	Pérez González	laura646@hotmail.com	5569636452	9	Guanajuato	5	2024-09-20	regular
691	Andrés	Vega Díaz	andrés691@gmail.com	5599878149	10	Yucatán	8	2025-05-31	mayorista
664	Miguel	Jiménez Herrera	miguel664@yahoo.com	5563202657	11	Baja California	7	2022-08-19	vip
665	Alejandro	Núñez Ortega	alejandro665@gmail.com	5540509683	11	Baja California	7	2025-07-25	regular
668	Pablo	Rodríguez Hernández	pablo668@gmail.com	5596791517	11	Baja California	7	2025-05-09	regular
697	Sofía	Hernández Pérez	sofía697@gmail.com	5535186888	11	Baja California	7	2022-07-16	regular
650	Luis	Torres Rivera	luis650@yahoo.com	5558384619	12	Nuevo León	6	2026-03-15	premium
652	Luis	Ramírez Núñez	luis652@yahoo.com	5545621515	12	Nuevo León	6	2022-01-08	regular
657	Ramón	Herrera Castillo	ramón657@gmail.com	5539438509	12	Nuevo León	6	2025-02-15	regular
675	Ana	Torres Rodríguez	ana675@yahoo.com	5594013952	12	Nuevo León	6	2022-06-01	regular
679	Carlos	González Herrera	carlos679@gmail.com	5583435357	12	Nuevo León	6	2023-08-25	regular
680	Sergio	Rodríguez López	sergio680@yahoo.com	5521976146	12	Nuevo León	6	2025-06-10	premium
649	Sergio	Sánchez Núñez	sergio649@gmail.com	5561639439	14	Puebla	3	2023-09-08	regular
673	Fernando	Flores Herrera	fernando673@yahoo.com	5527383462	14	Puebla	3	2024-08-02	regular
686	Andrés	Cruz Vargas	andrés686@gmail.com	5572391513	14	Puebla	3	2025-12-18	regular
700	Manuel	Díaz Reyes	manuel700@gmail.com	5555073885	14	Puebla	3	2025-06-16	regular
645	Alberto	García Mendoza	alberto645@gmail.com	5524272571	15	Querétaro	5	2022-04-26	mayorista
639	Rosa	Aguilar Cruz	rosa639@yahoo.com	5588069593	16	Coahuila	6	2025-07-28	regular
656	Manuel	Morales Gutiérrez	manuel656@gmail.com	5540885447	16	Coahuila	6	2025-12-22	regular
666	Pablo	González Ramos	pablo666@hotmail.com	5539381121	16	Coahuila	6	2025-05-31	mayorista
685	Roberto	Ortega Gómez	roberto685@gmail.com	5539937437	16	Coahuila	6	2021-07-17	regular
641	Carmen	Pérez Ortega	carmen641@hotmail.com	5596914605	17	San Luis Potosí	5	2026-04-29	regular
651	Francisco	Flores Jiménez	francisco651@yahoo.com	5599559917	17	San Luis Potosí	5	2022-12-10	mayorista
701	Manuel	Jiménez Rodríguez	manuel701@gmail.com	5561212562	17	San Luis Potosí	5	2021-09-15	premium
644	Carlos	Herrera Aguilar	carlos644@gmail.com	5515870689	18	Baja California	7	2025-01-19	premium
662	José	García Ortega	josé662@gmail.com	5565900995	18	Baja California	7	2022-02-25	regular
681	Diego	Ramírez Herrera	diego681@gmail.com	5597280725	18	Baja California	7	2025-10-01	nuevo
688	Claudia	Martínez Ramírez	claudia688@hotmail.com	5573077976	18	Baja California	7	2022-11-08	regular
690	Alejandra	Ramírez Ramírez	alejandra690@gmail.com	5521219432	18	Baja California	7	2026-01-21	regular
696	Alejandra	Ramírez Reyes	alejandra696@gmail.com	5570473000	18	Baja California	7	2022-11-20	regular
674	Sofía	Reyes Mendoza	sofía674@gmail.com	5513178988	19	Veracruz	3	2021-12-24	regular
678	Elena	Pérez Jiménez	elena678@gmail.com	5530454970	19	Veracruz	3	2022-12-04	nuevo
716	Sofía	González Torres	sofía716@yahoo.com	5520385959	1	Guerrero	2	2021-09-16	regular
754	Fernanda	Gómez Martínez	fernanda754@hotmail.com	5546006180	1	Guerrero	2	2025-04-16	regular
760	Sofía	Torres Mendoza	sofía760@gmail.com	5570749138	1	Guerrero	2	2022-04-29	regular
719	Ramón	Vargas Jiménez	ramón719@gmail.com	5525731275	2	Aguascalientes	5	2024-07-01	regular
725	Claudia	Díaz Castro	claudia725@hotmail.com	5546463456	2	Aguascalientes	5	2022-12-14	regular
731	Laura	Ortega Castro	laura731@gmail.com	5568412302	2	Aguascalientes	5	2021-11-19	regular
742	Francisco	Sánchez Ortega	francisco742@yahoo.com	5547653656	2	Aguascalientes	5	2022-02-10	premium
707	Mario	Moreno Sánchez	mario707@hotmail.com	5514385512	4	CDMX	5	2026-04-19	regular
733	Liliana	Gómez Sánchez	liliana733@gmail.com	5548257007	4	CDMX	5	2022-11-01	premium
737	Sofía	Aguilar Rivera	sofía737@gmail.com	5523790014	4	CDMX	5	2025-03-10	regular
744	Rosa	Castillo López	rosa744@yahoo.com	5538517975	4	CDMX	5	2022-09-07	regular
762	Adriana	Morales Martínez	adriana762@hotmail.com	5595872544	4	CDMX	5	2025-08-13	nuevo
705	Fernando	Vega Morales	fernando705@gmail.com	5557058571	5	Sinaloa	7	2024-02-17	vip
726	Fernando	Ortega Rivera	fernando726@hotmail.com	5518625670	5	Sinaloa	7	2025-07-04	mayorista
736	Manuel	Herrera Flores	manuel736@yahoo.com	5550056450	5	Sinaloa	7	2023-09-05	mayorista
748	Sergio	Vega Ortega	sergio748@gmail.com	5529768893	5	Sinaloa	7	2021-07-13	regular
734	María	Núñez Cruz	maría734@hotmail.com	5564064349	6	Jalisco	4	2023-06-15	vip
739	Daniela	Aguilar Castro	daniela739@gmail.com	5510663217	6	Jalisco	4	2024-12-27	mayorista
713	Laura	Ortega Gómez	laura713@hotmail.com	5570895423	7	Sonora	7	2025-05-25	regular
728	David	Díaz Mendoza	david728@yahoo.com	5538881529	7	Sonora	7	2024-05-11	regular
763	Patricia	Rivera Morales	patricia763@hotmail.com	5567810328	7	Sonora	7	2025-04-15	premium
721	Sandra	Reyes Herrera	sandra721@hotmail.com	5525406645	8	Chihuahua	1	2026-04-12	regular
730	José	Gómez Torres	josé730@gmail.com	5580767956	8	Chihuahua	1	2025-11-13	regular
747	Andrés	Vega Jiménez	andrés747@gmail.com	5563714593	8	Chihuahua	1	2026-01-22	regular
751	Eduardo	Martínez Hernández	eduardo751@gmail.com	5566718851	8	Chihuahua	1	2024-10-17	regular
708	Francisco	Aguilar Ramos	francisco708@gmail.com	5554975010	9	Guanajuato	5	2023-03-28	nuevo
718	Mario	Gómez Castro	mario718@hotmail.com	5531622965	9	Guanajuato	5	2024-10-08	regular
756	Elena	Rodríguez Flores	elena756@gmail.com	5532366774	9	Guanajuato	5	2024-07-31	mayorista
711	Liliana	Mendoza Gómez	liliana711@gmail.com	5594197247	10	Yucatán	8	2021-10-01	regular
714	Gabriela	Pérez Gutiérrez	gabriela714@gmail.com	5560748656	10	Yucatán	8	2022-09-30	regular
723	Claudia	Díaz Reyes	claudia723@gmail.com	5535911301	10	Yucatán	8	2025-06-22	regular
735	Carlos	López Morales	carlos735@hotmail.com	5550399304	10	Yucatán	8	2024-08-31	premium
740	Miguel	Torres López	miguel740@hotmail.com	5560943206	10	Yucatán	8	2022-07-12	regular
741	Andrés	Martínez González	andrés741@yahoo.com	5588400641	11	Baja California	7	2022-11-15	regular
750	Manuel	López Rivera	manuel750@yahoo.com	5577402853	11	Baja California	7	2023-08-06	regular
702	Gabriela	Castillo Jiménez	gabriela702@gmail.com	5523317762	12	Nuevo León	6	2021-12-04	mayorista
717	Fernanda	Martínez Morales	fernanda717@gmail.com	5565531931	12	Nuevo León	6	2023-09-19	nuevo
757	Carlos	Moreno Morales	carlos757@yahoo.com	5545410956	12	Nuevo León	6	2025-06-27	premium
727	Isabel	Ortega Díaz	isabel727@hotmail.com	5596583583	13	Michoacán	2	2024-06-20	regular
745	Rosa	Morales Martínez	rosa745@hotmail.com	5580819264	13	Michoacán	2	2021-08-18	regular
749	Carlos	Castro Cruz	carlos749@yahoo.com	5598836768	13	Michoacán	2	2023-11-27	regular
755	Sergio	Castillo Jiménez	sergio755@yahoo.com	5534840859	13	Michoacán	2	2022-07-08	premium
759	Liliana	Moreno Torres	liliana759@gmail.com	5580500436	13	Michoacán	2	2025-07-04	premium
710	Carmen	Gómez Castro	carmen710@yahoo.com	5541000202	14	Puebla	3	2022-06-18	mayorista
715	Juan	Vargas García	juan715@gmail.com	5587759654	14	Puebla	3	2025-10-27	regular
720	Verónica	García Rodríguez	verónica720@gmail.com	5544158548	14	Puebla	3	2025-05-13	premium
732	Diego	Morales Hernández	diego732@gmail.com	5566537506	14	Puebla	3	2025-09-30	regular
703	Carlos	Jiménez Núñez	carlos703@yahoo.com	5593728466	15	Querétaro	5	2025-11-19	premium
722	Juan	Ramírez Ramírez	juan722@hotmail.com	5556782042	15	Querétaro	5	2022-10-15	regular
743	Alejandro	Herrera Torres	alejandro743@gmail.com	5557380159	15	Querétaro	5	2021-10-04	mayorista
764	Pablo	Vargas Martínez	pablo764@gmail.com	5594139980	15	Querétaro	5	2023-12-04	nuevo
765	Carmen	Ramírez Núñez	carmen765@gmail.com	5554452330	16	Coahuila	6	2023-02-21	regular
706	Fernanda	García Rivera	fernanda706@gmail.com	5578123659	17	San Luis Potosí	5	2024-12-10	mayorista
724	Isabel	Gómez Martínez	isabel724@gmail.com	5588863503	17	San Luis Potosí	5	2025-07-07	premium
712	Rosa	López López	rosa712@yahoo.com	5589629793	18	Baja California	7	2026-04-16	premium
746	Mónica	Vargas González	mónica746@gmail.com	5524181508	18	Baja California	7	2025-03-20	vip
709	Pablo	Pérez Jiménez	pablo709@gmail.com	5516923083	19	Veracruz	3	2024-01-15	regular
729	Carlos	Flores Castillo	carlos729@yahoo.com	5572461793	19	Veracruz	3	2021-12-26	regular
768	Gabriela	Jiménez Gutiérrez	gabriela768@gmail.com	5550754622	1	Guerrero	2	2024-10-29	regular
769	Andrés	Hernández Pérez	andrés769@hotmail.com	5517139481	1	Guerrero	2	2024-09-23	regular
782	Patricia	Torres Vargas	patricia782@hotmail.com	5510865811	1	Guerrero	2	2022-12-12	premium
784	Francisco	Cruz Gómez	francisco784@yahoo.com	5564298766	1	Guerrero	2	2025-05-31	mayorista
787	Claudia	Morales Torres	claudia787@yahoo.com	5589022539	1	Guerrero	2	2024-05-20	premium
802	Sandra	Morales Pérez	sandra802@gmail.com	5586553774	1	Guerrero	2	2023-08-21	regular
807	Miguel	Gutiérrez Castillo	miguel807@gmail.com	5588218402	1	Guerrero	2	2024-12-20	premium
810	Adriana	Ramos Jiménez	adriana810@gmail.com	5584011044	1	Guerrero	2	2025-09-19	regular
794	Francisco	Herrera Moreno	francisco794@gmail.com	5527370722	2	Aguascalientes	5	2023-02-22	nuevo
801	Daniela	Herrera Díaz	daniela801@gmail.com	5519658994	2	Aguascalientes	5	2025-05-28	premium
830	Alejandro	López Sánchez	alejandro830@gmail.com	5549704948	2	Aguascalientes	5	2023-03-30	regular
785	Verónica	Ramírez Aguilar	verónica785@gmail.com	5568939010	3	Chihuahua	1	2025-10-02	regular
789	María	Ortega Torres	maría789@hotmail.com	5598206742	3	Chihuahua	1	2023-12-14	regular
776	Mario	Cruz Díaz	mario776@gmail.com	5571912488	4	CDMX	5	2023-04-24	regular
788	Luis	Cruz Díaz	luis788@gmail.com	5529886575	4	CDMX	5	2024-11-08	regular
790	Patricia	Cruz Castro	patricia790@gmail.com	5547165431	4	CDMX	5	2025-07-22	regular
774	Sergio	López Torres	sergio774@gmail.com	5594331525	5	Sinaloa	7	2023-05-21	regular
809	Miguel	Sánchez Morales	miguel809@hotmail.com	5591873043	6	Jalisco	4	2024-07-03	nuevo
820	Isabel	Flores Castillo	isabel820@gmail.com	5524009401	6	Jalisco	4	2024-07-02	vip
825	Miguel	Sánchez Pérez	miguel825@hotmail.com	5581469858	6	Jalisco	4	2022-09-28	regular
814	Andrés	Martínez Castro	andrés814@gmail.com	5559353022	7	Sonora	7	2025-05-11	regular
799	Alejandro	Morales Cruz	alejandro799@gmail.com	5540265633	8	Chihuahua	1	2022-04-14	regular
800	Rosa	López Ortega	rosa800@hotmail.com	5522912566	8	Chihuahua	1	2026-04-04	mayorista
808	Mario	Ramírez Pérez	mario808@hotmail.com	5528695003	8	Chihuahua	1	2023-05-18	mayorista
786	Carmen	González Aguilar	carmen786@gmail.com	5542303777	9	Guanajuato	5	2023-07-30	premium
772	Pablo	Díaz Gómez	pablo772@gmail.com	5523171952	10	Yucatán	8	2024-10-01	regular
773	Mario	Moreno Castro	mario773@hotmail.com	5536777331	10	Yucatán	8	2025-09-07	regular
805	Valeria	García Sánchez	valeria805@gmail.com	5548909246	10	Yucatán	8	2024-04-03	premium
823	Sofía	García Morales	sofía823@gmail.com	5546278860	10	Yucatán	8	2023-02-23	regular
826	Daniela	Núñez García	daniela826@gmail.com	5555126455	10	Yucatán	8	2021-11-25	premium
803	Verónica	Vega González	verónica803@gmail.com	5568905216	11	Baja California	7	2022-12-09	regular
813	María	Gutiérrez Morales	maría813@hotmail.com	5526809078	11	Baja California	7	2022-07-06	regular
815	Elena	Sánchez López	elena815@gmail.com	5540484320	11	Baja California	7	2022-04-03	premium
827	Carlos	Flores Ramos	carlos827@gmail.com	5568260695	11	Baja California	7	2022-01-21	premium
797	Alejandra	Núñez López	alejandra797@yahoo.com	5515022195	12	Nuevo León	6	2023-12-20	premium
775	Alejandra	Martínez González	alejandra775@gmail.com	5552045107	13	Michoacán	2	2022-08-08	premium
780	Liliana	Morales Castillo	liliana780@yahoo.com	5588466030	13	Michoacán	2	2022-04-19	premium
806	Roberto	Torres López	roberto806@gmail.com	5542399944	13	Michoacán	2	2023-01-07	regular
779	Francisco	Cruz Aguilar	francisco779@yahoo.com	5597225409	14	Puebla	3	2024-07-29	regular
783	Carlos	González Jiménez	carlos783@gmail.com	5579769403	14	Puebla	3	2025-01-21	regular
796	Diego	Flores Herrera	diego796@hotmail.com	5541758221	14	Puebla	3	2021-07-04	regular
804	José	González Mendoza	josé804@gmail.com	5523544314	14	Puebla	3	2023-08-25	regular
770	Carlos	Hernández Ramírez	carlos770@hotmail.com	5577376391	15	Querétaro	5	2025-07-29	nuevo
812	María	Núñez Hernández	maría812@hotmail.com	5536330066	15	Querétaro	5	2023-01-13	mayorista
828	Ana	Mendoza Martínez	ana828@gmail.com	5548576654	15	Querétaro	5	2023-11-05	regular
778	Manuel	Castro Ortega	manuel778@gmail.com	5517185483	16	Coahuila	6	2025-09-27	regular
791	Sandra	Pérez Rivera	sandra791@gmail.com	5580471776	16	Coahuila	6	2023-07-27	regular
793	Fernanda	López Núñez	fernanda793@gmail.com	5574927109	16	Coahuila	6	2023-10-19	premium
811	Miguel	Morales Reyes	miguel811@yahoo.com	5574101392	17	San Luis Potosí	5	2022-01-23	mayorista
819	Ricardo	Cruz Castillo	ricardo819@yahoo.com	5584008439	17	San Luis Potosí	5	2021-07-28	premium
767	Eduardo	Torres Martínez	eduardo767@gmail.com	5576964850	18	Baja California	7	2023-10-30	premium
781	Sandra	González Gutiérrez	sandra781@gmail.com	5576478665	18	Baja California	7	2025-03-11	mayorista
792	Daniela	Vargas Ramos	daniela792@gmail.com	5571670595	18	Baja California	7	2024-11-18	premium
798	María	Núñez Rodríguez	maría798@hotmail.com	5560684499	18	Baja California	7	2022-11-14	regular
834	Roberto	Ramírez Herrera	roberto834@gmail.com	5544834976	1	Guerrero	2	2025-09-24	regular
890	Ricardo	Ortega García	ricardo890@yahoo.com	5559636618	1	Guerrero	2	2023-04-15	regular
833	Manuel	Pérez Díaz	manuel833@hotmail.com	5547103909	3	Chihuahua	1	2023-05-09	regular
860	Alejandro	Morales Cruz	alejandro860@yahoo.com	5544819972	3	Chihuahua	1	2022-03-21	regular
870	Alberto	Pérez Castillo	alberto870@yahoo.com	5545309169	3	Chihuahua	1	2024-04-24	premium
831	Daniela	Ramírez Moreno	daniela831@hotmail.com	5591604268	4	CDMX	5	2025-09-30	regular
861	Alejandro	González Martínez	alejandro861@hotmail.com	5532662988	4	CDMX	5	2023-02-02	vip
882	Roberto	Núñez Rivera	roberto882@yahoo.com	5543380451	4	CDMX	5	2026-03-30	mayorista
885	Laura	López López	laura885@gmail.com	5565751363	4	CDMX	5	2026-05-12	premium
832	Isabel	Vega Rodríguez	isabel832@yahoo.com	5511190605	5	Sinaloa	7	2026-03-28	nuevo
844	Ana	Jiménez Morales	ana844@gmail.com	5579838315	5	Sinaloa	7	2024-08-31	regular
878	Ricardo	Flores Vargas	ricardo878@gmail.com	5551407598	5	Sinaloa	7	2024-02-23	regular
858	Gabriela	Flores Gómez	gabriela858@yahoo.com	5529219517	6	Jalisco	4	2021-11-17	vip
867	Valeria	Pérez Aguilar	valeria867@gmail.com	5594031142	6	Jalisco	4	2022-11-20	premium
876	Francisco	Pérez Castro	francisco876@gmail.com	5564895832	6	Jalisco	4	2023-04-17	premium
846	Elena	Cruz Ramos	elena846@gmail.com	5565019311	7	Sonora	7	2025-12-30	regular
862	Verónica	Gutiérrez Mendoza	verónica862@yahoo.com	5513459771	7	Sonora	7	2025-04-21	regular
872	Diego	Morales Mendoza	diego872@gmail.com	5590241009	7	Sonora	7	2023-05-26	regular
889	Verónica	Reyes Sánchez	verónica889@hotmail.com	5562834161	7	Sonora	7	2022-03-02	regular
869	Claudia	Torres González	claudia869@hotmail.com	5579297448	8	Chihuahua	1	2026-06-05	regular
886	Patricia	Martínez Ramos	patricia886@gmail.com	5562495761	8	Chihuahua	1	2021-10-13	premium
851	Patricia	Vega Hernández	patricia851@gmail.com	5513212026	9	Guanajuato	5	2026-01-13	regular
836	Manuel	Castillo Sánchez	manuel836@hotmail.com	5544769739	10	Yucatán	8	2026-05-09	premium
864	Sofía	Cruz Castro	sofía864@yahoo.com	5528363405	10	Yucatán	8	2022-05-05	premium
868	Ramón	Gómez Vega	ramón868@gmail.com	5536263497	10	Yucatán	8	2023-10-23	regular
887	David	Díaz Reyes	david887@gmail.com	5550554420	10	Yucatán	8	2023-11-15	regular
839	Carlos	Flores Jiménez	carlos839@gmail.com	5554961030	11	Baja California	7	2022-10-15	regular
847	Daniela	Vargas Morales	daniela847@gmail.com	5570259467	11	Baja California	7	2025-02-26	regular
866	Sandra	Moreno Herrera	sandra866@hotmail.com	5515148168	11	Baja California	7	2025-11-18	vip
873	Luis	Castro Castro	luis873@gmail.com	5548556908	11	Baja California	7	2023-12-09	regular
875	Claudia	Aguilar Mendoza	claudia875@gmail.com	5590672745	11	Baja California	7	2022-08-04	regular
837	Daniela	Gutiérrez Castillo	daniela837@yahoo.com	5524651674	12	Nuevo León	6	2023-08-08	regular
838	Elena	Pérez Flores	elena838@gmail.com	5565830504	12	Nuevo León	6	2022-11-05	regular
842	Ramón	Hernández Moreno	ramón842@gmail.com	5561148988	12	Nuevo León	6	2026-01-04	nuevo
853	David	Ortega Jiménez	david853@gmail.com	5516071701	12	Nuevo León	6	2022-04-21	vip
855	Roberto	Ramos Herrera	roberto855@gmail.com	5578367019	12	Nuevo León	6	2025-08-04	mayorista
835	Alberto	Vargas Hernández	alberto835@hotmail.com	5534730353	13	Michoacán	2	2021-08-14	regular
856	Daniela	Moreno Vargas	daniela856@yahoo.com	5533719260	13	Michoacán	2	2022-05-24	regular
857	Sofía	Sánchez Torres	sofía857@yahoo.com	5579481516	13	Michoacán	2	2023-03-12	regular
865	Laura	Ramos Mendoza	laura865@yahoo.com	5531035567	13	Michoacán	2	2024-07-25	regular
892	Liliana	Sánchez López	liliana892@hotmail.com	5573554061	13	Michoacán	2	2022-05-23	mayorista
859	Rosa	Díaz Reyes	rosa859@hotmail.com	5552193677	14	Puebla	3	2024-06-30	regular
874	Sofía	Rodríguez Cruz	sofía874@gmail.com	5598665957	14	Puebla	3	2024-06-30	premium
843	Liliana	Reyes Ortega	liliana843@gmail.com	5566113763	15	Querétaro	5	2022-05-02	regular
850	Carmen	Castro Cruz	carmen850@yahoo.com	5545349744	15	Querétaro	5	2022-06-16	vip
880	María	Mendoza Gómez	maría880@hotmail.com	5557338677	15	Querétaro	5	2026-02-02	premium
888	Ramón	Morales Gómez	ramón888@yahoo.com	5564536785	15	Querétaro	5	2024-11-18	regular
891	Juan	Mendoza Vargas	juan891@gmail.com	5522802899	15	Querétaro	5	2025-06-30	regular
877	David	Díaz Gómez	david877@gmail.com	5567069281	16	Coahuila	6	2024-12-25	vip
881	Daniela	Gutiérrez Pérez	daniela881@gmail.com	5581900277	16	Coahuila	6	2021-08-16	premium
884	Elena	Hernández Ramírez	elena884@gmail.com	5560715072	16	Coahuila	6	2025-09-16	mayorista
854	Alejandra	Vargas Cruz	alejandra854@gmail.com	5568477341	17	San Luis Potosí	5	2022-03-13	regular
863	Alejandra	Ramos Cruz	alejandra863@gmail.com	5570914632	17	San Luis Potosí	5	2025-10-30	premium
871	Eduardo	Morales Reyes	eduardo871@gmail.com	5534167825	17	San Luis Potosí	5	2021-09-24	regular
883	Sandra	Martínez Reyes	sandra883@yahoo.com	5531064869	17	San Luis Potosí	5	2024-10-02	regular
848	Patricia	Núñez Gutiérrez	patricia848@hotmail.com	5588484532	18	Baja California	7	2023-01-18	regular
893	Ana	Herrera Morales	ana893@yahoo.com	5555347939	18	Baja California	7	2026-03-29	regular
840	Gabriela	Jiménez García	gabriela840@yahoo.com	5530141148	19	Veracruz	3	2026-04-20	regular
841	David	Reyes Castillo	david841@gmail.com	5578207069	19	Veracruz	3	2022-06-13	regular
849	David	Martínez López	david849@hotmail.com	5529917719	19	Veracruz	3	2023-09-03	premium
918	Luis	Hernández Cruz	luis918@gmail.com	5518365183	2	Aguascalientes	5	2025-11-24	mayorista
919	Fernando	Vargas Jiménez	fernando919@gmail.com	5554649538	2	Aguascalientes	5	2022-06-20	regular
932	Sandra	Moreno Vargas	sandra932@yahoo.com	5588761749	2	Aguascalientes	5	2024-05-10	regular
943	Luis	Gómez González	luis943@hotmail.com	5563671462	2	Aguascalientes	5	2024-11-09	mayorista
899	Liliana	Vargas Rodríguez	liliana899@hotmail.com	5537442403	3	Chihuahua	1	2022-06-09	regular
941	Alejandra	López Ramos	alejandra941@hotmail.com	5560232033	4	CDMX	5	2023-10-08	regular
916	María	Vega Castillo	maría916@gmail.com	5591543479	5	Sinaloa	7	2023-09-11	regular
923	Andrés	Ortega Aguilar	andrés923@gmail.com	5585992639	5	Sinaloa	7	2025-12-13	regular
954	Mónica	Díaz Hernández	mónica954@yahoo.com	5575715873	5	Sinaloa	7	2024-05-21	regular
926	Rosa	Ramos Herrera	rosa926@gmail.com	5551672868	6	Jalisco	4	2024-04-26	premium
936	Adriana	Flores Morales	adriana936@gmail.com	5550288578	6	Jalisco	4	2021-07-11	regular
909	Elena	Gutiérrez Gómez	elena909@yahoo.com	5573683359	7	Sonora	7	2024-09-11	mayorista
956	Carlos	Cruz Flores	carlos956@yahoo.com	5524989876	7	Sonora	7	2022-05-05	regular
904	Pablo	Núñez Ramírez	pablo904@gmail.com	5596114007	8	Chihuahua	1	2026-01-04	regular
913	Rosa	Gómez Rivera	rosa913@hotmail.com	5511432428	8	Chihuahua	1	2023-12-19	regular
927	Juan	Ortega Flores	juan927@hotmail.com	5546614518	8	Chihuahua	1	2025-06-14	nuevo
930	Daniela	Vargas Mendoza	daniela930@gmail.com	5548747182	8	Chihuahua	1	2024-07-11	premium
931	Isabel	López Reyes	isabel931@gmail.com	5544656876	8	Chihuahua	1	2023-10-28	regular
938	Gabriela	Castro Jiménez	gabriela938@gmail.com	5580341559	8	Chihuahua	1	2023-04-05	premium
896	Sofía	Díaz Castillo	sofía896@yahoo.com	5511828652	9	Guanajuato	5	2023-07-13	premium
900	Claudia	Cruz Pérez	claudia900@gmail.com	5528164926	9	Guanajuato	5	2023-07-04	premium
902	Verónica	Cruz Flores	verónica902@hotmail.com	5589786327	9	Guanajuato	5	2026-01-26	regular
917	Verónica	Mendoza Martínez	verónica917@yahoo.com	5530561048	9	Guanajuato	5	2021-07-24	mayorista
924	José	Rodríguez Flores	josé924@gmail.com	5512698765	9	Guanajuato	5	2022-01-08	regular
933	Ana	Flores Castillo	ana933@yahoo.com	5511060092	9	Guanajuato	5	2024-01-30	regular
898	Alejandra	Gómez García	alejandra898@yahoo.com	5549490030	10	Yucatán	8	2023-07-07	regular
910	José	Castro Jiménez	josé910@gmail.com	5532295753	10	Yucatán	8	2022-06-16	regular
915	Alejandro	Vargas Morales	alejandro915@hotmail.com	5543962179	10	Yucatán	8	2022-12-09	regular
953	Patricia	García Flores	patricia953@gmail.com	5589208997	10	Yucatán	8	2025-05-03	regular
903	Elena	Rivera Vargas	elena903@yahoo.com	5548143010	11	Baja California	7	2023-03-03	premium
912	Eduardo	Vega Cruz	eduardo912@gmail.com	5556438200	11	Baja California	7	2025-03-31	premium
920	Daniela	Reyes García	daniela920@gmail.com	5564112975	11	Baja California	7	2021-09-30	premium
921	Fernando	Aguilar Herrera	fernando921@gmail.com	5545787268	12	Nuevo León	6	2025-06-23	regular
897	Andrés	Vega Martínez	andrés897@yahoo.com	5532913930	13	Michoacán	2	2023-09-18	regular
914	Ramón	Torres Flores	ramón914@yahoo.com	5544059134	13	Michoacán	2	2026-05-16	premium
928	Andrés	Ramírez López	andrés928@hotmail.com	5556823088	13	Michoacán	2	2023-12-04	mayorista
951	Alejandro	Ramos Vargas	alejandro951@hotmail.com	5570434208	13	Michoacán	2	2024-05-09	premium
895	Elena	Flores Cruz	elena895@gmail.com	5579045775	15	Querétaro	5	2021-08-18	premium
911	Andrés	Morales Castillo	andrés911@gmail.com	5526138312	15	Querétaro	5	2024-01-02	premium
929	Carmen	Hernández Aguilar	carmen929@gmail.com	5530898267	15	Querétaro	5	2023-04-04	regular
952	Verónica	Rivera Martínez	verónica952@gmail.com	5566917057	15	Querétaro	5	2022-03-09	regular
955	Daniela	Ramírez Díaz	daniela955@yahoo.com	5513158189	15	Querétaro	5	2024-12-11	regular
937	Sandra	Martínez Díaz	sandra937@yahoo.com	5587509126	16	Coahuila	6	2023-02-13	regular
942	Manuel	Moreno Gómez	manuel942@gmail.com	5573391831	16	Coahuila	6	2021-10-13	regular
949	Sofía	Cruz Mendoza	sofía949@hotmail.com	5523610361	16	Coahuila	6	2021-12-09	mayorista
950	Juan	Ortega Reyes	juan950@yahoo.com	5575248523	16	Coahuila	6	2024-01-28	premium
901	David	Díaz Rodríguez	david901@yahoo.com	5510751945	17	San Luis Potosí	5	2022-07-06	regular
922	Fernando	Castillo Reyes	fernando922@hotmail.com	5510432769	17	San Luis Potosí	5	2024-11-28	regular
925	Mónica	López Castro	mónica925@gmail.com	5543115824	17	San Luis Potosí	5	2021-10-01	premium
940	Andrés	García Moreno	andrés940@hotmail.com	5550437430	17	San Luis Potosí	5	2025-12-29	regular
907	Rosa	López Núñez	rosa907@gmail.com	5529661777	18	Baja California	7	2025-07-09	regular
939	David	Mendoza Hernández	david939@gmail.com	5551509991	18	Baja California	7	2021-12-13	regular
947	José	Flores Gómez	josé947@gmail.com	5567138006	18	Baja California	7	2024-11-05	regular
957	Elena	Rodríguez López	elena957@gmail.com	5526918765	18	Baja California	7	2022-11-23	regular
905	Fernando	Ramírez Rodríguez	fernando905@yahoo.com	5580104308	19	Veracruz	3	2022-10-30	premium
958	Daniela	Cruz Castillo	daniela958@gmail.com	5580270865	19	Veracruz	3	2023-11-16	regular
1009	Claudia	García Flores	claudia1009@gmail.com	5578390365	1	Guerrero	2	2023-08-31	regular
1019	Ramón	Morales Hernández	ramón1019@gmail.com	5562353371	1	Guerrero	2	2025-01-16	regular
965	Alberto	Mendoza Vargas	alberto965@yahoo.com	5512425706	2	Aguascalientes	5	2025-03-16	regular
995	Eduardo	Vargas González	eduardo995@gmail.com	5577255871	2	Aguascalientes	5	2023-07-06	regular
966	Alberto	Aguilar Cruz	alberto966@gmail.com	5595197744	3	Chihuahua	1	2024-08-07	regular
978	Alejandra	Pérez Vargas	alejandra978@yahoo.com	5591833362	3	Chihuahua	1	2023-08-16	nuevo
997	José	Flores Sánchez	josé997@yahoo.com	5547354880	3	Chihuahua	1	2022-01-30	premium
984	Roberto	Sánchez Cruz	roberto984@gmail.com	5519374071	4	CDMX	5	2022-03-31	regular
1015	Valeria	Cruz Torres	valeria1015@yahoo.com	5565985387	4	CDMX	5	2022-03-03	vip
982	Valeria	González Torres	valeria982@yahoo.com	5587524461	5	Sinaloa	7	2023-11-14	regular
987	Ana	Rivera Gómez	ana987@gmail.com	5578660380	5	Sinaloa	7	2024-01-16	premium
990	Ricardo	Herrera Ramírez	ricardo990@hotmail.com	5554380596	5	Sinaloa	7	2022-07-10	regular
1000	Verónica	Vega López	verónica1000@gmail.com	5517512810	5	Sinaloa	7	2023-04-08	regular
1005	Gabriela	Ortega García	gabriela1005@gmail.com	5524968484	5	Sinaloa	7	2022-01-31	premium
991	Miguel	Herrera González	miguel991@yahoo.com	5539665008	7	Sonora	7	2023-04-14	regular
1014	Elena	Núñez Ramírez	elena1014@hotmail.com	5550750934	7	Sonora	7	2025-08-19	regular
1020	Fernanda	Hernández Martínez	fernanda1020@yahoo.com	5582195140	7	Sonora	7	2023-12-27	vip
993	Alberto	Torres Vega	alberto993@hotmail.com	5513758727	8	Chihuahua	1	2023-03-05	regular
981	Roberto	Cruz Rivera	roberto981@gmail.com	5542120359	9	Guanajuato	5	2023-10-18	vip
988	Alejandro	Herrera Aguilar	alejandro988@gmail.com	5525003358	9	Guanajuato	5	2024-05-22	regular
996	Claudia	Vargas Rodríguez	claudia996@gmail.com	5574699989	9	Guanajuato	5	2023-09-24	mayorista
1012	Alberto	Pérez Ortega	alberto1012@gmail.com	5553455060	9	Guanajuato	5	2025-05-14	premium
999	Miguel	Gómez Vargas	miguel999@yahoo.com	5519019126	10	Yucatán	8	2023-05-05	nuevo
1016	Mario	Rivera Vargas	mario1016@gmail.com	5571322699	10	Yucatán	8	2026-05-03	mayorista
964	Roberto	Moreno Torres	roberto964@yahoo.com	5512512414	11	Baja California	7	2022-10-05	regular
1006	Adriana	Herrera Cruz	adriana1006@gmail.com	5543789014	11	Baja California	7	2023-01-27	regular
969	Laura	Vargas Morales	laura969@gmail.com	5556345273	12	Nuevo León	6	2025-04-12	premium
989	Ricardo	Mendoza Morales	ricardo989@yahoo.com	5596172555	12	Nuevo León	6	2023-11-16	mayorista
963	Isabel	Ramos Castillo	isabel963@gmail.com	5547158689	13	Michoacán	2	2022-09-05	regular
998	Fernando	Rivera Morales	fernando998@hotmail.com	5511637561	13	Michoacán	2	2025-03-01	premium
1011	Elena	Pérez Torres	elena1011@gmail.com	5552951801	13	Michoacán	2	2023-10-19	regular
959	Miguel	González Jiménez	miguel959@gmail.com	5595606010	14	Puebla	3	2024-04-20	regular
972	Fernanda	Núñez Gutiérrez	fernanda972@hotmail.com	5526575085	14	Puebla	3	2024-03-23	regular
974	Alberto	Ramírez Flores	alberto974@gmail.com	5594594167	14	Puebla	3	2022-09-20	mayorista
983	Elena	Mendoza Rodríguez	elena983@gmail.com	5577137712	14	Puebla	3	2021-12-09	premium
1003	Ricardo	Ortega Herrera	ricardo1003@gmail.com	5572313438	14	Puebla	3	2023-06-08	mayorista
1004	José	Pérez Morales	josé1004@yahoo.com	5536494075	14	Puebla	3	2023-05-28	regular
973	Liliana	Torres Rodríguez	liliana973@gmail.com	5563836946	15	Querétaro	5	2024-02-26	regular
985	Sandra	Morales Vega	sandra985@hotmail.com	5544900534	15	Querétaro	5	2025-10-07	premium
1010	Mario	Moreno Torres	mario1010@hotmail.com	5555960407	15	Querétaro	5	2021-10-31	regular
960	Valeria	Núñez Vargas	valeria960@gmail.com	5566711004	16	Coahuila	6	2026-04-27	regular
968	Manuel	Castillo Rodríguez	manuel968@gmail.com	5544318479	16	Coahuila	6	2026-04-06	premium
975	Valeria	Reyes Gutiérrez	valeria975@gmail.com	5540212304	16	Coahuila	6	2023-09-02	premium
977	Andrés	Vargas Rodríguez	andrés977@gmail.com	5523196701	16	Coahuila	6	2023-03-11	premium
980	Eduardo	García Ramos	eduardo980@gmail.com	5597793969	16	Coahuila	6	2023-05-08	regular
994	Isabel	Rivera Ramos	isabel994@gmail.com	5579366132	16	Coahuila	6	2023-10-09	premium
971	Liliana	Díaz Díaz	liliana971@gmail.com	5513141814	17	San Luis Potosí	5	2023-04-29	premium
976	Andrés	Rodríguez Núñez	andrés976@gmail.com	5563694387	17	San Luis Potosí	5	2026-06-05	regular
986	Verónica	Castillo García	verónica986@hotmail.com	5518024377	17	San Luis Potosí	5	2021-11-22	regular
1007	Valeria	Reyes Morales	valeria1007@gmail.com	5596607967	17	San Luis Potosí	5	2024-12-17	mayorista
967	Manuel	García Flores	manuel967@yahoo.com	5569644085	18	Baja California	7	2023-11-08	mayorista
970	Gabriela	Torres Herrera	gabriela970@hotmail.com	5513968089	18	Baja California	7	2022-12-10	regular
992	Roberto	Ortega Vargas	roberto992@hotmail.com	5549578072	18	Baja California	7	2022-04-10	mayorista
1002	Alberto	Ramírez Gutiérrez	alberto1002@hotmail.com	5518545499	18	Baja California	7	2023-07-07	regular
1021	Juan	Castro Ramos	juan1021@hotmail.com	5565536259	18	Baja California	7	2021-07-18	regular
961	Laura	Aguilar Núñez	laura961@yahoo.com	5535721973	19	Veracruz	3	2024-12-24	nuevo
962	Verónica	Vega Mendoza	verónica962@hotmail.com	5560229157	19	Veracruz	3	2023-10-17	regular
979	Alejandra	García Flores	alejandra979@gmail.com	5532341731	19	Veracruz	3	2022-12-08	regular
1073	Alberto	Jiménez Vega	alberto1073@hotmail.com	5599242791	1	Guerrero	2	2021-10-02	premium
1049	María	Torres Morales	maría1049@hotmail.com	5527206526	2	Aguascalientes	5	2022-10-06	regular
1057	Alejandro	Vargas Herrera	alejandro1057@gmail.com	5555278396	2	Aguascalientes	5	2025-05-26	regular
1069	Ramón	Moreno González	ramón1069@yahoo.com	5546972997	2	Aguascalientes	5	2026-05-20	premium
1083	Roberto	Pérez Gutiérrez	roberto1083@gmail.com	5583454371	2	Aguascalientes	5	2022-04-17	regular
1056	Liliana	Gómez Cruz	liliana1056@gmail.com	5570826614	3	Chihuahua	1	2024-12-20	regular
1063	Ricardo	Castillo Reyes	ricardo1063@yahoo.com	5532231222	3	Chihuahua	1	2025-03-05	mayorista
1077	Francisco	Vega Núñez	francisco1077@gmail.com	5515650731	3	Chihuahua	1	2025-11-03	regular
1030	Ramón	Flores Cruz	ramón1030@gmail.com	5568035365	4	CDMX	5	2024-03-11	regular
1039	Daniela	Morales Ramírez	daniela1039@gmail.com	5571331294	4	CDMX	5	2026-05-28	regular
1041	José	Vargas Vargas	josé1041@gmail.com	5573265064	4	CDMX	5	2024-11-26	premium
1054	Fernanda	Vargas Hernández	fernanda1054@gmail.com	5534450775	4	CDMX	5	2025-08-23	premium
1080	Pablo	Aguilar Mendoza	pablo1080@gmail.com	5567954859	4	CDMX	5	2025-03-26	regular
1048	Diego	Cruz Díaz	diego1048@gmail.com	5582038305	5	Sinaloa	7	2025-09-09	mayorista
1052	Alejandro	Rodríguez Ramos	alejandro1052@gmail.com	5554107402	5	Sinaloa	7	2022-09-12	regular
1079	Fernanda	Castillo Ramos	fernanda1079@hotmail.com	5569088694	5	Sinaloa	7	2023-03-25	mayorista
1081	David	Martínez Torres	david1081@gmail.com	5513808371	5	Sinaloa	7	2021-09-06	mayorista
1082	Eduardo	Rivera Sánchez	eduardo1082@hotmail.com	5553555317	5	Sinaloa	7	2022-07-11	nuevo
1025	Patricia	Martínez Vargas	patricia1025@yahoo.com	5575277802	6	Jalisco	4	2021-10-12	regular
1023	Carlos	González Herrera	carlos1023@gmail.com	5552139163	7	Sonora	7	2022-02-10	regular
1055	Elena	Rodríguez Gómez	elena1055@hotmail.com	5574940557	7	Sonora	7	2025-05-23	premium
1084	Roberto	Vega Morales	roberto1084@gmail.com	5554796947	7	Sonora	7	2022-12-27	regular
1038	Diego	Ramos Jiménez	diego1038@hotmail.com	5565717519	8	Chihuahua	1	2025-04-07	nuevo
1050	Sofía	Morales Morales	sofía1050@gmail.com	5586670472	8	Chihuahua	1	2025-09-27	regular
1044	Alejandra	Rodríguez Rodríguez	alejandra1044@gmail.com	5530317946	9	Guanajuato	5	2024-05-25	mayorista
1022	Fernando	Gutiérrez López	fernando1022@yahoo.com	5583361416	10	Yucatán	8	2023-04-28	regular
1024	Carmen	Flores Cruz	carmen1024@yahoo.com	5536707338	10	Yucatán	8	2025-01-05	premium
1045	Roberto	García Morales	roberto1045@yahoo.com	5560087924	10	Yucatán	8	2022-12-16	regular
1071	Verónica	Ramos Jiménez	verónica1071@yahoo.com	5555818870	10	Yucatán	8	2026-03-20	regular
1074	Miguel	Vargas Martínez	miguel1074@gmail.com	5547608285	10	Yucatán	8	2025-01-12	premium
1040	Luis	Rivera Rivera	luis1040@gmail.com	5518765169	11	Baja California	7	2021-09-09	premium
1046	Valeria	García Castro	valeria1046@hotmail.com	5529373095	11	Baja California	7	2026-03-08	regular
1047	Sandra	Rodríguez Rodríguez	sandra1047@yahoo.com	5539890245	12	Nuevo León	6	2024-02-03	nuevo
1066	Gabriela	Pérez Núñez	gabriela1066@gmail.com	5589723307	12	Nuevo León	6	2026-02-10	premium
1026	Sandra	Rivera García	sandra1026@gmail.com	5514306243	13	Michoacán	2	2021-07-19	premium
1042	Ana	González Vega	ana1042@hotmail.com	5527172930	13	Michoacán	2	2025-07-28	regular
1058	Claudia	Herrera Gutiérrez	claudia1058@yahoo.com	5555952797	13	Michoacán	2	2024-12-20	regular
1060	Eduardo	Torres Cruz	eduardo1060@hotmail.com	5521135674	13	Michoacán	2	2025-06-03	regular
1062	Alberto	Herrera González	alberto1062@gmail.com	5581210764	13	Michoacán	2	2026-03-07	mayorista
1035	Fernando	Herrera Rivera	fernando1035@hotmail.com	5569007608	14	Puebla	3	2021-10-07	vip
1037	Roberto	Reyes Núñez	roberto1037@gmail.com	5579322944	14	Puebla	3	2025-07-13	premium
1059	Carlos	Gutiérrez González	carlos1059@hotmail.com	5524916551	14	Puebla	3	2023-05-11	premium
1076	Isabel	Martínez Herrera	isabel1076@gmail.com	5575479724	15	Querétaro	5	2023-01-16	mayorista
1036	Fernando	Gómez Hernández	fernando1036@yahoo.com	5537599495	16	Coahuila	6	2023-02-19	mayorista
1064	Patricia	Gutiérrez Jiménez	patricia1064@yahoo.com	5516564881	16	Coahuila	6	2024-10-12	regular
1067	Diego	Aguilar Rodríguez	diego1067@gmail.com	5542542841	16	Coahuila	6	2022-01-13	regular
1034	David	Núñez Sánchez	david1034@gmail.com	5537071907	17	San Luis Potosí	5	2025-07-12	regular
1043	Miguel	Hernández Jiménez	miguel1043@gmail.com	5598711501	17	San Luis Potosí	5	2024-05-11	premium
1051	Juan	Sánchez Moreno	juan1051@yahoo.com	5564202290	17	San Luis Potosí	5	2021-06-21	premium
1072	Sofía	Vargas Cruz	sofía1072@yahoo.com	5575404850	17	San Luis Potosí	5	2025-03-08	regular
1029	Laura	Herrera Moreno	laura1029@yahoo.com	5570570928	18	Baja California	7	2022-10-18	regular
1033	Sergio	Rodríguez Martínez	sergio1033@hotmail.com	5515295236	18	Baja California	7	2023-06-01	regular
1053	Isabel	Herrera Castro	isabel1053@yahoo.com	5598745007	18	Baja California	7	2023-03-13	premium
1027	Claudia	Torres Ortega	claudia1027@yahoo.com	5520140494	19	Veracruz	3	2025-12-05	nuevo
1028	Verónica	Rodríguez Mendoza	verónica1028@gmail.com	5521774955	19	Veracruz	3	2023-10-26	premium
1032	Andrés	Vargas Moreno	andrés1032@hotmail.com	5557599687	19	Veracruz	3	2025-08-03	regular
1078	Sofía	Ortega Martínez	sofía1078@hotmail.com	5558412445	19	Veracruz	3	2022-09-03	premium
1092	Rosa	González García	rosa1092@hotmail.com	5592170846	1	Guerrero	2	2021-09-29	regular
1096	Verónica	Ortega González	verónica1096@hotmail.com	5578109300	1	Guerrero	2	2023-06-11	regular
1131	Laura	Gutiérrez Vega	laura1131@yahoo.com	5514790926	1	Guerrero	2	2023-10-05	regular
1141	Claudia	Jiménez Ramírez	claudia1141@hotmail.com	5571066956	1	Guerrero	2	2025-08-02	regular
1095	Elena	Flores Gutiérrez	elena1095@hotmail.com	5528051318	2	Aguascalientes	5	2021-08-15	mayorista
1104	Carmen	García Vargas	carmen1104@gmail.com	5526039031	2	Aguascalientes	5	2025-12-11	regular
1122	Ana	Núñez Pérez	ana1122@hotmail.com	5539738238	2	Aguascalientes	5	2026-01-13	premium
1110	Fernando	Rivera Martínez	fernando1110@gmail.com	5530759612	3	Chihuahua	1	2024-05-06	regular
1140	Diego	Núñez Ortega	diego1140@gmail.com	5547912273	3	Chihuahua	1	2024-04-10	regular
1147	Diego	Martínez Gutiérrez	diego1147@gmail.com	5550308304	3	Chihuahua	1	2024-02-18	regular
1098	Mónica	Jiménez Cruz	mónica1098@yahoo.com	5532997024	4	CDMX	5	2023-04-22	regular
1108	Manuel	Hernández Moreno	manuel1108@yahoo.com	5581017414	4	CDMX	5	2026-06-02	regular
1111	Carmen	Reyes González	carmen1111@gmail.com	5569741176	4	CDMX	5	2022-12-15	regular
1138	Valeria	Rivera Hernández	valeria1138@yahoo.com	5541361578	4	CDMX	5	2024-04-22	regular
1113	Claudia	Pérez Jiménez	claudia1113@hotmail.com	5555284617	5	Sinaloa	7	2022-10-02	regular
1144	Eduardo	Pérez Gómez	eduardo1144@yahoo.com	5570708263	5	Sinaloa	7	2024-04-07	regular
1139	Pablo	Herrera Ortega	pablo1139@yahoo.com	5594327199	6	Jalisco	4	2023-04-14	regular
1086	Fernanda	Pérez Ramírez	fernanda1086@gmail.com	5575154738	7	Sonora	7	2024-07-21	mayorista
1099	Daniela	Morales Vega	daniela1099@gmail.com	5518559981	7	Sonora	7	2026-01-29	nuevo
1146	Alberto	Rivera Castro	alberto1146@hotmail.com	5564788762	7	Sonora	7	2022-11-01	regular
1106	Mario	Castro Ramírez	mario1106@yahoo.com	5563878721	8	Chihuahua	1	2025-03-04	regular
1109	Ramón	Ortega Rivera	ramón1109@gmail.com	5533138191	8	Chihuahua	1	2022-11-16	premium
1145	Pablo	González Ramos	pablo1145@gmail.com	5543018516	8	Chihuahua	1	2022-06-13	regular
1105	Pablo	Mendoza Díaz	pablo1105@yahoo.com	5556076320	9	Guanajuato	5	2025-11-27	regular
1112	Sofía	Mendoza Núñez	sofía1112@yahoo.com	5556849237	9	Guanajuato	5	2023-02-19	regular
1134	Valeria	Hernández Ortega	valeria1134@yahoo.com	5543662096	9	Guanajuato	5	2024-06-24	regular
1107	Laura	Flores Cruz	laura1107@gmail.com	5580312275	10	Yucatán	8	2026-05-01	mayorista
1127	Fernanda	Ramírez Aguilar	fernanda1127@gmail.com	5575527308	10	Yucatán	8	2023-01-29	regular
1129	Diego	López Rodríguez	diego1129@gmail.com	5532463582	10	Yucatán	8	2022-08-17	premium
1094	Alejandro	Castillo Mendoza	alejandro1094@gmail.com	5545374067	11	Baja California	7	2024-05-14	regular
1101	Manuel	Castillo Moreno	manuel1101@yahoo.com	5578176556	11	Baja California	7	2025-08-20	premium
1117	Gabriela	Flores González	gabriela1117@yahoo.com	5594065834	11	Baja California	7	2024-03-06	regular
1126	Rosa	Castro Vargas	rosa1126@gmail.com	5546589757	11	Baja California	7	2022-07-29	regular
1148	Manuel	Castro Rodríguez	manuel1148@gmail.com	5579457789	11	Baja California	7	2025-06-07	vip
1088	Manuel	Gutiérrez Rodríguez	manuel1088@hotmail.com	5536658273	12	Nuevo León	6	2025-12-08	premium
1128	Ana	Castillo Herrera	ana1128@hotmail.com	5539927143	12	Nuevo León	6	2022-11-14	regular
1087	Carmen	Rodríguez Flores	carmen1087@yahoo.com	5551678306	13	Michoacán	2	2022-07-08	premium
1116	David	Núñez Reyes	david1116@gmail.com	5581393856	13	Michoacán	2	2024-03-26	premium
1121	Ana	Aguilar Aguilar	ana1121@gmail.com	5568224195	13	Michoacán	2	2023-07-04	mayorista
1133	Juan	Cruz Jiménez	juan1133@gmail.com	5598969812	13	Michoacán	2	2022-02-22	nuevo
1136	Andrés	García Vega	andrés1136@hotmail.com	5590753445	13	Michoacán	2	2024-10-30	regular
1137	David	Hernández Martínez	david1137@gmail.com	5565019090	13	Michoacán	2	2023-06-13	regular
1123	Ramón	Vargas Jiménez	ramón1123@hotmail.com	5537652856	14	Puebla	3	2024-10-25	regular
1130	Gabriela	Gutiérrez Torres	gabriela1130@hotmail.com	5524561556	14	Puebla	3	2024-03-25	mayorista
1143	Carlos	Díaz Mendoza	carlos1143@yahoo.com	5565079123	15	Querétaro	5	2021-09-01	regular
1085	Elena	Flores Aguilar	elena1085@hotmail.com	5522137642	16	Coahuila	6	2024-09-09	premium
1089	Fernanda	Vega Ramírez	fernanda1089@yahoo.com	5557486185	16	Coahuila	6	2025-09-12	vip
1124	David	Rodríguez Gómez	david1124@gmail.com	5559899973	16	Coahuila	6	2026-03-12	regular
1142	Elena	González Torres	elena1142@gmail.com	5533401284	16	Coahuila	6	2025-01-01	mayorista
1118	Carlos	Morales Martínez	carlos1118@yahoo.com	5562185014	17	San Luis Potosí	5	2023-08-27	nuevo
1120	Valeria	Ramos Hernández	valeria1120@gmail.com	5516336089	17	San Luis Potosí	5	2024-04-14	regular
1100	Alejandro	Castro Ramos	alejandro1100@hotmail.com	5567825027	18	Baja California	7	2024-03-22	regular
1093	Liliana	Pérez Díaz	liliana1093@hotmail.com	5563635663	19	Veracruz	3	2021-06-18	vip
1102	Liliana	Flores Vega	liliana1102@hotmail.com	5558096857	19	Veracruz	3	2025-10-09	premium
1115	Claudia	Pérez Mendoza	claudia1115@yahoo.com	5574481336	19	Veracruz	3	2025-11-21	mayorista
1119	Ana	Reyes Aguilar	ana1119@hotmail.com	5551220925	19	Veracruz	3	2022-04-02	vip
1125	Adriana	Moreno Ramírez	adriana1125@gmail.com	5566752704	19	Veracruz	3	2022-06-18	mayorista
1150	Fernando	González Díaz	fernando1150@yahoo.com	5527522806	1	Guerrero	2	2024-09-02	premium
1171	Miguel	Castillo López	miguel1171@hotmail.com	5535855513	1	Guerrero	2	2021-11-10	regular
1185	Claudia	Díaz Díaz	claudia1185@gmail.com	5531450764	1	Guerrero	2	2022-09-17	regular
1195	Alberto	Morales Gutiérrez	alberto1195@yahoo.com	5552954460	1	Guerrero	2	2024-09-06	premium
1179	Eduardo	Ramos Mendoza	eduardo1179@yahoo.com	5575644207	2	Aguascalientes	5	2023-05-20	nuevo
1189	Andrés	Rivera Díaz	andrés1189@hotmail.com	5541331564	2	Aguascalientes	5	2022-11-21	vip
1199	Patricia	Cruz Vargas	patricia1199@yahoo.com	5569611364	2	Aguascalientes	5	2025-11-03	vip
1200	Fernando	Castillo Jiménez	fernando1200@yahoo.com	5527251767	2	Aguascalientes	5	2026-05-08	regular
1160	Laura	Rivera Jiménez	laura1160@gmail.com	5576404207	4	CDMX	5	2022-12-16	mayorista
1161	Roberto	Rivera Vega	roberto1161@hotmail.com	5579851147	4	CDMX	5	2023-09-13	regular
1163	Mónica	Moreno López	mónica1163@yahoo.com	5593774633	4	CDMX	5	2022-04-29	regular
1170	José	Rodríguez López	josé1170@gmail.com	5522292455	4	CDMX	5	2024-01-07	premium
1177	Alejandra	López Moreno	alejandra1177@gmail.com	5569851981	4	CDMX	5	2022-04-09	premium
1197	Sandra	Torres Sánchez	sandra1197@gmail.com	5566772934	4	CDMX	5	2024-10-09	regular
1153	José	Rivera Jiménez	josé1153@gmail.com	5588309134	5	Sinaloa	7	2023-10-13	regular
1157	Diego	Rodríguez Herrera	diego1157@hotmail.com	5558638387	5	Sinaloa	7	2023-03-02	regular
1180	Ramón	Rodríguez Hernández	ramón1180@gmail.com	5564993351	5	Sinaloa	7	2021-07-05	regular
1156	Luis	Moreno González	luis1156@gmail.com	5523028371	6	Jalisco	4	2025-09-07	mayorista
1162	Ricardo	Castillo Torres	ricardo1162@hotmail.com	5555300876	6	Jalisco	4	2024-11-30	premium
1172	Adriana	Castillo Rodríguez	adriana1172@hotmail.com	5589431668	6	Jalisco	4	2023-12-18	regular
1196	Rosa	Núñez Jiménez	rosa1196@gmail.com	5549677387	6	Jalisco	4	2022-04-27	mayorista
1207	Isabel	Sánchez Sánchez	isabel1207@hotmail.com	5513251451	6	Jalisco	4	2022-11-03	mayorista
1176	Isabel	Torres Herrera	isabel1176@yahoo.com	5576293229	7	Sonora	7	2022-05-02	regular
1188	Sergio	Flores Ramos	sergio1188@hotmail.com	5527197789	7	Sonora	7	2023-04-11	nuevo
1152	Ana	Flores Vega	ana1152@hotmail.com	5557874974	8	Chihuahua	1	2022-04-11	regular
1159	Alberto	Torres Moreno	alberto1159@yahoo.com	5599778757	8	Chihuahua	1	2022-11-21	regular
1190	Isabel	Gutiérrez Flores	isabel1190@gmail.com	5554434217	8	Chihuahua	1	2025-09-24	nuevo
1206	Pablo	Castillo González	pablo1206@gmail.com	5522008959	8	Chihuahua	1	2023-12-06	regular
1154	Sergio	Martínez Mendoza	sergio1154@gmail.com	5530403362	9	Guanajuato	5	2024-02-12	regular
1155	Alejandra	Rodríguez Gutiérrez	alejandra1155@gmail.com	5573024306	10	Yucatán	8	2022-07-29	mayorista
1184	David	Pérez García	david1184@yahoo.com	5583729641	10	Yucatán	8	2025-03-02	regular
1187	Carlos	Torres Vargas	carlos1187@hotmail.com	5593011005	11	Baja California	7	2023-01-06	regular
1151	Sandra	Ramos Vargas	sandra1151@gmail.com	5523027791	12	Nuevo León	6	2025-12-18	regular
1158	Carlos	Morales Moreno	carlos1158@gmail.com	5555604049	12	Nuevo León	6	2021-06-22	regular
1193	Mónica	Jiménez Castro	mónica1193@gmail.com	5545702898	12	Nuevo León	6	2023-12-04	regular
1198	Carlos	García Vargas	carlos1198@gmail.com	5566562468	12	Nuevo León	6	2024-05-18	regular
1204	Luis	Reyes Rodríguez	luis1204@gmail.com	5541542991	12	Nuevo León	6	2022-03-19	regular
1166	Andrés	Núñez Moreno	andrés1166@hotmail.com	5552763636	13	Michoacán	2	2025-10-22	regular
1175	Rosa	Díaz Ramírez	rosa1175@gmail.com	5542315695	13	Michoacán	2	2026-05-28	premium
1186	Laura	Flores Castillo	laura1186@yahoo.com	5541561623	13	Michoacán	2	2023-09-03	mayorista
1169	Mónica	Vargas Vega	mónica1169@hotmail.com	5592217107	14	Puebla	3	2026-02-16	premium
1173	Roberto	Pérez Ramírez	roberto1173@hotmail.com	5535413534	14	Puebla	3	2022-07-03	premium
1183	Roberto	González Ortega	roberto1183@gmail.com	5539124413	14	Puebla	3	2026-05-09	regular
1165	Alejandra	Díaz Castillo	alejandra1165@hotmail.com	5545109738	15	Querétaro	5	2025-05-12	regular
1201	Verónica	Morales Rivera	verónica1201@hotmail.com	5560335546	15	Querétaro	5	2026-04-20	premium
1164	Fernando	Castro Morales	fernando1164@yahoo.com	5546276862	16	Coahuila	6	2024-07-24	regular
1205	José	Díaz Flores	josé1205@gmail.com	5576096285	16	Coahuila	6	2023-05-22	regular
1211	José	Ortega Castro	josé1211@hotmail.com	5532035756	16	Coahuila	6	2025-04-02	regular
1174	David	Herrera Sánchez	david1174@hotmail.com	5589498261	17	San Luis Potosí	5	2023-01-27	regular
1202	Fernanda	Rodríguez Flores	fernanda1202@gmail.com	5514635073	17	San Luis Potosí	5	2024-08-17	regular
1168	Carlos	Ramos Mendoza	carlos1168@hotmail.com	5519446616	18	Baja California	7	2023-03-06	premium
1181	Fernanda	Cruz Vega	fernanda1181@gmail.com	5570690090	18	Baja California	7	2025-08-25	premium
1182	Carlos	Vega González	carlos1182@gmail.com	5561198338	18	Baja California	7	2024-03-15	regular
1192	Diego	Castro García	diego1192@hotmail.com	5561558846	18	Baja California	7	2022-12-12	regular
1208	Miguel	Hernández Sánchez	miguel1208@gmail.com	5530485751	18	Baja California	7	2023-08-21	regular
1149	Fernando	Gómez Ortega	fernando1149@gmail.com	5546684386	19	Veracruz	3	2022-02-17	regular
1178	Eduardo	Castillo Moreno	eduardo1178@gmail.com	5518842104	19	Veracruz	3	2024-12-21	premium
1222	Rosa	Martínez Núñez	rosa1222@gmail.com	5514075870	1	Guerrero	2	2025-06-19	regular
1235	Carmen	Ramos Sánchez	carmen1235@gmail.com	5554949481	1	Guerrero	2	2025-10-15	regular
1249	Verónica	Vargas Ramos	verónica1249@hotmail.com	5579355175	1	Guerrero	2	2025-06-20	vip
1260	Ricardo	Vega Morales	ricardo1260@gmail.com	5535322457	1	Guerrero	2	2023-10-06	regular
1268	Gabriela	Aguilar Gutiérrez	gabriela1268@gmail.com	5551358100	1	Guerrero	2	2023-07-30	regular
1217	Roberto	Vega Flores	roberto1217@hotmail.com	5562153213	2	Aguascalientes	5	2023-11-17	nuevo
1271	Isabel	Vega Torres	isabel1271@gmail.com	5540580466	2	Aguascalientes	5	2024-08-17	vip
1246	Sofía	Cruz Gómez	sofía1246@gmail.com	5542397292	3	Chihuahua	1	2023-10-24	regular
1266	Elena	Jiménez Reyes	elena1266@hotmail.com	5568081584	3	Chihuahua	1	2026-04-09	regular
1269	Liliana	Castillo Gutiérrez	liliana1269@gmail.com	5591229215	3	Chihuahua	1	2022-09-27	premium
1270	David	López Castillo	david1270@yahoo.com	5579390240	3	Chihuahua	1	2022-11-26	regular
1219	María	Jiménez Hernández	maría1219@gmail.com	5546806704	4	CDMX	5	2024-09-28	regular
1224	Laura	Ramos Castillo	laura1224@yahoo.com	5560657129	4	CDMX	5	2026-03-27	regular
1234	Sandra	Gutiérrez Hernández	sandra1234@gmail.com	5587237550	4	CDMX	5	2025-01-06	vip
1239	Verónica	Vargas Martínez	verónica1239@gmail.com	5535636468	4	CDMX	5	2026-05-09	regular
1244	Adriana	Castro Rivera	adriana1244@gmail.com	5575808087	4	CDMX	5	2024-04-24	regular
1231	Alberto	Ramírez Castro	alberto1231@hotmail.com	5596632730	5	Sinaloa	7	2023-12-01	premium
1264	Fernando	Moreno Ramos	fernando1264@gmail.com	5562449097	5	Sinaloa	7	2023-01-17	mayorista
1267	Patricia	Herrera Vargas	patricia1267@yahoo.com	5547692831	5	Sinaloa	7	2022-10-19	mayorista
1242	Ramón	Núñez Morales	ramón1242@gmail.com	5589636235	6	Jalisco	4	2022-08-21	regular
1263	Daniela	Sánchez Aguilar	daniela1263@yahoo.com	5567964749	6	Jalisco	4	2021-07-24	regular
1220	Carmen	Martínez Hernández	carmen1220@hotmail.com	5566796333	7	Sonora	7	2026-01-07	regular
1255	Mario	Gutiérrez Castillo	mario1255@yahoo.com	5545269140	7	Sonora	7	2023-10-13	regular
1258	Fernando	González Torres	fernando1258@hotmail.com	5511502382	7	Sonora	7	2026-02-09	regular
1216	Ricardo	Ortega Castro	ricardo1216@gmail.com	5543867505	8	Chihuahua	1	2023-07-31	regular
1237	Luis	Sánchez Vargas	luis1237@gmail.com	5530897858	8	Chihuahua	1	2022-06-06	regular
1256	Patricia	Martínez García	patricia1256@hotmail.com	5599206598	8	Chihuahua	1	2023-12-11	premium
1229	Verónica	Gutiérrez González	verónica1229@hotmail.com	5564626836	9	Guanajuato	5	2023-03-11	regular
1251	Rosa	Morales Morales	rosa1251@yahoo.com	5597761151	9	Guanajuato	5	2022-02-10	regular
1274	Manuel	Gutiérrez Flores	manuel1274@yahoo.com	5579808342	9	Guanajuato	5	2025-10-14	premium
1223	Ricardo	Cruz Vega	ricardo1223@gmail.com	5584818976	10	Yucatán	8	2024-12-05	regular
1240	Roberto	Aguilar Herrera	roberto1240@gmail.com	5518995520	10	Yucatán	8	2023-11-28	nuevo
1248	Francisco	Cruz López	francisco1248@gmail.com	5572166964	10	Yucatán	8	2022-07-15	regular
1265	Juan	Morales Jiménez	juan1265@gmail.com	5578390278	11	Baja California	7	2022-10-27	mayorista
1272	Daniela	Torres Pérez	daniela1272@gmail.com	5579480727	11	Baja California	7	2024-11-18	regular
1225	Alejandra	Rodríguez García	alejandra1225@gmail.com	5515910104	12	Nuevo León	6	2022-02-16	mayorista
1214	Sandra	Herrera Gómez	sandra1214@yahoo.com	5562002935	14	Puebla	3	2022-04-12	vip
1250	Roberto	Hernández Torres	roberto1250@gmail.com	5567274946	14	Puebla	3	2022-08-05	regular
1227	Miguel	Vega Ortega	miguel1227@gmail.com	5568430949	15	Querétaro	5	2022-07-03	regular
1228	Miguel	Torres Rivera	miguel1228@yahoo.com	5573414545	15	Querétaro	5	2025-07-11	regular
1230	Eduardo	Herrera Torres	eduardo1230@hotmail.com	5576372099	15	Querétaro	5	2024-02-27	regular
1243	David	Rivera García	david1243@yahoo.com	5561506760	15	Querétaro	5	2022-02-16	regular
1254	Mario	García Castillo	mario1254@gmail.com	5559430818	15	Querétaro	5	2025-11-06	regular
1212	Alberto	Torres Ramírez	alberto1212@gmail.com	5578569102	16	Coahuila	6	2025-07-19	mayorista
1233	Carmen	Vega Mendoza	carmen1233@gmail.com	5537623724	16	Coahuila	6	2025-12-26	mayorista
1241	Eduardo	Moreno Gómez	eduardo1241@hotmail.com	5556059442	16	Coahuila	6	2024-05-05	regular
1213	Isabel	Flores Pérez	isabel1213@yahoo.com	5525994412	17	San Luis Potosí	5	2023-11-30	regular
1259	Francisco	Moreno Ramírez	francisco1259@gmail.com	5511188832	17	San Luis Potosí	5	2021-07-04	mayorista
1273	Fernando	Herrera Jiménez	fernando1273@gmail.com	5528693532	17	San Luis Potosí	5	2025-05-18	premium
1221	Gabriela	Herrera Hernández	gabriela1221@gmail.com	5550540480	18	Baja California	7	2024-12-20	regular
1232	Carmen	Castro Hernández	carmen1232@hotmail.com	5593894510	18	Baja California	7	2023-02-01	regular
1261	Pablo	Gutiérrez Vargas	pablo1261@gmail.com	5519518525	18	Baja California	7	2022-09-14	regular
1215	Ramón	Ramos Ramos	ramón1215@hotmail.com	5538768553	19	Veracruz	3	2021-11-10	regular
1247	Andrés	Pérez Jiménez	andrés1247@yahoo.com	5527231429	19	Veracruz	3	2021-08-10	premium
1253	Sofía	Martínez Rodríguez	sofía1253@hotmail.com	5591229370	19	Veracruz	3	2026-04-24	regular
1257	Verónica	Ramírez Morales	verónica1257@hotmail.com	5534898755	19	Veracruz	3	2024-02-16	regular
1262	Laura	Morales Reyes	laura1262@gmail.com	5519742877	19	Veracruz	3	2025-07-09	regular
1285	Laura	Ortega Ramos	laura1285@gmail.com	5546202434	1	Guerrero	2	2025-09-29	regular
1294	Mario	Ramírez Rivera	mario1294@yahoo.com	5544877696	1	Guerrero	2	2025-07-23	regular
1315	Miguel	Mendoza Reyes	miguel1315@gmail.com	5568840762	1	Guerrero	2	2024-01-06	premium
1320	Diego	Mendoza López	diego1320@hotmail.com	5532226983	1	Guerrero	2	2025-10-21	regular
1327	Alejandra	Gómez Aguilar	alejandra1327@yahoo.com	5514106460	2	Aguascalientes	5	2024-05-14	regular
1338	Patricia	Martínez Cruz	patricia1338@hotmail.com	5547913187	2	Aguascalientes	5	2022-08-03	regular
1288	Alejandra	Castillo Cruz	alejandra1288@hotmail.com	5561603430	3	Chihuahua	1	2022-03-27	regular
1299	Carmen	Sánchez García	carmen1299@gmail.com	5536224131	3	Chihuahua	1	2022-06-13	regular
1305	Francisco	Cruz Vargas	francisco1305@gmail.com	5557504416	3	Chihuahua	1	2023-03-17	premium
1319	Juan	Díaz Gutiérrez	juan1319@gmail.com	5538268399	4	CDMX	5	2026-01-27	regular
1276	Ricardo	Gómez Morales	ricardo1276@gmail.com	5586261088	5	Sinaloa	7	2023-06-07	regular
1287	Sergio	Díaz Ortega	sergio1287@gmail.com	5561902437	5	Sinaloa	7	2025-03-31	regular
1308	Fernando	Herrera García	fernando1308@hotmail.com	5529752845	5	Sinaloa	7	2021-08-05	regular
1314	Sandra	Rivera García	sandra1314@yahoo.com	5592265540	5	Sinaloa	7	2024-07-01	premium
1280	Juan	Rodríguez Martínez	juan1280@hotmail.com	5517315154	6	Jalisco	4	2021-09-10	regular
1332	Valeria	Martínez Hernández	valeria1332@gmail.com	5521052264	6	Jalisco	4	2022-12-31	regular
1335	Francisco	Martínez Morales	francisco1335@gmail.com	5548077170	6	Jalisco	4	2024-03-28	mayorista
1337	Sergio	Moreno Flores	sergio1337@yahoo.com	5530833152	6	Jalisco	4	2025-12-31	regular
1281	Manuel	Ramírez González	manuel1281@gmail.com	5566809516	8	Chihuahua	1	2026-03-22	mayorista
1284	Ricardo	Rodríguez Mendoza	ricardo1284@gmail.com	5561441896	8	Chihuahua	1	2023-05-29	premium
1275	Elena	Pérez Jiménez	elena1275@gmail.com	5555281312	9	Guanajuato	5	2021-06-20	premium
1297	Juan	Torres González	juan1297@gmail.com	5547381443	9	Guanajuato	5	2025-02-27	regular
1298	José	Sánchez Vega	josé1298@yahoo.com	5597861865	9	Guanajuato	5	2024-10-29	regular
1303	Alejandro	Cruz Sánchez	alejandro1303@hotmail.com	5543314826	9	Guanajuato	5	2022-11-09	premium
1278	Isabel	Núñez Morales	isabel1278@hotmail.com	5588327265	10	Yucatán	8	2023-07-31	regular
1291	Carmen	Mendoza Gómez	carmen1291@yahoo.com	5564371908	10	Yucatán	8	2025-01-18	premium
1296	Roberto	López Jiménez	roberto1296@gmail.com	5516719620	10	Yucatán	8	2025-12-31	regular
1301	Manuel	Núñez Rodríguez	manuel1301@yahoo.com	5533057873	10	Yucatán	8	2023-07-26	mayorista
1321	David	Jiménez Ramos	david1321@gmail.com	5572938222	10	Yucatán	8	2023-03-18	regular
1293	Carlos	Gómez Ortega	carlos1293@yahoo.com	5575895196	11	Baja California	7	2022-05-20	regular
1311	Gabriela	Rivera Hernández	gabriela1311@hotmail.com	5597702160	11	Baja California	7	2026-01-03	regular
1328	Diego	Núñez Gómez	diego1328@gmail.com	5564400820	11	Baja California	7	2021-09-06	regular
1290	Alberto	Gómez Aguilar	alberto1290@yahoo.com	5529396573	12	Nuevo León	6	2023-01-28	mayorista
1312	Francisco	Gutiérrez Morales	francisco1312@hotmail.com	5574351832	12	Nuevo León	6	2024-06-20	regular
1326	Ramón	Flores Torres	ramón1326@yahoo.com	5574582036	12	Nuevo León	6	2022-02-05	regular
1334	Sandra	López Aguilar	sandra1334@gmail.com	5528604725	12	Nuevo León	6	2023-11-08	premium
1289	Isabel	Pérez Castro	isabel1289@gmail.com	5568606209	13	Michoacán	2	2024-07-10	regular
1322	Valeria	Vargas Moreno	valeria1322@yahoo.com	5589158875	13	Michoacán	2	2022-08-14	regular
1323	Elena	Sánchez Aguilar	elena1323@yahoo.com	5554044033	13	Michoacán	2	2024-10-04	regular
1325	Elena	Cruz Castro	elena1325@yahoo.com	5582774096	13	Michoacán	2	2024-05-29	regular
1279	Miguel	Díaz Vargas	miguel1279@gmail.com	5589896025	14	Puebla	3	2023-10-10	regular
1333	Carmen	Castro Gómez	carmen1333@gmail.com	5575815017	14	Puebla	3	2024-12-11	regular
1300	Isabel	Aguilar Mendoza	isabel1300@yahoo.com	5572080682	15	Querétaro	5	2022-03-06	regular
1313	Francisco	Rodríguez García	francisco1313@gmail.com	5529587604	15	Querétaro	5	2024-12-06	regular
1277	José	Ramírez Martínez	josé1277@gmail.com	5583911477	16	Coahuila	6	2026-06-05	regular
1295	Sandra	Jiménez Reyes	sandra1295@gmail.com	5514871204	16	Coahuila	6	2024-05-26	regular
1304	Pablo	González García	pablo1304@hotmail.com	5575760850	16	Coahuila	6	2023-05-11	regular
1307	Eduardo	Aguilar Torres	eduardo1307@hotmail.com	5561347982	16	Coahuila	6	2024-10-06	regular
1329	Roberto	Flores Rodríguez	roberto1329@gmail.com	5589650979	16	Coahuila	6	2021-08-29	regular
1282	María	Martínez Flores	maría1282@gmail.com	5547201638	17	San Luis Potosí	5	2024-01-13	regular
1283	Alberto	Ortega Herrera	alberto1283@hotmail.com	5541724015	18	Baja California	7	2026-04-25	regular
1306	Isabel	Reyes Núñez	isabel1306@hotmail.com	5577072182	18	Baja California	7	2021-12-06	regular
1316	Manuel	Ramos Ramos	manuel1316@gmail.com	5519031400	18	Baja California	7	2021-10-26	regular
1317	Mónica	Ramos Ramos	mónica1317@gmail.com	5529320840	18	Baja California	7	2022-03-04	vip
1318	Pablo	Ramírez Gómez	pablo1318@yahoo.com	5511626011	18	Baja California	7	2025-05-09	regular
1324	Fernanda	Hernández Ortega	fernanda1324@hotmail.com	5524293758	18	Baja California	7	2023-05-02	regular
1331	Juan	Torres Aguilar	juan1331@hotmail.com	5557949350	19	Veracruz	3	2025-12-14	regular
1350	Elena	Cruz Ramírez	elena1350@hotmail.com	5515195631	20	Jalisco	4	2022-09-12	vip
1343	María	Vega Mendoza	maría1343@yahoo.com	5522511284	1	Guerrero	2	2021-07-14	nuevo
1355	Rosa	García Moreno	rosa1355@yahoo.com	5542963378	1	Guerrero	2	2026-04-30	regular
1364	Liliana	Ramos Castillo	liliana1364@hotmail.com	5540434030	1	Guerrero	2	2023-04-27	premium
1390	Sergio	González Torres	sergio1390@yahoo.com	5511847858	1	Guerrero	2	2022-01-14	premium
1342	Juan	Aguilar Flores	juan1342@gmail.com	5566686642	2	Aguascalientes	5	2022-03-25	regular
1368	Alberto	Mendoza Hernández	alberto1368@gmail.com	5595641687	2	Aguascalientes	5	2025-01-24	regular
1372	Adriana	Vega Martínez	adriana1372@yahoo.com	5545460303	2	Aguascalientes	5	2024-08-29	mayorista
1398	Isabel	Castillo Mendoza	isabel1398@yahoo.com	5563949308	3	Chihuahua	1	2023-04-11	regular
1376	Patricia	López Martínez	patricia1376@gmail.com	5588960861	4	CDMX	5	2025-11-05	mayorista
1392	Fernanda	Ramírez Rodríguez	fernanda1392@yahoo.com	5527916286	4	CDMX	5	2022-01-24	regular
1396	Sandra	Núñez Rodríguez	sandra1396@gmail.com	5580910956	4	CDMX	5	2025-08-10	nuevo
1400	Ricardo	Gutiérrez Flores	ricardo1400@yahoo.com	5585488785	4	CDMX	5	2022-07-30	regular
1366	Daniela	Vargas Flores	daniela1366@hotmail.com	5552301424	5	Sinaloa	7	2025-12-19	regular
1401	Patricia	Sánchez Díaz	patricia1401@gmail.com	5537509178	5	Sinaloa	7	2024-02-18	regular
1347	Liliana	Jiménez Núñez	liliana1347@gmail.com	5568376344	6	Jalisco	4	2023-11-23	nuevo
1388	Elena	Morales Morales	elena1388@gmail.com	5568713655	6	Jalisco	4	2025-01-11	regular
1399	Diego	Jiménez Pérez	diego1399@gmail.com	5553582517	6	Jalisco	4	2021-08-20	regular
1345	Carlos	Vargas Rivera	carlos1345@gmail.com	5592527384	7	Sonora	7	2024-07-21	regular
1362	Verónica	Pérez Morales	verónica1362@gmail.com	5594767925	7	Sonora	7	2026-04-11	regular
1344	Juan	Sánchez Reyes	juan1344@gmail.com	5547294047	8	Chihuahua	1	2022-05-27	regular
1363	Mario	Martínez Mendoza	mario1363@gmail.com	5564017185	8	Chihuahua	1	2025-07-03	regular
1378	Ramón	Castillo Vega	ramón1378@hotmail.com	5573124701	8	Chihuahua	1	2022-05-11	premium
1391	Andrés	Rivera Torres	andrés1391@gmail.com	5570309806	8	Chihuahua	1	2022-08-02	mayorista
1358	María	Sánchez López	maría1358@gmail.com	5546245645	9	Guanajuato	5	2025-10-22	premium
1361	Adriana	Mendoza Mendoza	adriana1361@gmail.com	5518513830	9	Guanajuato	5	2025-08-17	regular
1346	Francisco	Pérez Pérez	francisco1346@hotmail.com	5577777421	10	Yucatán	8	2023-06-20	regular
1348	Gabriela	Gutiérrez Herrera	gabriela1348@yahoo.com	5512404497	11	Baja California	7	2023-02-21	premium
1352	José	Mendoza Mendoza	josé1352@hotmail.com	5583356152	11	Baja California	7	2026-05-09	regular
1356	Isabel	Rodríguez Moreno	isabel1356@yahoo.com	5531724678	11	Baja California	7	2025-04-20	premium
1385	Carlos	Vargas Pérez	carlos1385@gmail.com	5511846825	11	Baja California	7	2025-11-04	regular
1340	Diego	Vargas Hernández	diego1340@yahoo.com	5556316611	12	Nuevo León	6	2026-03-03	regular
1357	Sergio	Torres Gutiérrez	sergio1357@gmail.com	5595768162	12	Nuevo León	6	2026-01-06	nuevo
1371	Sergio	Díaz García	sergio1371@yahoo.com	5534800234	12	Nuevo León	6	2021-07-27	regular
1375	Pablo	Herrera Núñez	pablo1375@hotmail.com	5566394418	12	Nuevo León	6	2022-10-03	regular
1359	Francisco	Herrera Aguilar	francisco1359@gmail.com	5572451136	13	Michoacán	2	2025-10-04	regular
1370	Juan	Ramírez Flores	juan1370@gmail.com	5519985429	13	Michoacán	2	2024-05-27	regular
1389	Miguel	Mendoza Castro	miguel1389@gmail.com	5571572062	13	Michoacán	2	2024-10-27	regular
1382	Mario	Ramírez Vargas	mario1382@gmail.com	5510194969	14	Puebla	3	2024-03-03	regular
1383	Patricia	Ortega Rodríguez	patricia1383@gmail.com	5587873678	14	Puebla	3	2022-09-06	regular
1393	Ricardo	Gutiérrez Reyes	ricardo1393@gmail.com	5529420254	14	Puebla	3	2024-12-10	premium
1397	Manuel	Díaz Ortega	manuel1397@yahoo.com	5535148626	14	Puebla	3	2022-05-03	regular
1354	Sofía	Vega Sánchez	sofía1354@gmail.com	5562214255	15	Querétaro	5	2022-05-17	regular
1360	Laura	Rivera Mendoza	laura1360@yahoo.com	5535407437	15	Querétaro	5	2025-01-15	premium
1367	Francisco	Gutiérrez Herrera	francisco1367@yahoo.com	5576349917	15	Querétaro	5	2023-05-09	premium
1373	Fernando	Ortega Mendoza	fernando1373@yahoo.com	5551807281	15	Querétaro	5	2022-03-19	regular
1395	Sofía	Sánchez Castro	sofía1395@hotmail.com	5599717427	15	Querétaro	5	2021-08-24	premium
1341	Isabel	Gómez Rodríguez	isabel1341@gmail.com	5572210446	16	Coahuila	6	2022-01-18	premium
1380	Claudia	Gutiérrez Sánchez	claudia1380@yahoo.com	5599507425	16	Coahuila	6	2025-05-13	mayorista
1387	Isabel	Cruz Moreno	isabel1387@hotmail.com	5537753738	16	Coahuila	6	2024-06-18	regular
1394	Sofía	Ramírez Vega	sofía1394@gmail.com	5551636644	16	Coahuila	6	2026-05-01	regular
1374	Verónica	Núñez Ortega	verónica1374@gmail.com	5583291553	17	San Luis Potosí	5	2023-05-07	premium
1369	Gabriela	Hernández Vega	gabriela1369@hotmail.com	5599231121	18	Baja California	7	2022-07-17	regular
1384	Elena	Sánchez Ramos	elena1384@yahoo.com	5562978256	18	Baja California	7	2025-03-22	regular
1339	Diego	Díaz Díaz	diego1339@hotmail.com	5584104323	19	Veracruz	3	2024-09-30	vip
1349	Claudia	Aguilar Castro	claudia1349@yahoo.com	5591706445	19	Veracruz	3	2025-02-24	vip
1353	Gabriela	Herrera Jiménez	gabriela1353@gmail.com	5576657301	19	Veracruz	3	2025-03-31	regular
1365	Eduardo	Pérez Castro	eduardo1365@yahoo.com	5510499523	19	Veracruz	3	2024-06-14	regular
1379	Francisco	Sánchez Díaz	francisco1379@hotmail.com	5546683639	19	Veracruz	3	2021-12-27	premium
1443	María	Herrera Sánchez	maría1443@gmail.com	5559442025	20	Jalisco	4	2023-04-30	premium
1431	Roberto	Mendoza Ortega	roberto1431@yahoo.com	5515284956	1	Guerrero	2	2026-02-23	regular
1450	José	López Núñez	josé1450@gmail.com	5577764711	1	Guerrero	2	2022-03-11	nuevo
1430	Luis	Sánchez Díaz	luis1430@yahoo.com	5540580804	2	Aguascalientes	5	2024-05-16	premium
1446	Eduardo	Pérez Aguilar	eduardo1446@gmail.com	5588802121	2	Aguascalientes	5	2021-06-28	premium
1463	Fernando	Martínez Rodríguez	fernando1463@gmail.com	5544094915	2	Aguascalientes	5	2024-06-13	regular
1444	Isabel	Flores Ramos	isabel1444@gmail.com	5572502873	3	Chihuahua	1	2021-10-12	premium
1454	Adriana	Martínez Ramos	adriana1454@gmail.com	5510412599	3	Chihuahua	1	2022-08-19	regular
1422	Valeria	García Hernández	valeria1422@gmail.com	5513667070	4	CDMX	5	2021-08-09	mayorista
1407	Ramón	Ramírez García	ramón1407@yahoo.com	5557902263	5	Sinaloa	7	2023-04-29	premium
1409	Rosa	Aguilar Pérez	rosa1409@yahoo.com	5518224212	5	Sinaloa	7	2025-03-06	premium
1421	Mario	Ramos Vargas	mario1421@gmail.com	5553196957	5	Sinaloa	7	2025-07-09	premium
1417	Sofía	Gutiérrez Morales	sofía1417@hotmail.com	5528148672	6	Jalisco	4	2023-07-17	regular
1428	Diego	Hernández Reyes	diego1428@yahoo.com	5590424826	6	Jalisco	4	2026-06-06	premium
1449	Claudia	Pérez González	claudia1449@yahoo.com	5540295304	6	Jalisco	4	2021-06-30	regular
1461	Alejandra	Herrera Vega	alejandra1461@yahoo.com	5535895776	6	Jalisco	4	2023-07-12	mayorista
1424	Luis	Cruz Mendoza	luis1424@gmail.com	5596912383	7	Sonora	7	2026-02-14	premium
1432	Alberto	Vega Jiménez	alberto1432@gmail.com	5592958783	7	Sonora	7	2022-01-13	nuevo
1459	Gabriela	González Reyes	gabriela1459@gmail.com	5515751690	7	Sonora	7	2022-11-28	regular
1402	Sofía	Moreno Gutiérrez	sofía1402@yahoo.com	5538794231	8	Chihuahua	1	2024-05-13	regular
1414	Carmen	Aguilar Jiménez	carmen1414@gmail.com	5586140861	8	Chihuahua	1	2023-12-05	regular
1415	Mónica	Ramírez Flores	mónica1415@yahoo.com	5512688078	8	Chihuahua	1	2024-03-02	regular
1435	Carmen	Gutiérrez Morales	carmen1435@hotmail.com	5579211163	8	Chihuahua	1	2024-04-28	premium
1441	Daniela	Flores Gutiérrez	daniela1441@gmail.com	5549437611	8	Chihuahua	1	2021-08-04	vip
1457	Alejandra	Pérez Rodríguez	alejandra1457@gmail.com	5531163196	8	Chihuahua	1	2023-01-16	premium
1405	Elena	Hernández Morales	elena1405@gmail.com	5582621876	9	Guanajuato	5	2022-10-04	premium
1408	Luis	Vargas Ortega	luis1408@yahoo.com	5533094606	9	Guanajuato	5	2025-02-17	premium
1411	Carmen	Morales Gómez	carmen1411@yahoo.com	5581542030	9	Guanajuato	5	2022-08-10	mayorista
1419	Francisco	Gutiérrez López	francisco1419@yahoo.com	5528277763	9	Guanajuato	5	2026-03-13	regular
1440	Eduardo	Herrera Torres	eduardo1440@gmail.com	5515679986	9	Guanajuato	5	2024-03-08	premium
1404	David	Núñez Sánchez	david1404@gmail.com	5522550720	10	Yucatán	8	2022-01-03	regular
1429	Fernanda	Rivera Vargas	fernanda1429@yahoo.com	5579241678	10	Yucatán	8	2023-06-22	regular
1434	Sofía	Castro Gutiérrez	sofía1434@gmail.com	5510667294	10	Yucatán	8	2022-12-08	premium
1458	Ricardo	Cruz Ramírez	ricardo1458@yahoo.com	5522378195	10	Yucatán	8	2026-03-29	premium
1410	Fernando	Rivera Vargas	fernando1410@gmail.com	5550210777	11	Baja California	7	2025-07-31	premium
1412	José	Herrera Rodríguez	josé1412@yahoo.com	5524554533	11	Baja California	7	2025-02-27	premium
1437	Sandra	Ortega Vargas	sandra1437@gmail.com	5551271494	11	Baja California	7	2024-10-10	regular
1438	Mario	Herrera Castillo	mario1438@hotmail.com	5580910050	11	Baja California	7	2025-03-30	regular
1452	Carlos	Mendoza García	carlos1452@gmail.com	5554907705	11	Baja California	7	2025-10-25	regular
1418	Patricia	Sánchez Núñez	patricia1418@hotmail.com	5582970220	12	Nuevo León	6	2025-02-02	regular
1420	Rosa	González Mendoza	rosa1420@gmail.com	5595395947	12	Nuevo León	6	2023-07-17	regular
1427	José	González Rodríguez	josé1427@gmail.com	5548785862	13	Michoacán	2	2022-12-16	premium
1442	José	Morales Gómez	josé1442@hotmail.com	5549003774	13	Michoacán	2	2023-03-20	nuevo
1451	Sofía	Cruz Reyes	sofía1451@gmail.com	5584161981	13	Michoacán	2	2026-05-25	regular
1460	Elena	Morales Núñez	elena1460@yahoo.com	5516222119	13	Michoacán	2	2022-07-22	regular
1406	Claudia	Aguilar Pérez	claudia1406@gmail.com	5554391723	14	Puebla	3	2025-12-12	regular
1425	Adriana	García Ramos	adriana1425@yahoo.com	5560874566	14	Puebla	3	2021-12-27	vip
1433	Sandra	Rodríguez González	sandra1433@yahoo.com	5516306434	14	Puebla	3	2021-08-04	regular
1447	Ricardo	Mendoza González	ricardo1447@gmail.com	5522087330	14	Puebla	3	2022-06-16	regular
1455	Eduardo	González Castro	eduardo1455@yahoo.com	5519517739	14	Puebla	3	2021-07-24	regular
1436	José	Gómez Ramírez	josé1436@hotmail.com	5528991936	16	Coahuila	6	2022-12-22	premium
1462	Pablo	Castro Jiménez	pablo1462@hotmail.com	5513660053	16	Coahuila	6	2025-07-31	premium
1439	Isabel	López Cruz	isabel1439@gmail.com	5562369622	17	San Luis Potosí	5	2022-11-26	regular
1445	Valeria	Hernández Torres	valeria1445@gmail.com	5517720663	17	San Luis Potosí	5	2025-02-07	regular
1416	Mónica	Núñez López	mónica1416@gmail.com	5525481681	18	Baja California	7	2026-02-21	regular
1403	Ramón	Díaz Martínez	ramón1403@gmail.com	5596304579	19	Veracruz	3	2021-06-15	regular
1413	Francisco	Castillo Gutiérrez	francisco1413@gmail.com	5581251601	19	Veracruz	3	2023-02-28	nuevo
1423	David	Rodríguez Herrera	david1423@gmail.com	5595501953	19	Veracruz	3	2025-12-27	regular
1426	Gabriela	Ramírez Rodríguez	gabriela1426@hotmail.com	5590577383	19	Veracruz	3	2023-06-02	regular
1491	Patricia	Jiménez González	patricia1491@hotmail.com	5522357361	1	Guerrero	2	2022-05-19	premium
1505	Alejandra	García Flores	alejandra1505@hotmail.com	5513076093	1	Guerrero	2	2022-01-15	premium
1486	Sandra	Pérez López	sandra1486@yahoo.com	5592126467	2	Aguascalientes	5	2021-10-29	nuevo
1470	Alejandro	Ortega Mendoza	alejandro1470@hotmail.com	5586878220	3	Chihuahua	1	2022-12-08	regular
1471	Fernanda	Vega Herrera	fernanda1471@gmail.com	5584181946	3	Chihuahua	1	2022-03-09	premium
1468	Luis	Hernández Martínez	luis1468@gmail.com	5570603852	4	CDMX	5	2023-01-18	mayorista
1507	Diego	Sánchez Castro	diego1507@hotmail.com	5529668825	4	CDMX	5	2024-05-25	premium
1509	Laura	Gómez Moreno	laura1509@gmail.com	5559129124	4	CDMX	5	2022-02-01	regular
1521	Miguel	Mendoza Vargas	miguel1521@gmail.com	5580382000	4	CDMX	5	2024-03-17	premium
1495	Pablo	Martínez Cruz	pablo1495@gmail.com	5520623444	5	Sinaloa	7	2026-05-21	regular
1506	Alejandra	Gómez Moreno	alejandra1506@gmail.com	5525971233	5	Sinaloa	7	2023-10-06	premium
1467	Manuel	Ramos Castro	manuel1467@gmail.com	5564687986	6	Jalisco	4	2025-04-03	regular
1485	Francisco	Díaz Jiménez	francisco1485@hotmail.com	5518402695	6	Jalisco	4	2025-10-15	mayorista
1499	Liliana	Flores Hernández	liliana1499@yahoo.com	5578487095	6	Jalisco	4	2021-11-10	regular
1513	Roberto	González Castro	roberto1513@gmail.com	5554410181	6	Jalisco	4	2023-01-19	premium
1516	Eduardo	Cruz Vargas	eduardo1516@gmail.com	5571456344	6	Jalisco	4	2022-07-19	premium
1494	José	Núñez González	josé1494@gmail.com	5552171230	7	Sonora	7	2022-06-08	vip
1497	Francisco	Moreno Flores	francisco1497@yahoo.com	5586965229	7	Sonora	7	2024-05-02	regular
1522	Elena	Rivera Hernández	elena1522@gmail.com	5514012808	7	Sonora	7	2022-03-17	nuevo
1466	Sergio	Castro Gutiérrez	sergio1466@hotmail.com	5570053039	8	Chihuahua	1	2024-07-10	regular
1482	Rosa	García Gutiérrez	rosa1482@yahoo.com	5529557879	8	Chihuahua	1	2021-12-01	regular
1526	Liliana	Vega Ramírez	liliana1526@gmail.com	5539822796	8	Chihuahua	1	2023-05-20	nuevo
1469	Liliana	Ortega Castillo	liliana1469@yahoo.com	5587052719	9	Guanajuato	5	2026-05-10	premium
1484	Sandra	Ramírez Vargas	sandra1484@gmail.com	5513953262	9	Guanajuato	5	2023-10-06	premium
1523	Alberto	Flores Moreno	alberto1523@yahoo.com	5526753792	9	Guanajuato	5	2024-11-16	mayorista
1527	Sofía	Flores Gómez	sofía1527@yahoo.com	5554007398	9	Guanajuato	5	2023-06-16	premium
1487	Ana	López Gómez	ana1487@gmail.com	5592150325	10	Yucatán	8	2025-12-29	regular
1489	Alejandra	Vargas González	alejandra1489@yahoo.com	5595564188	10	Yucatán	8	2024-12-05	regular
1498	José	Castro Moreno	josé1498@gmail.com	5551218029	10	Yucatán	8	2023-02-14	regular
1475	Fernanda	Ortega Gutiérrez	fernanda1475@gmail.com	5517351443	11	Baja California	7	2022-12-15	premium
1476	Claudia	González Gómez	claudia1476@gmail.com	5571361861	11	Baja California	7	2026-04-10	premium
1493	Pablo	Núñez Reyes	pablo1493@gmail.com	5545272295	12	Nuevo León	6	2025-05-08	regular
1501	Mónica	Ramos Mendoza	mónica1501@hotmail.com	5535051514	12	Nuevo León	6	2026-05-14	mayorista
1473	Ramón	Sánchez González	ramón1473@yahoo.com	5512855262	13	Michoacán	2	2021-06-20	regular
1477	Fernando	Torres Gutiérrez	fernando1477@gmail.com	5540616453	13	Michoacán	2	2023-01-16	regular
1488	Valeria	Hernández Cruz	valeria1488@yahoo.com	5594495057	13	Michoacán	2	2025-05-06	mayorista
1504	Ricardo	Vega Aguilar	ricardo1504@gmail.com	5525433087	13	Michoacán	2	2025-06-14	regular
1510	Sofía	Moreno Ramírez	sofía1510@yahoo.com	5519779395	13	Michoacán	2	2022-10-17	premium
1514	Manuel	Díaz Ramos	manuel1514@gmail.com	5543657954	13	Michoacán	2	2024-10-22	premium
1479	Gabriela	Aguilar García	gabriela1479@gmail.com	5564689989	14	Puebla	3	2025-08-24	vip
1496	Carmen	Moreno Martínez	carmen1496@yahoo.com	5560979859	14	Puebla	3	2025-03-20	premium
1502	Claudia	Castro Aguilar	claudia1502@gmail.com	5534480241	14	Puebla	3	2022-12-03	regular
1472	Mónica	López Castro	mónica1472@gmail.com	5529485870	15	Querétaro	5	2022-01-19	regular
1515	Alberto	Flores Vega	alberto1515@gmail.com	5578747076	15	Querétaro	5	2022-11-30	regular
1519	Mónica	Morales Jiménez	mónica1519@gmail.com	5561603280	15	Querétaro	5	2025-08-08	mayorista
1480	Alejandra	Flores García	alejandra1480@gmail.com	5529762536	16	Coahuila	6	2023-02-18	premium
1500	Miguel	Sánchez Cruz	miguel1500@yahoo.com	5523638593	16	Coahuila	6	2023-10-22	regular
1517	Roberto	Sánchez Castro	roberto1517@gmail.com	5570073059	16	Coahuila	6	2023-10-07	regular
1518	Carmen	García Núñez	carmen1518@gmail.com	5546896459	16	Coahuila	6	2022-01-26	regular
1524	David	Vega Rivera	david1524@yahoo.com	5580274372	16	Coahuila	6	2023-11-11	regular
1465	Patricia	Jiménez Pérez	patricia1465@gmail.com	5545404362	17	San Luis Potosí	5	2022-03-29	nuevo
1474	Rosa	Rodríguez Castro	rosa1474@yahoo.com	5539934299	17	San Luis Potosí	5	2022-01-25	regular
1512	Isabel	Sánchez Díaz	isabel1512@gmail.com	5582726901	17	San Luis Potosí	5	2022-01-19	regular
1478	Adriana	Núñez Rivera	adriana1478@gmail.com	5579821206	18	Baja California	7	2022-10-04	mayorista
1483	Sofía	Ramírez Aguilar	sofía1483@yahoo.com	5582674616	18	Baja California	7	2025-02-04	regular
1490	Andrés	Jiménez Torres	andrés1490@yahoo.com	5570267126	18	Baja California	7	2022-05-17	regular
1520	Alejandra	Reyes Morales	alejandra1520@gmail.com	5530658164	18	Baja California	7	2024-08-25	regular
1481	Patricia	Díaz Moreno	patricia1481@hotmail.com	5561329407	19	Veracruz	3	2024-04-28	regular
1530	Sofía	Gutiérrez Castillo	sofía1530@yahoo.com	5596680604	1	Guerrero	2	2023-07-15	regular
1535	Fernando	Ramos Rodríguez	fernando1535@hotmail.com	5566302151	1	Guerrero	2	2022-05-13	mayorista
1563	Mario	Martínez Morales	mario1563@gmail.com	5572146491	1	Guerrero	2	2025-03-20	regular
1564	Ricardo	García Ortega	ricardo1564@hotmail.com	5587525357	1	Guerrero	2	2023-01-07	premium
1544	Alberto	Núñez Martínez	alberto1544@gmail.com	5567459585	2	Aguascalientes	5	2026-04-20	regular
1546	Ricardo	González Vargas	ricardo1546@gmail.com	5525533493	2	Aguascalientes	5	2021-07-29	regular
1559	Liliana	Vargas Ortega	liliana1559@gmail.com	5513928091	2	Aguascalientes	5	2025-06-04	regular
1536	Elena	Mendoza Díaz	elena1536@yahoo.com	5512155101	3	Chihuahua	1	2024-12-14	nuevo
1548	Gabriela	Torres Torres	gabriela1548@gmail.com	5580436375	3	Chihuahua	1	2024-04-18	regular
1584	Liliana	Moreno Flores	liliana1584@gmail.com	5530149849	3	Chihuahua	1	2024-11-01	regular
1552	Rosa	Aguilar López	rosa1552@hotmail.com	5596590284	4	CDMX	5	2022-12-06	regular
1555	Carmen	Mendoza Rodríguez	carmen1555@gmail.com	5574435190	5	Sinaloa	7	2024-08-23	regular
1565	Andrés	Jiménez Aguilar	andrés1565@gmail.com	5588150391	5	Sinaloa	7	2026-06-06	regular
1566	José	Rodríguez Hernández	josé1566@hotmail.com	5589979778	5	Sinaloa	7	2022-03-09	regular
1570	Mónica	Reyes Reyes	mónica1570@gmail.com	5586359325	5	Sinaloa	7	2024-06-26	premium
1538	Sofía	Castillo Ortega	sofía1538@gmail.com	5585361321	6	Jalisco	4	2023-01-19	premium
1556	Verónica	Vargas Ramírez	verónica1556@yahoo.com	5586667691	6	Jalisco	4	2024-08-14	regular
1578	Mónica	Díaz Cruz	mónica1578@gmail.com	5528741499	6	Jalisco	4	2025-10-19	premium
1579	Laura	Martínez Martínez	laura1579@yahoo.com	5534254080	6	Jalisco	4	2025-10-07	premium
1590	Ricardo	Gutiérrez Morales	ricardo1590@yahoo.com	5593137786	6	Jalisco	4	2023-12-17	premium
1537	Luis	Torres Herrera	luis1537@gmail.com	5514723415	7	Sonora	7	2025-06-13	regular
1574	Laura	García Herrera	laura1574@hotmail.com	5588769634	7	Sonora	7	2022-09-21	regular
1586	María	Mendoza Núñez	maría1586@hotmail.com	5590020978	7	Sonora	7	2025-09-22	premium
1558	Mónica	Martínez Vargas	mónica1558@yahoo.com	5538866008	8	Chihuahua	1	2023-12-17	premium
1562	Ricardo	Mendoza Ortega	ricardo1562@gmail.com	5582499525	8	Chihuahua	1	2024-08-25	regular
1573	Valeria	Martínez Cruz	valeria1573@hotmail.com	5531878126	8	Chihuahua	1	2021-07-22	premium
1575	Diego	Ramírez Vargas	diego1575@gmail.com	5578636393	8	Chihuahua	1	2026-02-15	premium
1576	Carlos	Ortega Díaz	carlos1576@gmail.com	5521092802	8	Chihuahua	1	2022-08-05	regular
1588	David	Gutiérrez Rivera	david1588@hotmail.com	5527493080	8	Chihuahua	1	2021-09-12	regular
1528	Claudia	Rodríguez Núñez	claudia1528@gmail.com	5562220968	9	Guanajuato	5	2023-03-21	regular
1542	Patricia	Morales Castillo	patricia1542@yahoo.com	5599833906	10	Yucatán	8	2023-05-30	premium
1587	María	Herrera Martínez	maría1587@yahoo.com	5529042679	10	Yucatán	8	2025-05-17	regular
1540	Roberto	Castro González	roberto1540@gmail.com	5584813845	11	Baja California	7	2024-02-10	regular
1547	David	Flores Morales	david1547@yahoo.com	5594960511	11	Baja California	7	2023-05-01	premium
1549	Claudia	González Morales	claudia1549@gmail.com	5539807813	11	Baja California	7	2023-12-05	mayorista
1589	Patricia	García González	patricia1589@gmail.com	5517222980	11	Baja California	7	2025-10-02	regular
1572	Ana	Pérez García	ana1572@yahoo.com	5562056495	12	Nuevo León	6	2021-11-16	regular
1539	Diego	García Ramírez	diego1539@yahoo.com	5579022241	13	Michoacán	2	2023-04-26	mayorista
1550	Gabriela	Vargas Díaz	gabriela1550@yahoo.com	5559163162	13	Michoacán	2	2022-04-21	premium
1582	Roberto	Cruz Vargas	roberto1582@gmail.com	5550461969	13	Michoacán	2	2025-11-11	regular
1583	Carmen	Martínez López	carmen1583@hotmail.com	5562986971	13	Michoacán	2	2025-08-28	vip
1529	Elena	Vega Castillo	elena1529@hotmail.com	5559667523	14	Puebla	3	2025-03-11	mayorista
1534	Eduardo	Pérez Gómez	eduardo1534@yahoo.com	5570891460	14	Puebla	3	2024-08-11	mayorista
1557	Andrés	Gómez Castro	andrés1557@gmail.com	5542358410	14	Puebla	3	2024-03-30	regular
1560	Liliana	Núñez Jiménez	liliana1560@yahoo.com	5532977078	14	Puebla	3	2022-05-03	regular
1577	Luis	González Gómez	luis1577@yahoo.com	5530372558	14	Puebla	3	2025-04-13	regular
1541	Ramón	Reyes Díaz	ramón1541@gmail.com	5570368405	15	Querétaro	5	2023-12-19	regular
1551	Gabriela	Pérez López	gabriela1551@gmail.com	5533202743	15	Querétaro	5	2021-11-30	mayorista
1569	Ana	Gutiérrez Pérez	ana1569@hotmail.com	5545609515	15	Querétaro	5	2023-09-14	premium
1554	Manuel	Cruz Rivera	manuel1554@yahoo.com	5573305233	16	Coahuila	6	2023-07-15	premium
1571	Daniela	Moreno Reyes	daniela1571@yahoo.com	5581805084	16	Coahuila	6	2026-02-07	premium
1581	Rosa	Hernández Torres	rosa1581@gmail.com	5567908044	16	Coahuila	6	2024-07-21	regular
1585	Ramón	Pérez Castillo	ramón1585@gmail.com	5556972893	16	Coahuila	6	2021-09-26	premium
1531	Manuel	Flores García	manuel1531@gmail.com	5575467163	17	San Luis Potosí	5	2021-10-26	regular
1543	Alejandra	Rivera Mendoza	alejandra1543@gmail.com	5592362416	17	San Luis Potosí	5	2025-06-12	regular
1567	Luis	Pérez Morales	luis1567@gmail.com	5553872657	18	Baja California	7	2023-03-13	nuevo
1568	Sandra	Sánchez González	sandra1568@hotmail.com	5523228017	18	Baja California	7	2021-12-30	regular
1532	Sergio	Vargas Jiménez	sergio1532@hotmail.com	5578761110	19	Veracruz	3	2026-01-10	vip
1533	Diego	Jiménez Morales	diego1533@yahoo.com	5554777065	19	Veracruz	3	2025-02-13	regular
1593	Ana	Sánchez Hernández	ana1593@hotmail.com	5564430657	1	Guerrero	2	2023-04-13	vip
1613	Sofía	Díaz Núñez	sofía1613@yahoo.com	5539029091	1	Guerrero	2	2024-11-01	nuevo
1640	María	Núñez Rodríguez	maría1640@hotmail.com	5550545587	1	Guerrero	2	2025-08-19	regular
1599	Mónica	Martínez González	mónica1599@gmail.com	5524519890	2	Aguascalientes	5	2022-06-30	regular
1647	Francisco	Gómez Ortega	francisco1647@hotmail.com	5522119306	2	Aguascalientes	5	2024-07-15	regular
1611	Alberto	Aguilar Morales	alberto1611@gmail.com	5563016030	3	Chihuahua	1	2023-06-24	nuevo
1631	Alberto	Núñez Díaz	alberto1631@gmail.com	5547988983	3	Chihuahua	1	2024-05-02	regular
1592	Luis	Flores Flores	luis1592@hotmail.com	5594790000	4	CDMX	5	2025-03-14	premium
1620	Liliana	Cruz Castro	liliana1620@yahoo.com	5569653983	4	CDMX	5	2022-05-07	mayorista
1636	Sandra	Cruz Jiménez	sandra1636@gmail.com	5567031050	4	CDMX	5	2022-12-13	mayorista
1623	Andrés	Reyes Rivera	andrés1623@yahoo.com	5533162629	6	Jalisco	4	2021-11-22	regular
1627	Liliana	Moreno Núñez	liliana1627@gmail.com	5599198877	6	Jalisco	4	2024-12-11	regular
1602	Fernando	García García	fernando1602@gmail.com	5534390832	7	Sonora	7	2023-06-19	mayorista
1637	José	Pérez Aguilar	josé1637@hotmail.com	5543324269	7	Sonora	7	2022-09-26	premium
1649	Daniela	Sánchez Castillo	daniela1649@gmail.com	5515971136	7	Sonora	7	2025-10-22	regular
1651	Juan	Martínez Reyes	juan1651@gmail.com	5553976954	7	Sonora	7	2023-01-31	regular
1603	Mónica	Díaz Castillo	mónica1603@yahoo.com	5513984125	8	Chihuahua	1	2025-10-08	regular
1624	Alejandra	Morales Flores	alejandra1624@yahoo.com	5534136369	8	Chihuahua	1	2024-04-24	regular
1638	Carmen	Aguilar Vega	carmen1638@yahoo.com	5541225607	8	Chihuahua	1	2023-10-12	premium
1616	Carlos	López Castillo	carlos1616@gmail.com	5545448743	9	Guanajuato	5	2021-06-28	regular
1617	Patricia	García Pérez	patricia1617@hotmail.com	5582551437	9	Guanajuato	5	2025-11-07	regular
1625	Pablo	López Herrera	pablo1625@gmail.com	5521278653	9	Guanajuato	5	2023-07-31	mayorista
1648	Ana	Martínez Martínez	ana1648@gmail.com	5590410932	9	Guanajuato	5	2026-02-12	mayorista
1595	Daniela	Rivera Torres	daniela1595@yahoo.com	5543030652	10	Yucatán	8	2023-10-03	mayorista
1604	Fernando	Jiménez Gómez	fernando1604@hotmail.com	5568985501	10	Yucatán	8	2021-09-29	regular
1609	Laura	Aguilar Castillo	laura1609@gmail.com	5594701395	10	Yucatán	8	2023-03-24	regular
1618	Roberto	Moreno Moreno	roberto1618@gmail.com	5594667848	10	Yucatán	8	2025-11-29	mayorista
1606	María	Hernández Hernández	maría1606@gmail.com	5564087642	11	Baja California	7	2024-01-22	regular
1612	Laura	Pérez Cruz	laura1612@gmail.com	5526143430	11	Baja California	7	2024-04-20	premium
1614	Ramón	Ramírez Sánchez	ramón1614@yahoo.com	5553260996	11	Baja California	7	2025-06-02	regular
1628	Luis	Ramírez Castro	luis1628@gmail.com	5587977109	11	Baja California	7	2025-10-24	regular
1594	Daniela	Díaz Castro	daniela1594@gmail.com	5593605083	12	Nuevo León	6	2024-05-13	regular
1621	Liliana	Torres Núñez	liliana1621@gmail.com	5514098443	12	Nuevo León	6	2023-05-19	vip
1598	José	Morales Rodríguez	josé1598@yahoo.com	5511762146	13	Michoacán	2	2025-11-24	mayorista
1610	José	Flores Mendoza	josé1610@yahoo.com	5591718358	13	Michoacán	2	2026-03-26	mayorista
1622	Gabriela	Gutiérrez González	gabriela1622@yahoo.com	5557788337	13	Michoacán	2	2023-07-27	premium
1626	Liliana	Ramírez Mendoza	liliana1626@hotmail.com	5585120173	13	Michoacán	2	2025-08-07	regular
1639	Valeria	Rodríguez Sánchez	valeria1639@yahoo.com	5584664486	13	Michoacán	2	2025-11-30	regular
1642	José	Morales Herrera	josé1642@gmail.com	5518768924	13	Michoacán	2	2025-09-25	premium
1644	Manuel	González Martínez	manuel1644@yahoo.com	5565525803	13	Michoacán	2	2021-09-09	nuevo
1596	Alejandro	Cruz Díaz	alejandro1596@yahoo.com	5517972328	14	Puebla	3	2021-12-22	premium
1597	Fernando	García Mendoza	fernando1597@gmail.com	5565374574	15	Querétaro	5	2025-02-26	regular
1629	Manuel	Vargas Sánchez	manuel1629@yahoo.com	5584250773	15	Querétaro	5	2025-03-09	regular
1643	Liliana	Herrera Gutiérrez	liliana1643@gmail.com	5583377419	15	Querétaro	5	2022-05-10	regular
1630	Luis	Herrera Núñez	luis1630@hotmail.com	5598399977	16	Coahuila	6	2025-06-04	regular
1635	Sandra	Sánchez Jiménez	sandra1635@yahoo.com	5544699521	16	Coahuila	6	2023-10-03	regular
1645	Valeria	Jiménez Rodríguez	valeria1645@gmail.com	5594099499	16	Coahuila	6	2024-12-16	regular
1646	Verónica	Jiménez Mendoza	verónica1646@gmail.com	5588083792	16	Coahuila	6	2022-07-16	premium
1650	Miguel	Sánchez Aguilar	miguel1650@gmail.com	5584522968	16	Coahuila	6	2025-04-13	regular
1601	Sergio	Rivera Reyes	sergio1601@gmail.com	5576039568	17	San Luis Potosí	5	2025-04-29	mayorista
1632	Alejandro	Núñez Jiménez	alejandro1632@yahoo.com	5578679294	17	San Luis Potosí	5	2025-08-05	regular
1652	Miguel	García Jiménez	miguel1652@gmail.com	5586826207	17	San Luis Potosí	5	2021-12-02	regular
1607	Liliana	García Herrera	liliana1607@yahoo.com	5569986114	19	Veracruz	3	2023-09-21	premium
1608	Alejandro	Hernández García	alejandro1608@gmail.com	5545258217	19	Veracruz	3	2025-02-13	regular
1615	Sandra	Moreno Ortega	sandra1615@gmail.com	5588230673	19	Veracruz	3	2025-10-21	nuevo
1619	Verónica	Mendoza López	verónica1619@hotmail.com	5592572018	19	Veracruz	3	2023-07-27	regular
1633	Manuel	Flores Martínez	manuel1633@yahoo.com	5557723980	19	Veracruz	3	2022-03-08	regular
1710	Sofía	Cruz Morales	sofía1710@hotmail.com	5528517985	1	Guerrero	2	2024-10-12	regular
1715	Ramón	González González	ramón1715@gmail.com	5559280571	1	Guerrero	2	2021-10-15	regular
1667	Ana	Pérez Reyes	ana1667@hotmail.com	5574252953	2	Aguascalientes	5	2025-03-02	regular
1714	Manuel	Rivera Moreno	manuel1714@yahoo.com	5516089650	2	Aguascalientes	5	2024-01-02	premium
1672	Andrés	Torres Herrera	andrés1672@gmail.com	5575934922	3	Chihuahua	1	2022-05-01	mayorista
1675	Diego	Rivera Castillo	diego1675@hotmail.com	5519029034	3	Chihuahua	1	2022-01-18	regular
1703	Juan	Gómez Gutiérrez	juan1703@gmail.com	5585779559	3	Chihuahua	1	2024-03-04	regular
1705	Claudia	Reyes Moreno	claudia1705@gmail.com	5575135201	3	Chihuahua	1	2026-01-14	regular
1663	Ana	García Herrera	ana1663@gmail.com	5582054847	4	CDMX	5	2025-11-02	regular
1681	Alberto	Jiménez Pérez	alberto1681@hotmail.com	5524381850	4	CDMX	5	2022-11-05	premium
1697	María	Cruz Aguilar	maría1697@gmail.com	5534478552	4	CDMX	5	2024-05-15	mayorista
1698	David	Ramos Ortega	david1698@hotmail.com	5554480754	4	CDMX	5	2022-07-31	regular
1655	Gabriela	Flores Díaz	gabriela1655@gmail.com	5575770619	5	Sinaloa	7	2024-07-15	regular
1706	Ramón	Díaz Rodríguez	ramón1706@hotmail.com	5586416822	5	Sinaloa	7	2024-04-30	regular
1707	Patricia	García López	patricia1707@hotmail.com	5558117953	5	Sinaloa	7	2021-09-06	nuevo
1658	Juan	Vega Vargas	juan1658@yahoo.com	5548814484	6	Jalisco	4	2025-11-01	regular
1676	Miguel	Ramírez Flores	miguel1676@gmail.com	5536086815	6	Jalisco	4	2024-04-11	premium
1684	Sandra	Herrera González	sandra1684@gmail.com	5590376344	6	Jalisco	4	2024-09-23	nuevo
1689	Carmen	Castro Ortega	carmen1689@yahoo.com	5579079708	6	Jalisco	4	2022-06-15	regular
1693	Rosa	Rivera Gómez	rosa1693@gmail.com	5548757233	6	Jalisco	4	2022-05-20	regular
1696	Ramón	Flores Aguilar	ramón1696@gmail.com	5523107454	6	Jalisco	4	2026-06-04	regular
1679	Mónica	Morales Reyes	mónica1679@hotmail.com	5567040474	7	Sonora	7	2025-06-24	regular
1709	Liliana	Rivera Núñez	liliana1709@yahoo.com	5571872428	7	Sonora	7	2024-07-24	regular
1713	Mónica	Hernández Mendoza	mónica1713@gmail.com	5545478283	7	Sonora	7	2024-12-13	vip
1656	Andrés	Mendoza Torres	andrés1656@gmail.com	5539626238	8	Chihuahua	1	2022-01-23	regular
1657	Alejandra	González Sánchez	alejandra1657@gmail.com	5559597432	10	Yucatán	8	2021-12-18	regular
1662	Alejandro	Castillo Martínez	alejandro1662@hotmail.com	5577559901	10	Yucatán	8	2023-06-15	premium
1665	Daniela	Cruz Núñez	daniela1665@gmail.com	5511828041	10	Yucatán	8	2023-12-11	regular
1670	Alejandro	Hernández Hernández	alejandro1670@gmail.com	5567611249	10	Yucatán	8	2024-09-24	premium
1677	Elena	Flores Ramos	elena1677@gmail.com	5529438263	10	Yucatán	8	2022-12-11	mayorista
1685	Ramón	Castillo González	ramón1685@gmail.com	5524046439	10	Yucatán	8	2021-09-26	regular
1659	Alberto	Rivera Sánchez	alberto1659@gmail.com	5511228910	11	Baja California	7	2025-07-18	mayorista
1660	Juan	Torres Rodríguez	juan1660@gmail.com	5570656527	11	Baja California	7	2021-07-02	regular
1702	Alberto	García Rivera	alberto1702@gmail.com	5536125123	11	Baja California	7	2024-02-03	regular
1716	Ana	López Vargas	ana1716@hotmail.com	5555925432	11	Baja California	7	2024-11-25	nuevo
1661	Gabriela	Gómez González	gabriela1661@gmail.com	5592312126	12	Nuevo León	6	2024-04-03	regular
1664	Fernanda	Morales Castillo	fernanda1664@hotmail.com	5536291079	12	Nuevo León	6	2025-06-22	regular
1666	Isabel	Vega Rodríguez	isabel1666@gmail.com	5567040947	12	Nuevo León	6	2025-08-14	premium
1691	Francisco	Gómez Cruz	francisco1691@yahoo.com	5513999753	13	Michoacán	2	2021-09-23	premium
1717	Fernando	Aguilar González	fernando1717@hotmail.com	5533840467	13	Michoacán	2	2025-07-13	vip
1671	Andrés	Flores Ramos	andrés1671@yahoo.com	5520295008	14	Puebla	3	2025-08-29	vip
1678	Ricardo	Castro Torres	ricardo1678@hotmail.com	5595143591	14	Puebla	3	2023-07-23	regular
1692	Verónica	Núñez Mendoza	verónica1692@gmail.com	5561839427	14	Puebla	3	2026-05-20	regular
1668	Fernanda	Vega Herrera	fernanda1668@gmail.com	5571901789	15	Querétaro	5	2024-06-24	nuevo
1680	Eduardo	Ramírez Ramírez	eduardo1680@hotmail.com	5538221426	15	Querétaro	5	2021-07-07	regular
1682	Valeria	Sánchez Vargas	valeria1682@gmail.com	5529741221	15	Querétaro	5	2023-11-20	nuevo
1686	Pablo	Sánchez Hernández	pablo1686@gmail.com	5590291375	15	Querétaro	5	2022-04-02	nuevo
1688	Elena	Ortega Mendoza	elena1688@hotmail.com	5596714228	15	Querétaro	5	2023-08-23	regular
1704	María	Reyes Sánchez	maría1704@gmail.com	5584897527	15	Querétaro	5	2023-07-12	mayorista
1708	Verónica	Aguilar Vega	verónica1708@yahoo.com	5520557472	15	Querétaro	5	2021-08-26	regular
1674	Claudia	Rodríguez García	claudia1674@hotmail.com	5582329391	16	Coahuila	6	2022-08-08	regular
1699	Pablo	Díaz Ramírez	pablo1699@yahoo.com	5596879784	16	Coahuila	6	2024-05-13	regular
1673	Andrés	Castro Herrera	andrés1673@yahoo.com	5599187418	17	San Luis Potosí	5	2022-10-29	premium
1700	José	Castillo Aguilar	josé1700@gmail.com	5540171534	17	San Luis Potosí	5	2026-06-08	mayorista
1695	Isabel	Díaz Mendoza	isabel1695@gmail.com	5583864238	18	Baja California	7	2025-05-08	regular
1683	Isabel	Vega Gutiérrez	isabel1683@gmail.com	5593496702	19	Veracruz	3	2023-03-13	regular
1694	Valeria	Vargas Sánchez	valeria1694@gmail.com	5521415537	19	Veracruz	3	2023-08-01	premium
1752	Verónica	Hernández López	verónica1752@gmail.com	5568952764	1	Guerrero	2	2024-12-20	regular
1723	Miguel	Cruz López	miguel1723@gmail.com	5589678144	2	Aguascalientes	5	2022-08-18	regular
1730	Daniela	Cruz Ramírez	daniela1730@gmail.com	5542474862	2	Aguascalientes	5	2021-07-23	vip
1761	Gabriela	Castro Moreno	gabriela1761@hotmail.com	5571275566	2	Aguascalientes	5	2022-03-20	mayorista
1748	Gabriela	López López	gabriela1748@gmail.com	5594135858	3	Chihuahua	1	2025-12-01	nuevo
1781	Andrés	Cruz Cruz	andrés1781@hotmail.com	5522878701	3	Chihuahua	1	2023-06-07	regular
1729	Manuel	Moreno Jiménez	manuel1729@hotmail.com	5519223541	5	Sinaloa	7	2024-10-12	regular
1738	Sofía	Jiménez Moreno	sofía1738@yahoo.com	5549585094	5	Sinaloa	7	2022-08-15	regular
1744	Claudia	Martínez Herrera	claudia1744@yahoo.com	5527332224	5	Sinaloa	7	2023-02-09	regular
1720	Daniela	García Morales	daniela1720@hotmail.com	5585491870	6	Jalisco	4	2025-12-06	regular
1722	Miguel	Ramos Rivera	miguel1722@hotmail.com	5569134843	6	Jalisco	4	2021-11-03	regular
1728	Sergio	Mendoza Gutiérrez	sergio1728@hotmail.com	5519492312	6	Jalisco	4	2024-12-30	regular
1734	Valeria	Flores Hernández	valeria1734@yahoo.com	5547138074	6	Jalisco	4	2024-03-28	regular
1742	Ana	López Flores	ana1742@yahoo.com	5534574296	7	Sonora	7	2021-12-20	premium
1778	Juan	Sánchez Vega	juan1778@hotmail.com	5576844055	7	Sonora	7	2021-09-04	vip
1780	Miguel	Díaz Ramírez	miguel1780@yahoo.com	5517709617	7	Sonora	7	2022-06-08	premium
1732	Isabel	Castro Torres	isabel1732@gmail.com	5577562496	8	Chihuahua	1	2023-05-18	regular
1735	Daniela	López Rivera	daniela1735@gmail.com	5531401790	8	Chihuahua	1	2023-04-12	regular
1746	Alberto	Pérez Torres	alberto1746@gmail.com	5511638103	8	Chihuahua	1	2022-07-29	mayorista
1753	Elena	Morales Reyes	elena1753@hotmail.com	5539233152	8	Chihuahua	1	2023-04-01	mayorista
1771	David	Núñez Sánchez	david1771@hotmail.com	5591050580	8	Chihuahua	1	2026-01-25	regular
1775	Alejandro	López Ramírez	alejandro1775@hotmail.com	5597890289	8	Chihuahua	1	2022-05-06	regular
1718	Isabel	García Hernández	isabel1718@hotmail.com	5579351663	9	Guanajuato	5	2025-07-17	premium
1741	Ramón	Rivera Vega	ramón1741@gmail.com	5511419443	9	Guanajuato	5	2021-08-15	regular
1764	Carlos	Castro Castillo	carlos1764@yahoo.com	5579881903	9	Guanajuato	5	2026-01-03	regular
1773	Ana	Moreno Martínez	ana1773@gmail.com	5528535751	9	Guanajuato	5	2022-05-24	premium
1731	Miguel	Gómez Vega	miguel1731@hotmail.com	5515223457	11	Baja California	7	2023-12-07	regular
1747	Alejandro	Rivera González	alejandro1747@gmail.com	5538791442	11	Baja California	7	2026-03-10	regular
1763	Alejandra	Torres Rodríguez	alejandra1763@yahoo.com	5542248411	11	Baja California	7	2022-09-06	mayorista
1721	Carlos	Jiménez Rodríguez	carlos1721@gmail.com	5524657555	12	Nuevo León	6	2024-09-04	regular
1724	Isabel	Castro Castillo	isabel1724@gmail.com	5597730855	12	Nuevo León	6	2021-07-11	regular
1745	Liliana	Moreno Rivera	liliana1745@gmail.com	5540950556	12	Nuevo León	6	2026-03-05	regular
1750	Daniela	Moreno Ortega	daniela1750@yahoo.com	5562066056	12	Nuevo León	6	2026-04-04	regular
1755	David	García Pérez	david1755@yahoo.com	5511483668	12	Nuevo León	6	2023-09-05	regular
1762	Verónica	Cruz Flores	verónica1762@gmail.com	5534973630	12	Nuevo León	6	2025-06-26	regular
1727	Sofía	Díaz Aguilar	sofía1727@gmail.com	5593806250	13	Michoacán	2	2025-08-26	nuevo
1772	Juan	Reyes Núñez	juan1772@gmail.com	5533136216	13	Michoacán	2	2024-11-23	regular
1736	Adriana	Hernández Gutiérrez	adriana1736@gmail.com	5553560692	14	Puebla	3	2026-03-16	regular
1737	María	Moreno Jiménez	maría1737@yahoo.com	5521184988	14	Puebla	3	2023-11-07	premium
1766	Manuel	García Rodríguez	manuel1766@hotmail.com	5532581930	14	Puebla	3	2022-10-25	premium
1767	Carmen	López Rivera	carmen1767@gmail.com	5580388195	14	Puebla	3	2023-07-08	regular
1768	Carlos	Moreno Rivera	carlos1768@gmail.com	5568214906	14	Puebla	3	2022-02-10	regular
1749	Valeria	Castro Jiménez	valeria1749@gmail.com	5533389105	15	Querétaro	5	2024-06-06	regular
1756	Alejandro	González Castro	alejandro1756@yahoo.com	5571656739	15	Querétaro	5	2025-01-06	regular
1759	Ana	Rivera Sánchez	ana1759@hotmail.com	5582613651	15	Querétaro	5	2024-02-15	regular
1770	Claudia	Rodríguez Castillo	claudia1770@gmail.com	5561233557	15	Querétaro	5	2023-07-19	regular
1719	Elena	López González	elena1719@gmail.com	5519729173	16	Coahuila	6	2023-05-28	vip
1754	Eduardo	Vega Sánchez	eduardo1754@yahoo.com	5571535643	16	Coahuila	6	2022-03-11	mayorista
1733	Ricardo	Gómez Núñez	ricardo1733@gmail.com	5594640648	17	San Luis Potosí	5	2024-03-02	vip
1725	Verónica	Castillo Flores	verónica1725@gmail.com	5540467872	18	Baja California	7	2021-12-21	regular
1726	Ramón	Gutiérrez Ortega	ramón1726@hotmail.com	5556253278	18	Baja California	7	2023-02-09	regular
1740	Laura	Moreno Rodríguez	laura1740@gmail.com	5521098866	18	Baja California	7	2025-06-03	regular
1779	Sofía	Sánchez Rivera	sofía1779@gmail.com	5515560483	18	Baja California	7	2023-08-16	regular
1751	Liliana	Ortega García	liliana1751@gmail.com	5563389592	19	Veracruz	3	2024-01-16	vip
1758	Luis	López García	luis1758@gmail.com	5514288027	19	Veracruz	3	2026-03-22	premium
1769	Manuel	Rivera Flores	manuel1769@gmail.com	5520945862	19	Veracruz	3	2021-07-04	regular
1776	Sandra	Ramos Martínez	sandra1776@hotmail.com	5558305167	19	Veracruz	3	2023-01-25	premium
1798	Andrés	Herrera Ramos	andrés1798@hotmail.com	5546045914	1	Guerrero	2	2024-08-03	premium
1824	Mario	Díaz López	mario1824@gmail.com	5514665196	1	Guerrero	2	2024-03-20	regular
1844	Mónica	Gómez Hernández	mónica1844@gmail.com	5580225378	1	Guerrero	2	2025-03-27	regular
1799	Alejandro	Ramos Herrera	alejandro1799@gmail.com	5595325945	2	Aguascalientes	5	2025-04-29	regular
1802	Carlos	Gutiérrez Castillo	carlos1802@gmail.com	5586864684	2	Aguascalientes	5	2021-09-28	vip
1810	Mónica	López Núñez	mónica1810@gmail.com	5547695226	2	Aguascalientes	5	2025-07-26	regular
1843	Sergio	López Pérez	sergio1843@gmail.com	5567713148	3	Chihuahua	1	2024-03-07	regular
1797	Eduardo	Vega Moreno	eduardo1797@gmail.com	5564447809	4	CDMX	5	2024-05-07	nuevo
1812	Claudia	Hernández Martínez	claudia1812@hotmail.com	5531958106	4	CDMX	5	2022-07-26	regular
1815	Juan	Aguilar Cruz	juan1815@gmail.com	5518439853	4	CDMX	5	2024-05-20	regular
1841	Roberto	Hernández Morales	roberto1841@gmail.com	5528399621	4	CDMX	5	2025-01-08	regular
1795	Ricardo	Castro González	ricardo1795@gmail.com	5547813626	5	Sinaloa	7	2025-05-25	mayorista
1811	Isabel	Ramos Castro	isabel1811@hotmail.com	5577845175	5	Sinaloa	7	2024-12-27	regular
1796	Daniela	Gutiérrez Sánchez	daniela1796@yahoo.com	5537153169	6	Jalisco	4	2021-11-28	premium
1814	Fernando	Cruz García	fernando1814@hotmail.com	5596665124	6	Jalisco	4	2022-03-01	premium
1819	Roberto	Núñez Hernández	roberto1819@yahoo.com	5593541727	7	Sonora	7	2024-06-23	premium
1821	Elena	Rivera González	elena1821@gmail.com	5592593597	7	Sonora	7	2021-10-21	mayorista
1807	Carmen	Díaz Aguilar	carmen1807@hotmail.com	5551466066	8	Chihuahua	1	2022-06-01	mayorista
1816	Ana	Hernández García	ana1816@gmail.com	5574940567	9	Guanajuato	5	2022-05-10	regular
1820	Fernanda	Rodríguez Núñez	fernanda1820@gmail.com	5590655868	9	Guanajuato	5	2023-03-21	premium
1827	Verónica	Sánchez Castro	verónica1827@gmail.com	5585191544	9	Guanajuato	5	2022-06-26	regular
1831	Liliana	González Castillo	liliana1831@gmail.com	5594736386	9	Guanajuato	5	2025-06-11	premium
1784	Carlos	Ramírez Sánchez	carlos1784@gmail.com	5582640278	10	Yucatán	8	2026-01-26	premium
1794	Laura	Moreno Jiménez	laura1794@gmail.com	5561038473	10	Yucatán	8	2025-03-17	regular
1805	Alejandro	González Sánchez	alejandro1805@hotmail.com	5525926737	10	Yucatán	8	2025-06-05	regular
1828	Alejandra	Núñez Castillo	alejandra1828@gmail.com	5581690032	10	Yucatán	8	2022-01-27	regular
1834	Miguel	Ramírez Gómez	miguel1834@gmail.com	5576005098	10	Yucatán	8	2025-11-09	mayorista
1782	María	Vargas Rodríguez	maría1782@gmail.com	5522033806	11	Baja California	7	2022-08-13	mayorista
1793	Diego	Jiménez Moreno	diego1793@gmail.com	5593587401	11	Baja California	7	2025-08-13	premium
1813	Patricia	Sánchez Castro	patricia1813@yahoo.com	5587484527	11	Baja California	7	2024-03-14	premium
1787	Ana	Gómez Sánchez	ana1787@gmail.com	5530531509	12	Nuevo León	6	2023-03-31	regular
1838	Eduardo	Flores Ramírez	eduardo1838@gmail.com	5533391451	12	Nuevo León	6	2024-05-18	regular
1792	Verónica	Castillo Flores	verónica1792@yahoo.com	5579080131	13	Michoacán	2	2022-11-16	mayorista
1818	Ramón	Castillo Mendoza	ramón1818@hotmail.com	5563418120	13	Michoacán	2	2021-12-04	premium
1825	Andrés	Hernández Reyes	andrés1825@hotmail.com	5526212584	13	Michoacán	2	2021-12-02	regular
1836	José	Sánchez Herrera	josé1836@yahoo.com	5517694960	13	Michoacán	2	2022-01-17	regular
1785	Juan	Ortega López	juan1785@gmail.com	5537249427	14	Puebla	3	2024-02-03	regular
1804	Daniela	Ortega Gómez	daniela1804@hotmail.com	5534390563	14	Puebla	3	2021-08-29	vip
1808	Mario	Sánchez Moreno	mario1808@gmail.com	5540333941	14	Puebla	3	2022-08-17	vip
1817	David	Cruz Moreno	david1817@gmail.com	5536154680	14	Puebla	3	2024-01-22	regular
1826	Fernanda	Hernández Martínez	fernanda1826@yahoo.com	5563207360	14	Puebla	3	2024-06-16	premium
1835	David	Sánchez Vega	david1835@gmail.com	5550921707	14	Puebla	3	2022-10-13	regular
1842	María	López Jiménez	maría1842@gmail.com	5576589496	14	Puebla	3	2025-09-06	premium
1806	Gabriela	Hernández Moreno	gabriela1806@gmail.com	5597330798	15	Querétaro	5	2023-03-04	regular
1786	Daniela	Gómez Gutiérrez	daniela1786@gmail.com	5566060603	16	Coahuila	6	2023-11-11	nuevo
1790	Alberto	Gómez Rodríguez	alberto1790@yahoo.com	5532675186	16	Coahuila	6	2025-09-09	regular
1800	Eduardo	Ortega Morales	eduardo1800@gmail.com	5546353477	16	Coahuila	6	2024-04-11	vip
1803	Gabriela	Reyes López	gabriela1803@gmail.com	5534879238	16	Coahuila	6	2023-02-07	regular
1788	Eduardo	Hernández Torres	eduardo1788@gmail.com	5544190049	17	San Luis Potosí	5	2022-10-07	regular
1791	Laura	Torres González	laura1791@hotmail.com	5599317146	18	Baja California	7	2021-10-18	premium
1801	Sandra	Gómez Mendoza	sandra1801@yahoo.com	5547628906	18	Baja California	7	2026-01-01	regular
1809	Luis	Morales Reyes	luis1809@gmail.com	5532415998	18	Baja California	7	2025-10-08	regular
1829	Andrés	Herrera Ramírez	andrés1829@yahoo.com	5539083765	18	Baja California	7	2025-08-25	nuevo
1830	Sandra	García Vargas	sandra1830@hotmail.com	5544058594	18	Baja California	7	2024-07-03	regular
1783	Laura	Morales Torres	laura1783@hotmail.com	5531356906	19	Veracruz	3	2022-03-30	nuevo
1789	Fernanda	Pérez Moreno	fernanda1789@hotmail.com	5540161371	19	Veracruz	3	2024-02-09	regular
1856	Daniela	González Ortega	daniela1856@gmail.com	5539895678	2	Aguascalientes	5	2025-04-16	regular
1858	Alejandra	Torres Sánchez	alejandra1858@gmail.com	5552146187	3	Chihuahua	1	2024-10-26	vip
1861	Laura	Mendoza Castro	laura1861@yahoo.com	5586421624	3	Chihuahua	1	2023-02-21	regular
1868	Ramón	Díaz Vega	ramón1868@hotmail.com	5529915454	3	Chihuahua	1	2025-03-11	regular
1851	Claudia	García Castillo	claudia1851@yahoo.com	5585331364	5	Sinaloa	7	2024-03-23	regular
1855	Alejandro	Ortega Díaz	alejandro1855@gmail.com	5572331124	5	Sinaloa	7	2026-01-01	regular
1865	Ricardo	Rodríguez Martínez	ricardo1865@gmail.com	5586639255	5	Sinaloa	7	2025-09-20	regular
1883	Carlos	Sánchez García	carlos1883@yahoo.com	5572873761	5	Sinaloa	7	2026-01-24	premium
1889	Patricia	Torres Hernández	patricia1889@gmail.com	5517850353	5	Sinaloa	7	2021-11-17	mayorista
1867	Alejandra	Rivera Flores	alejandra1867@hotmail.com	5526865926	6	Jalisco	4	2025-01-27	regular
1876	Fernanda	Mendoza Aguilar	fernanda1876@gmail.com	5513760835	6	Jalisco	4	2023-05-08	premium
1887	Ricardo	García Pérez	ricardo1887@hotmail.com	5527691237	6	Jalisco	4	2025-09-24	regular
1896	José	Hernández Martínez	josé1896@gmail.com	5578922513	6	Jalisco	4	2025-02-14	premium
1897	Verónica	Díaz Mendoza	verónica1897@gmail.com	5592435286	6	Jalisco	4	2022-09-09	vip
1866	Diego	Herrera Hernández	diego1866@yahoo.com	5579601571	7	Sonora	7	2025-05-13	regular
1854	Ricardo	Rivera Flores	ricardo1854@gmail.com	5573117198	8	Chihuahua	1	2026-03-26	regular
1873	Manuel	Gutiérrez Rivera	manuel1873@yahoo.com	5534637969	8	Chihuahua	1	2021-10-18	regular
1881	David	Ramos Vega	david1881@gmail.com	5531405453	8	Chihuahua	1	2025-04-26	regular
1849	Liliana	Vargas Flores	liliana1849@yahoo.com	5516131158	9	Guanajuato	5	2025-10-07	regular
1874	Patricia	Hernández Vega	patricia1874@yahoo.com	5549292923	9	Guanajuato	5	2024-12-16	regular
1885	Daniela	Herrera Aguilar	daniela1885@hotmail.com	5517605519	9	Guanajuato	5	2024-11-19	premium
1891	Alejandro	Díaz Martínez	alejandro1891@gmail.com	5590627301	9	Guanajuato	5	2024-12-18	regular
1901	Diego	Gómez Ramos	diego1901@yahoo.com	5570989006	9	Guanajuato	5	2025-07-12	regular
1905	Alberto	Ortega Núñez	alberto1905@yahoo.com	5512793011	9	Guanajuato	5	2026-05-21	mayorista
1853	Fernando	Gómez Castro	fernando1853@hotmail.com	5514533166	10	Yucatán	8	2021-08-20	regular
1877	Valeria	Castillo Castillo	valeria1877@gmail.com	5586380740	10	Yucatán	8	2024-04-21	premium
1902	Patricia	González Martínez	patricia1902@yahoo.com	5553017146	10	Yucatán	8	2023-02-17	mayorista
1862	Isabel	Ramírez Ortega	isabel1862@yahoo.com	5546190360	11	Baja California	7	2024-12-18	regular
1863	Verónica	Rodríguez González	verónica1863@hotmail.com	5577176544	11	Baja California	7	2025-09-22	premium
1875	María	Torres Sánchez	maría1875@gmail.com	5587771867	11	Baja California	7	2023-08-13	premium
1880	Daniela	Hernández Rodríguez	daniela1880@hotmail.com	5547625379	11	Baja California	7	2024-04-02	regular
1884	Mario	Mendoza Cruz	mario1884@hotmail.com	5568725569	11	Baja California	7	2025-08-25	premium
1888	Ramón	Mendoza Ramos	ramón1888@gmail.com	5512199227	12	Nuevo León	6	2023-11-24	premium
1895	Patricia	Sánchez Morales	patricia1895@yahoo.com	5586960904	12	Nuevo León	6	2021-12-28	regular
1857	Andrés	Ramos García	andrés1857@yahoo.com	5531677773	13	Michoacán	2	2025-07-17	regular
1864	Fernando	Ortega Moreno	fernando1864@gmail.com	5596240962	13	Michoacán	2	2023-03-06	mayorista
1846	María	Cruz Flores	maría1846@gmail.com	5581191483	15	Querétaro	5	2022-12-16	regular
1886	José	Castro Rodríguez	josé1886@gmail.com	5588077298	15	Querétaro	5	2022-02-16	regular
1903	Fernando	Núñez Pérez	fernando1903@gmail.com	5510202363	15	Querétaro	5	2021-11-12	regular
1859	Verónica	Aguilar Ortega	verónica1859@gmail.com	5592104213	16	Coahuila	6	2024-06-27	vip
1870	Mónica	Flores Vega	mónica1870@yahoo.com	5589846877	16	Coahuila	6	2025-05-18	regular
1872	Eduardo	Gutiérrez Torres	eduardo1872@hotmail.com	5563223875	16	Coahuila	6	2025-03-15	regular
1882	Adriana	Mendoza Sánchez	adriana1882@yahoo.com	5554317225	16	Coahuila	6	2023-03-25	nuevo
1907	Andrés	Morales Ramírez	andrés1907@gmail.com	5534381903	16	Coahuila	6	2024-01-19	premium
1848	Alberto	López Vargas	alberto1848@gmail.com	5554132892	17	San Luis Potosí	5	2025-05-22	regular
1852	Alejandra	Morales Gómez	alejandra1852@yahoo.com	5570416623	17	San Luis Potosí	5	2021-06-25	vip
1860	Mario	Sánchez Torres	mario1860@gmail.com	5545128164	17	San Luis Potosí	5	2022-04-07	regular
1894	Liliana	Mendoza Castillo	liliana1894@yahoo.com	5581642266	17	San Luis Potosí	5	2022-06-13	regular
1904	Gabriela	Torres Cruz	gabriela1904@gmail.com	5512485938	17	San Luis Potosí	5	2023-08-18	mayorista
1845	Diego	Sánchez López	diego1845@gmail.com	5534880515	18	Baja California	7	2023-12-28	premium
1869	Patricia	Castro Ramos	patricia1869@gmail.com	5524312453	18	Baja California	7	2022-01-29	regular
1879	Alejandro	Pérez Hernández	alejandro1879@hotmail.com	5517844402	18	Baja California	7	2025-03-01	regular
1892	Manuel	Sánchez Gutiérrez	manuel1892@gmail.com	5569150591	18	Baja California	7	2022-01-08	premium
1893	Valeria	Reyes Vega	valeria1893@gmail.com	5534142912	18	Baja California	7	2024-09-01	regular
1847	Daniela	Sánchez Aguilar	daniela1847@gmail.com	5537917940	19	Veracruz	3	2022-07-12	premium
1850	Carlos	Herrera Rivera	carlos1850@yahoo.com	5547955201	19	Veracruz	3	2022-11-09	regular
1871	Diego	García Gutiérrez	diego1871@gmail.com	5520587268	19	Veracruz	3	2023-01-10	regular
1908	Alberto	Ramos Flores	alberto1908@yahoo.com	5570713460	1	Guerrero	2	2023-10-14	regular
1917	Gabriela	Castro García	gabriela1917@hotmail.com	5581247910	2	Aguascalientes	5	2024-12-22	regular
1963	Juan	Mendoza Herrera	juan1963@yahoo.com	5556196801	3	Chihuahua	1	2023-02-04	regular
1927	Roberto	Gutiérrez Flores	roberto1927@yahoo.com	5522933377	4	CDMX	5	2024-08-22	premium
1940	Elena	Gutiérrez Castillo	elena1940@hotmail.com	5533916938	4	CDMX	5	2022-06-06	mayorista
1943	Carmen	Flores Flores	carmen1943@yahoo.com	5568405557	4	CDMX	5	2022-02-28	regular
1952	Pablo	Gómez Torres	pablo1952@gmail.com	5518215004	4	CDMX	5	2021-09-25	regular
1930	Ana	Hernández Cruz	ana1930@hotmail.com	5532013599	5	Sinaloa	7	2022-03-16	regular
1965	Fernando	Núñez Vargas	fernando1965@gmail.com	5549580165	5	Sinaloa	7	2021-12-30	regular
1970	Claudia	Sánchez Núñez	claudia1970@gmail.com	5529218151	5	Sinaloa	7	2023-09-02	regular
1918	Sergio	Torres Herrera	sergio1918@hotmail.com	5510128848	6	Jalisco	4	2021-12-27	regular
1925	Roberto	Reyes Castillo	roberto1925@hotmail.com	5512671254	6	Jalisco	4	2025-03-19	mayorista
1926	Carlos	Ramos Castillo	carlos1926@gmail.com	5510286011	6	Jalisco	4	2026-05-31	regular
1909	Eduardo	Ortega González	eduardo1909@yahoo.com	5563602194	7	Sonora	7	2023-05-27	regular
1939	Alberto	Cruz Díaz	alberto1939@hotmail.com	5524853741	7	Sonora	7	2023-02-12	regular
1962	Diego	Ramírez Moreno	diego1962@yahoo.com	5563803762	7	Sonora	7	2025-07-09	regular
1966	Diego	Castro Gómez	diego1966@yahoo.com	5553712070	7	Sonora	7	2023-02-04	regular
1971	Verónica	Vargas Gutiérrez	verónica1971@gmail.com	5592877501	7	Sonora	7	2023-04-30	regular
1912	Juan	Vargas Díaz	juan1912@hotmail.com	5549816893	9	Guanajuato	5	2026-03-16	regular
1929	Roberto	Núñez Díaz	roberto1929@gmail.com	5592670664	9	Guanajuato	5	2022-09-29	premium
1933	Verónica	Núñez Mendoza	verónica1933@gmail.com	5564021354	9	Guanajuato	5	2024-03-19	regular
1950	Ramón	Gutiérrez García	ramón1950@yahoo.com	5591192063	9	Guanajuato	5	2022-09-23	premium
1951	María	Flores Rodríguez	maría1951@hotmail.com	5514214307	9	Guanajuato	5	2024-03-17	regular
1964	David	Núñez Díaz	david1964@gmail.com	5534727844	9	Guanajuato	5	2025-09-29	premium
1924	Mario	Ortega Jiménez	mario1924@gmail.com	5592270938	10	Yucatán	8	2023-03-21	premium
1944	Juan	Ortega Vega	juan1944@gmail.com	5569733842	10	Yucatán	8	2022-12-05	regular
1948	Adriana	Mendoza Reyes	adriana1948@gmail.com	5525105475	11	Baja California	7	2023-11-08	regular
1958	Ramón	Pérez Aguilar	ramón1958@hotmail.com	5549485474	11	Baja California	7	2023-12-05	regular
1960	Miguel	García Martínez	miguel1960@gmail.com	5537386444	11	Baja California	7	2024-05-10	mayorista
1915	José	Rodríguez Vega	josé1915@hotmail.com	5533205676	12	Nuevo León	6	2024-05-10	premium
1923	Diego	Reyes Núñez	diego1923@gmail.com	5525021199	12	Nuevo León	6	2023-10-21	mayorista
1945	Alejandra	Díaz Ortega	alejandra1945@gmail.com	5550871016	12	Nuevo León	6	2022-02-27	regular
1969	Ana	García Ramos	ana1969@yahoo.com	5534808116	12	Nuevo León	6	2021-07-28	regular
1931	Ricardo	Rodríguez Vega	ricardo1931@gmail.com	5537757450	13	Michoacán	2	2023-01-10	mayorista
1932	Rosa	Pérez Aguilar	rosa1932@hotmail.com	5521180576	13	Michoacán	2	2024-07-23	premium
1913	Alejandro	Jiménez Reyes	alejandro1913@hotmail.com	5555586036	14	Puebla	3	2025-05-09	regular
1920	Pablo	Vargas Gómez	pablo1920@hotmail.com	5551713824	14	Puebla	3	2023-02-07	regular
1959	Claudia	Núñez Ramos	claudia1959@gmail.com	5597728424	14	Puebla	3	2023-06-20	regular
1916	Sofía	Castillo Rivera	sofía1916@gmail.com	5568443796	15	Querétaro	5	2024-02-08	regular
1922	Sergio	Castillo López	sergio1922@yahoo.com	5543948447	15	Querétaro	5	2025-03-24	premium
1928	Roberto	Ramírez Sánchez	roberto1928@gmail.com	5541533557	15	Querétaro	5	2022-06-19	regular
1941	Pablo	Gómez Rivera	pablo1941@gmail.com	5563586934	15	Querétaro	5	2024-04-15	premium
1949	Sandra	Vargas Flores	sandra1949@hotmail.com	5581999061	15	Querétaro	5	2025-11-05	nuevo
1953	Alejandro	Rivera Reyes	alejandro1953@yahoo.com	5584662900	15	Querétaro	5	2023-03-26	regular
1967	Roberto	Martínez Vega	roberto1967@gmail.com	5541106335	15	Querétaro	5	2025-03-07	regular
1936	Alberto	Ramos Vega	alberto1936@yahoo.com	5512655477	16	Coahuila	6	2023-09-28	regular
1947	Eduardo	Moreno Jiménez	eduardo1947@gmail.com	5548148252	16	Coahuila	6	2024-11-24	regular
1956	Ana	García Pérez	ana1956@yahoo.com	5562395558	16	Coahuila	6	2025-11-15	regular
1957	Adriana	Rivera Vargas	adriana1957@hotmail.com	5557974300	16	Coahuila	6	2024-10-20	regular
1942	Daniela	Ortega Aguilar	daniela1942@yahoo.com	5537399209	17	San Luis Potosí	5	2022-12-26	regular
1946	Claudia	García Gutiérrez	claudia1946@hotmail.com	5571375663	17	San Luis Potosí	5	2022-08-07	premium
1910	Patricia	García Vargas	patricia1910@hotmail.com	5531161829	18	Baja California	7	2023-02-14	regular
1921	Sergio	Moreno Rodríguez	sergio1921@yahoo.com	5568534862	18	Baja California	7	2025-06-10	regular
1934	Manuel	Torres Herrera	manuel1934@hotmail.com	5535484177	18	Baja California	7	2022-09-21	regular
1955	Luis	Gutiérrez Rivera	luis1955@hotmail.com	5511955403	18	Baja California	7	2023-12-09	premium
1961	Ricardo	Ramírez Núñez	ricardo1961@hotmail.com	5543831592	18	Baja California	7	2023-01-27	regular
1911	Mario	Pérez Hernández	mario1911@yahoo.com	5599233384	19	Veracruz	3	2024-03-10	regular
1937	Miguel	Díaz Herrera	miguel1937@gmail.com	5559691975	19	Veracruz	3	2025-07-04	regular
19	Sandra	Torres Pérez	sandra19@hotmail.com	5579231333	20	Jalisco	4	2022-12-30	regular
22	Liliana	Rivera Rivera	liliana22@gmail.com	5547112255	20	Jalisco	4	2023-01-17	nuevo
26	Alejandro	López Gómez	alejandro26@gmail.com	5539579214	20	Jalisco	4	2021-12-16	regular
27	Sandra	Gutiérrez García	sandra27@gmail.com	5545346197	20	Jalisco	4	2024-10-31	regular
56	Rosa	Díaz Castro	rosa56@gmail.com	5562982727	20	Jalisco	4	2025-07-12	premium
63	Isabel	Aguilar Gómez	isabel63@gmail.com	5526369402	20	Jalisco	4	2024-04-14	premium
66	Rosa	Rivera Castro	rosa66@hotmail.com	5525157001	20	Jalisco	4	2022-11-23	regular
95	Andrés	Herrera Jiménez	andrés95@gmail.com	5522090729	20	Jalisco	4	2024-01-09	regular
111	Adriana	Vega Vargas	adriana111@gmail.com	5566013532	20	Jalisco	4	2023-03-26	regular
121	Andrés	Vega Jiménez	andrés121@yahoo.com	5571410640	20	Jalisco	4	2024-01-18	regular
123	Ana	Reyes Martínez	ana123@hotmail.com	5515692967	20	Jalisco	4	2023-07-15	regular
218	Sofía	Martínez Morales	sofía218@gmail.com	5592628262	20	Jalisco	4	2026-02-02	mayorista
221	Carmen	Castillo Rivera	carmen221@gmail.com	5568876111	20	Jalisco	4	2023-03-08	regular
237	Mario	Ramos Vega	mario237@yahoo.com	5587774748	20	Jalisco	4	2023-02-16	vip
272	Alejandra	Rodríguez Morales	alejandra272@gmail.com	5596541691	20	Jalisco	4	2026-04-14	regular
279	David	Núñez Núñez	david279@yahoo.com	5577562908	20	Jalisco	4	2021-10-12	regular
283	Sofía	Sánchez González	sofía283@gmail.com	5529107146	20	Jalisco	4	2024-09-20	regular
293	Sergio	Cruz Jiménez	sergio293@gmail.com	5569586748	20	Jalisco	4	2023-05-04	regular
333	Daniela	Castro Mendoza	daniela333@gmail.com	5581794497	20	Jalisco	4	2021-08-20	regular
369	Diego	Torres González	diego369@gmail.com	5550320166	20	Jalisco	4	2023-07-06	regular
382	Ramón	Ramos Jiménez	ramón382@gmail.com	5575485030	20	Jalisco	4	2022-06-10	regular
388	Diego	Martínez Mendoza	diego388@hotmail.com	5550755467	20	Jalisco	4	2025-04-09	regular
395	Juan	Martínez Vega	juan395@hotmail.com	5510884169	20	Jalisco	4	2021-10-06	mayorista
429	Ana	Pérez Sánchez	ana429@gmail.com	5588655491	20	Jalisco	4	2023-09-06	regular
431	Carlos	Ramírez Gutiérrez	carlos431@gmail.com	5523624363	20	Jalisco	4	2022-03-02	regular
442	María	Martínez Cruz	maría442@yahoo.com	5511256721	20	Jalisco	4	2022-04-12	regular
520	Carlos	Jiménez Herrera	carlos520@gmail.com	5551452961	20	Jalisco	4	2022-04-22	regular
524	Ricardo	Pérez Gutiérrez	ricardo524@hotmail.com	5543331368	20	Jalisco	4	2023-01-13	mayorista
526	Fernando	González López	fernando526@hotmail.com	5537430524	20	Jalisco	4	2023-08-07	regular
527	Gabriela	Rodríguez Ramos	gabriela527@yahoo.com	5591315976	20	Jalisco	4	2024-09-29	regular
548	Valeria	Rivera Moreno	valeria548@gmail.com	5552308622	20	Jalisco	4	2024-06-02	premium
550	María	Jiménez Martínez	maría550@gmail.com	5547509496	20	Jalisco	4	2024-05-18	regular
560	Fernanda	Vargas Vargas	fernanda560@gmail.com	5568648080	20	Jalisco	4	2025-03-11	regular
574	Liliana	Díaz González	liliana574@gmail.com	5564223156	20	Jalisco	4	2026-04-03	regular
597	Ana	Núñez Ramos	ana597@gmail.com	5559680785	20	Jalisco	4	2022-08-23	premium
617	Sandra	Rodríguez Sánchez	sandra617@yahoo.com	5545370495	20	Jalisco	4	2022-09-16	mayorista
620	Miguel	Gómez Díaz	miguel620@gmail.com	5595001425	20	Jalisco	4	2025-03-14	regular
642	Fernanda	Moreno Jiménez	fernanda642@yahoo.com	5567229772	20	Jalisco	4	2023-11-23	vip
1985	José	Torres Sánchez	josé1985@yahoo.com	5588874493	3	Chihuahua	1	2023-03-21	regular
1973	Pablo	Martínez Reyes	pablo1973@yahoo.com	5521278771	5	Sinaloa	7	2026-01-26	regular
1992	Liliana	Hernández Rodríguez	liliana1992@yahoo.com	5588357247	5	Sinaloa	7	2022-05-06	regular
1972	Verónica	Flores Rodríguez	verónica1972@hotmail.com	5532858779	7	Sonora	7	2025-08-29	premium
1980	Sandra	Gutiérrez Castro	sandra1980@hotmail.com	5519169403	7	Sonora	7	2021-12-28	regular
1983	Francisco	Hernández Martínez	francisco1983@gmail.com	5524412290	7	Sonora	7	2024-01-23	premium
1977	Liliana	Cruz Pérez	liliana1977@hotmail.com	5590937930	8	Chihuahua	1	2026-03-28	regular
1982	Luis	Cruz Castillo	luis1982@yahoo.com	5598703668	8	Chihuahua	1	2024-08-10	premium
1979	Elena	Aguilar Vargas	elena1979@gmail.com	5590648127	9	Guanajuato	5	2024-01-19	vip
1981	Rosa	García Torres	rosa1981@gmail.com	5568357188	9	Guanajuato	5	2024-09-02	premium
1990	Adriana	Ramos Cruz	adriana1990@gmail.com	5568792790	9	Guanajuato	5	2023-04-19	vip
1974	Sandra	Vega Vargas	sandra1974@yahoo.com	5522448176	10	Yucatán	8	2023-12-07	regular
1999	Mónica	Cruz Ortega	mónica1999@yahoo.com	5585198705	11	Baja California	7	2024-01-27	regular
1978	Manuel	García Sánchez	manuel1978@hotmail.com	5566543954	12	Nuevo León	6	2021-07-18	premium
1989	Sergio	Rodríguez Vargas	sergio1989@yahoo.com	5579068413	13	Michoacán	2	2024-10-10	premium
1991	Diego	Flores Vargas	diego1991@gmail.com	5556778834	13	Michoacán	2	2025-09-26	vip
1995	Isabel	Mendoza Núñez	isabel1995@yahoo.com	5531458188	13	Michoacán	2	2024-04-01	nuevo
1996	Roberto	Ramos Pérez	roberto1996@gmail.com	5538174991	13	Michoacán	2	2023-08-17	regular
1976	Gabriela	Martínez Aguilar	gabriela1976@gmail.com	5571907135	14	Puebla	3	2024-06-12	regular
1997	Manuel	Martínez Herrera	manuel1997@yahoo.com	5575992723	15	Querétaro	5	2025-12-30	regular
1984	Alejandro	Vega Gómez	alejandro1984@hotmail.com	5569417259	16	Coahuila	6	2025-07-14	regular
1994	Carlos	Núñez Flores	carlos1994@gmail.com	5581017405	17	San Luis Potosí	5	2024-12-21	vip
1975	Ricardo	Herrera Rivera	ricardo1975@gmail.com	5557864995	18	Baja California	7	2024-10-10	regular
1986	Mario	Ramírez Castro	mario1986@hotmail.com	5587190704	19	Veracruz	3	2022-01-05	regular
1998	Liliana	García Castro	liliana1998@gmail.com	5592838528	19	Veracruz	3	2022-11-29	mayorista
648	Mario	González García	mario648@gmail.com	5513221342	20	Jalisco	4	2024-01-19	regular
655	Mario	Jiménez Mendoza	mario655@gmail.com	5528551745	20	Jalisco	4	2024-04-18	regular
659	Patricia	Torres Cruz	patricia659@hotmail.com	5566515994	20	Jalisco	4	2025-04-06	mayorista
669	Eduardo	Jiménez Herrera	eduardo669@gmail.com	5513764654	20	Jalisco	4	2024-11-11	regular
704	Ana	Moreno Torres	ana704@gmail.com	5538436861	20	Jalisco	4	2022-02-01	regular
738	Luis	Flores Vega	luis738@gmail.com	5568476310	20	Jalisco	4	2025-06-28	regular
752	Alejandro	Reyes Jiménez	alejandro752@yahoo.com	5516693632	20	Jalisco	4	2025-10-27	regular
753	Miguel	Ortega Ramírez	miguel753@hotmail.com	5546971545	20	Jalisco	4	2021-06-30	premium
758	Adriana	Rivera Morales	adriana758@gmail.com	5575539501	20	Jalisco	4	2023-10-18	regular
771	Patricia	Ramos Pérez	patricia771@hotmail.com	5549030787	20	Jalisco	4	2026-04-07	regular
777	Laura	Herrera González	laura777@gmail.com	5550586096	20	Jalisco	4	2023-03-11	regular
795	Alberto	Aguilar Gómez	alberto795@yahoo.com	5531364734	20	Jalisco	4	2025-11-26	premium
816	Verónica	Ortega Hernández	verónica816@gmail.com	5511999650	20	Jalisco	4	2021-11-20	regular
817	Andrés	Rodríguez Torres	andrés817@yahoo.com	5597940656	20	Jalisco	4	2024-10-21	regular
821	Adriana	Morales Ramírez	adriana821@hotmail.com	5579926758	20	Jalisco	4	2024-09-25	premium
822	Eduardo	Ramos Aguilar	eduardo822@gmail.com	5514814077	20	Jalisco	4	2022-07-12	regular
829	Sandra	Ramírez Rodríguez	sandra829@gmail.com	5572724302	20	Jalisco	4	2025-09-14	vip
845	Gabriela	Núñez Sánchez	gabriela845@hotmail.com	5558582114	20	Jalisco	4	2023-11-21	regular
852	Fernanda	Castro Díaz	fernanda852@yahoo.com	5584751326	20	Jalisco	4	2022-06-14	regular
1001	Roberto	Castillo Núñez	roberto1001@gmail.com	5542895027	20	Jalisco	4	2022-07-30	premium
1018	Fernando	Jiménez Reyes	fernando1018@yahoo.com	5519989411	20	Jalisco	4	2025-07-18	regular
1031	Pablo	García García	pablo1031@yahoo.com	5544742654	20	Jalisco	4	2023-03-03	premium
1068	Ramón	Pérez Sánchez	ramón1068@gmail.com	5519466596	20	Jalisco	4	2024-11-23	regular
1070	Sandra	Martínez Herrera	sandra1070@gmail.com	5573231224	20	Jalisco	4	2022-09-28	regular
1075	Alejandro	Rivera López	alejandro1075@hotmail.com	5575169251	20	Jalisco	4	2023-02-28	regular
1090	Sergio	Jiménez Ortega	sergio1090@gmail.com	5553464571	20	Jalisco	4	2023-12-18	mayorista
1091	Juan	Moreno Ramírez	juan1091@yahoo.com	5539390348	20	Jalisco	4	2021-07-15	regular
1097	Adriana	Sánchez Ramos	adriana1097@hotmail.com	5584366395	20	Jalisco	4	2023-11-02	regular
1103	José	Reyes Díaz	josé1103@gmail.com	5536121315	20	Jalisco	4	2023-01-27	premium
1114	Andrés	Martínez Moreno	andrés1114@gmail.com	5555411755	20	Jalisco	4	2024-05-24	regular
1132	Pablo	Rodríguez López	pablo1132@gmail.com	5519046325	20	Jalisco	4	2024-01-01	premium
1135	Ana	Gómez Gómez	ana1135@yahoo.com	5518542875	20	Jalisco	4	2025-05-31	premium
1167	Luis	Sánchez López	luis1167@yahoo.com	5586760300	20	Jalisco	4	2022-01-28	regular
1191	Liliana	Núñez Sánchez	liliana1191@gmail.com	5591790554	20	Jalisco	4	2021-11-19	mayorista
1194	Alejandro	Castillo González	alejandro1194@hotmail.com	5573585237	20	Jalisco	4	2025-03-11	premium
1210	José	Hernández Pérez	josé1210@gmail.com	5538029575	20	Jalisco	4	2023-03-06	regular
1218	Carmen	Núñez Morales	carmen1218@hotmail.com	5599526487	20	Jalisco	4	2026-01-03	premium
1226	Claudia	Pérez Mendoza	claudia1226@hotmail.com	5535242303	20	Jalisco	4	2022-07-30	regular
1236	Daniela	Gutiérrez Núñez	daniela1236@hotmail.com	5562720687	20	Jalisco	4	2023-03-18	regular
1238	Sandra	Mendoza Martínez	sandra1238@hotmail.com	5551145240	20	Jalisco	4	2022-03-17	regular
1245	José	Morales Ramírez	josé1245@gmail.com	5521135331	20	Jalisco	4	2022-05-20	mayorista
1252	Ricardo	Flores Vega	ricardo1252@gmail.com	5576216456	20	Jalisco	4	2022-06-11	regular
1286	Elena	Sánchez Cruz	elena1286@gmail.com	5533292561	20	Jalisco	4	2024-11-16	regular
1292	Fernanda	Jiménez Castro	fernanda1292@yahoo.com	5585606069	20	Jalisco	4	2022-10-29	premium
1302	Ana	Gómez González	ana1302@yahoo.com	5527755795	20	Jalisco	4	2021-08-12	premium
1309	Patricia	Vargas Mendoza	patricia1309@yahoo.com	5512198223	20	Jalisco	4	2023-12-25	regular
1310	Andrés	Rivera Castro	andrés1310@yahoo.com	5516891577	20	Jalisco	4	2025-08-17	mayorista
1351	Alejandro	García Reyes	alejandro1351@yahoo.com	5570297305	20	Jalisco	4	2024-03-20	regular
1377	Eduardo	Gómez Gutiérrez	eduardo1377@yahoo.com	5585321709	20	Jalisco	4	2025-12-26	regular
1381	Juan	Gómez Ortega	juan1381@hotmail.com	5546152919	20	Jalisco	4	2022-12-27	mayorista
1448	Sofía	Gutiérrez Hernández	sofía1448@gmail.com	5536658175	20	Jalisco	4	2023-02-12	regular
1508	Juan	López Moreno	juan1508@gmail.com	5534219451	20	Jalisco	4	2022-12-01	regular
1525	Eduardo	Aguilar Aguilar	eduardo1525@gmail.com	5534922740	20	Jalisco	4	2022-11-21	nuevo
1545	Ana	Hernández González	ana1545@gmail.com	5559996586	20	Jalisco	4	2023-02-27	premium
1553	Pablo	Ramos García	pablo1553@gmail.com	5579738269	20	Jalisco	4	2024-02-12	regular
1561	Ramón	López Vargas	ramón1561@hotmail.com	5529310301	20	Jalisco	4	2025-07-05	regular
1591	Alejandra	Díaz Vega	alejandra1591@gmail.com	5565343491	20	Jalisco	4	2025-09-18	regular
1600	Francisco	Hernández Díaz	francisco1600@yahoo.com	5572001364	20	Jalisco	4	2024-07-31	regular
1605	Juan	López Rivera	juan1605@gmail.com	5580412756	20	Jalisco	4	2021-10-14	regular
1634	Isabel	Gutiérrez Gutiérrez	isabel1634@hotmail.com	5587023573	20	Jalisco	4	2024-12-14	regular
1669	Daniela	Ramírez Reyes	daniela1669@yahoo.com	5584825320	20	Jalisco	4	2023-08-15	regular
1687	Carmen	Ramírez González	carmen1687@gmail.com	5584725325	20	Jalisco	4	2023-02-14	regular
1690	Carmen	González Martínez	carmen1690@yahoo.com	5534845617	20	Jalisco	4	2025-06-17	mayorista
1739	Carmen	Rodríguez Vargas	carmen1739@hotmail.com	5559787936	20	Jalisco	4	2024-09-04	mayorista
1757	Roberto	Moreno Ortega	roberto1757@gmail.com	5530059058	20	Jalisco	4	2022-01-07	regular
1760	Juan	Castro Castro	juan1760@yahoo.com	5569602309	20	Jalisco	4	2021-12-27	regular
1774	Miguel	Rodríguez Gutiérrez	miguel1774@yahoo.com	5527107502	20	Jalisco	4	2025-09-07	premium
1822	Rosa	Núñez Sánchez	rosa1822@yahoo.com	5569417375	20	Jalisco	4	2022-07-10	premium
1823	Adriana	Jiménez Rodríguez	adriana1823@yahoo.com	5573576443	20	Jalisco	4	2022-01-22	regular
1833	Pablo	Sánchez Aguilar	pablo1833@gmail.com	5574261898	20	Jalisco	4	2026-01-26	mayorista
1914	Manuel	Herrera Vega	manuel1914@yahoo.com	5581730341	20	Jalisco	4	2022-06-30	mayorista
1919	Sandra	Núñez Núñez	sandra1919@hotmail.com	5574483772	20	Jalisco	4	2021-10-12	regular
1935	Ricardo	Castillo Jiménez	ricardo1935@hotmail.com	5578196270	20	Jalisco	4	2024-06-26	mayorista
1938	Verónica	Reyes Martínez	verónica1938@gmail.com	5545755742	20	Jalisco	4	2022-02-15	regular
1954	Ana	Flores Morales	ana1954@hotmail.com	5583962723	20	Jalisco	4	2022-12-22	regular
1987	Miguel	Gutiérrez Jiménez	miguel1987@gmail.com	5574382977	20	Jalisco	4	2023-03-17	regular
133	María	Jiménez Castro	maría133@yahoo.com	5598512648	1	Guerrero	2	2023-11-25	regular
142	Juan	Jiménez Ortega	juan142@hotmail.com	5576805681	1	Guerrero	2	2021-11-30	regular
164	David	Mendoza Vega	david164@gmail.com	5570838623	1	Guerrero	2	2026-04-11	regular
313	Valeria	Rodríguez Jiménez	valeria313@hotmail.com	5537079584	1	Guerrero	2	2022-11-18	mayorista
379	Diego	Díaz García	diego379@hotmail.com	5569762583	1	Guerrero	2	2023-10-20	regular
383	Ramón	Flores Gutiérrez	ramón383@hotmail.com	5565987241	1	Guerrero	2	2025-10-15	regular
695	Valeria	García González	valeria695@gmail.com	5529795314	1	Guerrero	2	2021-08-06	regular
818	Luis	Moreno López	luis818@hotmail.com	5537630190	1	Guerrero	2	2022-06-28	premium
824	Laura	Hernández Ramírez	laura824@gmail.com	5561531052	1	Guerrero	2	2026-05-04	mayorista
894	Alejandra	Vega García	alejandra894@yahoo.com	5585485324	1	Guerrero	2	2023-05-21	regular
906	Ramón	Jiménez Ramírez	ramón906@gmail.com	5592662979	1	Guerrero	2	2025-04-09	regular
908	José	Castro Hernández	josé908@hotmail.com	5567096991	1	Guerrero	2	2024-08-11	regular
935	Mónica	Ortega Ortega	mónica935@gmail.com	5563597632	1	Guerrero	2	2021-10-07	regular
944	Alejandra	Jiménez Gómez	alejandra944@gmail.com	5556555725	1	Guerrero	2	2022-09-09	premium
946	Fernanda	Núñez López	fernanda946@gmail.com	5528532770	1	Guerrero	2	2025-05-23	regular
1203	Sandra	Hernández Ramos	sandra1203@gmail.com	5527698856	1	Guerrero	2	2026-02-01	vip
1453	Sandra	Núñez García	sandra1453@yahoo.com	5573387410	1	Guerrero	2	2024-12-18	premium
1456	Gabriela	Martínez Gutiérrez	gabriela1456@yahoo.com	5581120433	1	Guerrero	2	2024-07-09	mayorista
1464	Manuel	Rodríguez Díaz	manuel1464@gmail.com	5575147422	1	Guerrero	2	2024-01-24	premium
1878	Patricia	Castro Mendoza	patricia1878@gmail.com	5596789632	1	Guerrero	2	2023-12-27	mayorista
1890	Alejandro	Moreno Castro	alejandro1890@gmail.com	5523635217	1	Guerrero	2	2022-11-04	premium
1900	David	Ramos Castro	david1900@gmail.com	5524682341	1	Guerrero	2	2025-11-15	regular
170	Pablo	López Jiménez	pablo170@hotmail.com	5560856575	2	Aguascalientes	5	2023-09-03	premium
476	Sandra	Rivera Morales	sandra476@gmail.com	5534024774	2	Aguascalientes	5	2022-06-13	regular
498	Mónica	López Aguilar	mónica498@hotmail.com	5580579265	2	Aguascalientes	5	2023-04-03	mayorista
761	Claudia	Ramírez Rivera	claudia761@hotmail.com	5550417525	2	Aguascalientes	5	2023-07-17	premium
945	Elena	Castro Jiménez	elena945@yahoo.com	5558624457	2	Aguascalientes	5	2023-08-20	mayorista
1017	Alejandro	Torres Aguilar	alejandro1017@yahoo.com	5561325709	2	Aguascalientes	5	2023-04-26	regular
1386	Juan	Ramos Vargas	juan1386@gmail.com	5559493703	2	Aguascalientes	5	2024-02-21	regular
1832	Miguel	Gómez Rodríguez	miguel1832@gmail.com	5592937486	2	Aguascalientes	5	2025-04-05	regular
1837	Ramón	Aguilar Ramos	ramón1837@yahoo.com	5518490284	2	Aguascalientes	5	2022-05-07	regular
1839	Isabel	López López	isabel1839@gmail.com	5555932113	2	Aguascalientes	5	2024-01-16	regular
1840	Laura	Ortega Ramos	laura1840@hotmail.com	5589313901	2	Aguascalientes	5	2023-12-01	regular
163	Mónica	Morales Sánchez	mónica163@gmail.com	5529289997	3	Chihuahua	1	2024-12-30	vip
179	Andrés	Castro Mendoza	andrés179@gmail.com	5567137046	3	Chihuahua	1	2025-06-08	regular
187	Roberto	Ortega Hernández	roberto187@gmail.com	5549158452	3	Chihuahua	1	2026-04-17	regular
879	Verónica	Pérez Herrera	verónica879@gmail.com	5592316265	3	Chihuahua	1	2024-08-05	regular
1013	Carmen	Jiménez Moreno	carmen1013@hotmail.com	5573589030	3	Chihuahua	1	2022-01-08	regular
1492	Pablo	Núñez Hernández	pablo1492@gmail.com	5585889571	3	Chihuahua	1	2026-01-26	premium
1503	Alejandra	Rodríguez Ortega	alejandra1503@gmail.com	5575941954	3	Chihuahua	1	2023-12-28	regular
1511	Ramón	González Flores	ramón1511@gmail.com	5571300688	3	Chihuahua	1	2026-03-23	regular
1712	Liliana	Gómez González	liliana1712@yahoo.com	5528913059	3	Chihuahua	1	2023-10-08	regular
1899	Juan	Rivera Martínez	juan1899@gmail.com	5593137998	3	Chihuahua	1	2025-01-12	premium
1906	Fernanda	Herrera Reyes	fernanda1906@gmail.com	5519579312	3	Chihuahua	1	2022-02-24	mayorista
1988	Valeria	Rodríguez Martínez	valeria1988@gmail.com	5582518184	3	Chihuahua	1	2024-02-24	premium
1993	Laura	Aguilar González	laura1993@hotmail.com	5595805091	3	Chihuahua	1	2021-08-15	regular
488	Daniela	González Ortega	daniela488@gmail.com	5551013170	4	CDMX	5	2023-08-23	mayorista
493	Carmen	Hernández Aguilar	carmen493@gmail.com	5575580570	4	CDMX	5	2025-05-25	regular
1061	Sandra	Pérez González	sandra1061@gmail.com	5539777154	4	CDMX	5	2025-05-01	premium
1065	Alejandra	Castro Morales	alejandra1065@yahoo.com	5550264407	4	CDMX	5	2026-01-09	regular
1209	Pablo	García Reyes	pablo1209@gmail.com	5576065625	4	CDMX	5	2022-09-09	premium
497	Alberto	Ortega Torres	alberto497@gmail.com	5577441055	5	Sinaloa	7	2024-11-24	regular
504	Valeria	Díaz Cruz	valeria504@yahoo.com	5515990830	5	Sinaloa	7	2026-04-18	regular
1008	Alejandro	Moreno Gutiérrez	alejandro1008@gmail.com	5594009791	5	Sinaloa	7	2025-10-26	nuevo
1580	Juan	Ramos Flores	juan1580@gmail.com	5581022010	5	Sinaloa	7	2025-01-18	regular
242	Laura	Gómez Castro	laura242@gmail.com	5581258920	6	Jalisco	4	2024-10-12	regular
254	Gabriela	Rodríguez Mendoza	gabriela254@yahoo.com	5548674340	6	Jalisco	4	2025-08-12	regular
434	Adriana	Torres Vargas	adriana434@gmail.com	5510072871	6	Jalisco	4	2023-09-28	regular
634	Juan	Castro Ramírez	juan634@gmail.com	5546297151	6	Jalisco	4	2022-11-04	nuevo
1743	Isabel	Cruz Vargas	isabel1743@gmail.com	5555605075	6	Jalisco	4	2023-12-27	regular
1777	Patricia	Ramos Vargas	patricia1777@gmail.com	5527123588	6	Jalisco	4	2022-11-21	regular
1898	Laura	Cruz Vega	laura1898@hotmail.com	5549104072	6	Jalisco	4	2021-12-20	premium
249	Mónica	Jiménez Rivera	mónica249@gmail.com	5518808386	8	Chihuahua	1	2021-06-27	regular
934	Luis	Rodríguez Núñez	luis934@yahoo.com	5583387315	9	Guanajuato	5	2022-03-24	regular
948	Claudia	Hernández Ramírez	claudia948@gmail.com	5566604567	9	Guanajuato	5	2025-07-12	regular
1968	José	González Torres	josé1968@yahoo.com	5523640196	9	Guanajuato	5	2022-07-06	mayorista
1641	Alejandra	Flores Vargas	alejandra1641@yahoo.com	5548809347	10	Yucatán	8	2026-04-15	premium
1653	Liliana	Ramírez Rodríguez	liliana1653@hotmail.com	5560337643	10	Yucatán	8	2022-01-15	vip
1654	Adriana	Díaz Díaz	adriana1654@yahoo.com	5568492621	10	Yucatán	8	2025-07-15	regular
1701	Sofía	Gómez Jiménez	sofía1701@gmail.com	5589387274	10	Yucatán	8	2022-02-11	premium
183	Mónica	Reyes López	mónica183@gmail.com	5591882291	12	Nuevo León	6	2025-01-25	regular
1765	María	Castillo Jiménez	maría1765@hotmail.com	5525372552	12	Nuevo León	6	2021-12-14	regular
2000	Eduardo	López Vargas	eduardo2000@gmail.com	5552021016	13	Michoacán	2	2023-06-05	premium
627	Fernando	Gutiérrez Ramos	fernando627@yahoo.com	5566131539	15	Querétaro	5	2022-06-15	regular
1711	José	Martínez Gutiérrez	josé1711@gmail.com	5596567889	15	Querétaro	5	2025-08-19	regular
1336	Claudia	Mendoza Cruz	claudia1336@hotmail.com	5549413474	16	Coahuila	6	2024-02-06	mayorista
1330	Carlos	González Gutiérrez	carlos1330@hotmail.com	5596969029	18	Baja California	7	2026-02-26	regular
\.


--
-- TOC entry 5092 (class 0 OID 25075)
-- Dependencies: 222
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (departamento_id, nombre, presupuesto, region_id) FROM stdin;
1	Ventas	850000.00	5
2	Marketing	420000.00	5
3	Tecnología	960000.00	5
4	Recursos Humanos	310000.00	5
5	Finanzas	540000.00	5
6	Operaciones	720000.00	1
7	Logística	680000.00	2
8	Servicio al Cliente	290000.00	3
9	Compras	380000.00	4
10	Legal	260000.00	5
\.


--
-- TOC entry 5098 (class 0 OID 25172)
-- Dependencies: 228
-- Data for Name: detalle_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_pedidos (detalle_id, pedido_id, producto_id, cantidad, precio_unitario, descuento_linea) FROM stdin;
1	1	99	5	16911.90	0.00
2	1	162	1	1341.67	5.00
3	1	78	2	21716.19	0.00
4	2	227	2	35785.16	0.00
5	3	147	4	16118.15	5.00
6	4	50	3	32360.23	0.00
7	4	34	2	34435.26	5.00
8	4	178	1	8358.65	0.00
9	5	171	1	1914.19	5.00
10	5	44	1	6287.16	0.00
11	5	228	1	31317.59	0.00
12	6	219	2	27037.61	5.00
13	6	311	1	14989.38	0.00
14	7	201	2	10598.73	0.00
15	7	153	2	32619.22	0.00
16	7	161	3	30174.43	0.00
17	8	5	3	23066.77	0.00
18	8	115	2	10525.91	5.00
19	9	52	2	5082.07	0.00
20	10	207	4	23472.26	0.00
21	11	36	5	1735.10	0.00
22	11	150	5	6436.80	5.00
23	11	297	4	2879.78	0.00
24	11	302	2	10847.55	0.00
25	12	1	5	15858.11	0.00
26	12	185	2	27147.39	0.00
27	12	220	2	18064.29	0.00
28	13	137	2	18272.97	0.00
29	14	99	4	16911.90	0.00
30	14	203	5	11026.49	0.00
31	15	118	4	26976.56	0.00
32	15	224	3	3586.39	10.00
33	15	257	3	17467.13	5.00
34	15	222	5	3056.85	0.00
35	15	121	1	3250.20	0.00
36	16	100	4	8325.24	5.00
37	16	68	2	30368.50	0.00
38	17	194	3	18125.11	0.00
39	17	12	5	14641.07	0.00
40	18	72	1	3396.14	0.00
41	18	40	2	14719.88	0.00
42	19	109	3	24975.44	0.00
43	20	248	2	5704.91	0.00
44	20	278	5	12560.12	5.00
45	21	69	1	20390.90	0.00
46	21	61	1	26987.99	0.00
47	22	304	5	25507.59	0.00
48	23	306	1	12630.20	0.00
49	23	21	1	28885.66	5.00
50	24	189	4	7295.82	0.00
51	24	319	5	28695.55	10.00
52	24	179	1	1556.32	5.00
53	24	153	4	32619.22	0.00
54	24	251	2	28879.67	0.00
55	25	16	3	2894.98	5.00
56	25	4	5	8942.68	0.00
57	25	168	2	4961.32	0.00
58	26	141	1	18976.68	10.00
59	26	109	4	24975.44	0.00
60	26	124	2	10512.87	0.00
61	26	214	1	8996.93	0.00
62	27	137	5	18272.97	0.00
63	27	295	1	15122.86	5.00
64	27	171	4	1914.19	0.00
65	27	318	1	32370.18	0.00
66	27	324	5	35511.98	5.00
67	28	35	2	14893.01	0.00
68	29	214	3	8996.93	10.00
69	30	10	5	1535.56	0.00
70	30	189	2	7295.82	5.00
71	31	292	1	20342.09	5.00
72	32	216	3	33300.54	5.00
73	32	267	2	13684.84	10.00
74	32	7	4	25378.21	0.00
75	32	55	4	25249.73	0.00
76	32	43	5	29453.15	0.00
77	33	101	5	7061.05	0.00
78	33	137	2	18272.97	0.00
79	34	212	2	13620.27	0.00
80	34	18	1	31259.75	0.00
81	34	60	2	28605.81	5.00
82	34	191	3	13943.67	10.00
83	35	158	5	28494.74	0.00
84	35	288	5	23034.91	0.00
85	35	280	3	18825.63	10.00
86	36	136	3	9436.00	0.00
87	36	211	3	12736.65	0.00
88	37	50	3	32360.23	0.00
89	37	208	3	8508.53	5.00
90	37	292	4	20342.09	5.00
91	37	108	3	19316.06	0.00
92	37	84	5	9912.34	0.00
93	38	51	1	24451.03	0.00
94	39	297	4	2879.78	5.00
95	39	38	4	11721.98	0.00
96	40	320	1	19956.45	10.00
97	40	185	3	27147.39	0.00
98	40	80	4	38259.20	0.00
99	41	134	3	32564.64	0.00
100	41	97	1	14554.24	0.00
101	41	311	5	14989.38	0.00
102	42	74	5	20327.04	5.00
103	42	168	3	4961.32	0.00
104	43	312	2	7030.98	0.00
105	43	279	2	267.97	0.00
106	43	24	2	2371.03	5.00
107	44	189	5	7295.82	5.00
108	45	329	5	21671.36	0.00
109	45	157	1	11935.44	0.00
110	46	283	2	18689.10	0.00
111	46	40	1	14719.88	5.00
112	47	61	1	26987.99	0.00
113	47	141	1	18976.68	0.00
114	48	198	1	26581.95	0.00
115	49	20	3	21995.92	0.00
116	50	56	2	27131.00	0.00
117	50	70	5	1664.51	10.00
118	51	299	3	11746.03	0.00
119	52	168	2	4961.32	0.00
120	53	166	4	18050.91	0.00
121	53	185	3	27147.39	0.00
122	54	289	5	15260.25	0.00
123	55	30	5	20705.47	0.00
124	56	171	2	1914.19	0.00
125	57	221	1	4679.42	0.00
126	58	158	3	28494.74	5.00
127	58	264	1	3231.57	0.00
128	58	120	3	6107.02	10.00
129	58	81	2	5090.35	10.00
130	59	40	1	14719.88	0.00
131	59	68	4	30368.50	10.00
132	60	265	1	33033.81	0.00
133	60	46	1	32347.10	0.00
134	61	12	1	14641.07	0.00
135	62	196	3	29103.79	0.00
136	62	173	4	29095.13	0.00
137	63	96	4	8770.71	0.00
138	63	114	1	14824.91	0.00
139	63	281	3	30869.24	0.00
140	63	99	2	16911.90	0.00
141	64	250	5	22128.51	0.00
142	64	136	3	9436.00	10.00
143	65	293	1	8008.05	0.00
144	65	329	5	21671.36	0.00
145	66	139	5	25656.53	0.00
146	66	83	4	7497.50	0.00
147	67	170	4	26345.81	0.00
148	67	229	1	18071.36	5.00
149	68	240	1	6679.87	10.00
150	68	147	3	16118.15	0.00
151	69	180	1	18260.88	0.00
152	69	236	3	17409.10	0.00
153	69	294	3	18000.72	0.00
154	69	261	3	22618.18	0.00
155	70	127	3	14788.94	0.00
156	70	321	1	15006.91	0.00
157	71	157	2	11935.44	0.00
158	72	88	5	24686.97	0.00
159	72	291	2	4154.47	0.00
160	73	39	4	3995.01	10.00
161	74	55	3	25249.73	0.00
162	74	125	3	30636.77	0.00
163	75	265	1	33033.81	0.00
164	75	57	4	25319.11	0.00
165	75	126	3	18009.84	0.00
166	76	71	3	5597.63	5.00
167	77	8	1	28612.40	0.00
168	78	218	3	9097.50	5.00
169	79	145	2	26900.06	0.00
170	80	15	3	5791.98	0.00
171	80	191	5	13943.67	0.00
172	81	245	4	20516.11	0.00
173	82	219	5	27037.61	0.00
174	82	28	5	20966.76	10.00
175	82	157	4	11935.44	0.00
176	83	266	3	30350.30	0.00
177	83	231	5	6896.87	0.00
178	83	95	3	873.16	0.00
179	84	8	4	28612.40	0.00
180	85	317	4	29835.28	0.00
181	85	319	4	28695.55	5.00
182	85	195	2	17434.24	0.00
183	86	14	4	17741.79	0.00
184	86	21	1	28885.66	0.00
185	87	161	1	30174.43	0.00
186	88	326	1	13740.29	0.00
187	88	95	2	873.16	5.00
188	88	66	4	17427.59	5.00
189	89	145	2	26900.06	0.00
190	89	73	2	19639.03	0.00
191	89	66	5	17427.59	0.00
192	89	190	3	2205.28	0.00
193	89	292	1	20342.09	0.00
194	90	39	3	3995.01	0.00
195	90	221	4	4679.42	0.00
196	90	208	1	8508.53	0.00
197	90	319	1	28695.55	0.00
198	90	242	5	26069.06	5.00
199	91	35	1	14893.01	0.00
200	91	57	5	25319.11	10.00
201	92	299	1	11746.03	10.00
202	93	165	5	10583.30	0.00
203	93	189	2	7295.82	0.00
204	94	207	2	23472.26	5.00
205	95	261	3	22618.18	5.00
206	95	276	5	21618.85	5.00
207	96	144	5	18427.13	0.00
208	96	237	1	8720.64	0.00
209	97	236	1	17409.10	0.00
210	98	255	3	37063.14	0.00
211	98	271	2	35488.48	5.00
212	98	133	3	19101.95	5.00
213	98	324	5	35511.98	0.00
214	98	158	3	28494.74	0.00
215	99	312	2	7030.98	0.00
216	100	27	3	7946.20	0.00
217	100	147	4	16118.15	5.00
218	101	60	5	28605.81	0.00
219	101	62	1	8722.93	0.00
220	101	276	4	21618.85	5.00
221	102	152	4	6462.82	0.00
222	102	229	4	18071.36	0.00
223	103	150	2	6436.80	0.00
224	103	192	2	22314.85	0.00
225	104	325	1	12556.36	0.00
226	105	267	4	13684.84	0.00
227	105	54	3	16118.63	0.00
228	105	163	2	20880.95	5.00
229	106	325	3	12556.36	0.00
230	107	234	1	27391.73	5.00
231	107	327	5	8103.13	5.00
232	108	227	1	35785.16	5.00
233	109	192	2	22314.85	0.00
234	109	173	1	29095.13	0.00
235	110	135	1	22949.80	0.00
236	111	180	5	18260.88	0.00
237	112	295	5	15122.86	0.00
238	112	321	4	15006.91	0.00
239	113	188	3	27164.75	0.00
240	114	321	3	15006.91	5.00
241	114	84	1	9912.34	0.00
242	115	273	3	19698.88	0.00
243	116	207	3	23472.26	10.00
244	117	139	3	25656.53	0.00
245	117	111	2	9004.05	5.00
246	117	225	1	27871.38	0.00
247	118	38	1	11721.98	0.00
248	119	208	4	8508.53	0.00
249	119	22	1	34187.79	10.00
250	119	235	1	23624.80	5.00
251	119	83	5	7497.50	0.00
252	120	211	4	12736.65	10.00
253	121	192	1	22314.85	0.00
254	121	18	2	31259.75	10.00
255	122	176	2	37396.28	5.00
256	122	200	1	2196.15	0.00
257	122	319	1	28695.55	0.00
258	123	204	4	7103.30	10.00
259	123	291	1	4154.47	0.00
260	124	172	3	21684.08	0.00
261	124	277	3	31244.88	0.00
262	124	267	4	13684.84	0.00
263	125	37	2	32619.07	0.00
264	125	53	5	1943.06	0.00
265	125	14	4	17741.79	5.00
266	125	18	3	31259.75	0.00
267	126	74	1	20327.04	5.00
268	126	126	1	18009.84	0.00
269	126	96	4	8770.71	0.00
270	127	243	2	32934.99	5.00
271	127	303	4	19580.63	0.00
272	128	182	1	8176.49	10.00
273	128	120	2	6107.02	0.00
274	129	17	4	1197.66	5.00
275	130	112	4	18453.69	0.00
276	130	41	2	11834.74	0.00
277	130	24	3	2371.03	0.00
278	130	234	5	27391.73	5.00
279	131	291	3	4154.47	0.00
280	131	99	4	16911.90	0.00
281	131	205	4	23585.50	5.00
282	131	250	4	22128.51	0.00
283	132	110	5	21067.54	0.00
284	132	258	1	4070.91	0.00
285	133	180	2	18260.88	0.00
286	134	107	2	359.68	0.00
287	134	272	2	17566.50	0.00
288	135	172	3	21684.08	0.00
289	135	23	5	8278.99	5.00
290	136	124	2	10512.87	0.00
291	136	323	5	23922.51	0.00
292	137	129	1	6063.22	0.00
293	137	210	1	31221.02	10.00
294	138	215	3	13820.74	0.00
295	138	54	3	16118.63	0.00
296	138	203	5	11026.49	0.00
297	139	293	2	8008.05	0.00
298	139	241	3	25166.29	0.00
299	139	29	1	35509.97	5.00
300	140	18	4	31259.75	0.00
301	140	160	1	21111.41	0.00
302	141	219	5	27037.61	5.00
303	141	188	3	27164.75	0.00
304	141	135	4	22949.80	5.00
305	141	151	2	2056.97	0.00
306	141	43	4	29453.15	0.00
307	142	170	4	26345.81	5.00
308	142	6	2	17267.65	0.00
309	142	106	4	8994.82	5.00
310	142	165	3	10583.30	0.00
311	143	167	4	6664.74	0.00
312	144	183	1	5758.05	0.00
313	144	45	1	6595.34	10.00
314	145	202	2	32567.80	5.00
315	145	121	4	3250.20	0.00
316	146	60	1	28605.81	5.00
317	147	59	3	23956.82	0.00
318	147	93	2	2239.83	0.00
319	148	298	1	14592.86	0.00
320	149	72	2	3396.14	0.00
321	150	73	5	19639.03	0.00
322	150	179	5	1556.32	0.00
323	150	127	4	14788.94	10.00
324	151	251	3	28879.67	0.00
325	151	208	2	8508.53	0.00
326	152	187	5	2994.33	5.00
327	153	121	4	3250.20	0.00
328	153	224	5	3586.39	0.00
329	154	145	1	26900.06	0.00
330	155	100	2	8325.24	0.00
331	155	242	1	26069.06	0.00
332	155	262	5	316.65	0.00
333	156	268	4	4330.51	0.00
334	156	208	1	8508.53	0.00
335	157	302	3	10847.55	0.00
336	158	13	1	13999.33	0.00
337	159	187	1	2994.33	0.00
338	160	9	1	33482.70	0.00
339	160	144	5	18427.13	0.00
340	160	241	2	25166.29	0.00
341	161	73	1	19639.03	0.00
342	162	231	4	6896.87	5.00
343	162	91	2	17167.44	0.00
344	163	209	5	14780.53	0.00
345	163	258	5	4070.91	0.00
346	164	214	2	8996.93	0.00
347	165	127	5	14788.94	0.00
348	165	203	3	11026.49	0.00
349	165	294	4	18000.72	0.00
350	166	44	5	6287.16	0.00
351	166	316	4	340.50	10.00
352	166	177	5	1037.15	0.00
353	166	314	5	21132.86	5.00
354	167	274	5	9735.42	5.00
355	168	320	2	19956.45	0.00
356	169	225	3	27871.38	0.00
357	169	76	2	16330.99	0.00
358	169	138	3	29598.30	0.00
359	170	251	2	28879.67	5.00
360	171	248	2	5704.91	0.00
361	171	92	3	20118.27	10.00
362	171	95	2	873.16	0.00
363	172	50	4	32360.23	0.00
364	173	96	4	8770.71	0.00
365	173	291	1	4154.47	0.00
366	174	174	1	28177.73	0.00
367	174	36	2	1735.10	5.00
368	174	217	3	3368.23	5.00
369	175	55	5	25249.73	0.00
370	175	116	1	23884.82	10.00
371	175	103	3	20005.99	5.00
372	176	77	5	20201.77	0.00
373	176	329	3	21671.36	10.00
374	177	48	1	18931.60	0.00
375	177	263	2	21676.55	0.00
376	178	99	1	16911.90	0.00
377	178	294	1	18000.72	0.00
378	179	169	4	16701.06	0.00
379	179	187	5	2994.33	0.00
380	179	28	1	20966.76	10.00
381	179	211	4	12736.65	5.00
382	179	112	4	18453.69	0.00
383	180	318	5	32370.18	0.00
384	180	317	5	29835.28	0.00
385	181	300	1	17477.32	5.00
386	181	227	2	35785.16	0.00
387	181	208	3	8508.53	10.00
388	182	294	1	18000.72	5.00
389	182	178	2	8358.65	0.00
390	183	138	2	29598.30	5.00
391	184	80	3	38259.20	0.00
392	185	80	4	38259.20	0.00
393	185	221	3	4679.42	5.00
394	185	102	3	19901.11	0.00
395	185	62	2	8722.93	0.00
396	186	155	2	2596.48	10.00
397	187	303	4	19580.63	0.00
398	188	296	2	21692.65	0.00
399	188	15	2	5791.98	0.00
400	189	17	5	1197.66	10.00
401	189	91	5	17167.44	0.00
402	190	8	2	28612.40	0.00
403	190	260	4	10785.43	0.00
404	191	107	3	359.68	0.00
405	192	219	2	27037.61	10.00
406	193	116	1	23884.82	0.00
407	193	34	1	34435.26	5.00
408	193	226	4	14516.18	0.00
409	194	179	1	1556.32	5.00
410	194	134	3	32564.64	5.00
411	194	229	2	18071.36	0.00
412	195	260	3	10785.43	0.00
413	195	86	4	27867.51	5.00
414	196	73	1	19639.03	0.00
415	196	76	5	16330.99	0.00
416	197	304	1	25507.59	0.00
417	197	131	5	32528.88	10.00
418	197	175	3	431.66	0.00
419	197	283	5	18689.10	0.00
420	198	52	2	5082.07	0.00
421	198	289	3	15260.25	0.00
422	198	264	2	3231.57	0.00
423	198	44	3	6287.16	0.00
424	198	219	4	27037.61	0.00
425	199	265	4	33033.81	0.00
426	200	239	3	23450.80	5.00
427	201	52	4	5082.07	5.00
428	202	124	4	10512.87	0.00
429	202	116	4	23884.82	5.00
430	203	122	1	12832.42	0.00
431	203	196	3	29103.79	0.00
432	203	241	4	25166.29	0.00
433	204	192	1	22314.85	0.00
434	204	123	5	16598.57	5.00
435	204	40	5	14719.88	0.00
436	204	90	1	18037.96	0.00
437	205	231	5	6896.87	0.00
438	205	72	2	3396.14	5.00
439	206	284	4	13885.78	0.00
440	207	316	1	340.50	0.00
441	208	283	5	18689.10	0.00
442	208	324	3	35511.98	0.00
443	208	232	3	10580.70	0.00
444	208	161	1	30174.43	0.00
445	209	187	3	2994.33	0.00
446	210	172	3	21684.08	5.00
447	211	53	4	1943.06	0.00
448	212	278	2	12560.12	0.00
449	212	140	4	30696.33	0.00
450	212	26	4	28783.35	0.00
451	213	226	4	14516.18	5.00
452	214	298	1	14592.86	0.00
453	214	151	3	2056.97	10.00
454	215	316	2	340.50	0.00
455	215	181	1	7647.49	0.00
456	215	201	3	10598.73	0.00
457	216	268	2	4330.51	0.00
458	217	77	4	20201.77	0.00
459	217	317	3	29835.28	0.00
460	217	318	3	32370.18	0.00
461	217	219	3	27037.61	0.00
462	218	311	4	14989.38	5.00
463	219	127	3	14788.94	0.00
464	219	263	4	21676.55	5.00
465	220	76	3	16330.99	0.00
466	220	73	4	19639.03	0.00
467	220	172	4	21684.08	0.00
468	221	40	1	14719.88	10.00
469	221	237	4	8720.64	0.00
470	222	327	3	8103.13	0.00
471	223	100	3	8325.24	10.00
472	223	311	1	14989.38	0.00
473	224	316	5	340.50	5.00
474	224	173	2	29095.13	0.00
475	225	121	5	3250.20	0.00
476	225	32	4	26325.66	5.00
477	226	167	3	6664.74	0.00
478	226	322	5	13830.37	0.00
479	227	316	1	340.50	0.00
480	227	154	5	3570.74	5.00
481	227	113	3	26136.34	0.00
482	228	130	3	21694.52	5.00
483	229	17	2	1197.66	0.00
484	229	297	2	2879.78	0.00
485	229	206	3	6045.35	0.00
486	229	237	1	8720.64	0.00
487	229	200	3	2196.15	0.00
488	230	249	1	340.08	0.00
489	230	326	3	13740.29	10.00
490	230	239	4	23450.80	0.00
491	231	119	4	20568.93	0.00
492	231	26	5	28783.35	0.00
493	231	232	1	10580.70	0.00
494	232	15	4	5791.98	5.00
495	233	51	3	24451.03	0.00
496	233	319	2	28695.55	5.00
497	234	144	3	18427.13	0.00
498	234	209	1	14780.53	0.00
499	234	53	5	1943.06	0.00
500	234	186	2	10556.47	0.00
501	234	22	5	34187.79	0.00
502	235	108	1	19316.06	0.00
503	235	317	5	29835.28	0.00
504	236	48	3	18931.60	0.00
505	237	229	1	18071.36	5.00
506	237	91	3	17167.44	0.00
507	237	316	2	340.50	0.00
508	237	293	2	8008.05	0.00
509	238	314	4	21132.86	0.00
510	239	150	5	6436.80	0.00
511	239	161	2	30174.43	5.00
512	239	193	2	7905.39	0.00
513	240	126	5	18009.84	5.00
514	240	325	4	12556.36	0.00
515	240	286	5	29466.98	10.00
516	241	149	5	12786.74	0.00
517	242	71	3	5597.63	0.00
518	243	217	1	3368.23	0.00
519	244	131	1	32528.88	0.00
520	244	135	5	22949.80	0.00
521	244	298	3	14592.86	10.00
522	245	249	4	340.08	5.00
523	246	100	3	8325.24	5.00
524	246	105	2	18324.05	10.00
525	247	22	5	34187.79	5.00
526	247	233	2	16609.25	5.00
527	247	57	1	25319.11	0.00
528	248	48	1	18931.60	5.00
529	248	197	2	13698.28	0.00
530	249	35	5	14893.01	0.00
531	249	271	1	35488.48	0.00
532	249	193	1	7905.39	0.00
533	249	237	1	8720.64	0.00
534	249	326	2	13740.29	10.00
535	250	205	4	23585.50	10.00
536	250	296	2	21692.65	5.00
537	251	183	3	5758.05	0.00
538	251	231	3	6896.87	0.00
539	251	312	3	7030.98	0.00
540	252	311	4	14989.38	0.00
541	252	97	5	14554.24	0.00
542	252	179	5	1556.32	10.00
543	252	150	4	6436.80	0.00
544	253	81	3	5090.35	10.00
545	253	119	2	20568.93	0.00
546	253	258	1	4070.91	0.00
547	254	39	3	3995.01	0.00
548	254	134	1	32564.64	0.00
549	255	98	5	3266.66	0.00
550	256	71	5	5597.63	0.00
551	256	267	3	13684.84	0.00
552	256	193	1	7905.39	0.00
553	257	247	5	17789.48	0.00
554	257	116	4	23884.82	10.00
555	257	113	3	26136.34	5.00
556	257	110	3	21067.54	0.00
557	258	92	3	20118.27	0.00
558	259	316	2	340.50	0.00
559	259	295	5	15122.86	0.00
560	260	170	1	26345.81	0.00
561	260	94	1	19130.25	10.00
562	261	187	3	2994.33	0.00
563	261	159	3	8802.38	0.00
564	261	156	2	32839.76	0.00
565	262	188	1	27164.75	5.00
566	263	282	2	26158.78	0.00
567	263	239	2	23450.80	0.00
568	263	8	4	28612.40	0.00
569	264	28	3	20966.76	5.00
570	264	69	5	20390.90	10.00
571	265	294	1	18000.72	10.00
572	265	39	2	3995.01	0.00
573	266	55	4	25249.73	0.00
574	266	27	1	7946.20	0.00
575	266	118	2	26976.56	10.00
576	267	233	4	16609.25	0.00
577	267	89	3	773.73	5.00
578	267	305	1	5777.48	0.00
579	267	175	2	431.66	0.00
580	268	253	4	6539.82	5.00
581	268	311	2	14989.38	0.00
582	269	93	2	2239.83	0.00
583	270	220	5	18064.29	0.00
584	270	224	2	3586.39	0.00
585	271	147	4	16118.15	0.00
586	272	110	3	21067.54	0.00
587	272	156	5	32839.76	10.00
588	272	187	4	2994.33	10.00
589	272	296	4	21692.65	0.00
590	273	88	3	24686.97	5.00
591	273	307	1	20775.79	0.00
592	274	156	3	32839.76	0.00
593	274	153	2	32619.22	5.00
594	274	39	4	3995.01	5.00
595	275	285	4	11004.33	10.00
596	275	90	5	18037.96	0.00
597	275	179	4	1556.32	10.00
598	276	224	4	3586.39	0.00
599	276	214	1	8996.93	0.00
600	276	299	5	11746.03	0.00
601	276	184	3	8109.22	10.00
602	276	166	1	18050.91	0.00
603	277	298	3	14592.86	5.00
604	277	212	1	13620.27	0.00
605	278	3	5	26253.43	0.00
606	278	161	3	30174.43	0.00
607	279	159	4	8802.38	0.00
608	279	85	5	18592.18	0.00
609	280	280	3	18825.63	0.00
610	280	25	4	21791.44	5.00
611	281	322	5	13830.37	5.00
612	281	200	2	2196.15	0.00
613	281	113	1	26136.34	5.00
614	282	73	4	19639.03	0.00
615	283	323	5	23922.51	0.00
616	283	328	3	22158.52	0.00
617	283	84	2	9912.34	5.00
618	283	15	2	5791.98	0.00
619	284	145	3	26900.06	0.00
620	285	69	4	20390.90	0.00
621	285	253	1	6539.82	5.00
622	286	238	3	18623.67	0.00
623	287	47	1	17054.16	0.00
624	287	162	5	1341.67	10.00
625	288	287	5	26929.25	0.00
626	289	161	5	30174.43	5.00
627	289	115	3	10525.91	0.00
628	289	324	5	35511.98	0.00
629	289	117	1	30916.88	0.00
630	289	170	3	26345.81	0.00
631	290	308	2	14634.32	0.00
632	290	174	4	28177.73	0.00
633	291	67	5	6504.44	0.00
634	291	4	1	8942.68	0.00
635	292	155	4	2596.48	0.00
636	292	295	1	15122.86	0.00
637	293	311	4	14989.38	0.00
638	294	14	5	17741.79	0.00
639	294	290	1	20830.98	10.00
640	295	2	3	24015.17	0.00
641	296	310	1	390.07	0.00
642	296	200	4	2196.15	5.00
643	296	326	3	13740.29	0.00
644	297	186	3	10556.47	5.00
645	297	316	2	340.50	0.00
646	297	252	3	19842.18	0.00
647	298	87	3	25661.61	0.00
648	298	46	5	32347.10	10.00
649	298	9	1	33482.70	5.00
650	299	322	4	13830.37	0.00
651	300	239	4	23450.80	0.00
652	300	281	3	30869.24	0.00
653	301	62	1	8722.93	0.00
654	301	172	5	21684.08	0.00
655	302	230	1	28400.61	10.00
656	302	239	4	23450.80	5.00
657	303	195	4	17434.24	0.00
658	303	16	4	2894.98	0.00
659	304	187	1	2994.33	0.00
660	305	285	4	11004.33	5.00
661	305	105	3	18324.05	10.00
662	306	302	2	10847.55	0.00
663	306	187	1	2994.33	0.00
664	306	276	5	21618.85	0.00
665	307	70	4	1664.51	0.00
666	308	192	3	22314.85	0.00
667	308	199	4	31720.32	5.00
668	308	289	5	15260.25	0.00
669	309	64	1	6770.97	0.00
670	309	10	2	1535.56	0.00
671	310	71	1	5597.63	10.00
672	311	133	4	19101.95	0.00
673	311	188	3	27164.75	10.00
674	311	301	4	9631.41	0.00
675	312	134	2	32564.64	0.00
676	313	217	3	3368.23	0.00
677	313	103	5	20005.99	0.00
678	313	105	3	18324.05	0.00
679	313	245	1	20516.11	0.00
680	314	243	4	32934.99	5.00
681	314	271	1	35488.48	0.00
682	315	45	1	6595.34	5.00
683	316	243	5	32934.99	0.00
684	317	82	1	32104.18	0.00
685	317	107	2	359.68	0.00
686	317	104	4	31420.14	0.00
687	318	51	4	24451.03	0.00
688	318	75	5	27128.62	0.00
689	319	262	4	316.65	5.00
690	320	21	1	28885.66	0.00
691	320	263	2	21676.55	0.00
692	321	260	2	10785.43	0.00
693	322	145	5	26900.06	0.00
694	323	123	5	16598.57	0.00
695	323	163	5	20880.95	0.00
696	323	58	3	26928.89	0.00
697	324	18	2	31259.75	0.00
698	324	149	3	12786.74	10.00
699	325	8	2	28612.40	0.00
700	325	324	2	35511.98	0.00
701	326	256	5	18150.18	5.00
702	326	23	2	8278.99	5.00
703	326	64	1	6770.97	0.00
704	327	142	3	32902.97	0.00
705	327	108	1	19316.06	5.00
706	328	243	3	32934.99	5.00
707	328	294	1	18000.72	0.00
708	328	88	2	24686.97	0.00
709	329	59	4	23956.82	0.00
710	329	120	2	6107.02	0.00
711	330	172	5	21684.08	10.00
712	330	80	4	38259.20	0.00
713	331	148	2	33398.34	0.00
714	331	207	4	23472.26	10.00
715	332	28	4	20966.76	0.00
716	333	55	3	25249.73	0.00
717	333	68	4	30368.50	0.00
718	334	326	4	13740.29	0.00
719	334	173	5	29095.13	0.00
720	334	110	2	21067.54	5.00
721	335	325	1	12556.36	0.00
722	335	52	3	5082.07	10.00
723	336	297	1	2879.78	0.00
724	336	168	5	4961.32	0.00
725	337	147	5	16118.15	0.00
726	337	261	3	22618.18	0.00
727	337	300	5	17477.32	0.00
728	338	73	3	19639.03	0.00
729	338	181	2	7647.49	0.00
730	339	148	3	33398.34	10.00
731	339	251	1	28879.67	0.00
732	339	129	3	6063.22	0.00
733	340	301	3	9631.41	5.00
734	340	1	3	15858.11	0.00
735	341	133	3	19101.95	0.00
736	342	249	1	340.08	5.00
737	342	159	3	8802.38	0.00
738	342	265	2	33033.81	5.00
739	343	262	4	316.65	0.00
740	343	274	3	9735.42	5.00
741	344	313	2	8702.12	10.00
742	344	118	4	26976.56	10.00
743	344	13	3	13999.33	0.00
744	344	129	2	6063.22	10.00
745	345	224	5	3586.39	0.00
746	346	134	2	32564.64	0.00
747	346	270	4	29941.52	0.00
748	347	68	3	30368.50	5.00
749	347	226	2	14516.18	0.00
750	347	63	2	26923.17	10.00
751	347	186	1	10556.47	5.00
752	348	108	3	19316.06	0.00
753	348	141	2	18976.68	0.00
754	348	51	4	24451.03	10.00
755	348	96	1	8770.71	0.00
756	349	307	4	20775.79	0.00
757	349	248	1	5704.91	5.00
758	349	177	2	1037.15	0.00
759	349	111	5	9004.05	10.00
760	350	322	4	13830.37	10.00
761	350	285	2	11004.33	0.00
762	351	50	5	32360.23	0.00
763	351	1	5	15858.11	0.00
764	352	188	5	27164.75	5.00
765	352	183	2	5758.05	10.00
766	353	82	3	32104.18	5.00
767	353	45	3	6595.34	5.00
768	353	271	1	35488.48	0.00
769	353	310	3	390.07	5.00
770	354	297	1	2879.78	0.00
771	354	265	1	33033.81	5.00
772	355	139	5	25656.53	0.00
773	355	93	5	2239.83	0.00
774	356	329	1	21671.36	0.00
775	357	302	3	10847.55	0.00
776	358	101	5	7061.05	0.00
777	358	97	1	14554.24	5.00
778	358	146	4	23311.85	0.00
779	359	26	5	28783.35	0.00
780	360	150	2	6436.80	0.00
781	361	321	1	15006.91	5.00
782	362	42	2	22822.73	0.00
783	362	236	2	17409.10	0.00
784	363	117	1	30916.88	0.00
785	364	255	3	37063.14	0.00
786	364	88	2	24686.97	5.00
787	364	157	1	11935.44	10.00
788	365	70	1	1664.51	10.00
789	366	254	5	15942.44	5.00
790	367	222	2	3056.85	0.00
791	367	308	1	14634.32	0.00
792	367	40	5	14719.88	5.00
793	367	26	2	28783.35	0.00
794	368	144	3	18427.13	0.00
795	369	20	4	21995.92	0.00
796	369	226	1	14516.18	0.00
797	370	277	1	31244.88	10.00
798	370	108	5	19316.06	0.00
799	370	44	5	6287.16	0.00
800	371	208	3	8508.53	5.00
801	372	55	5	25249.73	0.00
802	373	152	2	6462.82	0.00
803	373	11	4	23322.36	0.00
804	374	65	4	28661.97	0.00
805	374	114	4	14824.91	0.00
806	374	50	1	32360.23	10.00
807	375	198	4	26581.95	5.00
808	376	160	5	21111.41	5.00
809	376	123	4	16598.57	10.00
810	377	139	4	25656.53	10.00
811	378	47	3	17054.16	0.00
812	378	280	4	18825.63	0.00
813	378	138	1	29598.30	10.00
814	379	304	1	25507.59	0.00
815	380	100	4	8325.24	10.00
816	381	58	2	26928.89	0.00
817	381	48	5	18931.60	10.00
818	382	106	2	8994.82	0.00
819	382	45	2	6595.34	0.00
820	382	27	3	7946.20	0.00
821	383	151	3	2056.97	0.00
822	383	286	2	29466.98	0.00
823	383	90	3	18037.96	0.00
824	384	202	4	32567.80	0.00
825	384	173	1	29095.13	0.00
826	384	143	1	21267.26	0.00
827	384	254	3	15942.44	5.00
828	385	28	3	20966.76	10.00
829	385	106	3	8994.82	0.00
830	385	198	2	26581.95	0.00
831	385	174	3	28177.73	0.00
832	385	116	4	23884.82	5.00
833	386	65	4	28661.97	0.00
834	386	86	4	27867.51	0.00
835	386	210	4	31221.02	0.00
836	387	183	3	5758.05	10.00
837	388	151	3	2056.97	0.00
838	388	88	4	24686.97	0.00
839	388	23	2	8278.99	0.00
840	389	273	4	19698.88	0.00
841	389	27	4	7946.20	0.00
842	390	204	3	7103.30	5.00
843	390	21	5	28885.66	0.00
844	390	97	2	14554.24	0.00
845	391	63	4	26923.17	5.00
846	391	179	2	1556.32	5.00
847	392	190	1	2205.28	0.00
848	392	95	3	873.16	0.00
849	393	3	1	26253.43	0.00
850	394	134	4	32564.64	0.00
851	394	110	1	21067.54	5.00
852	394	328	4	22158.52	5.00
853	395	263	2	21676.55	0.00
854	396	190	2	2205.28	0.00
855	396	181	3	7647.49	0.00
856	396	258	5	4070.91	0.00
857	397	230	4	28400.61	0.00
858	397	295	3	15122.86	5.00
859	397	290	2	20830.98	0.00
860	398	30	2	20705.47	0.00
861	398	156	2	32839.76	5.00
862	399	264	5	3231.57	10.00
863	399	131	5	32528.88	0.00
864	400	232	4	10580.70	10.00
865	400	268	4	4330.51	10.00
866	400	329	3	21671.36	0.00
867	401	55	1	25249.73	0.00
868	401	171	4	1914.19	10.00
869	401	272	5	17566.50	0.00
870	402	305	1	5777.48	5.00
871	402	134	5	32564.64	10.00
872	402	192	2	22314.85	5.00
873	402	56	4	27131.00	0.00
874	403	329	5	21671.36	0.00
875	403	289	4	15260.25	0.00
876	404	55	1	25249.73	5.00
877	405	319	4	28695.55	0.00
878	405	189	1	7295.82	5.00
879	405	314	5	21132.86	5.00
880	406	29	2	35509.97	5.00
881	406	188	1	27164.75	0.00
882	407	40	2	14719.88	0.00
883	408	148	3	33398.34	5.00
884	409	56	5	27131.00	10.00
885	410	289	3	15260.25	0.00
886	411	219	4	27037.61	0.00
887	412	199	5	31720.32	0.00
888	412	291	1	4154.47	10.00
889	412	114	4	14824.91	0.00
890	412	79	2	13282.08	5.00
891	412	269	2	6147.83	10.00
892	413	317	1	29835.28	0.00
893	413	236	4	17409.10	5.00
894	414	283	4	18689.10	5.00
895	414	239	2	23450.80	0.00
896	415	55	3	25249.73	0.00
897	415	214	4	8996.93	0.00
898	415	293	1	8008.05	0.00
899	415	74	1	20327.04	10.00
900	415	230	5	28400.61	10.00
901	416	241	1	25166.29	0.00
902	416	150	4	6436.80	0.00
903	416	27	5	7946.20	0.00
904	417	204	1	7103.30	0.00
905	417	196	4	29103.79	0.00
906	418	174	4	28177.73	0.00
907	418	125	4	30636.77	0.00
908	419	4	2	8942.68	5.00
909	420	60	2	28605.81	5.00
910	421	112	1	18453.69	0.00
911	421	315	1	19913.45	0.00
912	422	40	2	14719.88	5.00
913	422	280	5	18825.63	0.00
914	422	35	4	14893.01	10.00
915	422	194	4	18125.11	0.00
916	422	290	4	20830.98	5.00
917	423	57	3	25319.11	0.00
918	424	218	2	9097.50	5.00
919	425	78	1	21716.19	0.00
920	425	186	3	10556.47	5.00
921	426	303	4	19580.63	0.00
922	426	169	4	16701.06	0.00
923	426	260	1	10785.43	5.00
924	426	324	4	35511.98	0.00
925	427	168	5	4961.32	0.00
926	427	130	3	21694.52	0.00
927	427	155	2	2596.48	5.00
928	428	81	3	5090.35	5.00
929	428	43	3	29453.15	0.00
930	428	266	1	30350.30	0.00
931	428	73	4	19639.03	10.00
932	429	169	2	16701.06	0.00
933	429	2	3	24015.17	0.00
934	430	111	2	9004.05	10.00
935	431	60	4	28605.81	0.00
936	432	227	4	35785.16	10.00
937	433	100	2	8325.24	0.00
938	433	79	1	13282.08	0.00
939	433	2	5	24015.17	5.00
940	434	121	1	3250.20	5.00
941	435	218	3	9097.50	0.00
942	435	237	2	8720.64	0.00
943	436	284	2	13885.78	0.00
944	436	6	1	17267.65	10.00
945	436	256	3	18150.18	0.00
946	437	297	4	2879.78	0.00
947	438	224	1	3586.39	0.00
948	438	90	5	18037.96	5.00
949	438	291	3	4154.47	5.00
950	438	194	5	18125.11	0.00
951	439	22	3	34187.79	5.00
952	439	132	5	11440.30	0.00
953	439	253	3	6539.82	10.00
954	439	63	3	26923.17	0.00
955	439	213	3	4846.86	5.00
956	440	177	2	1037.15	0.00
957	440	240	4	6679.87	0.00
958	440	237	2	8720.64	0.00
959	440	61	4	26987.99	0.00
960	441	326	5	13740.29	10.00
961	441	90	4	18037.96	5.00
962	442	89	4	773.73	5.00
963	443	165	5	10583.30	0.00
964	443	132	2	11440.30	0.00
965	444	305	4	5777.48	0.00
966	444	149	3	12786.74	0.00
967	445	97	1	14554.24	0.00
968	445	16	1	2894.98	5.00
969	446	213	3	4846.86	5.00
970	447	289	5	15260.25	10.00
971	447	151	2	2056.97	10.00
972	447	184	2	8109.22	0.00
973	447	104	2	31420.14	0.00
974	448	126	5	18009.84	5.00
975	448	112	2	18453.69	5.00
976	448	179	5	1556.32	0.00
977	448	199	4	31720.32	5.00
978	448	214	4	8996.93	0.00
979	449	325	1	12556.36	10.00
980	449	77	2	20201.77	5.00
981	450	1	2	15858.11	0.00
982	450	58	4	26928.89	0.00
983	451	314	1	21132.86	10.00
984	452	247	3	17789.48	5.00
985	452	5	1	23066.77	10.00
986	452	51	3	24451.03	5.00
987	453	326	2	13740.29	0.00
988	453	195	3	17434.24	0.00
989	454	281	1	30869.24	0.00
990	455	208	1	8508.53	0.00
991	455	173	1	29095.13	0.00
992	456	230	3	28400.61	5.00
993	456	327	5	8103.13	5.00
994	456	187	2	2994.33	0.00
995	456	12	3	14641.07	0.00
996	457	310	1	390.07	0.00
997	457	286	5	29466.98	5.00
998	457	48	3	18931.60	0.00
999	458	236	4	17409.10	0.00
1000	459	193	5	7905.39	0.00
1001	459	172	4	21684.08	0.00
1002	459	204	2	7103.30	0.00
1003	460	270	2	29941.52	10.00
1004	460	89	4	773.73	5.00
1005	460	196	4	29103.79	5.00
1006	461	52	2	5082.07	0.00
1007	461	45	1	6595.34	0.00
1008	461	159	2	8802.38	5.00
1009	462	244	3	10146.51	0.00
1010	462	41	2	11834.74	0.00
1011	463	69	4	20390.90	0.00
1012	463	304	3	25507.59	5.00
1013	463	114	1	14824.91	0.00
1014	463	16	2	2894.98	0.00
1015	464	260	1	10785.43	0.00
1016	465	69	5	20390.90	5.00
1017	465	277	3	31244.88	5.00
1018	466	146	3	23311.85	0.00
1019	466	243	5	32934.99	0.00
1020	467	69	2	20390.90	0.00
1021	467	261	3	22618.18	5.00
1022	467	302	4	10847.55	10.00
1023	467	248	5	5704.91	10.00
1024	468	96	3	8770.71	0.00
1025	468	148	3	33398.34	0.00
1026	469	144	1	18427.13	0.00
1027	469	78	3	21716.19	0.00
1028	469	63	5	26923.17	0.00
1029	470	243	4	32934.99	0.00
1030	471	191	1	13943.67	5.00
1031	471	107	4	359.68	5.00
1032	471	290	5	20830.98	0.00
1033	472	221	2	4679.42	0.00
1034	472	305	2	5777.48	10.00
1035	472	91	1	17167.44	0.00
1036	472	111	2	9004.05	0.00
1037	473	101	2	7061.05	5.00
1038	473	305	3	5777.48	0.00
1039	473	172	2	21684.08	0.00
1040	474	112	3	18453.69	0.00
1041	474	55	3	25249.73	0.00
1042	474	90	4	18037.96	5.00
1043	475	49	1	10492.89	0.00
1044	476	252	2	19842.18	0.00
1045	476	122	2	12832.42	0.00
1046	477	289	3	15260.25	0.00
1047	477	324	4	35511.98	0.00
1048	477	91	3	17167.44	0.00
1049	477	64	4	6770.97	5.00
1050	478	235	2	23624.80	0.00
1051	478	36	5	1735.10	0.00
1052	479	263	3	21676.55	5.00
1053	479	300	3	17477.32	0.00
1054	479	43	2	29453.15	0.00
1055	479	29	2	35509.97	5.00
1056	480	313	3	8702.12	0.00
1057	480	218	2	9097.50	5.00
1058	481	79	5	13282.08	0.00
1059	481	1	5	15858.11	0.00
1060	482	244	3	10146.51	0.00
1061	482	286	4	29466.98	0.00
1062	483	114	4	14824.91	0.00
1063	484	25	3	21791.44	0.00
1064	484	303	4	19580.63	0.00
1065	484	226	5	14516.18	0.00
1066	485	66	5	17427.59	0.00
1067	485	280	3	18825.63	0.00
1068	485	161	4	30174.43	0.00
1069	485	203	5	11026.49	0.00
1070	486	43	1	29453.15	0.00
1071	487	278	1	12560.12	0.00
1072	487	163	2	20880.95	0.00
1073	487	160	1	21111.41	0.00
1074	488	6	2	17267.65	0.00
1075	488	126	3	18009.84	5.00
1076	488	210	5	31221.02	0.00
1077	489	305	1	5777.48	0.00
1078	490	48	1	18931.60	5.00
1079	490	103	2	20005.99	5.00
1080	491	225	3	27871.38	0.00
1081	491	41	3	11834.74	10.00
1082	492	102	1	19901.11	0.00
1083	492	16	3	2894.98	5.00
1084	493	231	3	6896.87	0.00
1085	493	251	3	28879.67	5.00
1086	493	241	3	25166.29	5.00
1087	494	50	2	32360.23	0.00
1088	494	206	2	6045.35	5.00
1089	495	125	4	30636.77	0.00
1090	496	181	5	7647.49	5.00
1091	496	238	4	18623.67	5.00
1092	497	30	3	20705.47	0.00
1093	497	96	4	8770.71	0.00
1094	498	198	5	26581.95	0.00
1095	499	264	2	3231.57	0.00
1096	499	185	1	27147.39	0.00
1097	500	191	2	13943.67	0.00
1098	500	178	3	8358.65	0.00
1099	501	133	1	19101.95	0.00
1100	501	33	3	4281.57	0.00
1101	501	93	4	2239.83	0.00
1102	501	140	5	30696.33	5.00
1103	502	199	1	31720.32	0.00
1104	502	26	1	28783.35	0.00
1105	503	4	1	8942.68	0.00
1106	503	263	2	21676.55	0.00
1107	503	250	5	22128.51	0.00
1108	504	298	2	14592.86	0.00
1109	505	260	5	10785.43	5.00
1110	505	304	5	25507.59	5.00
1111	506	313	5	8702.12	0.00
1112	507	50	3	32360.23	0.00
1113	507	212	5	13620.27	10.00
1114	508	186	4	10556.47	5.00
1115	508	234	1	27391.73	0.00
1116	509	221	2	4679.42	0.00
1117	509	226	1	14516.18	0.00
1118	509	164	5	15959.84	0.00
1119	509	65	2	28661.97	0.00
1120	509	211	4	12736.65	5.00
1121	510	42	4	22822.73	0.00
1122	510	250	2	22128.51	0.00
1123	511	236	5	17409.10	0.00
1124	511	149	2	12786.74	0.00
1125	512	251	3	28879.67	0.00
1126	512	219	2	27037.61	10.00
1127	512	94	4	19130.25	0.00
1128	513	266	2	30350.30	0.00
1129	514	218	1	9097.50	0.00
1130	514	321	5	15006.91	0.00
1131	514	173	2	29095.13	0.00
1132	515	129	4	6063.22	0.00
1133	515	274	1	9735.42	5.00
1134	515	100	2	8325.24	0.00
1135	516	171	1	1914.19	0.00
1136	517	7	4	25378.21	0.00
1137	518	325	4	12556.36	0.00
1138	518	259	3	12682.03	0.00
1139	519	162	3	1341.67	5.00
1140	520	59	4	23956.82	0.00
1141	520	264	5	3231.57	0.00
1142	521	66	3	17427.59	10.00
1143	522	251	3	28879.67	5.00
1144	522	242	3	26069.06	0.00
1145	523	175	3	431.66	5.00
1146	523	34	4	34435.26	0.00
1147	523	107	5	359.68	5.00
1148	524	215	5	13820.74	10.00
1149	524	318	2	32370.18	0.00
1150	525	151	1	2056.97	0.00
1151	525	246	1	14044.38	0.00
1152	525	252	2	19842.18	0.00
1153	526	328	3	22158.52	5.00
1154	526	128	1	7835.32	0.00
1155	527	235	5	23624.80	5.00
1156	527	70	5	1664.51	10.00
1157	528	196	4	29103.79	5.00
1158	528	188	1	27164.75	5.00
1159	529	324	5	35511.98	0.00
1160	529	26	4	28783.35	0.00
1161	529	121	4	3250.20	0.00
1162	530	49	5	10492.89	0.00
1163	530	18	5	31259.75	0.00
1164	531	58	5	26928.89	0.00
1165	532	7	1	25378.21	0.00
1166	532	112	2	18453.69	0.00
1167	532	141	5	18976.68	0.00
1168	533	59	2	23956.82	5.00
1169	533	249	1	340.08	0.00
1170	533	102	1	19901.11	0.00
1171	534	224	1	3586.39	5.00
1172	534	185	5	27147.39	10.00
1173	535	261	5	22618.18	0.00
1174	535	256	5	18150.18	0.00
1175	536	257	4	17467.13	0.00
1176	536	321	3	15006.91	0.00
1177	537	44	3	6287.16	5.00
1178	537	51	1	24451.03	0.00
1179	538	151	4	2056.97	0.00
1180	538	214	2	8996.93	5.00
1181	538	35	5	14893.01	5.00
1182	538	314	1	21132.86	0.00
1183	538	28	2	20966.76	10.00
1184	539	265	5	33033.81	5.00
1185	539	204	5	7103.30	10.00
1186	539	201	5	10598.73	0.00
1187	540	10	2	1535.56	0.00
1188	540	11	4	23322.36	10.00
1189	541	329	1	21671.36	5.00
1190	541	117	2	30916.88	0.00
1191	542	87	1	25661.61	5.00
1192	543	192	2	22314.85	5.00
1193	543	49	3	10492.89	0.00
1194	543	115	4	10525.91	0.00
1195	543	111	2	9004.05	5.00
1196	543	173	5	29095.13	0.00
1197	544	16	5	2894.98	0.00
1198	544	277	5	31244.88	0.00
1199	544	139	3	25656.53	5.00
1200	545	218	5	9097.50	0.00
1201	546	291	4	4154.47	0.00
1202	547	59	2	23956.82	0.00
1203	547	326	3	13740.29	0.00
1204	548	144	2	18427.13	10.00
1205	549	102	5	19901.11	0.00
1206	550	156	5	32839.76	5.00
1207	550	286	3	29466.98	0.00
1208	550	329	1	21671.36	0.00
1209	551	26	1	28783.35	0.00
1210	551	17	1	1197.66	5.00
1211	551	267	3	13684.84	0.00
1212	551	170	4	26345.81	0.00
1213	551	296	4	21692.65	5.00
1214	552	125	4	30636.77	5.00
1215	553	105	3	18324.05	5.00
1216	554	33	3	4281.57	5.00
1217	555	263	4	21676.55	5.00
1218	555	294	4	18000.72	0.00
1219	556	246	4	14044.38	0.00
1220	557	151	2	2056.97	0.00
1221	557	73	1	19639.03	0.00
1222	557	329	4	21671.36	5.00
1223	557	313	5	8702.12	5.00
1224	558	175	1	431.66	10.00
1225	559	11	4	23322.36	0.00
1226	559	252	2	19842.18	0.00
1227	559	291	1	4154.47	0.00
1228	560	141	1	18976.68	0.00
1229	560	301	4	9631.41	0.00
1230	560	200	3	2196.15	0.00
1231	561	88	1	24686.97	0.00
1232	561	247	4	17789.48	0.00
1233	562	273	5	19698.88	0.00
1234	562	222	2	3056.85	0.00
1235	563	230	1	28400.61	0.00
1236	563	237	4	8720.64	0.00
1237	564	303	5	19580.63	10.00
1238	565	310	4	390.07	0.00
1239	565	45	4	6595.34	0.00
1240	565	253	1	6539.82	0.00
1241	565	195	4	17434.24	0.00
1242	566	83	3	7497.50	0.00
1243	566	142	4	32902.97	0.00
1244	567	101	2	7061.05	0.00
1245	567	1	4	15858.11	0.00
1246	567	6	1	17267.65	0.00
1247	568	147	5	16118.15	0.00
1248	568	217	5	3368.23	0.00
1249	568	175	5	431.66	0.00
1250	569	156	5	32839.76	0.00
1251	569	308	3	14634.32	0.00
1252	570	92	1	20118.27	0.00
1253	571	86	5	27867.51	5.00
1254	571	194	4	18125.11	0.00
1255	572	106	4	8994.82	0.00
1256	573	252	4	19842.18	5.00
1257	573	273	4	19698.88	5.00
1258	573	189	2	7295.82	0.00
1259	573	147	2	16118.15	0.00
1260	573	168	4	4961.32	0.00
1261	574	259	1	12682.03	0.00
1262	575	178	4	8358.65	0.00
1263	576	71	2	5597.63	0.00
1264	577	123	1	16598.57	0.00
1265	577	192	3	22314.85	0.00
1266	578	228	3	31317.59	5.00
1267	578	119	2	20568.93	0.00
1268	578	51	4	24451.03	0.00
1269	579	130	4	21694.52	0.00
1270	580	285	2	11004.33	5.00
1271	581	31	2	14239.86	0.00
1272	581	247	5	17789.48	5.00
1273	581	36	5	1735.10	0.00
1274	581	32	4	26325.66	0.00
1275	581	26	4	28783.35	0.00
1276	582	309	4	29167.36	0.00
1277	583	328	5	22158.52	5.00
1278	583	115	2	10525.91	0.00
1279	584	270	5	29941.52	0.00
1280	584	229	5	18071.36	5.00
1281	584	220	4	18064.29	0.00
1282	585	77	1	20201.77	10.00
1283	585	177	2	1037.15	0.00
1284	585	263	4	21676.55	10.00
1285	586	194	3	18125.11	0.00
1286	587	171	1	1914.19	0.00
1287	588	309	2	29167.36	0.00
1288	588	324	4	35511.98	0.00
1289	588	316	3	340.50	0.00
1290	589	268	4	4330.51	10.00
1291	589	13	3	13999.33	10.00
1292	590	16	2	2894.98	10.00
1293	590	101	2	7061.05	0.00
1294	591	316	5	340.50	0.00
1295	591	180	2	18260.88	10.00
1296	591	30	2	20705.47	0.00
1297	592	95	1	873.16	5.00
1298	592	274	4	9735.42	0.00
1299	593	228	4	31317.59	10.00
1300	593	276	2	21618.85	5.00
1301	594	273	5	19698.88	0.00
1302	594	35	5	14893.01	0.00
1303	595	257	2	17467.13	0.00
1304	595	294	2	18000.72	0.00
1305	595	292	3	20342.09	0.00
1306	595	117	4	30916.88	0.00
1307	596	199	1	31720.32	0.00
1308	597	78	3	21716.19	10.00
1309	598	256	3	18150.18	0.00
1310	598	97	5	14554.24	0.00
1311	598	200	5	2196.15	0.00
1312	599	210	1	31221.02	0.00
1313	599	202	5	32567.80	0.00
1314	600	187	2	2994.33	0.00
1315	600	242	4	26069.06	5.00
1316	601	179	2	1556.32	5.00
1317	601	244	5	10146.51	0.00
1318	602	72	5	3396.14	10.00
1319	603	117	5	30916.88	5.00
1320	603	261	1	22618.18	0.00
1321	603	182	5	8176.49	5.00
1322	604	220	3	18064.29	0.00
1323	604	223	3	13014.71	0.00
1324	604	292	3	20342.09	0.00
1325	604	83	3	7497.50	0.00
1326	605	240	3	6679.87	5.00
1327	605	115	4	10525.91	0.00
1328	606	147	3	16118.15	0.00
1329	607	151	5	2056.97	0.00
1330	607	317	1	29835.28	0.00
1331	608	294	4	18000.72	0.00
1332	608	310	2	390.07	0.00
1333	608	326	4	13740.29	0.00
1334	609	44	1	6287.16	0.00
1335	609	166	4	18050.91	0.00
1336	609	124	4	10512.87	5.00
1337	609	122	1	12832.42	5.00
1338	610	215	4	13820.74	5.00
1339	610	314	4	21132.86	0.00
1340	611	276	1	21618.85	5.00
1341	612	184	2	8109.22	5.00
1342	613	305	1	5777.48	10.00
1343	613	6	5	17267.65	5.00
1344	614	20	4	21995.92	0.00
1345	615	13	4	13999.33	0.00
1346	616	317	3	29835.28	0.00
1347	616	42	3	22822.73	10.00
1348	616	179	2	1556.32	5.00
1349	617	81	3	5090.35	0.00
1350	617	74	4	20327.04	0.00
1351	617	133	2	19101.95	0.00
1352	617	132	1	11440.30	0.00
1353	618	315	5	19913.45	5.00
1354	618	159	5	8802.38	0.00
1355	618	144	1	18427.13	10.00
1356	618	43	4	29453.15	0.00
1357	618	98	2	3266.66	0.00
1358	619	283	1	18689.10	0.00
1359	620	301	4	9631.41	0.00
1360	620	22	4	34187.79	0.00
1361	621	7	4	25378.21	10.00
1362	621	221	1	4679.42	5.00
1363	621	107	5	359.68	5.00
1364	622	258	1	4070.91	0.00
1365	623	13	5	13999.33	0.00
1366	623	193	5	7905.39	0.00
1367	623	296	3	21692.65	0.00
1368	624	266	5	30350.30	5.00
1369	624	299	5	11746.03	0.00
1370	625	121	2	3250.20	0.00
1371	625	4	1	8942.68	0.00
1372	626	184	1	8109.22	0.00
1373	627	287	1	26929.25	0.00
1374	627	98	4	3266.66	0.00
1375	627	55	5	25249.73	0.00
1376	627	293	5	8008.05	0.00
1377	628	314	1	21132.86	0.00
1378	628	283	3	18689.10	0.00
1379	629	124	5	10512.87	10.00
1380	630	181	1	7647.49	0.00
1381	630	158	2	28494.74	10.00
1382	630	236	1	17409.10	0.00
1383	631	262	3	316.65	0.00
1384	631	235	1	23624.80	0.00
1385	632	116	1	23884.82	5.00
1386	632	15	4	5791.98	10.00
1387	633	159	4	8802.38	5.00
1388	633	140	3	30696.33	0.00
1389	634	114	3	14824.91	0.00
1390	635	192	4	22314.85	5.00
1391	635	193	3	7905.39	0.00
1392	636	11	3	23322.36	0.00
1393	636	262	4	316.65	0.00
1394	637	295	4	15122.86	0.00
1395	637	109	2	24975.44	0.00
1396	638	158	4	28494.74	0.00
1397	638	250	5	22128.51	5.00
1398	638	137	1	18272.97	5.00
1399	638	116	3	23884.82	5.00
1400	639	291	4	4154.47	5.00
1401	640	64	1	6770.97	0.00
1402	641	140	1	30696.33	10.00
1403	641	255	3	37063.14	0.00
1404	642	117	1	30916.88	0.00
1405	642	87	5	25661.61	0.00
1406	642	42	4	22822.73	0.00
1407	643	69	4	20390.90	0.00
1408	643	121	5	3250.20	0.00
1409	643	249	2	340.08	10.00
1410	644	4	2	8942.68	0.00
1411	644	314	3	21132.86	0.00
1412	644	276	2	21618.85	0.00
1413	645	7	3	25378.21	0.00
1414	645	107	2	359.68	5.00
1415	646	227	3	35785.16	0.00
1416	647	214	5	8996.93	0.00
1417	647	164	5	15959.84	0.00
1418	647	207	3	23472.26	10.00
1419	648	26	3	28783.35	10.00
1420	649	180	5	18260.88	0.00
1421	649	111	4	9004.05	5.00
1422	650	28	2	20966.76	0.00
1423	650	48	3	18931.60	0.00
1424	650	161	1	30174.43	0.00
1425	650	139	1	25656.53	10.00
1426	651	141	1	18976.68	5.00
1427	651	318	5	32370.18	10.00
1428	652	59	3	23956.82	0.00
1429	652	178	1	8358.65	5.00
1430	652	325	5	12556.36	0.00
1431	652	152	1	6462.82	0.00
1432	653	209	3	14780.53	0.00
1433	654	203	4	11026.49	0.00
1434	655	149	3	12786.74	0.00
1435	655	161	4	30174.43	0.00
1436	656	255	5	37063.14	0.00
1437	656	218	3	9097.50	0.00
1438	656	222	1	3056.85	0.00
1439	656	185	2	27147.39	0.00
1440	657	68	4	30368.50	0.00
1441	657	120	4	6107.02	0.00
1442	657	288	3	23034.91	0.00
1443	657	53	3	1943.06	0.00
1444	658	201	1	10598.73	0.00
1445	659	281	2	30869.24	5.00
1446	659	265	5	33033.81	10.00
1447	659	120	3	6107.02	5.00
1448	659	207	2	23472.26	0.00
1449	660	323	1	23922.51	0.00
1450	660	103	2	20005.99	0.00
1451	661	56	4	27131.00	5.00
1452	662	260	3	10785.43	0.00
1453	663	234	5	27391.73	5.00
1454	664	90	5	18037.96	5.00
1455	664	117	1	30916.88	0.00
1456	665	313	5	8702.12	0.00
1457	665	209	2	14780.53	0.00
1458	666	268	2	4330.51	0.00
1459	666	140	3	30696.33	0.00
1460	667	156	4	32839.76	0.00
1461	667	8	3	28612.40	0.00
1462	667	271	4	35488.48	0.00
1463	668	295	4	15122.86	0.00
1464	668	322	4	13830.37	0.00
1465	669	249	5	340.08	5.00
1466	669	302	1	10847.55	0.00
1467	670	125	3	30636.77	0.00
1468	670	149	1	12786.74	0.00
1469	671	162	3	1341.67	0.00
1470	672	65	3	28661.97	0.00
1471	673	264	5	3231.57	0.00
1472	673	222	1	3056.85	10.00
1473	673	122	1	12832.42	0.00
1474	673	160	1	21111.41	5.00
1475	674	195	1	17434.24	0.00
1476	674	129	3	6063.22	0.00
1477	674	311	2	14989.38	0.00
1478	675	92	5	20118.27	0.00
1479	675	11	4	23322.36	10.00
1480	675	50	1	32360.23	0.00
1481	675	185	3	27147.39	10.00
1482	675	196	3	29103.79	5.00
1483	676	244	4	10146.51	5.00
1484	677	4	1	8942.68	0.00
1485	677	317	1	29835.28	0.00
1486	678	8	1	28612.40	0.00
1487	678	317	5	29835.28	0.00
1488	679	154	1	3570.74	0.00
1489	679	177	3	1037.15	0.00
1490	680	184	5	8109.22	5.00
1491	680	168	5	4961.32	0.00
1492	681	282	1	26158.78	10.00
1493	682	305	4	5777.48	5.00
1494	682	202	5	32567.80	0.00
1495	683	267	5	13684.84	5.00
1496	684	277	5	31244.88	0.00
1497	684	160	4	21111.41	5.00
1498	685	12	1	14641.07	5.00
1499	685	305	4	5777.48	0.00
1500	685	310	3	390.07	0.00
1501	685	17	1	1197.66	0.00
1502	685	234	4	27391.73	0.00
1503	686	64	5	6770.97	0.00
1504	687	263	2	21676.55	0.00
1505	687	246	1	14044.38	0.00
1506	688	194	2	18125.11	5.00
1507	688	123	4	16598.57	0.00
1508	689	255	2	37063.14	5.00
1509	690	166	3	18050.91	5.00
1510	690	31	2	14239.86	10.00
1511	691	23	5	8278.99	0.00
1512	691	170	4	26345.81	0.00
1513	692	73	2	19639.03	0.00
1514	693	188	2	27164.75	0.00
1515	693	134	3	32564.64	5.00
1516	693	302	5	10847.55	0.00
1517	694	157	3	11935.44	0.00
1518	695	178	4	8358.65	0.00
1519	695	315	4	19913.45	0.00
1520	695	301	4	9631.41	5.00
1521	696	313	4	8702.12	0.00
1522	696	288	3	23034.91	5.00
1523	696	319	3	28695.55	0.00
1524	697	125	3	30636.77	0.00
1525	697	59	1	23956.82	0.00
1526	697	199	1	31720.32	5.00
1527	698	215	1	13820.74	10.00
1528	698	159	2	8802.38	0.00
1529	699	89	4	773.73	0.00
1530	699	220	5	18064.29	0.00
1531	699	21	2	28885.66	0.00
1532	699	22	3	34187.79	0.00
1533	700	312	5	7030.98	0.00
1534	700	316	5	340.50	0.00
1535	700	97	5	14554.24	0.00
1536	700	276	2	21618.85	0.00
1537	701	143	3	21267.26	0.00
1538	701	249	3	340.08	0.00
1539	702	204	3	7103.30	0.00
1540	702	188	5	27164.75	5.00
1541	703	317	2	29835.28	0.00
1542	703	171	4	1914.19	0.00
1543	703	224	4	3586.39	0.00
1544	704	108	1	19316.06	0.00
1545	704	42	2	22822.73	0.00
1546	705	265	4	33033.81	0.00
1547	706	135	2	22949.80	0.00
1548	707	262	2	316.65	5.00
1549	708	170	3	26345.81	0.00
1550	708	233	5	16609.25	5.00
1551	709	218	5	9097.50	10.00
1552	710	66	2	17427.59	0.00
1553	710	186	3	10556.47	0.00
1554	711	99	2	16911.90	10.00
1555	711	175	3	431.66	0.00
1556	712	33	4	4281.57	0.00
1557	713	195	5	17434.24	0.00
1558	713	216	2	33300.54	10.00
1559	713	11	3	23322.36	0.00
1560	713	222	3	3056.85	0.00
1561	713	273	3	19698.88	0.00
1562	714	280	1	18825.63	0.00
1563	715	110	1	21067.54	0.00
1564	716	72	3	3396.14	0.00
1565	716	108	1	19316.06	5.00
1566	716	299	4	11746.03	0.00
1567	716	174	2	28177.73	0.00
1568	717	182	3	8176.49	0.00
1569	718	85	4	18592.18	5.00
1570	718	210	2	31221.02	0.00
1571	718	119	3	20568.93	0.00
1572	718	322	4	13830.37	0.00
1573	718	69	1	20390.90	0.00
1574	719	317	4	29835.28	0.00
1575	720	253	1	6539.82	0.00
1576	720	282	3	26158.78	5.00
1577	720	257	1	17467.13	0.00
1578	720	17	4	1197.66	0.00
1579	721	90	4	18037.96	0.00
1580	722	138	5	29598.30	0.00
1581	722	213	2	4846.86	0.00
1582	723	289	1	15260.25	0.00
1583	723	97	3	14554.24	0.00
1584	724	127	2	14788.94	5.00
1585	724	91	1	17167.44	0.00
1586	725	71	5	5597.63	5.00
1587	725	233	4	16609.25	0.00
1588	726	196	1	29103.79	5.00
1589	727	169	5	16701.06	0.00
1590	727	220	5	18064.29	0.00
1591	727	146	5	23311.85	0.00
1592	727	12	5	14641.07	0.00
1593	728	192	1	22314.85	0.00
1594	729	254	4	15942.44	0.00
1595	729	292	5	20342.09	0.00
1596	730	56	5	27131.00	0.00
1597	730	292	4	20342.09	0.00
1598	730	64	1	6770.97	0.00
1599	731	43	3	29453.15	0.00
1600	731	307	3	20775.79	0.00
1601	731	5	3	23066.77	0.00
1602	731	19	4	7630.10	10.00
1603	731	73	4	19639.03	0.00
1604	732	85	4	18592.18	0.00
1605	733	304	4	25507.59	0.00
1606	733	310	4	390.07	0.00
1607	734	273	3	19698.88	0.00
1608	734	189	1	7295.82	0.00
1609	734	277	1	31244.88	0.00
1610	735	208	3	8508.53	5.00
1611	735	182	3	8176.49	5.00
1612	735	44	2	6287.16	5.00
1613	736	187	1	2994.33	0.00
1614	736	149	4	12786.74	0.00
1615	736	103	1	20005.99	10.00
1616	736	41	1	11834.74	10.00
1617	737	237	4	8720.64	0.00
1618	737	170	5	26345.81	10.00
1619	737	294	3	18000.72	0.00
1620	738	312	3	7030.98	5.00
1621	738	97	3	14554.24	0.00
1622	739	97	3	14554.24	5.00
1623	739	52	2	5082.07	5.00
1624	739	135	2	22949.80	0.00
1625	739	291	5	4154.47	0.00
1626	740	3	5	26253.43	0.00
1627	740	320	1	19956.45	0.00
1628	741	295	5	15122.86	0.00
1629	742	155	3	2596.48	0.00
1630	742	54	1	16118.63	0.00
1631	743	41	2	11834.74	0.00
1632	744	140	5	30696.33	0.00
1633	744	83	2	7497.50	5.00
1634	745	94	2	19130.25	5.00
1635	746	70	3	1664.51	0.00
1636	746	164	5	15959.84	5.00
1637	747	175	2	431.66	0.00
1638	748	7	3	25378.21	0.00
1639	748	149	1	12786.74	0.00
1640	748	65	3	28661.97	0.00
1641	749	293	3	8008.05	5.00
1642	749	205	2	23585.50	0.00
1643	749	271	4	35488.48	0.00
1644	750	292	1	20342.09	0.00
1645	751	85	3	18592.18	5.00
1646	751	79	4	13282.08	0.00
1647	752	82	4	32104.18	0.00
1648	752	275	1	17459.90	0.00
1649	752	21	4	28885.66	0.00
1650	752	310	1	390.07	0.00
1651	753	184	5	8109.22	0.00
1652	753	52	4	5082.07	0.00
1653	753	163	2	20880.95	0.00
1654	754	70	2	1664.51	0.00
1655	754	180	5	18260.88	0.00
1656	755	27	2	7946.20	0.00
1657	755	158	4	28494.74	10.00
1658	756	93	2	2239.83	0.00
1659	756	189	4	7295.82	0.00
1660	757	166	2	18050.91	0.00
1661	757	118	2	26976.56	10.00
1662	757	123	2	16598.57	0.00
1663	758	213	4	4846.86	5.00
1664	758	140	1	30696.33	0.00
1665	759	36	5	1735.10	0.00
1666	759	52	2	5082.07	0.00
1667	759	183	5	5758.05	5.00
1668	759	47	3	17054.16	0.00
1669	760	222	1	3056.85	0.00
1670	760	102	2	19901.11	0.00
1671	761	315	3	19913.45	0.00
1672	761	16	1	2894.98	0.00
1673	761	106	3	8994.82	5.00
1674	761	329	3	21671.36	0.00
1675	762	195	1	17434.24	0.00
1676	762	222	3	3056.85	0.00
1677	762	255	2	37063.14	0.00
1678	763	155	2	2596.48	0.00
1679	763	167	2	6664.74	0.00
1680	763	87	3	25661.61	0.00
1681	764	262	5	316.65	0.00
1682	764	165	5	10583.30	0.00
1683	764	96	3	8770.71	0.00
1684	765	225	3	27871.38	0.00
1685	765	234	2	27391.73	0.00
1686	766	312	4	7030.98	0.00
1687	767	151	3	2056.97	0.00
1688	767	4	2	8942.68	10.00
1689	767	222	1	3056.85	0.00
1690	768	158	3	28494.74	10.00
1691	769	5	3	23066.77	0.00
1692	769	232	4	10580.70	0.00
1693	770	11	3	23322.36	0.00
1694	770	98	3	3266.66	0.00
1695	771	178	2	8358.65	0.00
1696	772	204	4	7103.30	10.00
1697	772	103	2	20005.99	0.00
1698	773	38	2	11721.98	10.00
1699	774	134	3	32564.64	0.00
1700	774	161	4	30174.43	0.00
1701	775	247	4	17789.48	0.00
1702	775	313	3	8702.12	0.00
1703	776	96	5	8770.71	0.00
1704	776	198	2	26581.95	0.00
1705	777	120	2	6107.02	0.00
1706	777	106	5	8994.82	5.00
1707	777	113	5	26136.34	10.00
1708	778	232	4	10580.70	0.00
1709	778	1	4	15858.11	0.00
1710	778	88	5	24686.97	0.00
1711	779	309	3	29167.36	0.00
1712	780	181	3	7647.49	0.00
1713	780	62	1	8722.93	10.00
1714	780	158	1	28494.74	5.00
1715	780	236	5	17409.10	0.00
1716	781	77	5	20201.77	5.00
1717	781	204	2	7103.30	10.00
1718	781	15	4	5791.98	0.00
1719	781	215	4	13820.74	0.00
1720	782	6	4	17267.65	0.00
1721	782	290	3	20830.98	0.00
1722	782	195	5	17434.24	5.00
1723	783	173	4	29095.13	0.00
1724	784	281	5	30869.24	0.00
1725	785	217	1	3368.23	5.00
1726	785	292	2	20342.09	0.00
1727	785	8	4	28612.40	5.00
1728	785	98	1	3266.66	0.00
1729	786	241	2	25166.29	0.00
1730	787	72	3	3396.14	0.00
1731	787	120	3	6107.02	5.00
1732	787	271	1	35488.48	0.00
1733	788	321	2	15006.91	10.00
1734	789	79	2	13282.08	0.00
1735	790	125	2	30636.77	0.00
1736	790	191	5	13943.67	0.00
1737	790	284	3	13885.78	0.00
1738	791	124	5	10512.87	0.00
1739	791	321	4	15006.91	10.00
1740	791	318	2	32370.18	0.00
1741	792	309	5	29167.36	10.00
1742	792	81	4	5090.35	10.00
1743	792	225	5	27871.38	5.00
1744	793	4	5	8942.68	5.00
1745	794	304	4	25507.59	5.00
1746	795	209	3	14780.53	0.00
1747	795	169	3	16701.06	5.00
1748	795	54	4	16118.63	0.00
1749	796	13	4	13999.33	0.00
1750	797	271	1	35488.48	0.00
1751	798	286	5	29466.98	0.00
1752	798	326	1	13740.29	0.00
1753	798	153	4	32619.22	0.00
1754	799	303	5	19580.63	0.00
1755	800	3	5	26253.43	0.00
1756	801	112	1	18453.69	0.00
1757	801	300	5	17477.32	0.00
1758	801	62	1	8722.93	5.00
1759	801	149	4	12786.74	0.00
1760	802	100	1	8325.24	0.00
1761	803	233	3	16609.25	0.00
1762	803	144	2	18427.13	0.00
1763	803	293	5	8008.05	0.00
1764	803	174	5	28177.73	5.00
1765	803	28	1	20966.76	0.00
1766	804	136	4	9436.00	0.00
1767	804	58	4	26928.89	0.00
1768	805	210	5	31221.02	5.00
1769	805	92	1	20118.27	10.00
1770	805	140	4	30696.33	0.00
1771	805	30	2	20705.47	0.00
1772	805	267	2	13684.84	0.00
1773	806	164	2	15959.84	0.00
1774	806	248	2	5704.91	0.00
1775	806	151	3	2056.97	0.00
1776	806	40	1	14719.88	5.00
1777	806	20	2	21995.92	0.00
1778	807	274	1	9735.42	5.00
1779	807	108	2	19316.06	0.00
1780	807	270	5	29941.52	0.00
1781	807	180	1	18260.88	0.00
1782	808	143	5	21267.26	0.00
1783	808	223	4	13014.71	0.00
1784	808	211	2	12736.65	0.00
1785	809	31	1	14239.86	10.00
1786	809	52	5	5082.07	5.00
1787	809	92	3	20118.27	0.00
1788	809	310	1	390.07	0.00
1789	810	62	1	8722.93	0.00
1790	810	28	1	20966.76	0.00
1791	811	190	5	2205.28	10.00
1792	811	128	5	7835.32	0.00
1793	811	173	5	29095.13	0.00
1794	812	25	2	21791.44	0.00
1795	812	276	3	21618.85	0.00
1796	812	59	1	23956.82	0.00
1797	813	203	4	11026.49	0.00
1798	813	26	5	28783.35	0.00
1799	813	74	4	20327.04	0.00
1800	814	285	4	11004.33	0.00
1801	814	141	4	18976.68	10.00
1802	815	316	5	340.50	0.00
1803	815	102	4	19901.11	0.00
1804	816	24	1	2371.03	0.00
1805	816	179	3	1556.32	0.00
1806	817	322	2	13830.37	10.00
1807	817	285	2	11004.33	0.00
1808	817	16	1	2894.98	0.00
1809	817	95	5	873.16	0.00
1810	817	265	1	33033.81	5.00
1811	818	120	3	6107.02	5.00
1812	818	11	3	23322.36	0.00
1813	819	321	3	15006.91	0.00
1814	819	302	3	10847.55	0.00
1815	820	297	1	2879.78	5.00
1816	821	303	5	19580.63	0.00
1817	821	232	3	10580.70	0.00
1818	821	215	1	13820.74	0.00
1819	821	270	5	29941.52	0.00
1820	822	102	2	19901.11	0.00
1821	822	323	4	23922.51	5.00
1822	822	23	1	8278.99	0.00
1823	823	55	4	25249.73	0.00
1824	823	199	3	31720.32	5.00
1825	824	276	1	21618.85	10.00
1826	824	70	5	1664.51	0.00
1827	825	268	5	4330.51	0.00
1828	825	37	4	32619.07	0.00
1829	826	116	3	23884.82	5.00
1830	826	144	1	18427.13	0.00
1831	827	159	4	8802.38	0.00
1832	827	256	2	18150.18	5.00
1833	828	101	2	7061.05	0.00
1834	828	207	5	23472.26	0.00
1835	829	140	5	30696.33	0.00
1836	830	57	4	25319.11	5.00
1837	831	100	1	8325.24	5.00
1838	832	225	1	27871.38	0.00
1839	833	270	2	29941.52	5.00
1840	833	193	2	7905.39	0.00
1841	834	186	5	10556.47	0.00
1842	834	285	3	11004.33	0.00
1843	835	27	3	7946.20	0.00
1844	836	188	2	27164.75	5.00
1845	836	234	3	27391.73	0.00
1846	836	46	3	32347.10	0.00
1847	837	143	4	21267.26	0.00
1848	837	52	4	5082.07	0.00
1849	837	220	4	18064.29	5.00
1850	837	162	1	1341.67	10.00
1851	838	72	1	3396.14	0.00
1852	838	20	1	21995.92	0.00
1853	838	254	5	15942.44	5.00
1854	839	189	5	7295.82	0.00
1855	840	96	2	8770.71	0.00
1856	840	210	3	31221.02	0.00
1857	841	41	1	11834.74	5.00
1858	841	179	2	1556.32	0.00
1859	842	311	5	14989.38	0.00
1860	842	322	5	13830.37	0.00
1861	842	263	5	21676.55	0.00
1862	842	133	5	19101.95	5.00
1863	843	6	3	17267.65	0.00
1864	844	83	3	7497.50	0.00
1865	844	304	1	25507.59	0.00
1866	844	309	1	29167.36	0.00
1867	844	254	2	15942.44	0.00
1868	844	277	5	31244.88	0.00
1869	845	5	3	23066.77	0.00
1870	845	290	2	20830.98	0.00
1871	845	8	4	28612.40	0.00
1872	846	291	1	4154.47	5.00
1873	846	9	1	33482.70	5.00
1874	847	1	3	15858.11	0.00
1875	847	76	4	16330.99	0.00
1876	848	307	3	20775.79	0.00
1877	848	24	2	2371.03	0.00
1878	848	313	4	8702.12	5.00
1879	849	139	2	25656.53	0.00
1880	849	201	1	10598.73	5.00
1881	850	58	5	26928.89	0.00
1882	850	265	3	33033.81	0.00
1883	850	99	5	16911.90	0.00
1884	851	301	4	9631.41	0.00
1885	852	200	1	2196.15	0.00
1886	852	228	4	31317.59	0.00
1887	852	244	5	10146.51	0.00
1888	853	293	5	8008.05	0.00
1889	853	154	3	3570.74	5.00
1890	853	93	5	2239.83	0.00
1891	853	197	5	13698.28	0.00
1892	854	326	3	13740.29	0.00
1893	855	168	2	4961.32	5.00
1894	856	242	1	26069.06	5.00
1895	856	19	4	7630.10	0.00
1896	856	186	3	10556.47	0.00
1897	857	136	5	9436.00	0.00
1898	857	152	5	6462.82	0.00
1899	858	198	5	26581.95	5.00
1900	858	227	1	35785.16	0.00
1901	858	265	5	33033.81	0.00
1902	859	270	1	29941.52	0.00
1903	859	237	3	8720.64	5.00
1904	860	87	1	25661.61	0.00
1905	861	320	5	19956.45	5.00
1906	862	90	5	18037.96	0.00
1907	863	160	2	21111.41	0.00
1908	863	9	5	33482.70	0.00
1909	863	150	2	6436.80	5.00
1910	863	200	4	2196.15	10.00
1911	864	211	2	12736.65	0.00
1912	865	25	5	21791.44	0.00
1913	866	157	3	11935.44	5.00
1914	867	257	2	17467.13	10.00
1915	867	146	2	23311.85	5.00
1916	868	22	4	34187.79	0.00
1917	868	305	1	5777.48	0.00
1918	868	165	2	10583.30	0.00
1919	868	152	4	6462.82	0.00
1920	868	308	1	14634.32	0.00
1921	869	293	5	8008.05	0.00
1922	870	257	1	17467.13	0.00
1923	870	143	5	21267.26	0.00
1924	870	204	1	7103.30	0.00
1925	870	229	1	18071.36	0.00
1926	870	215	3	13820.74	0.00
1927	871	164	1	15959.84	10.00
1928	871	248	5	5704.91	0.00
1929	871	204	5	7103.30	0.00
1930	871	69	4	20390.90	5.00
1931	871	36	5	1735.10	10.00
1932	872	12	1	14641.07	5.00
1933	872	13	3	13999.33	0.00
1934	873	196	1	29103.79	10.00
1935	873	122	3	12832.42	5.00
1936	874	255	2	37063.14	0.00
1937	874	191	1	13943.67	0.00
1938	874	223	5	13014.71	0.00
1939	874	80	5	38259.20	0.00
1940	875	165	1	10583.30	0.00
1941	875	100	2	8325.24	0.00
1942	875	236	4	17409.10	5.00
1943	876	234	2	27391.73	0.00
1944	877	79	5	13282.08	0.00
1945	877	143	2	21267.26	0.00
1946	877	266	4	30350.30	5.00
1947	878	188	4	27164.75	0.00
1948	878	216	3	33300.54	10.00
1949	879	280	2	18825.63	5.00
1950	879	167	3	6664.74	0.00
1951	880	259	4	12682.03	0.00
1952	880	145	5	26900.06	0.00
1953	880	80	5	38259.20	5.00
1954	881	226	3	14516.18	0.00
1955	881	184	3	8109.22	0.00
1956	881	244	4	10146.51	0.00
1957	881	325	4	12556.36	5.00
1958	882	298	3	14592.86	0.00
1959	882	92	5	20118.27	0.00
1960	883	66	5	17427.59	10.00
1961	883	316	1	340.50	0.00
1962	884	267	4	13684.84	10.00
1963	885	56	1	27131.00	0.00
1964	886	202	3	32567.80	10.00
1965	886	124	1	10512.87	0.00
1966	887	245	4	20516.11	0.00
1967	887	249	4	340.08	5.00
1968	888	40	2	14719.88	0.00
1969	888	10	5	1535.56	0.00
1970	889	92	5	20118.27	10.00
1971	889	255	1	37063.14	5.00
1972	889	250	5	22128.51	0.00
1973	890	196	3	29103.79	5.00
1974	890	225	2	27871.38	10.00
1975	891	16	4	2894.98	0.00
1976	891	167	3	6664.74	0.00
1977	892	36	4	1735.10	0.00
1978	893	170	4	26345.81	5.00
1979	893	48	1	18931.60	0.00
1980	893	273	1	19698.88	0.00
1981	894	37	2	32619.07	5.00
1982	895	316	5	340.50	0.00
1983	896	25	4	21791.44	0.00
1984	896	273	4	19698.88	0.00
1985	897	328	3	22158.52	0.00
1986	898	28	4	20966.76	0.00
1987	898	53	3	1943.06	0.00
1988	899	238	1	18623.67	10.00
1989	899	19	3	7630.10	0.00
1990	900	95	2	873.16	0.00
1991	900	199	4	31720.32	10.00
1992	900	158	3	28494.74	0.00
1993	900	40	5	14719.88	0.00
1994	901	232	3	10580.70	0.00
1995	901	101	5	7061.05	0.00
1996	902	93	2	2239.83	5.00
1997	903	64	2	6770.97	0.00
1998	903	43	5	29453.15	0.00
1999	904	143	5	21267.26	0.00
2000	905	274	3	9735.42	0.00
2001	906	171	4	1914.19	0.00
2002	906	185	2	27147.39	0.00
2003	906	229	2	18071.36	0.00
2004	907	97	1	14554.24	0.00
2005	907	66	2	17427.59	0.00
2006	908	135	5	22949.80	0.00
2007	908	320	5	19956.45	0.00
2008	909	140	4	30696.33	0.00
2009	910	255	5	37063.14	10.00
2010	910	106	4	8994.82	5.00
2011	910	71	5	5597.63	0.00
2012	911	73	1	19639.03	10.00
2013	911	243	2	32934.99	0.00
2014	912	133	4	19101.95	5.00
2015	912	154	5	3570.74	0.00
2016	913	315	5	19913.45	0.00
2017	913	15	4	5791.98	10.00
2018	914	153	4	32619.22	0.00
2019	915	214	3	8996.93	0.00
2020	915	76	5	16330.99	10.00
2021	915	218	5	9097.50	0.00
2022	915	149	2	12786.74	10.00
2023	915	208	3	8508.53	5.00
2024	916	125	2	30636.77	5.00
2025	916	43	3	29453.15	5.00
2026	917	22	4	34187.79	0.00
2027	917	297	2	2879.78	0.00
2028	917	89	1	773.73	0.00
2029	918	41	2	11834.74	0.00
2030	919	38	3	11721.98	0.00
2031	920	260	5	10785.43	0.00
2032	920	182	3	8176.49	0.00
2033	920	41	1	11834.74	5.00
2034	920	108	3	19316.06	0.00
2035	920	197	2	13698.28	0.00
2036	921	276	4	21618.85	0.00
2037	922	315	1	19913.45	0.00
2038	922	28	2	20966.76	10.00
2039	923	244	3	10146.51	5.00
2040	923	124	4	10512.87	0.00
2041	924	83	4	7497.50	0.00
2042	925	273	3	19698.88	0.00
2043	926	113	2	26136.34	10.00
2044	926	40	5	14719.88	10.00
2045	926	32	3	26325.66	5.00
2046	926	107	2	359.68	0.00
2047	926	72	4	3396.14	10.00
2048	927	29	5	35509.97	0.00
2049	927	183	2	5758.05	0.00
2050	928	143	5	21267.26	10.00
2051	928	175	4	431.66	0.00
2052	929	106	1	8994.82	10.00
2053	930	41	3	11834.74	10.00
2054	930	77	5	20201.77	0.00
2055	930	183	2	5758.05	5.00
2056	931	106	1	8994.82	0.00
2057	932	57	2	25319.11	10.00
2058	933	240	4	6679.87	10.00
2059	933	11	4	23322.36	0.00
2060	933	212	5	13620.27	5.00
2061	934	96	3	8770.71	0.00
2062	934	154	4	3570.74	0.00
2063	934	130	5	21694.52	10.00
2064	935	119	1	20568.93	0.00
2065	936	213	2	4846.86	0.00
2066	936	270	1	29941.52	0.00
2067	936	250	2	22128.51	0.00
2068	937	308	4	14634.32	5.00
2069	938	144	5	18427.13	0.00
2070	938	219	5	27037.61	0.00
2071	939	7	5	25378.21	0.00
2072	940	285	2	11004.33	0.00
2073	940	177	2	1037.15	0.00
2074	940	258	4	4070.91	0.00
2075	940	244	2	10146.51	0.00
2076	941	80	4	38259.20	0.00
2077	942	4	2	8942.68	0.00
2078	943	84	1	9912.34	0.00
2079	943	265	4	33033.81	10.00
2080	943	281	3	30869.24	0.00
2081	944	194	3	18125.11	0.00
2082	944	320	5	19956.45	0.00
2083	945	323	4	23922.51	0.00
2084	945	60	3	28605.81	0.00
2085	945	289	2	15260.25	0.00
2086	946	298	3	14592.86	5.00
2087	947	40	1	14719.88	5.00
2088	948	242	2	26069.06	0.00
2089	948	3	1	26253.43	0.00
2090	948	23	2	8278.99	5.00
2091	948	21	1	28885.66	0.00
2092	948	276	2	21618.85	0.00
2093	949	26	5	28783.35	0.00
2094	949	271	3	35488.48	0.00
2095	950	229	1	18071.36	5.00
2096	951	48	3	18931.60	0.00
2097	952	135	3	22949.80	5.00
2098	952	239	5	23450.80	5.00
2099	953	250	1	22128.51	5.00
2100	953	99	4	16911.90	0.00
2101	953	291	4	4154.47	0.00
2102	954	258	4	4070.91	5.00
2103	954	187	1	2994.33	0.00
2104	955	101	2	7061.05	5.00
2105	955	63	3	26923.17	0.00
2106	955	218	3	9097.50	5.00
2107	955	11	3	23322.36	0.00
2108	956	103	1	20005.99	10.00
2109	956	65	3	28661.97	0.00
2110	956	238	3	18623.67	10.00
2111	957	219	3	27037.61	0.00
2112	957	312	3	7030.98	0.00
2113	957	132	4	11440.30	0.00
2114	958	326	4	13740.29	0.00
2115	958	131	1	32528.88	0.00
2116	959	157	1	11935.44	10.00
2117	959	5	1	23066.77	5.00
2118	959	9	1	33482.70	0.00
2119	960	228	5	31317.59	0.00
2120	960	135	1	22949.80	0.00
2121	960	98	4	3266.66	0.00
2122	960	230	2	28400.61	0.00
2123	961	167	5	6664.74	0.00
2124	962	219	2	27037.61	0.00
2125	963	108	2	19316.06	0.00
2126	964	176	3	37396.28	0.00
2127	965	189	5	7295.82	10.00
2128	965	237	4	8720.64	0.00
2129	966	26	3	28783.35	0.00
2130	966	19	1	7630.10	0.00
2131	966	10	4	1535.56	0.00
2132	967	256	5	18150.18	0.00
2133	967	312	2	7030.98	10.00
2134	967	123	5	16598.57	0.00
2135	968	29	2	35509.97	0.00
2136	969	200	1	2196.15	10.00
2137	969	116	3	23884.82	0.00
2138	970	25	4	21791.44	0.00
2139	970	10	3	1535.56	0.00
2140	970	258	1	4070.91	10.00
2141	971	261	2	22618.18	5.00
2142	972	99	1	16911.90	0.00
2143	972	252	5	19842.18	0.00
2144	973	275	3	17459.90	0.00
2145	974	324	2	35511.98	0.00
2146	974	278	3	12560.12	5.00
2147	974	45	5	6595.34	10.00
2148	975	116	2	23884.82	10.00
2149	976	166	1	18050.91	0.00
2150	976	233	4	16609.25	0.00
2151	976	24	4	2371.03	0.00
2152	977	217	3	3368.23	0.00
2153	978	151	5	2056.97	0.00
2154	979	296	2	21692.65	0.00
2155	980	80	4	38259.20	0.00
2156	981	240	4	6679.87	5.00
2157	981	161	5	30174.43	0.00
2158	982	1	1	15858.11	0.00
2159	982	223	5	13014.71	0.00
2160	983	6	4	17267.65	0.00
2161	983	313	1	8702.12	0.00
2162	983	185	5	27147.39	0.00
2163	984	45	4	6595.34	0.00
2164	984	9	4	33482.70	0.00
2165	985	122	5	12832.42	0.00
2166	985	12	2	14641.07	10.00
2167	986	102	5	19901.11	5.00
2168	986	58	2	26928.89	0.00
2169	986	135	5	22949.80	0.00
2170	987	265	1	33033.81	0.00
2171	987	207	3	23472.26	0.00
2172	988	112	3	18453.69	0.00
2173	988	129	5	6063.22	10.00
2174	989	87	5	25661.61	5.00
2175	989	89	5	773.73	0.00
2176	989	15	3	5791.98	5.00
2177	989	214	5	8996.93	5.00
2178	990	102	3	19901.11	0.00
2179	991	283	4	18689.10	0.00
2180	991	236	2	17409.10	0.00
2181	991	189	3	7295.82	0.00
2182	992	21	3	28885.66	5.00
2183	992	260	3	10785.43	10.00
2184	992	266	5	30350.30	0.00
2185	993	312	2	7030.98	0.00
2186	994	232	1	10580.70	0.00
2187	994	227	2	35785.16	0.00
2188	994	260	5	10785.43	0.00
2189	994	108	5	19316.06	0.00
2190	994	148	4	33398.34	0.00
2191	995	232	3	10580.70	0.00
2192	995	49	1	10492.89	10.00
2193	995	62	4	8722.93	5.00
2194	995	4	4	8942.68	0.00
2195	995	116	3	23884.82	0.00
2196	996	134	5	32564.64	0.00
2197	996	55	3	25249.73	0.00
2198	996	243	1	32934.99	0.00
2199	997	8	1	28612.40	0.00
2200	998	327	2	8103.13	5.00
2201	999	281	5	30869.24	0.00
2202	1000	41	5	11834.74	0.00
2203	1000	48	3	18931.60	0.00
2204	1000	127	5	14788.94	5.00
2205	1000	329	1	21671.36	0.00
2206	1001	252	3	19842.18	0.00
2207	1001	76	4	16330.99	5.00
2208	1002	166	4	18050.91	0.00
2209	1002	194	1	18125.11	0.00
2210	1002	39	5	3995.01	5.00
2211	1002	266	2	30350.30	0.00
2212	1002	159	4	8802.38	10.00
2213	1003	227	4	35785.16	5.00
2214	1003	159	5	8802.38	0.00
2215	1004	61	2	26987.99	0.00
2216	1004	309	5	29167.36	5.00
2217	1005	115	3	10525.91	0.00
2218	1005	268	5	4330.51	0.00
2219	1005	68	5	30368.50	0.00
2220	1005	193	1	7905.39	0.00
2221	1006	316	1	340.50	0.00
2222	1006	298	5	14592.86	5.00
2223	1007	235	4	23624.80	0.00
2224	1007	232	4	10580.70	0.00
2225	1007	14	3	17741.79	10.00
2226	1007	258	4	4070.91	0.00
2227	1008	227	5	35785.16	10.00
2228	1008	164	4	15959.84	0.00
2229	1009	321	1	15006.91	0.00
2230	1009	260	4	10785.43	0.00
2231	1010	211	2	12736.65	0.00
2232	1010	269	2	6147.83	5.00
2233	1010	69	2	20390.90	5.00
2234	1011	123	3	16598.57	0.00
2235	1012	48	2	18931.60	0.00
2236	1013	208	4	8508.53	0.00
2237	1013	173	2	29095.13	0.00
2238	1014	189	4	7295.82	0.00
2239	1014	134	3	32564.64	0.00
2240	1015	108	1	19316.06	0.00
2241	1015	70	5	1664.51	5.00
2242	1015	35	5	14893.01	0.00
2243	1015	128	5	7835.32	0.00
2244	1015	112	1	18453.69	10.00
2245	1016	81	4	5090.35	0.00
2246	1016	302	2	10847.55	0.00
2247	1016	178	5	8358.65	0.00
2248	1016	171	4	1914.19	5.00
2249	1016	256	1	18150.18	0.00
2250	1017	36	4	1735.10	0.00
2251	1017	308	1	14634.32	0.00
2252	1017	6	3	17267.65	0.00
2253	1018	320	5	19956.45	5.00
2254	1018	41	3	11834.74	5.00
2255	1019	327	3	8103.13	0.00
2256	1019	280	4	18825.63	0.00
2257	1020	226	2	14516.18	0.00
2258	1021	162	4	1341.67	0.00
2259	1021	300	2	17477.32	0.00
2260	1022	25	1	21791.44	0.00
2261	1022	316	2	340.50	0.00
2262	1022	129	4	6063.22	10.00
2263	1023	6	5	17267.65	0.00
2264	1024	253	1	6539.82	0.00
2265	1025	74	4	20327.04	0.00
2266	1025	52	1	5082.07	0.00
2267	1025	191	5	13943.67	0.00
2268	1026	238	1	18623.67	0.00
2269	1026	57	3	25319.11	5.00
2270	1027	307	1	20775.79	0.00
2271	1027	82	1	32104.18	10.00
2272	1028	282	1	26158.78	0.00
2273	1028	12	5	14641.07	0.00
2274	1028	77	4	20201.77	0.00
2275	1028	89	1	773.73	0.00
2276	1029	56	1	27131.00	0.00
2277	1029	325	3	12556.36	0.00
2278	1030	132	3	11440.30	0.00
2279	1030	46	1	32347.10	5.00
2280	1030	143	2	21267.26	10.00
2281	1030	209	2	14780.53	10.00
2282	1030	177	3	1037.15	0.00
2283	1031	155	5	2596.48	0.00
2284	1032	208	2	8508.53	0.00
2285	1032	100	2	8325.24	0.00
2286	1032	13	3	13999.33	0.00
2287	1033	28	3	20966.76	0.00
2288	1033	229	3	18071.36	0.00
2289	1034	1	1	15858.11	0.00
2290	1034	33	2	4281.57	0.00
2291	1034	291	4	4154.47	0.00
2292	1035	223	4	13014.71	5.00
2293	1035	315	4	19913.45	0.00
2294	1036	107	1	359.68	0.00
2295	1036	136	3	9436.00	0.00
2296	1037	142	5	32902.97	0.00
2297	1037	281	3	30869.24	0.00
2298	1037	222	1	3056.85	0.00
2299	1037	141	3	18976.68	0.00
2300	1038	39	3	3995.01	0.00
2301	1038	267	4	13684.84	10.00
2302	1039	308	4	14634.32	0.00
2303	1039	132	2	11440.30	0.00
2304	1040	26	3	28783.35	0.00
2305	1040	18	5	31259.75	0.00
2306	1041	144	2	18427.13	10.00
2307	1042	242	1	26069.06	5.00
2308	1043	295	1	15122.86	0.00
2309	1043	82	5	32104.18	0.00
2310	1044	109	5	24975.44	0.00
2311	1044	123	2	16598.57	0.00
2312	1045	201	5	10598.73	10.00
2313	1045	66	2	17427.59	5.00
2314	1045	163	4	20880.95	0.00
2315	1046	62	2	8722.93	5.00
2316	1046	57	5	25319.11	5.00
2317	1046	312	2	7030.98	0.00
2318	1047	109	4	24975.44	0.00
2319	1047	2	2	24015.17	5.00
2320	1047	14	1	17741.79	0.00
2321	1048	319	1	28695.55	0.00
2322	1048	88	5	24686.97	0.00
2323	1048	138	4	29598.30	0.00
2324	1048	187	5	2994.33	0.00
2325	1049	44	4	6287.16	0.00
2326	1049	49	2	10492.89	0.00
2327	1050	168	2	4961.32	0.00
2328	1050	290	1	20830.98	10.00
2329	1050	63	2	26923.17	0.00
2330	1050	128	2	7835.32	5.00
2331	1051	236	3	17409.10	10.00
2332	1051	71	1	5597.63	5.00
2333	1052	15	1	5791.98	0.00
2334	1052	295	4	15122.86	0.00
2335	1052	130	1	21694.52	5.00
2336	1053	85	5	18592.18	0.00
2337	1053	273	1	19698.88	0.00
2338	1054	147	4	16118.15	0.00
2339	1055	50	4	32360.23	0.00
2340	1055	205	4	23585.50	0.00
2341	1055	100	5	8325.24	0.00
2342	1056	328	4	22158.52	5.00
2343	1056	329	2	21671.36	10.00
2344	1057	72	2	3396.14	0.00
2345	1058	103	4	20005.99	0.00
2346	1058	232	1	10580.70	0.00
2347	1058	285	3	11004.33	0.00
2348	1058	110	3	21067.54	10.00
2349	1059	249	3	340.08	0.00
2350	1059	278	3	12560.12	0.00
2351	1059	144	3	18427.13	0.00
2352	1059	245	4	20516.11	0.00
2353	1060	138	1	29598.30	0.00
2354	1061	154	4	3570.74	0.00
2355	1061	18	2	31259.75	5.00
2356	1062	297	2	2879.78	0.00
2357	1063	138	5	29598.30	5.00
2358	1064	192	1	22314.85	0.00
2359	1065	164	5	15959.84	0.00
2360	1065	3	5	26253.43	0.00
2361	1066	136	2	9436.00	5.00
2362	1066	253	1	6539.82	5.00
2363	1067	15	2	5791.98	0.00
2364	1067	220	1	18064.29	0.00
2365	1067	217	4	3368.23	10.00
2366	1068	154	2	3570.74	0.00
2367	1069	64	5	6770.97	5.00
2368	1069	133	5	19101.95	10.00
2369	1070	266	3	30350.30	0.00
2370	1071	60	3	28605.81	0.00
2371	1072	122	3	12832.42	5.00
2372	1072	3	5	26253.43	0.00
2373	1073	287	1	26929.25	0.00
2374	1074	243	5	32934.99	5.00
2375	1075	264	2	3231.57	10.00
2376	1075	94	5	19130.25	5.00
2377	1076	321	1	15006.91	0.00
2378	1076	59	5	23956.82	0.00
2379	1077	326	3	13740.29	0.00
2380	1078	42	1	22822.73	5.00
2381	1078	109	4	24975.44	5.00
2382	1079	301	1	9631.41	0.00
2383	1079	298	1	14592.86	0.00
2384	1080	86	5	27867.51	0.00
2385	1080	87	2	25661.61	5.00
2386	1080	246	4	14044.38	0.00
2387	1081	263	3	21676.55	5.00
2388	1081	270	3	29941.52	10.00
2389	1081	127	2	14788.94	0.00
2390	1082	92	2	20118.27	0.00
2391	1083	240	1	6679.87	0.00
2392	1083	243	4	32934.99	5.00
2393	1084	55	3	25249.73	0.00
2394	1085	168	3	4961.32	0.00
2395	1085	76	5	16330.99	0.00
2396	1086	300	5	17477.32	0.00
2397	1086	190	3	2205.28	0.00
2398	1086	295	2	15122.86	0.00
2399	1086	83	5	7497.50	0.00
2400	1086	26	4	28783.35	10.00
2401	1087	294	5	18000.72	0.00
2402	1088	149	3	12786.74	10.00
2403	1088	296	1	21692.65	5.00
2404	1089	299	1	11746.03	0.00
2405	1090	257	4	17467.13	0.00
2406	1091	177	5	1037.15	0.00
2407	1092	11	3	23322.36	0.00
2408	1092	55	4	25249.73	0.00
2409	1092	75	5	27128.62	0.00
2410	1093	118	2	26976.56	10.00
2411	1094	227	4	35785.16	0.00
2412	1094	277	3	31244.88	10.00
2413	1094	219	2	27037.61	5.00
2414	1094	322	5	13830.37	0.00
2415	1095	318	1	32370.18	5.00
2416	1095	305	3	5777.48	0.00
2417	1095	166	4	18050.91	0.00
2418	1095	249	4	340.08	10.00
2419	1096	43	2	29453.15	0.00
2420	1096	25	2	21791.44	0.00
2421	1097	179	5	1556.32	0.00
2422	1098	241	2	25166.29	0.00
2423	1098	92	3	20118.27	5.00
2424	1099	165	5	10583.30	10.00
2425	1100	223	3	13014.71	0.00
2426	1100	216	5	33300.54	0.00
2427	1100	127	4	14788.94	0.00
2428	1100	57	3	25319.11	0.00
2429	1101	60	5	28605.81	5.00
2430	1101	58	5	26928.89	0.00
2431	1101	268	1	4330.51	0.00
2432	1101	257	4	17467.13	0.00
2433	1102	61	2	26987.99	0.00
2434	1102	244	4	10146.51	0.00
2435	1103	143	1	21267.26	0.00
2436	1103	115	4	10525.91	10.00
2437	1104	1	1	15858.11	0.00
2438	1105	60	1	28605.81	0.00
2439	1106	285	2	11004.33	0.00
2440	1106	85	3	18592.18	0.00
2441	1107	136	3	9436.00	0.00
2442	1107	292	5	20342.09	0.00
2443	1108	62	4	8722.93	0.00
2444	1108	329	3	21671.36	5.00
2445	1108	297	1	2879.78	10.00
2446	1109	178	2	8358.65	0.00
2447	1109	146	5	23311.85	10.00
2448	1110	329	2	21671.36	0.00
2449	1111	132	5	11440.30	0.00
2450	1111	274	3	9735.42	0.00
2451	1112	24	5	2371.03	5.00
2452	1113	3	4	26253.43	0.00
2453	1114	277	5	31244.88	0.00
2454	1114	48	2	18931.60	0.00
2455	1115	98	2	3266.66	0.00
2456	1115	44	4	6287.16	0.00
2457	1115	204	2	7103.30	5.00
2458	1115	241	4	25166.29	0.00
2459	1115	302	3	10847.55	0.00
2460	1116	14	3	17741.79	0.00
2461	1116	221	1	4679.42	0.00
2462	1117	30	1	20705.47	0.00
2463	1117	295	4	15122.86	0.00
2464	1118	167	5	6664.74	0.00
2465	1119	277	2	31244.88	5.00
2466	1119	196	3	29103.79	0.00
2467	1119	169	3	16701.06	0.00
2468	1120	101	1	7061.05	0.00
2469	1120	305	4	5777.48	0.00
2470	1120	97	3	14554.24	0.00
2471	1121	126	4	18009.84	10.00
2472	1121	131	1	32528.88	5.00
2473	1122	211	5	12736.65	5.00
2474	1122	265	1	33033.81	0.00
2475	1122	281	5	30869.24	5.00
2476	1123	322	5	13830.37	0.00
2477	1123	123	2	16598.57	0.00
2478	1123	91	5	17167.44	0.00
2479	1123	31	4	14239.86	0.00
2480	1123	42	2	22822.73	0.00
2481	1124	279	1	267.97	0.00
2482	1124	59	4	23956.82	0.00
2483	1124	44	1	6287.16	5.00
2484	1124	319	1	28695.55	0.00
2485	1125	258	3	4070.91	0.00
2486	1125	137	4	18272.97	0.00
2487	1126	10	2	1535.56	5.00
2488	1126	32	3	26325.66	0.00
2489	1126	131	4	32528.88	0.00
2490	1127	174	3	28177.73	0.00
2491	1128	155	5	2596.48	0.00
2492	1128	226	3	14516.18	0.00
2493	1129	131	5	32528.88	0.00
2494	1129	294	1	18000.72	10.00
2495	1130	136	1	9436.00	0.00
2496	1130	15	3	5791.98	0.00
2497	1130	301	5	9631.41	0.00
2498	1131	192	1	22314.85	0.00
2499	1131	75	2	27128.62	0.00
2500	1132	234	1	27391.73	0.00
2501	1132	112	4	18453.69	0.00
2502	1132	299	4	11746.03	0.00
2503	1133	132	1	11440.30	10.00
2504	1133	153	2	32619.22	0.00
2505	1133	94	3	19130.25	0.00
2506	1134	5	3	23066.77	5.00
2507	1134	208	1	8508.53	0.00
2508	1135	189	1	7295.82	5.00
2509	1136	120	2	6107.02	0.00
2510	1136	224	5	3586.39	0.00
2511	1137	53	2	1943.06	10.00
2512	1137	292	4	20342.09	0.00
2513	1138	213	5	4846.86	0.00
2514	1138	88	3	24686.97	0.00
2515	1138	106	4	8994.82	0.00
2516	1139	323	2	23922.51	5.00
2517	1139	230	3	28400.61	0.00
2518	1140	105	2	18324.05	5.00
2519	1141	98	3	3266.66	10.00
2520	1141	172	4	21684.08	10.00
2521	1142	43	2	29453.15	0.00
2522	1142	283	2	18689.10	0.00
2523	1142	66	1	17427.59	0.00
2524	1142	110	3	21067.54	5.00
2525	1143	23	4	8278.99	5.00
2526	1143	142	1	32902.97	5.00
2527	1143	205	1	23585.50	0.00
2528	1144	191	1	13943.67	5.00
2529	1144	113	3	26136.34	0.00
2530	1144	120	5	6107.02	0.00
2531	1145	91	2	17167.44	0.00
2532	1145	285	5	11004.33	0.00
2533	1145	236	2	17409.10	0.00
2534	1145	174	3	28177.73	0.00
2535	1146	77	5	20201.77	0.00
2536	1147	267	1	13684.84	0.00
2537	1147	240	2	6679.87	0.00
2538	1148	25	2	21791.44	10.00
2539	1149	223	5	13014.71	5.00
2540	1150	239	1	23450.80	0.00
2541	1150	2	1	24015.17	5.00
2542	1151	172	3	21684.08	10.00
2543	1151	173	1	29095.13	5.00
2544	1151	251	3	28879.67	0.00
2545	1152	280	2	18825.63	10.00
2546	1153	149	4	12786.74	0.00
2547	1153	8	1	28612.40	0.00
2548	1153	40	3	14719.88	0.00
2549	1154	176	4	37396.28	5.00
2550	1154	323	4	23922.51	10.00
2551	1154	188	4	27164.75	0.00
2552	1155	232	1	10580.70	0.00
2553	1156	70	1	1664.51	0.00
2554	1157	246	3	14044.38	0.00
2555	1157	138	5	29598.30	5.00
2556	1157	63	2	26923.17	0.00
2557	1157	324	1	35511.98	0.00
2558	1157	228	2	31317.59	0.00
2559	1158	67	4	6504.44	0.00
2560	1158	119	2	20568.93	0.00
2561	1158	231	2	6896.87	5.00
2562	1158	47	3	17054.16	10.00
2563	1158	207	5	23472.26	0.00
2564	1159	82	1	32104.18	0.00
2565	1159	34	2	34435.26	10.00
2566	1160	227	5	35785.16	10.00
2567	1160	5	5	23066.77	0.00
2568	1161	242	4	26069.06	0.00
2569	1162	325	1	12556.36	5.00
2570	1163	126	1	18009.84	0.00
2571	1164	59	1	23956.82	10.00
2572	1165	201	3	10598.73	0.00
2573	1165	19	1	7630.10	0.00
2574	1165	25	3	21791.44	5.00
2575	1166	274	1	9735.42	0.00
2576	1166	206	5	6045.35	0.00
2577	1166	178	4	8358.65	0.00
2578	1166	46	2	32347.10	0.00
2579	1167	272	2	17566.50	5.00
2580	1167	118	1	26976.56	0.00
2581	1167	294	2	18000.72	0.00
2582	1168	279	5	267.97	5.00
2583	1169	210	5	31221.02	5.00
2584	1170	183	4	5758.05	0.00
2585	1170	237	2	8720.64	0.00
2586	1170	243	5	32934.99	10.00
2587	1171	52	4	5082.07	0.00
2588	1171	132	1	11440.30	0.00
2589	1172	152	3	6462.82	0.00
2590	1172	176	5	37396.28	5.00
2591	1172	122	1	12832.42	10.00
2592	1173	261	4	22618.18	0.00
2593	1173	136	1	9436.00	0.00
2594	1174	110	3	21067.54	0.00
2595	1175	149	4	12786.74	5.00
2596	1175	143	3	21267.26	0.00
2597	1176	203	3	11026.49	0.00
2598	1176	318	3	32370.18	0.00
2599	1177	61	3	26987.99	0.00
2600	1178	301	3	9631.41	0.00
2601	1178	48	1	18931.60	0.00
2602	1179	297	1	2879.78	0.00
2603	1180	67	4	6504.44	0.00
2604	1180	226	2	14516.18	0.00
2605	1180	207	5	23472.26	0.00
2606	1180	145	3	26900.06	0.00
2607	1181	327	1	8103.13	5.00
2608	1181	76	4	16330.99	0.00
2609	1181	172	1	21684.08	5.00
2610	1181	293	4	8008.05	0.00
2611	1182	112	5	18453.69	0.00
2612	1182	31	5	14239.86	0.00
2613	1182	318	2	32370.18	0.00
2614	1182	236	5	17409.10	0.00
2615	1183	246	3	14044.38	10.00
2616	1184	289	5	15260.25	10.00
2617	1184	60	5	28605.81	10.00
2618	1184	307	5	20775.79	10.00
2619	1184	45	5	6595.34	5.00
2620	1185	108	1	19316.06	0.00
2621	1185	165	5	10583.30	0.00
2622	1186	165	1	10583.30	0.00
2623	1186	174	4	28177.73	0.00
2624	1187	45	4	6595.34	0.00
2625	1187	136	5	9436.00	0.00
2626	1188	325	1	12556.36	0.00
2627	1188	209	4	14780.53	10.00
2628	1188	83	4	7497.50	5.00
2629	1189	118	5	26976.56	5.00
2630	1190	157	1	11935.44	5.00
2631	1190	138	3	29598.30	0.00
2632	1190	186	4	10556.47	0.00
2633	1190	210	1	31221.02	0.00
2634	1190	180	3	18260.88	0.00
2635	1191	279	3	267.97	0.00
2636	1192	2	1	24015.17	0.00
2637	1193	38	5	11721.98	10.00
2638	1194	258	1	4070.91	0.00
2639	1194	153	2	32619.22	10.00
2640	1194	287	3	26929.25	5.00
2641	1195	284	5	13885.78	0.00
2642	1196	13	2	13999.33	0.00
2643	1196	290	1	20830.98	0.00
2644	1196	78	3	21716.19	5.00
2645	1197	219	4	27037.61	0.00
2646	1197	209	4	14780.53	5.00
2647	1197	304	2	25507.59	0.00
2648	1198	85	4	18592.18	5.00
2649	1199	31	1	14239.86	0.00
2650	1199	10	4	1535.56	0.00
2651	1200	151	4	2056.97	0.00
2652	1200	298	5	14592.86	0.00
2653	1201	60	2	28605.81	0.00
2654	1202	97	1	14554.24	0.00
2655	1202	27	2	7946.20	0.00
2656	1203	222	2	3056.85	0.00
2657	1203	133	4	19101.95	0.00
2658	1203	200	3	2196.15	10.00
2659	1203	220	3	18064.29	0.00
2660	1203	298	2	14592.86	0.00
2661	1204	90	2	18037.96	0.00
2662	1205	134	4	32564.64	0.00
2663	1205	170	3	26345.81	0.00
2664	1206	84	3	9912.34	0.00
2665	1206	52	2	5082.07	0.00
2666	1206	204	5	7103.30	0.00
2667	1206	283	3	18689.10	0.00
2668	1206	167	5	6664.74	5.00
2669	1207	28	2	20966.76	10.00
2670	1207	237	5	8720.64	0.00
2671	1207	82	5	32104.18	0.00
2672	1208	297	4	2879.78	5.00
2673	1208	77	5	20201.77	0.00
2674	1208	273	1	19698.88	0.00
2675	1208	325	4	12556.36	0.00
2676	1208	287	3	26929.25	10.00
2677	1209	93	3	2239.83	5.00
2678	1209	272	1	17566.50	0.00
2679	1209	177	2	1037.15	5.00
2680	1209	146	4	23311.85	0.00
2681	1210	49	4	10492.89	5.00
2682	1211	120	2	6107.02	0.00
2683	1211	228	3	31317.59	5.00
2684	1211	10	1	1535.56	0.00
2685	1211	236	3	17409.10	0.00
2686	1212	151	4	2056.97	0.00
2687	1212	3	2	26253.43	0.00
2688	1213	288	1	23034.91	0.00
2689	1213	263	3	21676.55	0.00
2690	1214	179	1	1556.32	5.00
2691	1214	306	3	12630.20	0.00
2692	1215	285	3	11004.33	0.00
2693	1215	229	3	18071.36	0.00
2694	1215	268	3	4330.51	0.00
2695	1216	4	5	8942.68	5.00
2696	1217	266	3	30350.30	5.00
2697	1217	238	1	18623.67	0.00
2698	1217	250	4	22128.51	0.00
2699	1217	296	2	21692.65	0.00
2700	1218	103	4	20005.99	0.00
2701	1219	322	4	13830.37	0.00
2702	1219	33	3	4281.57	0.00
2703	1220	245	2	20516.11	0.00
2704	1220	207	5	23472.26	0.00
2705	1221	159	1	8802.38	0.00
2706	1221	242	3	26069.06	0.00
2707	1221	329	5	21671.36	0.00
2708	1221	306	5	12630.20	0.00
2709	1222	195	4	17434.24	0.00
2710	1222	252	4	19842.18	0.00
2711	1223	144	4	18427.13	0.00
2712	1223	209	4	14780.53	0.00
2713	1223	193	4	7905.39	0.00
2714	1224	204	1	7103.30	0.00
2715	1225	49	3	10492.89	0.00
2716	1225	208	3	8508.53	10.00
2717	1225	266	2	30350.30	0.00
2718	1226	61	3	26987.99	0.00
2719	1226	221	2	4679.42	0.00
2720	1226	268	2	4330.51	0.00
2721	1226	253	2	6539.82	0.00
2722	1227	63	1	26923.17	0.00
2723	1228	286	1	29466.98	5.00
2724	1228	268	5	4330.51	0.00
2725	1228	104	1	31420.14	0.00
2726	1229	46	2	32347.10	0.00
2727	1230	233	3	16609.25	0.00
2728	1231	48	5	18931.60	0.00
2729	1231	161	5	30174.43	5.00
2730	1231	244	3	10146.51	5.00
2731	1232	257	1	17467.13	0.00
2732	1233	132	3	11440.30	5.00
2733	1234	135	1	22949.80	0.00
2734	1234	245	1	20516.11	5.00
2735	1235	93	4	2239.83	0.00
2736	1236	230	4	28400.61	0.00
2737	1236	138	2	29598.30	0.00
2738	1236	99	2	16911.90	0.00
2739	1237	32	5	26325.66	5.00
2740	1237	89	3	773.73	5.00
2741	1237	198	3	26581.95	0.00
2742	1238	321	1	15006.91	0.00
2743	1238	68	2	30368.50	0.00
2744	1239	121	1	3250.20	5.00
2745	1240	225	5	27871.38	5.00
2746	1240	14	2	17741.79	0.00
2747	1241	142	3	32902.97	5.00
2748	1241	180	1	18260.88	0.00
2749	1241	119	5	20568.93	5.00
2750	1241	299	1	11746.03	0.00
2751	1241	226	5	14516.18	5.00
2752	1242	305	1	5777.48	10.00
2753	1242	257	5	17467.13	0.00
2754	1243	79	4	13282.08	0.00
2755	1244	68	5	30368.50	10.00
2756	1244	194	3	18125.11	0.00
2757	1245	151	4	2056.97	0.00
2758	1246	234	3	27391.73	0.00
2759	1247	252	5	19842.18	0.00
2760	1248	10	2	1535.56	0.00
2761	1248	221	5	4679.42	0.00
2762	1248	11	1	23322.36	0.00
2763	1248	277	2	31244.88	0.00
2764	1249	216	4	33300.54	5.00
2765	1249	327	5	8103.13	0.00
2766	1250	161	3	30174.43	0.00
2767	1251	77	2	20201.77	0.00
2768	1251	93	5	2239.83	0.00
2769	1252	11	3	23322.36	5.00
2770	1252	105	2	18324.05	5.00
2771	1253	77	2	20201.77	0.00
2772	1253	117	3	30916.88	0.00
2773	1253	86	1	27867.51	5.00
2774	1253	254	4	15942.44	5.00
2775	1254	285	1	11004.33	0.00
2776	1254	269	5	6147.83	0.00
2777	1255	278	2	12560.12	0.00
2778	1255	86	2	27867.51	0.00
2779	1256	155	4	2596.48	0.00
2780	1256	218	5	9097.50	0.00
2781	1257	261	1	22618.18	5.00
2782	1258	76	2	16330.99	0.00
2783	1258	57	4	25319.11	10.00
2784	1259	92	3	20118.27	0.00
2785	1259	42	3	22822.73	0.00
2786	1259	134	2	32564.64	0.00
2787	1260	27	3	7946.20	10.00
2788	1261	327	3	8103.13	0.00
2789	1261	317	2	29835.28	0.00
2790	1261	253	5	6539.82	0.00
2791	1261	135	4	22949.80	0.00
2792	1262	130	5	21694.52	5.00
2793	1263	27	2	7946.20	5.00
2794	1263	269	4	6147.83	5.00
2795	1264	75	4	27128.62	0.00
2796	1264	26	5	28783.35	0.00
2797	1264	27	4	7946.20	0.00
2798	1265	196	5	29103.79	0.00
2799	1265	248	4	5704.91	10.00
2800	1265	187	3	2994.33	0.00
2801	1265	260	2	10785.43	0.00
2802	1265	183	3	5758.05	10.00
2803	1266	256	1	18150.18	0.00
2804	1266	302	5	10847.55	5.00
2805	1267	304	5	25507.59	5.00
2806	1267	150	4	6436.80	0.00
2807	1267	29	1	35509.97	10.00
2808	1267	168	2	4961.32	0.00
2809	1267	224	5	3586.39	0.00
2810	1268	23	4	8278.99	0.00
2811	1268	237	5	8720.64	0.00
2812	1268	311	5	14989.38	5.00
2813	1269	82	2	32104.18	5.00
2814	1269	135	3	22949.80	0.00
2815	1270	126	1	18009.84	0.00
2816	1270	229	1	18071.36	0.00
2817	1270	78	4	21716.19	0.00
2818	1270	28	3	20966.76	0.00
2819	1271	236	4	17409.10	0.00
2820	1271	151	1	2056.97	0.00
2821	1272	156	3	32839.76	0.00
2822	1272	153	5	32619.22	5.00
2823	1273	22	1	34187.79	5.00
2824	1273	252	4	19842.18	0.00
2825	1274	264	2	3231.57	0.00
2826	1274	27	2	7946.20	10.00
2827	1275	295	5	15122.86	0.00
2828	1275	70	3	1664.51	0.00
2829	1275	113	5	26136.34	0.00
2830	1275	1	1	15858.11	5.00
2831	1275	5	3	23066.77	5.00
2832	1276	101	5	7061.05	0.00
2833	1277	118	5	26976.56	10.00
2834	1278	98	1	3266.66	5.00
2835	1278	190	2	2205.28	0.00
2836	1278	138	2	29598.30	0.00
2837	1278	106	5	8994.82	0.00
2838	1279	139	5	25656.53	0.00
2839	1279	283	5	18689.10	0.00
2840	1279	264	3	3231.57	0.00
2841	1280	237	5	8720.64	0.00
2842	1280	117	4	30916.88	0.00
2843	1280	71	5	5597.63	0.00
2844	1280	91	5	17167.44	0.00
2845	1280	329	5	21671.36	5.00
2846	1281	296	1	21692.65	0.00
2847	1281	49	1	10492.89	0.00
2848	1282	236	4	17409.10	10.00
2849	1282	288	1	23034.91	5.00
2850	1283	199	1	31720.32	10.00
2851	1283	297	3	2879.78	0.00
2852	1284	240	5	6679.87	10.00
2853	1284	195	4	17434.24	5.00
2854	1285	140	1	30696.33	0.00
2855	1285	141	3	18976.68	0.00
2856	1285	301	1	9631.41	0.00
2857	1286	226	3	14516.18	5.00
2858	1286	90	2	18037.96	0.00
2859	1286	166	1	18050.91	10.00
2860	1287	270	3	29941.52	0.00
2861	1287	254	2	15942.44	5.00
2862	1287	70	1	1664.51	0.00
2863	1288	244	4	10146.51	0.00
2864	1288	93	3	2239.83	0.00
2865	1289	87	2	25661.61	0.00
2866	1289	250	1	22128.51	5.00
2867	1289	76	2	16330.99	0.00
2868	1290	197	2	13698.28	0.00
2869	1290	120	4	6107.02	5.00
2870	1290	278	5	12560.12	0.00
2871	1291	239	5	23450.80	0.00
2872	1291	57	3	25319.11	0.00
2873	1292	155	3	2596.48	0.00
2874	1292	202	4	32567.80	0.00
2875	1293	32	5	26325.66	0.00
2876	1293	315	5	19913.45	10.00
2877	1293	196	5	29103.79	0.00
2878	1294	149	4	12786.74	5.00
2879	1295	290	4	20830.98	0.00
2880	1295	48	2	18931.60	0.00
2881	1296	124	5	10512.87	0.00
2882	1297	279	1	267.97	0.00
2883	1297	33	4	4281.57	0.00
2884	1297	44	1	6287.16	10.00
2885	1297	7	5	25378.21	5.00
2886	1298	210	2	31221.02	0.00
2887	1299	301	5	9631.41	0.00
2888	1300	107	3	359.68	0.00
2889	1300	94	5	19130.25	0.00
2890	1300	96	2	8770.71	0.00
2891	1301	83	3	7497.50	5.00
2892	1301	244	3	10146.51	0.00
2893	1301	133	3	19101.95	5.00
2894	1302	145	4	26900.06	10.00
2895	1303	254	2	15942.44	0.00
2896	1303	308	4	14634.32	5.00
2897	1304	236	3	17409.10	0.00
2898	1304	39	4	3995.01	0.00
2899	1304	234	4	27391.73	0.00
2900	1305	134	1	32564.64	0.00
2901	1305	65	4	28661.97	0.00
2902	1306	312	2	7030.98	0.00
2903	1306	273	4	19698.88	0.00
2904	1307	163	2	20880.95	10.00
2905	1307	310	5	390.07	0.00
2906	1308	253	1	6539.82	0.00
2907	1308	289	1	15260.25	0.00
2908	1308	15	1	5791.98	10.00
2909	1308	308	4	14634.32	0.00
2910	1309	285	4	11004.33	0.00
2911	1309	58	1	26928.89	0.00
2912	1309	188	4	27164.75	0.00
2913	1310	53	2	1943.06	0.00
2914	1310	312	2	7030.98	5.00
2915	1310	103	5	20005.99	5.00
2916	1311	250	2	22128.51	5.00
2917	1312	257	3	17467.13	0.00
2918	1313	86	1	27867.51	0.00
2919	1313	182	2	8176.49	0.00
2920	1313	68	1	30368.50	0.00
2921	1313	30	5	20705.47	5.00
2922	1314	150	4	6436.80	10.00
2923	1315	215	4	13820.74	0.00
2924	1315	221	1	4679.42	0.00
2925	1316	87	5	25661.61	5.00
2926	1317	313	2	8702.12	5.00
2927	1318	42	4	22822.73	0.00
2928	1318	110	5	21067.54	10.00
2929	1319	58	3	26928.89	5.00
2930	1320	305	4	5777.48	0.00
2931	1321	52	3	5082.07	5.00
2932	1321	285	1	11004.33	0.00
2933	1322	140	5	30696.33	5.00
2934	1323	263	1	21676.55	10.00
2935	1323	173	3	29095.13	0.00
2936	1324	277	5	31244.88	5.00
2937	1324	149	3	12786.74	0.00
2938	1324	178	1	8358.65	0.00
2939	1324	325	4	12556.36	0.00
2940	1325	232	5	10580.70	0.00
2941	1326	174	4	28177.73	5.00
2942	1327	165	2	10583.30	0.00
2943	1327	25	2	21791.44	5.00
2944	1327	66	1	17427.59	0.00
2945	1328	95	3	873.16	5.00
2946	1328	244	5	10146.51	5.00
2947	1328	87	3	25661.61	0.00
2948	1328	191	2	13943.67	0.00
2949	1329	163	2	20880.95	0.00
2950	1329	280	4	18825.63	0.00
2951	1330	122	4	12832.42	0.00
2952	1330	317	4	29835.28	0.00
2953	1331	228	1	31317.59	0.00
2954	1331	164	5	15959.84	0.00
2955	1332	208	5	8508.53	10.00
2956	1332	248	1	5704.91	0.00
2957	1333	20	2	21995.92	0.00
2958	1333	236	2	17409.10	0.00
2959	1334	58	1	26928.89	0.00
2960	1334	256	1	18150.18	0.00
2961	1334	200	3	2196.15	0.00
2962	1334	141	1	18976.68	0.00
2963	1334	273	2	19698.88	0.00
2964	1335	314	1	21132.86	0.00
2965	1335	186	3	10556.47	5.00
2966	1335	196	3	29103.79	0.00
2967	1335	171	1	1914.19	10.00
2968	1336	92	2	20118.27	0.00
2969	1337	206	2	6045.35	5.00
2970	1337	18	2	31259.75	10.00
2971	1337	69	1	20390.90	0.00
2972	1338	154	4	3570.74	0.00
2973	1338	262	5	316.65	0.00
2974	1339	24	5	2371.03	0.00
2975	1339	180	1	18260.88	0.00
2976	1340	135	1	22949.80	0.00
2977	1340	118	5	26976.56	0.00
2978	1340	173	4	29095.13	0.00
2979	1341	34	3	34435.26	0.00
2980	1341	18	1	31259.75	5.00
2981	1341	278	3	12560.12	0.00
2982	1341	135	5	22949.80	10.00
2983	1342	92	4	20118.27	0.00
2984	1343	312	4	7030.98	0.00
2985	1343	310	3	390.07	0.00
2986	1344	243	5	32934.99	0.00
2987	1344	303	5	19580.63	10.00
2988	1345	219	1	27037.61	0.00
2989	1345	215	3	13820.74	0.00
2990	1345	264	5	3231.57	0.00
2991	1346	260	3	10785.43	0.00
2992	1346	284	4	13885.78	0.00
2993	1346	229	2	18071.36	0.00
2994	1347	261	3	22618.18	0.00
2995	1347	166	3	18050.91	5.00
2996	1348	237	5	8720.64	5.00
2997	1348	12	3	14641.07	5.00
2998	1348	204	5	7103.30	5.00
2999	1348	21	2	28885.66	0.00
3000	1349	213	2	4846.86	5.00
3001	1349	146	3	23311.85	0.00
3002	1349	119	1	20568.93	5.00
3003	1350	187	4	2994.33	0.00
3004	1350	77	1	20201.77	10.00
3005	1351	197	4	13698.28	0.00
3006	1351	83	5	7497.50	0.00
3007	1352	30	3	20705.47	0.00
3008	1353	301	3	9631.41	0.00
3009	1353	77	2	20201.77	5.00
3010	1353	14	4	17741.79	5.00
3011	1353	24	3	2371.03	10.00
3012	1353	286	4	29466.98	0.00
3013	1354	206	2	6045.35	0.00
3014	1354	325	3	12556.36	0.00
3015	1354	159	5	8802.38	0.00
3016	1354	289	5	15260.25	0.00
3017	1354	103	2	20005.99	0.00
3018	1355	298	2	14592.86	0.00
3019	1356	147	3	16118.15	10.00
3020	1356	262	2	316.65	0.00
3021	1357	323	4	23922.51	0.00
3022	1357	90	2	18037.96	0.00
3023	1357	5	5	23066.77	0.00
3024	1357	202	1	32567.80	0.00
3025	1358	78	5	21716.19	10.00
3026	1359	11	2	23322.36	5.00
3027	1360	205	4	23585.50	0.00
3028	1360	210	5	31221.02	5.00
3029	1360	47	4	17054.16	5.00
3030	1361	320	1	19956.45	0.00
3031	1361	298	2	14592.86	10.00
3032	1362	212	2	13620.27	5.00
3033	1362	177	5	1037.15	5.00
3034	1362	2	2	24015.17	0.00
3035	1363	79	1	13282.08	0.00
3036	1363	69	2	20390.90	0.00
3037	1363	294	4	18000.72	0.00
3038	1364	81	1	5090.35	10.00
3039	1364	247	4	17789.48	5.00
3040	1365	60	3	28605.81	0.00
3041	1365	193	2	7905.39	0.00
3042	1365	86	1	27867.51	0.00
3043	1366	243	4	32934.99	0.00
3044	1366	23	3	8278.99	0.00
3045	1366	60	1	28605.81	0.00
3046	1367	287	4	26929.25	0.00
3047	1368	166	1	18050.91	0.00
3048	1369	104	2	31420.14	0.00
3049	1369	49	3	10492.89	5.00
3050	1369	68	2	30368.50	0.00
3051	1370	89	4	773.73	0.00
3052	1370	53	1	1943.06	5.00
3053	1371	114	1	14824.91	0.00
3054	1371	232	5	10580.70	5.00
3055	1371	179	4	1556.32	0.00
3056	1371	54	5	16118.63	0.00
3057	1371	153	5	32619.22	0.00
3058	1372	313	5	8702.12	0.00
3059	1372	233	2	16609.25	5.00
3060	1372	99	3	16911.90	0.00
3061	1372	67	4	6504.44	0.00
3062	1372	228	3	31317.59	0.00
3063	1373	9	2	33482.70	0.00
3064	1373	35	5	14893.01	0.00
3065	1374	42	5	22822.73	5.00
3066	1374	135	3	22949.80	0.00
3067	1375	173	5	29095.13	0.00
3068	1376	43	3	29453.15	0.00
3069	1376	294	4	18000.72	0.00
3070	1376	199	5	31720.32	5.00
3071	1376	187	3	2994.33	0.00
3072	1377	291	3	4154.47	0.00
3073	1377	52	1	5082.07	0.00
3074	1377	134	1	32564.64	0.00
3075	1378	280	4	18825.63	0.00
3076	1379	127	4	14788.94	0.00
3077	1379	326	3	13740.29	10.00
3078	1380	51	1	24451.03	0.00
3079	1381	249	4	340.08	0.00
3080	1381	312	1	7030.98	0.00
3081	1382	146	5	23311.85	0.00
3082	1383	178	3	8358.65	5.00
3083	1384	265	2	33033.81	0.00
3084	1384	197	3	13698.28	5.00
3085	1384	73	3	19639.03	5.00
3086	1384	94	4	19130.25	0.00
3087	1385	196	2	29103.79	0.00
3088	1385	255	2	37063.14	0.00
3089	1386	211	4	12736.65	10.00
3090	1386	294	4	18000.72	0.00
3091	1386	17	5	1197.66	0.00
3092	1387	124	3	10512.87	5.00
3093	1388	97	1	14554.24	0.00
3094	1388	288	3	23034.91	0.00
3095	1388	324	1	35511.98	0.00
3096	1388	295	4	15122.86	0.00
3097	1388	171	3	1914.19	0.00
3098	1389	229	4	18071.36	5.00
3099	1389	201	2	10598.73	0.00
3100	1389	67	2	6504.44	0.00
3101	1390	158	5	28494.74	0.00
3102	1390	111	4	9004.05	5.00
3103	1391	66	3	17427.59	0.00
3104	1392	107	4	359.68	0.00
3105	1392	156	2	32839.76	5.00
3106	1392	272	2	17566.50	5.00
3107	1392	108	1	19316.06	0.00
3108	1393	132	1	11440.30	0.00
3109	1393	218	1	9097.50	5.00
3110	1393	248	3	5704.91	5.00
3111	1393	187	1	2994.33	0.00
3112	1394	32	4	26325.66	0.00
3113	1394	109	1	24975.44	5.00
3114	1394	300	1	17477.32	0.00
3115	1395	139	2	25656.53	0.00
3116	1396	23	5	8278.99	0.00
3117	1396	299	5	11746.03	0.00
3118	1397	131	4	32528.88	0.00
3119	1397	22	1	34187.79	5.00
3120	1397	297	4	2879.78	5.00
3121	1398	150	4	6436.80	0.00
3122	1398	270	5	29941.52	0.00
3123	1399	180	2	18260.88	5.00
3124	1400	268	4	4330.51	0.00
3125	1400	181	4	7647.49	5.00
3126	1401	160	4	21111.41	0.00
3127	1401	73	1	19639.03	0.00
3128	1401	298	2	14592.86	0.00
3129	1401	90	3	18037.96	0.00
3130	1402	226	5	14516.18	0.00
3131	1402	160	2	21111.41	5.00
3132	1403	218	4	9097.50	0.00
3133	1404	182	3	8176.49	0.00
3134	1404	90	4	18037.96	0.00
3135	1404	98	3	3266.66	0.00
3136	1404	261	1	22618.18	5.00
3137	1404	53	2	1943.06	0.00
3138	1405	256	5	18150.18	0.00
3139	1405	231	2	6896.87	0.00
3140	1406	126	5	18009.84	0.00
3141	1407	193	3	7905.39	0.00
3142	1407	76	2	16330.99	0.00
3143	1407	118	4	26976.56	0.00
3144	1407	35	3	14893.01	10.00
3145	1407	252	4	19842.18	0.00
3146	1408	223	3	13014.71	10.00
3147	1409	74	4	20327.04	10.00
3148	1409	233	3	16609.25	10.00
3149	1410	199	5	31720.32	10.00
3150	1410	319	3	28695.55	0.00
3151	1411	292	1	20342.09	0.00
3152	1411	251	4	28879.67	5.00
3153	1411	113	3	26136.34	10.00
3154	1411	326	1	13740.29	10.00
3155	1412	329	2	21671.36	10.00
3156	1412	160	5	21111.41	5.00
3157	1412	327	2	8103.13	0.00
3158	1413	59	1	23956.82	0.00
3159	1413	320	1	19956.45	0.00
3160	1414	178	3	8358.65	0.00
3161	1415	253	3	6539.82	5.00
3162	1416	63	5	26923.17	0.00
3163	1416	288	5	23034.91	5.00
3164	1417	45	5	6595.34	0.00
3165	1417	191	4	13943.67	0.00
3166	1417	285	5	11004.33	0.00
3167	1417	271	2	35488.48	0.00
3168	1418	41	2	11834.74	0.00
3169	1418	96	3	8770.71	5.00
3170	1418	213	2	4846.86	0.00
3171	1418	260	3	10785.43	0.00
3172	1419	192	1	22314.85	5.00
3173	1419	328	4	22158.52	0.00
3174	1420	214	2	8996.93	0.00
3175	1420	313	2	8702.12	5.00
3176	1420	6	5	17267.65	5.00
3177	1420	176	1	37396.28	0.00
3178	1420	137	3	18272.97	5.00
3179	1421	1	2	15858.11	0.00
3180	1422	54	1	16118.63	10.00
3181	1423	127	4	14788.94	0.00
3182	1423	65	2	28661.97	0.00
3183	1423	175	2	431.66	0.00
3184	1424	104	3	31420.14	0.00
3185	1425	326	3	13740.29	0.00
3186	1425	32	3	26325.66	10.00
3187	1426	42	4	22822.73	0.00
3188	1427	30	1	20705.47	5.00
3189	1427	144	5	18427.13	0.00
3190	1427	203	4	11026.49	5.00
3191	1427	108	1	19316.06	0.00
3192	1428	108	1	19316.06	0.00
3193	1428	180	3	18260.88	10.00
3194	1429	98	5	3266.66	0.00
3195	1429	56	1	27131.00	0.00
3196	1430	227	1	35785.16	10.00
3197	1431	256	3	18150.18	5.00
3198	1431	99	2	16911.90	0.00
3199	1432	11	1	23322.36	0.00
3200	1432	176	4	37396.28	0.00
3201	1432	143	4	21267.26	0.00
3202	1433	197	5	13698.28	0.00
3203	1433	67	4	6504.44	0.00
3204	1434	46	3	32347.10	5.00
3205	1435	120	1	6107.02	5.00
3206	1435	316	2	340.50	5.00
3207	1435	145	4	26900.06	5.00
3208	1435	284	3	13885.78	5.00
3209	1436	266	3	30350.30	0.00
3210	1436	142	1	32902.97	0.00
3211	1437	248	4	5704.91	0.00
3212	1438	284	1	13885.78	0.00
3213	1439	249	3	340.08	0.00
3214	1439	65	5	28661.97	0.00
3215	1440	146	3	23311.85	5.00
3216	1440	131	1	32528.88	5.00
3217	1440	139	5	25656.53	0.00
3218	1441	153	2	32619.22	0.00
3219	1441	329	1	21671.36	5.00
3220	1442	99	3	16911.90	0.00
3221	1442	8	4	28612.40	0.00
3222	1442	213	5	4846.86	0.00
3223	1442	107	3	359.68	0.00
3224	1442	142	3	32902.97	10.00
3225	1443	118	4	26976.56	10.00
3226	1444	133	4	19101.95	0.00
3227	1444	290	3	20830.98	10.00
3228	1445	317	2	29835.28	0.00
3229	1445	261	3	22618.18	5.00
3230	1446	114	2	14824.91	0.00
3231	1446	173	4	29095.13	0.00
3232	1446	14	4	17741.79	0.00
3233	1446	95	1	873.16	0.00
3234	1447	252	2	19842.18	10.00
3235	1447	57	1	25319.11	0.00
3236	1448	252	2	19842.18	5.00
3237	1448	172	2	21684.08	10.00
3238	1448	72	1	3396.14	0.00
3239	1448	84	3	9912.34	0.00
3240	1449	144	2	18427.13	10.00
3241	1450	97	2	14554.24	0.00
3242	1450	116	3	23884.82	10.00
3243	1450	280	2	18825.63	0.00
3244	1450	246	1	14044.38	5.00
3245	1450	328	2	22158.52	0.00
3246	1451	211	2	12736.65	0.00
3247	1451	123	4	16598.57	0.00
3248	1451	279	2	267.97	0.00
3249	1452	193	3	7905.39	0.00
3250	1452	319	5	28695.55	0.00
3251	1453	165	2	10583.30	5.00
3252	1453	59	3	23956.82	0.00
3253	1454	165	2	10583.30	0.00
3254	1454	127	4	14788.94	0.00
3255	1455	162	3	1341.67	5.00
3256	1455	298	2	14592.86	0.00
3257	1456	279	5	267.97	0.00
3258	1457	215	4	13820.74	0.00
3259	1458	95	5	873.16	0.00
3260	1458	263	3	21676.55	0.00
3261	1458	18	1	31259.75	0.00
3262	1459	311	4	14989.38	0.00
3263	1460	133	1	19101.95	10.00
3264	1460	294	3	18000.72	5.00
3265	1460	59	4	23956.82	0.00
3266	1461	253	4	6539.82	0.00
3267	1462	218	1	9097.50	0.00
3268	1462	248	2	5704.91	0.00
3269	1462	328	2	22158.52	0.00
3270	1462	141	3	18976.68	10.00
3271	1462	306	4	12630.20	0.00
3272	1463	114	5	14824.91	0.00
3273	1463	155	3	2596.48	0.00
3274	1464	79	1	13282.08	0.00
3275	1464	80	3	38259.20	0.00
3276	1464	110	1	21067.54	0.00
3277	1465	210	4	31221.02	0.00
3278	1465	187	3	2994.33	0.00
3279	1466	112	3	18453.69	0.00
3280	1466	118	3	26976.56	0.00
3281	1467	197	5	13698.28	0.00
3282	1467	298	3	14592.86	0.00
3283	1467	105	5	18324.05	0.00
3284	1468	305	2	5777.48	10.00
3285	1469	174	5	28177.73	10.00
3286	1469	328	1	22158.52	5.00
3287	1469	82	1	32104.18	5.00
3288	1469	314	5	21132.86	0.00
3289	1469	25	3	21791.44	5.00
3290	1470	230	5	28400.61	10.00
3291	1471	231	1	6896.87	0.00
3292	1471	103	5	20005.99	0.00
3293	1471	68	1	30368.50	0.00
3294	1472	59	5	23956.82	10.00
3295	1473	309	1	29167.36	0.00
3296	1473	256	4	18150.18	0.00
3297	1474	176	5	37396.28	0.00
3298	1474	117	3	30916.88	10.00
3299	1474	293	1	8008.05	0.00
3300	1475	296	1	21692.65	0.00
3301	1476	300	5	17477.32	0.00
3302	1476	299	1	11746.03	5.00
3303	1476	154	4	3570.74	0.00
3304	1476	309	4	29167.36	0.00
3305	1477	228	3	31317.59	0.00
3306	1478	86	3	27867.51	5.00
3307	1478	269	5	6147.83	0.00
3308	1479	112	5	18453.69	0.00
3309	1479	236	2	17409.10	0.00
3310	1479	16	3	2894.98	0.00
3311	1480	291	1	4154.47	0.00
3312	1481	299	3	11746.03	0.00
3313	1481	92	1	20118.27	5.00
3314	1482	278	5	12560.12	5.00
3315	1482	321	4	15006.91	10.00
3316	1482	184	4	8109.22	5.00
3317	1482	133	2	19101.95	0.00
3318	1482	292	3	20342.09	0.00
3319	1483	284	4	13885.78	0.00
3320	1484	138	3	29598.30	5.00
3321	1484	67	4	6504.44	0.00
3322	1484	297	2	2879.78	0.00
3323	1485	199	5	31720.32	0.00
3324	1485	139	3	25656.53	0.00
3325	1485	77	5	20201.77	0.00
3326	1486	249	5	340.08	0.00
3327	1486	204	5	7103.30	5.00
3328	1487	266	1	30350.30	10.00
3329	1487	145	1	26900.06	0.00
3330	1488	195	1	17434.24	0.00
3331	1489	105	2	18324.05	0.00
3332	1489	256	2	18150.18	0.00
3333	1489	22	4	34187.79	0.00
3334	1489	201	2	10598.73	0.00
3335	1490	266	5	30350.30	0.00
3336	1491	241	2	25166.29	5.00
3337	1491	53	5	1943.06	0.00
3338	1491	222	3	3056.85	10.00
3339	1492	23	5	8278.99	0.00
3340	1492	27	4	7946.20	0.00
3341	1493	313	5	8702.12	0.00
3342	1493	144	5	18427.13	5.00
3343	1494	208	1	8508.53	0.00
3344	1494	23	4	8278.99	0.00
3345	1495	212	4	13620.27	0.00
3346	1495	233	3	16609.25	0.00
3347	1496	317	4	29835.28	5.00
3348	1497	314	2	21132.86	0.00
3349	1497	108	1	19316.06	5.00
3350	1497	22	5	34187.79	0.00
3351	1498	12	2	14641.07	5.00
3352	1499	204	4	7103.30	5.00
3353	1499	58	3	26928.89	10.00
3354	1499	324	2	35511.98	5.00
3355	1499	191	5	13943.67	0.00
3356	1500	5	1	23066.77	0.00
3357	1500	112	5	18453.69	0.00
3358	1500	232	5	10580.70	5.00
3359	1501	146	4	23311.85	5.00
3360	1502	21	3	28885.66	0.00
3361	1502	129	4	6063.22	0.00
3362	1502	212	4	13620.27	0.00
3363	1503	108	2	19316.06	10.00
3364	1503	201	5	10598.73	0.00
3365	1504	317	2	29835.28	5.00
3366	1505	91	3	17167.44	10.00
3367	1505	108	2	19316.06	0.00
3368	1505	30	2	20705.47	0.00
3369	1506	293	1	8008.05	0.00
3370	1506	282	5	26158.78	0.00
3371	1506	96	2	8770.71	0.00
3372	1507	48	2	18931.60	0.00
3373	1508	230	2	28400.61	5.00
3374	1508	292	4	20342.09	5.00
3375	1509	4	2	8942.68	0.00
3376	1509	42	5	22822.73	5.00
3377	1510	317	1	29835.28	0.00
3378	1510	80	2	38259.20	0.00
3379	1511	165	1	10583.30	0.00
3380	1511	243	3	32934.99	0.00
3381	1511	137	4	18272.97	5.00
3382	1512	41	2	11834.74	0.00
3383	1512	42	5	22822.73	0.00
3384	1513	211	5	12736.65	0.00
3385	1513	297	2	2879.78	5.00
3386	1513	217	5	3368.23	0.00
3387	1513	160	2	21111.41	0.00
3388	1514	112	2	18453.69	5.00
3389	1514	128	4	7835.32	5.00
3390	1514	288	2	23034.91	10.00
3391	1515	154	3	3570.74	0.00
3392	1515	32	4	26325.66	0.00
3393	1516	187	4	2994.33	0.00
3394	1517	164	5	15959.84	0.00
3395	1517	275	1	17459.90	0.00
3396	1517	56	5	27131.00	0.00
3397	1518	78	2	21716.19	10.00
3398	1518	297	1	2879.78	5.00
3399	1518	95	4	873.16	5.00
3400	1519	176	5	37396.28	0.00
3401	1519	268	2	4330.51	0.00
3402	1520	20	1	21995.92	10.00
3403	1520	287	4	26929.25	0.00
3404	1520	307	2	20775.79	5.00
3405	1520	266	2	30350.30	0.00
3406	1521	255	2	37063.14	5.00
3407	1521	154	1	3570.74	0.00
3408	1521	226	3	14516.18	0.00
3409	1521	266	1	30350.30	0.00
3410	1522	158	3	28494.74	0.00
3411	1522	138	2	29598.30	0.00
3412	1523	307	3	20775.79	0.00
3413	1524	170	3	26345.81	0.00
3414	1524	282	4	26158.78	0.00
3415	1525	67	5	6504.44	0.00
3416	1526	29	5	35509.97	0.00
3417	1527	36	1	1735.10	0.00
3418	1527	306	2	12630.20	5.00
3419	1528	296	2	21692.65	10.00
3420	1528	90	1	18037.96	0.00
3421	1529	79	3	13282.08	0.00
3422	1529	155	5	2596.48	0.00
3423	1529	74	2	20327.04	0.00
3424	1530	81	3	5090.35	5.00
3425	1530	217	5	3368.23	0.00
3426	1530	287	4	26929.25	5.00
3427	1530	151	5	2056.97	0.00
3428	1531	241	4	25166.29	0.00
3429	1532	96	4	8770.71	0.00
3430	1532	289	1	15260.25	0.00
3431	1533	253	1	6539.82	0.00
3432	1533	188	1	27164.75	0.00
3433	1533	280	3	18825.63	0.00
3434	1534	270	5	29941.52	0.00
3435	1534	77	2	20201.77	0.00
3436	1534	177	3	1037.15	0.00
3437	1535	286	3	29466.98	5.00
3438	1535	83	3	7497.50	5.00
3439	1536	259	3	12682.03	0.00
3440	1536	264	4	3231.57	10.00
3441	1536	14	3	17741.79	0.00
3442	1536	22	5	34187.79	0.00
3443	1537	260	3	10785.43	0.00
3444	1537	154	1	3570.74	0.00
3445	1537	301	1	9631.41	10.00
3446	1538	26	3	28783.35	0.00
3447	1539	269	5	6147.83	5.00
3448	1539	226	3	14516.18	10.00
3449	1539	287	4	26929.25	0.00
3450	1540	268	3	4330.51	0.00
3451	1541	99	3	16911.90	0.00
3452	1542	90	1	18037.96	0.00
3453	1543	245	1	20516.11	0.00
3454	1543	8	2	28612.40	0.00
3455	1544	170	1	26345.81	0.00
3456	1545	43	4	29453.15	5.00
3457	1545	190	5	2205.28	10.00
3458	1546	272	4	17566.50	5.00
3459	1546	104	3	31420.14	0.00
3460	1546	86	1	27867.51	0.00
3461	1546	260	3	10785.43	5.00
3462	1547	156	5	32839.76	10.00
3463	1548	258	3	4070.91	5.00
3464	1548	294	3	18000.72	0.00
3465	1548	78	3	21716.19	0.00
3466	1549	120	2	6107.02	0.00
3467	1549	101	1	7061.05	0.00
3468	1550	174	1	28177.73	0.00
3469	1550	281	5	30869.24	10.00
3470	1550	42	2	22822.73	0.00
3471	1550	257	4	17467.13	0.00
3472	1551	275	1	17459.90	5.00
3473	1552	306	5	12630.20	0.00
3474	1552	142	5	32902.97	0.00
3475	1553	123	2	16598.57	0.00
3476	1553	227	2	35785.16	5.00
3477	1553	101	5	7061.05	5.00
3478	1554	196	4	29103.79	5.00
3479	1554	181	3	7647.49	5.00
3480	1554	173	1	29095.13	5.00
3481	1555	5	3	23066.77	0.00
3482	1555	327	3	8103.13	5.00
3483	1555	273	5	19698.88	5.00
3484	1555	10	2	1535.56	0.00
3485	1556	109	3	24975.44	0.00
3486	1556	95	1	873.16	0.00
3487	1557	305	4	5777.48	0.00
3488	1557	51	2	24451.03	0.00
3489	1557	131	3	32528.88	0.00
3490	1558	260	3	10785.43	0.00
3491	1558	116	4	23884.82	5.00
3492	1559	216	1	33300.54	5.00
3493	1559	324	5	35511.98	5.00
3494	1559	31	2	14239.86	5.00
3495	1560	226	5	14516.18	0.00
3496	1560	124	2	10512.87	0.00
3497	1560	159	3	8802.38	0.00
3498	1560	311	2	14989.38	5.00
3499	1561	165	4	10583.30	10.00
3500	1561	104	2	31420.14	5.00
3501	1561	53	5	1943.06	0.00
3502	1562	82	1	32104.18	0.00
3503	1562	131	3	32528.88	0.00
3504	1562	12	4	14641.07	5.00
3505	1563	277	5	31244.88	0.00
3506	1563	43	1	29453.15	0.00
3507	1564	288	4	23034.91	10.00
3508	1565	272	5	17566.50	0.00
3509	1566	250	3	22128.51	0.00
3510	1566	265	5	33033.81	10.00
3511	1566	134	1	32564.64	5.00
3512	1566	70	2	1664.51	5.00
3513	1566	118	3	26976.56	0.00
3514	1567	300	5	17477.32	5.00
3515	1567	72	3	3396.14	0.00
3516	1568	143	4	21267.26	0.00
3517	1568	147	2	16118.15	0.00
3518	1568	252	5	19842.18	0.00
3519	1569	102	1	19901.11	0.00
3520	1569	317	1	29835.28	5.00
3521	1569	78	3	21716.19	5.00
3522	1570	129	2	6063.22	5.00
3523	1570	182	2	8176.49	0.00
3524	1571	320	3	19956.45	0.00
3525	1572	291	5	4154.47	5.00
3526	1572	288	4	23034.91	0.00
3527	1573	113	2	26136.34	0.00
3528	1574	106	1	8994.82	0.00
3529	1574	58	1	26928.89	0.00
3530	1574	135	1	22949.80	0.00
3531	1574	323	1	23922.51	5.00
3532	1575	114	1	14824.91	0.00
3533	1575	311	3	14989.38	0.00
3534	1575	47	3	17054.16	0.00
3535	1576	276	2	21618.85	0.00
3536	1576	224	4	3586.39	10.00
3537	1577	157	3	11935.44	0.00
3538	1578	110	3	21067.54	10.00
3539	1579	325	1	12556.36	5.00
3540	1579	246	2	14044.38	5.00
3541	1579	173	5	29095.13	0.00
3542	1579	182	5	8176.49	0.00
3543	1580	42	5	22822.73	5.00
3544	1580	120	5	6107.02	0.00
3545	1580	235	1	23624.80	0.00
3546	1580	44	2	6287.16	10.00
3547	1581	195	2	17434.24	0.00
3548	1582	274	3	9735.42	0.00
3549	1583	213	5	4846.86	0.00
3550	1583	110	1	21067.54	0.00
3551	1584	103	2	20005.99	0.00
3552	1584	269	3	6147.83	0.00
3553	1584	115	2	10525.91	5.00
3554	1584	80	2	38259.20	0.00
3555	1585	15	3	5791.98	0.00
3556	1585	82	3	32104.18	0.00
3557	1585	195	3	17434.24	0.00
3558	1586	85	1	18592.18	0.00
3559	1586	121	5	3250.20	0.00
3560	1586	127	3	14788.94	5.00
3561	1586	62	1	8722.93	5.00
3562	1587	48	5	18931.60	0.00
3563	1587	130	2	21694.52	0.00
3564	1587	121	4	3250.20	0.00
3565	1588	297	5	2879.78	0.00
3566	1588	24	3	2371.03	0.00
3567	1588	301	1	9631.41	0.00
3568	1589	329	3	21671.36	5.00
3569	1589	34	4	34435.26	0.00
3570	1589	104	1	31420.14	5.00
3571	1589	74	4	20327.04	0.00
3572	1590	134	4	32564.64	0.00
3573	1591	242	3	26069.06	0.00
3574	1591	31	4	14239.86	0.00
3575	1591	87	5	25661.61	0.00
3576	1592	181	4	7647.49	10.00
3577	1593	286	3	29466.98	0.00
3578	1593	29	2	35509.97	5.00
3579	1593	231	2	6896.87	0.00
3580	1594	185	5	27147.39	0.00
3581	1594	70	1	1664.51	0.00
3582	1595	1	5	15858.11	5.00
3583	1596	230	3	28400.61	0.00
3584	1596	143	3	21267.26	5.00
3585	1596	163	5	20880.95	0.00
3586	1596	232	5	10580.70	0.00
3587	1597	250	2	22128.51	10.00
3588	1597	220	4	18064.29	5.00
3589	1598	213	3	4846.86	5.00
3590	1598	148	2	33398.34	0.00
3591	1598	104	2	31420.14	0.00
3592	1599	28	1	20966.76	0.00
3593	1599	256	1	18150.18	0.00
3594	1600	106	3	8994.82	0.00
3595	1600	11	5	23322.36	10.00
3596	1601	77	1	20201.77	0.00
3597	1601	123	4	16598.57	0.00
3598	1602	255	4	37063.14	0.00
3599	1602	145	3	26900.06	0.00
3600	1603	252	3	19842.18	10.00
3601	1603	117	1	30916.88	0.00
3602	1604	153	2	32619.22	10.00
3603	1604	24	5	2371.03	0.00
3604	1605	2	5	24015.17	0.00
3605	1605	317	5	29835.28	0.00
3606	1605	109	4	24975.44	0.00
3607	1606	307	2	20775.79	0.00
3608	1606	101	3	7061.05	5.00
3609	1606	187	2	2994.33	5.00
3610	1607	150	2	6436.80	5.00
3611	1607	77	4	20201.77	5.00
3612	1607	214	5	8996.93	0.00
3613	1608	81	1	5090.35	0.00
3614	1608	210	4	31221.02	0.00
3615	1608	245	1	20516.11	0.00
3616	1609	96	1	8770.71	5.00
3617	1609	73	4	19639.03	0.00
3618	1610	179	3	1556.32	0.00
3619	1610	302	4	10847.55	5.00
3620	1610	142	1	32902.97	5.00
3621	1610	35	3	14893.01	0.00
3622	1611	227	4	35785.16	0.00
3623	1612	307	4	20775.79	0.00
3624	1612	52	3	5082.07	0.00
3625	1612	223	4	13014.71	0.00
3626	1612	71	1	5597.63	5.00
3627	1613	20	4	21995.92	0.00
3628	1614	89	5	773.73	0.00
3629	1614	107	1	359.68	0.00
3630	1614	111	4	9004.05	5.00
3631	1614	328	3	22158.52	5.00
3632	1615	95	1	873.16	0.00
3633	1616	284	4	13885.78	0.00
3634	1616	53	5	1943.06	0.00
3635	1616	197	4	13698.28	0.00
3636	1616	73	1	19639.03	10.00
3637	1617	327	4	8103.13	0.00
3638	1617	320	3	19956.45	5.00
3639	1618	176	1	37396.28	0.00
3640	1618	2	4	24015.17	0.00
3641	1619	304	2	25507.59	0.00
3642	1620	205	2	23585.50	10.00
3643	1620	51	5	24451.03	10.00
3644	1620	199	5	31720.32	0.00
3645	1620	211	2	12736.65	0.00
3646	1621	197	4	13698.28	5.00
3647	1621	119	4	20568.93	0.00
3648	1622	320	4	19956.45	0.00
3649	1622	193	3	7905.39	0.00
3650	1623	6	1	17267.65	5.00
3651	1624	189	3	7295.82	0.00
3652	1624	6	5	17267.65	0.00
3653	1625	262	5	316.65	0.00
3654	1625	119	1	20568.93	0.00
3655	1625	257	2	17467.13	5.00
3656	1626	3	4	26253.43	0.00
3657	1626	329	4	21671.36	0.00
3658	1627	298	5	14592.86	0.00
3659	1627	258	1	4070.91	10.00
3660	1628	213	1	4846.86	0.00
3661	1629	88	5	24686.97	0.00
3662	1630	288	1	23034.91	0.00
3663	1631	92	4	20118.27	0.00
3664	1631	155	4	2596.48	0.00
3665	1631	151	4	2056.97	0.00
3666	1631	199	3	31720.32	0.00
3667	1632	94	3	19130.25	10.00
3668	1632	207	1	23472.26	0.00
3669	1633	272	2	17566.50	0.00
3670	1634	102	3	19901.11	0.00
3671	1634	268	5	4330.51	5.00
3672	1635	203	5	11026.49	0.00
3673	1636	131	5	32528.88	0.00
3674	1636	295	4	15122.86	10.00
3675	1637	228	2	31317.59	5.00
3676	1638	135	4	22949.80	0.00
3677	1638	29	3	35509.97	0.00
3678	1639	318	2	32370.18	0.00
3679	1640	199	5	31720.32	10.00
3680	1640	168	4	4961.32	5.00
3681	1640	73	3	19639.03	10.00
3682	1641	310	1	390.07	5.00
3683	1642	23	2	8278.99	5.00
3684	1642	251	1	28879.67	5.00
3685	1643	41	4	11834.74	0.00
3686	1644	197	1	13698.28	0.00
3687	1644	24	1	2371.03	0.00
3688	1645	221	5	4679.42	0.00
3689	1645	158	2	28494.74	0.00
3690	1645	67	2	6504.44	0.00
3691	1645	112	5	18453.69	0.00
3692	1646	134	3	32564.64	0.00
3693	1647	325	1	12556.36	0.00
3694	1647	321	1	15006.91	0.00
3695	1648	14	5	17741.79	0.00
3696	1649	97	5	14554.24	5.00
3697	1650	179	3	1556.32	0.00
3698	1650	82	1	32104.18	0.00
3699	1651	213	5	4846.86	0.00
3700	1651	315	3	19913.45	5.00
3701	1652	14	2	17741.79	0.00
3702	1652	307	5	20775.79	5.00
3703	1652	91	3	17167.44	0.00
3704	1652	209	4	14780.53	0.00
3705	1653	99	4	16911.90	0.00
3706	1653	51	2	24451.03	5.00
3707	1653	147	5	16118.15	0.00
3708	1653	101	3	7061.05	10.00
3709	1653	6	5	17267.65	0.00
3710	1654	308	1	14634.32	0.00
3711	1654	299	5	11746.03	5.00
3712	1655	283	2	18689.10	0.00
3713	1655	290	4	20830.98	0.00
3714	1656	297	1	2879.78	0.00
3715	1657	115	4	10525.91	0.00
3716	1657	217	5	3368.23	0.00
3717	1657	130	4	21694.52	5.00
3718	1658	240	1	6679.87	0.00
3719	1658	264	1	3231.57	0.00
3720	1658	161	4	30174.43	5.00
3721	1658	276	4	21618.85	0.00
3722	1659	98	5	3266.66	5.00
3723	1660	260	3	10785.43	0.00
3724	1660	320	3	19956.45	10.00
3725	1661	296	5	21692.65	5.00
3726	1661	232	4	10580.70	5.00
3727	1661	329	4	21671.36	0.00
3728	1661	28	5	20966.76	0.00
3729	1661	118	1	26976.56	0.00
3730	1662	100	2	8325.24	0.00
3731	1663	214	3	8996.93	0.00
3732	1663	313	1	8702.12	5.00
3733	1663	160	2	21111.41	10.00
3734	1663	326	2	13740.29	10.00
3735	1664	283	4	18689.10	0.00
3736	1665	98	3	3266.66	0.00
3737	1665	115	5	10525.91	0.00
3738	1666	86	1	27867.51	0.00
3739	1667	145	4	26900.06	0.00
3740	1668	250	1	22128.51	5.00
3741	1668	113	3	26136.34	0.00
3742	1668	87	4	25661.61	0.00
3743	1668	163	2	20880.95	5.00
3744	1669	116	2	23884.82	0.00
3745	1670	294	3	18000.72	10.00
3746	1670	79	4	13282.08	10.00
3747	1671	25	3	21791.44	0.00
3748	1671	117	2	30916.88	5.00
3749	1672	171	4	1914.19	0.00
3750	1673	230	2	28400.61	0.00
3751	1674	201	5	10598.73	5.00
3752	1675	169	1	16701.06	0.00
3753	1675	135	2	22949.80	0.00
3754	1676	3	1	26253.43	10.00
3755	1676	53	5	1943.06	10.00
3756	1676	164	5	15959.84	0.00
3757	1677	104	5	31420.14	0.00
3758	1677	23	1	8278.99	5.00
3759	1678	238	1	18623.67	0.00
3760	1679	22	5	34187.79	0.00
3761	1679	111	1	9004.05	0.00
3762	1680	100	4	8325.24	0.00
3763	1680	18	4	31259.75	0.00
3764	1681	64	2	6770.97	0.00
3765	1682	315	5	19913.45	5.00
3766	1682	227	3	35785.16	0.00
3767	1682	75	4	27128.62	0.00
3768	1683	195	1	17434.24	0.00
3769	1684	263	4	21676.55	0.00
3770	1685	152	4	6462.82	5.00
3771	1685	274	3	9735.42	5.00
3772	1685	226	1	14516.18	0.00
3773	1686	210	3	31221.02	5.00
3774	1686	311	2	14989.38	5.00
3775	1686	179	1	1556.32	0.00
3776	1687	170	4	26345.81	5.00
3777	1687	109	3	24975.44	0.00
3778	1687	41	4	11834.74	0.00
3779	1688	173	4	29095.13	5.00
3780	1688	315	2	19913.45	0.00
3781	1689	67	5	6504.44	0.00
3782	1690	267	1	13684.84	0.00
3783	1690	35	2	14893.01	0.00
3784	1691	321	4	15006.91	0.00
3785	1691	93	3	2239.83	0.00
3786	1691	130	3	21694.52	0.00
3787	1692	257	3	17467.13	0.00
3788	1692	166	5	18050.91	5.00
3789	1693	324	4	35511.98	0.00
3790	1693	23	3	8278.99	0.00
3791	1694	244	5	10146.51	10.00
3792	1694	264	5	3231.57	0.00
3793	1694	271	5	35488.48	0.00
3794	1695	156	1	32839.76	0.00
3795	1695	144	2	18427.13	5.00
3796	1696	18	3	31259.75	0.00
3797	1696	293	1	8008.05	0.00
3798	1697	54	5	16118.63	0.00
3799	1697	290	1	20830.98	0.00
3800	1698	255	4	37063.14	0.00
3801	1699	258	1	4070.91	0.00
3802	1700	297	2	2879.78	0.00
3803	1701	239	5	23450.80	0.00
3804	1701	230	2	28400.61	0.00
3805	1701	32	5	26325.66	0.00
3806	1701	177	2	1037.15	10.00
3807	1701	73	4	19639.03	0.00
3808	1702	115	2	10525.91	0.00
3809	1703	72	5	3396.14	5.00
3810	1703	184	1	8109.22	0.00
3811	1703	267	1	13684.84	0.00
3812	1703	288	4	23034.91	0.00
3813	1704	66	1	17427.59	0.00
3814	1705	167	3	6664.74	0.00
3815	1705	155	5	2596.48	5.00
3816	1705	140	1	30696.33	0.00
3817	1706	209	1	14780.53	0.00
3818	1707	200	1	2196.15	0.00
3819	1707	274	2	9735.42	5.00
3820	1707	48	4	18931.60	0.00
3821	1708	251	5	28879.67	0.00
3822	1708	119	3	20568.93	10.00
3823	1708	8	3	28612.40	0.00
3824	1709	6	4	17267.65	0.00
3825	1709	229	3	18071.36	0.00
3826	1709	98	2	3266.66	10.00
3827	1710	5	1	23066.77	0.00
3828	1710	146	1	23311.85	0.00
3829	1710	156	3	32839.76	10.00
3830	1711	328	1	22158.52	0.00
3831	1711	106	3	8994.82	5.00
3832	1711	159	1	8802.38	0.00
3833	1711	103	1	20005.99	0.00
3834	1711	205	1	23585.50	10.00
3835	1712	223	4	13014.71	0.00
3836	1712	275	4	17459.90	0.00
3837	1713	313	5	8702.12	5.00
3838	1714	124	2	10512.87	5.00
3839	1715	292	3	20342.09	0.00
3840	1716	260	3	10785.43	0.00
3841	1717	297	4	2879.78	10.00
3842	1717	306	1	12630.20	0.00
3843	1717	1	3	15858.11	0.00
3844	1717	269	5	6147.83	0.00
3845	1718	322	2	13830.37	0.00
3846	1718	84	4	9912.34	0.00
3847	1718	244	2	10146.51	0.00
3848	1718	117	4	30916.88	0.00
3849	1718	319	3	28695.55	5.00
3850	1719	265	2	33033.81	0.00
3851	1719	90	3	18037.96	0.00
3852	1720	293	3	8008.05	10.00
3853	1720	222	4	3056.85	0.00
3854	1721	77	4	20201.77	0.00
3855	1721	128	5	7835.32	5.00
3856	1722	85	1	18592.18	0.00
3857	1723	3	4	26253.43	0.00
3858	1724	315	4	19913.45	0.00
3859	1724	148	4	33398.34	0.00
3860	1725	230	3	28400.61	5.00
3861	1725	130	4	21694.52	0.00
3862	1725	190	5	2205.28	0.00
3863	1725	14	1	17741.79	10.00
3864	1726	299	2	11746.03	0.00
3865	1726	49	5	10492.89	0.00
3866	1726	103	1	20005.99	0.00
3867	1726	142	3	32902.97	0.00
3868	1727	164	4	15959.84	0.00
3869	1728	139	4	25656.53	0.00
3870	1728	244	3	10146.51	0.00
3871	1729	56	3	27131.00	0.00
3872	1730	162	4	1341.67	0.00
3873	1730	193	4	7905.39	0.00
3874	1730	80	4	38259.20	0.00
3875	1731	14	4	17741.79	0.00
3876	1732	202	1	32567.80	10.00
3877	1732	199	3	31720.32	5.00
3878	1733	112	5	18453.69	5.00
3879	1734	108	4	19316.06	0.00
3880	1734	237	5	8720.64	5.00
3881	1734	146	4	23311.85	0.00
3882	1735	95	2	873.16	5.00
3883	1735	157	2	11935.44	0.00
3884	1736	37	5	32619.07	0.00
3885	1736	91	4	17167.44	5.00
3886	1737	55	1	25249.73	0.00
3887	1737	69	5	20390.90	0.00
3888	1737	259	5	12682.03	0.00
3889	1737	75	5	27128.62	0.00
3890	1737	219	3	27037.61	0.00
3891	1738	259	3	12682.03	0.00
3892	1738	38	1	11721.98	0.00
3893	1738	299	5	11746.03	0.00
3894	1739	178	1	8358.65	0.00
3895	1739	206	1	6045.35	0.00
3896	1739	47	4	17054.16	5.00
3897	1740	166	5	18050.91	10.00
3898	1741	137	1	18272.97	0.00
3899	1741	267	2	13684.84	0.00
3900	1742	199	3	31720.32	10.00
3901	1743	323	4	23922.51	5.00
3902	1743	275	1	17459.90	10.00
3903	1744	135	1	22949.80	0.00
3904	1745	14	4	17741.79	0.00
3905	1746	154	1	3570.74	0.00
3906	1746	238	5	18623.67	0.00
3907	1746	248	2	5704.91	10.00
3908	1746	4	2	8942.68	0.00
3909	1747	65	4	28661.97	10.00
3910	1748	125	1	30636.77	0.00
3911	1748	287	4	26929.25	0.00
3912	1749	199	2	31720.32	0.00
3913	1749	71	2	5597.63	0.00
3914	1750	84	3	9912.34	0.00
3915	1750	302	5	10847.55	5.00
3916	1750	10	2	1535.56	5.00
3917	1750	160	3	21111.41	5.00
3918	1751	71	1	5597.63	0.00
3919	1751	149	3	12786.74	5.00
3920	1751	25	1	21791.44	5.00
3921	1751	174	4	28177.73	5.00
3922	1752	285	5	11004.33	0.00
3923	1753	81	3	5090.35	0.00
3924	1753	329	5	21671.36	0.00
3925	1754	321	3	15006.91	5.00
3926	1754	262	1	316.65	0.00
3927	1754	127	1	14788.94	0.00
3928	1754	84	4	9912.34	0.00
3929	1754	80	1	38259.20	0.00
3930	1755	94	1	19130.25	0.00
3931	1755	269	5	6147.83	0.00
3932	1756	223	5	13014.71	0.00
3933	1756	302	3	10847.55	10.00
3934	1756	49	5	10492.89	0.00
3935	1756	247	4	17789.48	5.00
3936	1757	36	5	1735.10	0.00
3937	1757	162	4	1341.67	0.00
3938	1757	124	3	10512.87	0.00
3939	1758	239	3	23450.80	0.00
3940	1759	73	4	19639.03	10.00
3941	1760	138	4	29598.30	0.00
3942	1760	175	1	431.66	0.00
3943	1761	180	5	18260.88	0.00
3944	1761	205	4	23585.50	10.00
3945	1762	197	1	13698.28	0.00
3946	1762	158	5	28494.74	0.00
3947	1763	15	4	5791.98	10.00
3948	1763	39	2	3995.01	0.00
3949	1764	50	4	32360.23	0.00
3950	1764	146	4	23311.85	0.00
3951	1765	15	4	5791.98	0.00
3952	1765	77	2	20201.77	10.00
3953	1766	104	5	31420.14	0.00
3954	1766	7	5	25378.21	0.00
3955	1766	58	3	26928.89	5.00
3956	1766	301	2	9631.41	0.00
3957	1767	191	4	13943.67	0.00
3958	1768	280	3	18825.63	0.00
3959	1768	275	5	17459.90	0.00
3960	1769	156	2	32839.76	0.00
3961	1770	201	5	10598.73	0.00
3962	1771	192	3	22314.85	10.00
3963	1771	239	4	23450.80	0.00
3964	1771	295	1	15122.86	0.00
3965	1772	232	5	10580.70	10.00
3966	1772	296	2	21692.65	0.00
3967	1773	218	2	9097.50	0.00
3968	1773	43	2	29453.15	10.00
3969	1774	83	4	7497.50	0.00
3970	1774	247	1	17789.48	0.00
3971	1775	318	5	32370.18	0.00
3972	1775	146	5	23311.85	0.00
3973	1776	197	5	13698.28	10.00
3974	1776	188	3	27164.75	10.00
3975	1777	274	4	9735.42	0.00
3976	1777	42	2	22822.73	0.00
3977	1778	56	5	27131.00	10.00
3978	1778	325	5	12556.36	0.00
3979	1779	177	1	1037.15	5.00
3980	1779	59	3	23956.82	0.00
3981	1780	145	3	26900.06	0.00
3982	1781	61	1	26987.99	0.00
3983	1782	94	5	19130.25	10.00
3984	1782	222	4	3056.85	0.00
3985	1782	315	4	19913.45	5.00
3986	1782	213	5	4846.86	0.00
3987	1783	123	2	16598.57	0.00
3988	1783	110	2	21067.54	10.00
3989	1783	90	2	18037.96	0.00
3990	1784	265	3	33033.81	0.00
3991	1784	90	5	18037.96	0.00
3992	1785	65	1	28661.97	0.00
3993	1786	315	2	19913.45	0.00
3994	1786	230	1	28400.61	10.00
3995	1787	300	1	17477.32	0.00
3996	1787	45	5	6595.34	5.00
3997	1787	327	5	8103.13	0.00
3998	1787	155	5	2596.48	5.00
3999	1787	240	3	6679.87	0.00
4000	1788	196	3	29103.79	0.00
4001	1789	56	1	27131.00	0.00
4002	1789	180	4	18260.88	0.00
4003	1790	170	2	26345.81	0.00
4004	1791	192	4	22314.85	0.00
4005	1792	205	3	23585.50	0.00
4006	1792	274	2	9735.42	0.00
4007	1793	27	1	7946.20	5.00
4008	1794	178	3	8358.65	0.00
4009	1794	320	3	19956.45	0.00
4010	1794	245	1	20516.11	0.00
4011	1794	232	1	10580.70	0.00
4012	1795	74	1	20327.04	5.00
4013	1796	282	1	26158.78	0.00
4014	1796	240	4	6679.87	0.00
4015	1796	89	4	773.73	0.00
4016	1796	35	1	14893.01	10.00
4017	1796	256	5	18150.18	0.00
4018	1797	199	1	31720.32	0.00
4019	1797	73	4	19639.03	0.00
4020	1798	21	3	28885.66	0.00
4021	1799	116	3	23884.82	0.00
4022	1799	204	5	7103.30	0.00
4023	1800	324	4	35511.98	0.00
4024	1800	50	1	32360.23	5.00
4025	1800	209	4	14780.53	5.00
4026	1801	86	5	27867.51	0.00
4027	1801	79	1	13282.08	0.00
4028	1801	20	2	21995.92	0.00
4029	1802	187	2	2994.33	0.00
4030	1802	13	3	13999.33	0.00
4031	1802	293	2	8008.05	5.00
4032	1802	196	5	29103.79	0.00
4033	1803	204	2	7103.30	0.00
4034	1803	4	4	8942.68	0.00
4035	1803	286	4	29466.98	0.00
4036	1804	107	4	359.68	5.00
4037	1804	160	4	21111.41	0.00
4038	1804	146	4	23311.85	0.00
4039	1804	58	5	26928.89	0.00
4040	1805	88	2	24686.97	0.00
4041	1806	192	1	22314.85	0.00
4042	1807	301	1	9631.41	0.00
4043	1807	248	2	5704.91	0.00
4044	1807	197	1	13698.28	0.00
4045	1808	258	2	4070.91	0.00
4046	1808	3	4	26253.43	0.00
4047	1808	285	3	11004.33	0.00
4048	1808	236	1	17409.10	0.00
4049	1809	275	5	17459.90	0.00
4050	1809	110	3	21067.54	0.00
4051	1809	32	1	26325.66	0.00
4052	1810	96	1	8770.71	0.00
4053	1810	308	1	14634.32	0.00
4054	1810	43	5	29453.15	0.00
4055	1810	125	1	30636.77	5.00
4056	1811	117	1	30916.88	0.00
4057	1812	202	4	32567.80	0.00
4058	1812	180	2	18260.88	0.00
4059	1813	262	4	316.65	10.00
4060	1814	128	1	7835.32	0.00
4061	1814	265	5	33033.81	0.00
4062	1814	160	5	21111.41	10.00
4063	1815	96	2	8770.71	0.00
4064	1815	82	2	32104.18	0.00
4065	1816	135	1	22949.80	5.00
4066	1817	44	5	6287.16	0.00
4067	1817	177	2	1037.15	0.00
4068	1818	252	4	19842.18	0.00
4069	1818	198	2	26581.95	5.00
4070	1818	143	5	21267.26	0.00
4071	1818	277	3	31244.88	0.00
4072	1819	113	2	26136.34	5.00
4073	1820	248	3	5704.91	0.00
4074	1820	88	1	24686.97	5.00
4075	1820	144	1	18427.13	0.00
4076	1821	327	1	8103.13	0.00
4077	1822	232	5	10580.70	0.00
4078	1823	57	3	25319.11	0.00
4079	1823	103	5	20005.99	5.00
4080	1824	101	3	7061.05	0.00
4081	1824	77	1	20201.77	5.00
4082	1825	184	2	8109.22	0.00
4083	1825	238	5	18623.67	5.00
4084	1825	31	5	14239.86	0.00
4085	1826	253	4	6539.82	5.00
4086	1826	96	5	8770.71	0.00
4087	1827	135	4	22949.80	5.00
4088	1828	316	2	340.50	10.00
4089	1828	276	2	21618.85	0.00
4090	1828	37	2	32619.07	5.00
4091	1828	36	1	1735.10	0.00
4092	1828	225	1	27871.38	0.00
4093	1829	93	2	2239.83	0.00
4094	1829	255	3	37063.14	0.00
4095	1829	28	2	20966.76	0.00
4096	1830	274	2	9735.42	0.00
4097	1831	96	1	8770.71	5.00
4098	1832	297	1	2879.78	5.00
4099	1832	45	2	6595.34	0.00
4100	1832	156	3	32839.76	5.00
4101	1832	116	3	23884.82	5.00
4102	1832	327	2	8103.13	10.00
4103	1833	265	2	33033.81	0.00
4104	1833	305	2	5777.48	0.00
4105	1833	86	5	27867.51	0.00
4106	1834	266	2	30350.30	0.00
4107	1834	242	4	26069.06	0.00
4108	1835	21	5	28885.66	0.00
4109	1835	155	4	2596.48	0.00
4110	1835	73	1	19639.03	5.00
4111	1835	119	1	20568.93	0.00
4112	1836	235	2	23624.80	5.00
4113	1836	316	4	340.50	5.00
4114	1836	219	5	27037.61	5.00
4115	1836	145	5	26900.06	5.00
4116	1837	126	5	18009.84	0.00
4117	1838	269	3	6147.83	5.00
4118	1839	116	3	23884.82	0.00
4119	1839	63	3	26923.17	5.00
4120	1839	236	1	17409.10	5.00
4121	1839	322	3	13830.37	0.00
4122	1840	115	1	10525.91	0.00
4123	1840	106	5	8994.82	0.00
4124	1840	134	3	32564.64	5.00
4125	1840	131	1	32528.88	0.00
4126	1841	78	1	21716.19	0.00
4127	1841	325	1	12556.36	5.00
4128	1842	141	2	18976.68	0.00
4129	1842	275	5	17459.90	5.00
4130	1842	167	5	6664.74	0.00
4131	1843	204	4	7103.30	0.00
4132	1843	6	3	17267.65	0.00
4133	1843	287	4	26929.25	10.00
4134	1844	262	1	316.65	5.00
4135	1844	281	4	30869.24	0.00
4136	1845	67	4	6504.44	0.00
4137	1845	141	1	18976.68	0.00
4138	1846	61	5	26987.99	0.00
4139	1846	219	4	27037.61	0.00
4140	1846	78	3	21716.19	0.00
4141	1846	59	2	23956.82	0.00
4142	1847	46	1	32347.10	0.00
4143	1847	177	5	1037.15	0.00
4144	1848	253	3	6539.82	10.00
4145	1848	25	3	21791.44	0.00
4146	1849	148	2	33398.34	5.00
4147	1849	295	4	15122.86	0.00
4148	1849	93	4	2239.83	0.00
4149	1850	316	4	340.50	0.00
4150	1850	8	5	28612.40	10.00
4151	1850	59	3	23956.82	0.00
4152	1851	138	4	29598.30	0.00
4153	1851	210	2	31221.02	0.00
4154	1852	152	5	6462.82	0.00
4155	1852	250	5	22128.51	0.00
4156	1852	102	2	19901.11	0.00
4157	1853	287	3	26929.25	10.00
4158	1853	105	3	18324.05	0.00
4159	1853	83	3	7497.50	10.00
4160	1854	59	4	23956.82	5.00
4161	1854	121	3	3250.20	10.00
4162	1854	98	2	3266.66	0.00
4163	1854	116	2	23884.82	0.00
4164	1854	36	5	1735.10	0.00
4165	1855	215	4	13820.74	0.00
4166	1855	316	2	340.50	0.00
4167	1856	243	2	32934.99	5.00
4168	1856	247	3	17789.48	0.00
4169	1857	255	5	37063.14	0.00
4170	1857	62	3	8722.93	0.00
4171	1858	193	3	7905.39	0.00
4172	1858	320	3	19956.45	0.00
4173	1858	218	2	9097.50	5.00
4174	1859	84	2	9912.34	10.00
4175	1859	267	4	13684.84	0.00
4176	1859	134	5	32564.64	0.00
4177	1859	10	3	1535.56	0.00
4178	1860	157	5	11935.44	10.00
4179	1860	1	5	15858.11	5.00
4180	1860	214	2	8996.93	0.00
4181	1860	202	2	32567.80	0.00
4182	1861	119	5	20568.93	0.00
4183	1861	3	1	26253.43	0.00
4184	1862	251	2	28879.67	0.00
4185	1862	90	2	18037.96	5.00
4186	1862	59	2	23956.82	0.00
4187	1863	182	4	8176.49	0.00
4188	1864	85	5	18592.18	0.00
4189	1864	104	1	31420.14	0.00
4190	1865	280	4	18825.63	0.00
4191	1866	125	4	30636.77	0.00
4192	1867	212	3	13620.27	5.00
4193	1867	304	1	25507.59	0.00
4194	1867	171	3	1914.19	0.00
4195	1867	277	4	31244.88	10.00
4196	1867	17	2	1197.66	0.00
4197	1868	62	5	8722.93	5.00
4198	1869	236	1	17409.10	0.00
4199	1869	151	2	2056.97	0.00
4200	1870	182	2	8176.49	5.00
4201	1870	209	2	14780.53	0.00
4202	1871	3	3	26253.43	0.00
4203	1871	95	1	873.16	0.00
4204	1871	115	5	10525.91	0.00
4205	1872	55	5	25249.73	0.00
4206	1872	61	1	26987.99	5.00
4207	1872	286	3	29466.98	0.00
4208	1872	90	2	18037.96	0.00
4209	1872	274	5	9735.42	0.00
4210	1873	267	5	13684.84	0.00
4211	1873	45	1	6595.34	5.00
4212	1873	136	4	9436.00	0.00
4213	1873	236	2	17409.10	0.00
4214	1874	296	4	21692.65	0.00
4215	1875	173	2	29095.13	0.00
4216	1875	137	4	18272.97	5.00
4217	1876	167	5	6664.74	0.00
4218	1876	260	4	10785.43	5.00
4219	1876	80	4	38259.20	0.00
4220	1877	6	1	17267.65	0.00
4221	1878	234	1	27391.73	0.00
4222	1879	78	3	21716.19	10.00
4223	1879	121	2	3250.20	0.00
4224	1880	24	5	2371.03	5.00
4225	1880	62	1	8722.93	0.00
4226	1880	65	1	28661.97	5.00
4227	1881	70	5	1664.51	0.00
4228	1882	258	1	4070.91	0.00
4229	1883	150	4	6436.80	0.00
4230	1883	51	4	24451.03	0.00
4231	1883	156	4	32839.76	0.00
4232	1884	134	2	32564.64	0.00
4233	1885	234	1	27391.73	0.00
4234	1885	189	3	7295.82	10.00
4235	1886	180	2	18260.88	0.00
4236	1886	135	5	22949.80	5.00
4237	1886	220	3	18064.29	0.00
4238	1886	85	4	18592.18	0.00
4239	1887	250	3	22128.51	5.00
4240	1888	296	2	21692.65	0.00
4241	1888	1	5	15858.11	0.00
4242	1888	295	5	15122.86	0.00
4243	1888	47	1	17054.16	0.00
4244	1889	190	3	2205.28	0.00
4245	1889	319	3	28695.55	10.00
4246	1890	206	3	6045.35	0.00
4247	1890	172	3	21684.08	0.00
4248	1890	223	3	13014.71	0.00
4249	1890	4	3	8942.68	10.00
4250	1890	283	5	18689.10	5.00
4251	1891	185	2	27147.39	0.00
4252	1891	189	1	7295.82	10.00
4253	1891	220	3	18064.29	0.00
4254	1891	35	5	14893.01	0.00
4255	1891	83	3	7497.50	0.00
4256	1892	14	4	17741.79	0.00
4257	1893	139	1	25656.53	0.00
4258	1893	88	1	24686.97	0.00
4259	1894	22	2	34187.79	0.00
4260	1894	304	2	25507.59	0.00
4261	1894	154	2	3570.74	0.00
4262	1895	44	4	6287.16	0.00
4263	1895	307	5	20775.79	0.00
4264	1895	281	3	30869.24	0.00
4265	1895	185	2	27147.39	10.00
4266	1896	21	4	28885.66	0.00
4267	1897	327	4	8103.13	5.00
4268	1897	109	5	24975.44	0.00
4269	1898	255	5	37063.14	10.00
4270	1899	107	2	359.68	0.00
4271	1899	187	3	2994.33	5.00
4272	1900	166	5	18050.91	0.00
4273	1900	326	3	13740.29	0.00
4274	1900	317	3	29835.28	0.00
4275	1901	148	2	33398.34	5.00
4276	1901	123	2	16598.57	0.00
4277	1901	281	5	30869.24	0.00
4278	1901	253	5	6539.82	5.00
4279	1902	219	3	27037.61	0.00
4280	1902	135	2	22949.80	0.00
4281	1902	61	1	26987.99	0.00
4282	1903	297	4	2879.78	0.00
4283	1903	99	4	16911.90	0.00
4284	1903	128	1	7835.32	0.00
4285	1904	9	2	33482.70	0.00
4286	1904	271	5	35488.48	0.00
4287	1904	280	3	18825.63	0.00
4288	1904	1	3	15858.11	5.00
4289	1904	220	2	18064.29	10.00
4290	1905	177	4	1037.15	0.00
4291	1905	123	3	16598.57	0.00
4292	1906	32	3	26325.66	10.00
4293	1906	312	4	7030.98	0.00
4294	1906	284	3	13885.78	0.00
4295	1907	270	2	29941.52	0.00
4296	1908	94	4	19130.25	0.00
4297	1908	235	1	23624.80	10.00
4298	1908	186	2	10556.47	5.00
4299	1908	135	5	22949.80	0.00
4300	1908	325	2	12556.36	0.00
4301	1909	126	5	18009.84	0.00
4302	1909	195	1	17434.24	0.00
4303	1910	15	3	5791.98	0.00
4304	1911	267	3	13684.84	0.00
4305	1911	22	4	34187.79	0.00
4306	1911	322	3	13830.37	0.00
4307	1912	318	4	32370.18	0.00
4308	1913	102	5	19901.11	0.00
4309	1913	159	4	8802.38	5.00
4310	1914	166	4	18050.91	10.00
4311	1914	253	5	6539.82	0.00
4312	1915	327	2	8103.13	0.00
4313	1915	152	2	6462.82	5.00
4314	1916	308	2	14634.32	0.00
4315	1917	39	1	3995.01	0.00
4316	1918	21	2	28885.66	0.00
4317	1919	281	1	30869.24	10.00
4318	1919	14	4	17741.79	5.00
4319	1920	265	5	33033.81	0.00
4320	1920	49	5	10492.89	5.00
4321	1921	6	4	17267.65	10.00
4322	1921	214	5	8996.93	0.00
4323	1922	103	2	20005.99	10.00
4324	1923	17	5	1197.66	0.00
4325	1923	306	5	12630.20	0.00
4326	1924	72	3	3396.14	0.00
4327	1925	138	1	29598.30	0.00
4328	1926	306	2	12630.20	0.00
4329	1927	265	2	33033.81	0.00
4330	1927	308	3	14634.32	0.00
4331	1927	267	3	13684.84	5.00
4332	1927	136	4	9436.00	0.00
4333	1927	245	3	20516.11	5.00
4334	1928	173	2	29095.13	0.00
4335	1929	145	4	26900.06	0.00
4336	1929	293	1	8008.05	0.00
4337	1930	116	1	23884.82	0.00
4338	1931	312	2	7030.98	0.00
4339	1932	205	1	23585.50	0.00
4340	1932	31	5	14239.86	0.00
4341	1933	187	3	2994.33	0.00
4342	1933	182	5	8176.49	0.00
4343	1933	26	4	28783.35	5.00
4344	1934	47	4	17054.16	0.00
4345	1934	155	3	2596.48	0.00
4346	1934	82	4	32104.18	0.00
4347	1934	198	1	26581.95	5.00
4348	1935	46	1	32347.10	0.00
4349	1935	45	1	6595.34	0.00
4350	1936	202	3	32567.80	0.00
4351	1937	165	5	10583.30	0.00
4352	1938	270	4	29941.52	0.00
4353	1938	304	3	25507.59	0.00
4354	1938	184	3	8109.22	5.00
4355	1939	251	5	28879.67	10.00
4356	1940	119	4	20568.93	0.00
4357	1941	177	2	1037.15	5.00
4358	1941	198	4	26581.95	0.00
4359	1942	158	5	28494.74	0.00
4360	1943	31	1	14239.86	5.00
4361	1944	16	3	2894.98	0.00
4362	1944	13	1	13999.33	5.00
4363	1944	87	4	25661.61	0.00
4364	1945	200	3	2196.15	0.00
4365	1945	204	3	7103.30	10.00
4366	1945	69	4	20390.90	0.00
4367	1946	57	1	25319.11	0.00
4368	1947	257	2	17467.13	0.00
4369	1947	147	2	16118.15	10.00
4370	1948	324	1	35511.98	10.00
4371	1948	77	5	20201.77	0.00
4372	1949	148	5	33398.34	5.00
4373	1949	243	1	32934.99	0.00
4374	1949	286	4	29466.98	0.00
4375	1950	214	5	8996.93	10.00
4376	1951	258	5	4070.91	0.00
4377	1951	322	2	13830.37	0.00
4378	1951	291	2	4154.47	0.00
4379	1952	65	3	28661.97	0.00
4380	1952	232	3	10580.70	0.00
4381	1952	305	3	5777.48	0.00
4382	1953	109	1	24975.44	0.00
4383	1953	101	5	7061.05	0.00
4384	1954	264	2	3231.57	5.00
4385	1955	304	2	25507.59	0.00
4386	1955	280	3	18825.63	0.00
4387	1955	185	2	27147.39	0.00
4388	1956	200	3	2196.15	0.00
4389	1956	108	5	19316.06	0.00
4390	1956	151	3	2056.97	0.00
4391	1956	197	2	13698.28	0.00
4392	1957	191	2	13943.67	5.00
4393	1958	321	3	15006.91	5.00
4394	1958	272	5	17566.50	0.00
4395	1958	48	5	18931.60	0.00
4396	1959	218	5	9097.50	0.00
4397	1960	261	2	22618.18	0.00
4398	1960	283	2	18689.10	10.00
4399	1961	127	5	14788.94	0.00
4400	1962	166	3	18050.91	0.00
4401	1963	186	2	10556.47	0.00
4402	1963	231	4	6896.87	0.00
4403	1963	10	1	1535.56	0.00
4404	1964	45	3	6595.34	0.00
4405	1964	110	4	21067.54	0.00
4406	1964	82	5	32104.18	0.00
4407	1965	93	2	2239.83	0.00
4408	1966	142	3	32902.97	10.00
4409	1966	176	3	37396.28	5.00
4410	1967	227	2	35785.16	5.00
4411	1968	35	4	14893.01	0.00
4412	1969	260	5	10785.43	0.00
4413	1969	234	3	27391.73	5.00
4414	1969	201	1	10598.73	0.00
4415	1969	189	3	7295.82	0.00
4416	1969	230	1	28400.61	5.00
4417	1970	286	4	29466.98	0.00
4418	1971	111	4	9004.05	0.00
4419	1972	48	3	18931.60	10.00
4420	1973	82	3	32104.18	0.00
4421	1973	89	1	773.73	0.00
4422	1973	65	3	28661.97	0.00
4423	1973	311	3	14989.38	5.00
4424	1974	51	3	24451.03	5.00
4425	1974	281	1	30869.24	0.00
4426	1974	8	2	28612.40	0.00
4427	1974	171	1	1914.19	0.00
4428	1975	82	4	32104.18	5.00
4429	1975	10	4	1535.56	0.00
4430	1976	303	5	19580.63	0.00
4431	1976	20	5	21995.92	5.00
4432	1976	323	4	23922.51	0.00
4433	1977	41	1	11834.74	0.00
4434	1977	116	4	23884.82	0.00
4435	1978	268	1	4330.51	0.00
4436	1978	236	3	17409.10	0.00
4437	1978	266	1	30350.30	0.00
4438	1979	217	4	3368.23	0.00
4439	1979	165	5	10583.30	0.00
4440	1980	253	5	6539.82	0.00
4441	1980	280	4	18825.63	0.00
4442	1981	286	3	29466.98	0.00
4443	1982	240	3	6679.87	5.00
4444	1982	314	1	21132.86	5.00
4445	1983	148	3	33398.34	10.00
4446	1983	43	4	29453.15	0.00
4447	1984	175	1	431.66	0.00
4448	1984	46	1	32347.10	0.00
4449	1985	251	3	28879.67	0.00
4450	1985	274	1	9735.42	0.00
4451	1985	103	3	20005.99	0.00
4452	1986	207	4	23472.26	0.00
4453	1987	52	5	5082.07	0.00
4454	1987	195	1	17434.24	0.00
4455	1988	103	3	20005.99	10.00
4456	1989	287	4	26929.25	0.00
4457	1989	101	3	7061.05	0.00
4458	1989	314	2	21132.86	5.00
4459	1990	314	4	21132.86	0.00
4460	1990	181	1	7647.49	0.00
4461	1991	178	3	8358.65	5.00
4462	1991	34	1	34435.26	0.00
4463	1991	321	5	15006.91	5.00
4464	1991	75	5	27128.62	0.00
4465	1991	87	2	25661.61	0.00
4466	1992	152	4	6462.82	10.00
4467	1992	239	1	23450.80	0.00
4468	1993	95	2	873.16	10.00
4469	1993	217	2	3368.23	0.00
4470	1994	291	4	4154.47	0.00
4471	1994	183	1	5758.05	5.00
4472	1994	104	5	31420.14	0.00
4473	1995	93	2	2239.83	0.00
4474	1995	228	2	31317.59	5.00
4475	1996	204	4	7103.30	0.00
4476	1997	298	1	14592.86	0.00
4477	1998	110	2	21067.54	0.00
4478	1998	9	2	33482.70	0.00
4479	1999	32	5	26325.66	5.00
4480	2000	3	5	26253.43	5.00
4481	2000	206	5	6045.35	0.00
4482	2001	227	1	35785.16	0.00
4483	2002	215	2	13820.74	0.00
4484	2002	250	2	22128.51	0.00
4485	2003	44	1	6287.16	0.00
4486	2003	300	2	17477.32	0.00
4487	2004	15	3	5791.98	5.00
4488	2004	19	4	7630.10	0.00
4489	2005	272	5	17566.50	0.00
4490	2006	110	5	21067.54	0.00
4491	2007	250	4	22128.51	0.00
4492	2007	2	1	24015.17	0.00
4493	2007	288	2	23034.91	5.00
4494	2007	226	3	14516.18	0.00
4495	2008	146	5	23311.85	0.00
4496	2008	128	2	7835.32	0.00
4497	2008	45	2	6595.34	10.00
4498	2008	23	4	8278.99	0.00
4499	2008	65	3	28661.97	5.00
4500	2009	95	3	873.16	5.00
4501	2010	135	1	22949.80	5.00
4502	2010	76	5	16330.99	0.00
4503	2010	255	5	37063.14	5.00
4504	2011	32	1	26325.66	10.00
4505	2011	122	1	12832.42	0.00
4506	2011	143	5	21267.26	5.00
4507	2011	97	2	14554.24	5.00
4508	2012	158	2	28494.74	10.00
4509	2012	177	3	1037.15	0.00
4510	2012	13	5	13999.33	0.00
4511	2012	282	4	26158.78	0.00
4512	2013	50	5	32360.23	0.00
4513	2013	305	3	5777.48	0.00
4514	2013	253	4	6539.82	0.00
4515	2013	144	2	18427.13	0.00
4516	2013	260	2	10785.43	5.00
4517	2014	131	3	32528.88	0.00
4518	2014	85	4	18592.18	0.00
4519	2015	249	2	340.08	0.00
4520	2015	150	5	6436.80	0.00
4521	2016	28	1	20966.76	10.00
4522	2016	209	3	14780.53	0.00
4523	2016	223	1	13014.71	0.00
4524	2017	52	3	5082.07	5.00
4525	2017	81	1	5090.35	5.00
4526	2017	327	1	8103.13	0.00
4527	2018	234	2	27391.73	5.00
4528	2018	204	1	7103.30	0.00
4529	2019	313	2	8702.12	0.00
4530	2019	84	5	9912.34	0.00
4531	2019	210	2	31221.02	5.00
4532	2020	195	2	17434.24	0.00
4533	2021	18	2	31259.75	0.00
4534	2021	303	2	19580.63	0.00
4535	2022	153	3	32619.22	5.00
4536	2022	3	5	26253.43	5.00
4537	2023	294	4	18000.72	5.00
4538	2024	252	4	19842.18	10.00
4539	2024	89	2	773.73	5.00
4540	2024	142	2	32902.97	0.00
4541	2025	292	1	20342.09	0.00
4542	2025	252	4	19842.18	0.00
4543	2025	19	2	7630.10	0.00
4544	2025	223	3	13014.71	5.00
4545	2026	296	1	21692.65	0.00
4546	2026	320	4	19956.45	0.00
4547	2027	321	2	15006.91	10.00
4548	2027	38	1	11721.98	0.00
4549	2027	131	4	32528.88	0.00
4550	2028	119	3	20568.93	0.00
4551	2028	224	5	3586.39	0.00
4552	2028	195	1	17434.24	0.00
4553	2029	289	4	15260.25	0.00
4554	2029	150	2	6436.80	5.00
4555	2029	89	2	773.73	0.00
4556	2030	153	5	32619.22	0.00
4557	2031	162	4	1341.67	5.00
4558	2031	228	3	31317.59	0.00
4559	2031	50	1	32360.23	0.00
4560	2032	293	2	8008.05	0.00
4561	2032	185	3	27147.39	0.00
4562	2033	187	4	2994.33	0.00
4563	2034	112	5	18453.69	0.00
4564	2034	310	1	390.07	0.00
4565	2034	247	1	17789.48	0.00
4566	2034	41	2	11834.74	0.00
4567	2035	183	4	5758.05	0.00
4568	2035	326	5	13740.29	0.00
4569	2035	297	4	2879.78	0.00
4570	2035	314	4	21132.86	0.00
4571	2036	254	4	15942.44	5.00
4572	2036	194	5	18125.11	5.00
4573	2036	204	2	7103.30	0.00
4574	2037	202	3	32567.80	10.00
4575	2037	300	2	17477.32	0.00
4576	2038	83	3	7497.50	5.00
4577	2038	57	2	25319.11	5.00
4578	2038	217	3	3368.23	5.00
4579	2039	325	2	12556.36	0.00
4580	2040	7	3	25378.21	0.00
4581	2040	9	2	33482.70	0.00
4582	2041	28	5	20966.76	0.00
4583	2041	172	5	21684.08	10.00
4584	2042	188	1	27164.75	5.00
4585	2043	30	5	20705.47	0.00
4586	2043	166	5	18050.91	10.00
4587	2044	181	5	7647.49	0.00
4588	2044	105	1	18324.05	0.00
4589	2045	276	3	21618.85	0.00
4590	2045	111	5	9004.05	0.00
4591	2046	303	1	19580.63	0.00
4592	2046	170	2	26345.81	10.00
4593	2047	191	1	13943.67	0.00
4594	2048	141	2	18976.68	5.00
4595	2048	20	5	21995.92	5.00
4596	2049	77	1	20201.77	0.00
4597	2050	300	1	17477.32	10.00
4598	2050	165	1	10583.30	0.00
4599	2051	50	5	32360.23	0.00
4600	2051	185	5	27147.39	5.00
4601	2051	173	3	29095.13	0.00
4602	2052	138	1	29598.30	0.00
4603	2053	222	3	3056.85	0.00
4604	2053	201	2	10598.73	0.00
4605	2054	280	1	18825.63	0.00
4606	2055	1	2	15858.11	0.00
4607	2055	105	2	18324.05	0.00
4608	2056	276	4	21618.85	0.00
4609	2056	103	3	20005.99	0.00
4610	2057	319	5	28695.55	0.00
4611	2057	63	1	26923.17	0.00
4612	2057	241	3	25166.29	0.00
4613	2058	280	1	18825.63	5.00
4614	2058	62	3	8722.93	5.00
4615	2058	33	4	4281.57	0.00
4616	2059	195	4	17434.24	0.00
4617	2059	60	1	28605.81	0.00
4618	2059	61	5	26987.99	5.00
4619	2059	253	3	6539.82	0.00
4620	2059	121	2	3250.20	0.00
4621	2060	307	4	20775.79	0.00
4622	2060	204	2	7103.30	0.00
4623	2061	104	1	31420.14	10.00
4624	2062	95	4	873.16	0.00
4625	2062	159	4	8802.38	0.00
4626	2062	102	5	19901.11	0.00
4627	2062	131	2	32528.88	10.00
4628	2063	92	2	20118.27	0.00
4629	2063	41	3	11834.74	0.00
4630	2063	172	4	21684.08	0.00
4631	2064	150	2	6436.80	0.00
4632	2064	215	5	13820.74	0.00
4633	2064	58	5	26928.89	0.00
4634	2065	191	4	13943.67	10.00
4635	2065	113	1	26136.34	0.00
4636	2065	317	5	29835.28	0.00
4637	2065	103	2	20005.99	5.00
4638	2066	121	2	3250.20	10.00
4639	2067	220	5	18064.29	0.00
4640	2068	180	1	18260.88	0.00
4641	2068	57	3	25319.11	0.00
4642	2068	257	5	17467.13	0.00
4643	2068	16	3	2894.98	0.00
4644	2069	260	4	10785.43	0.00
4645	2069	219	2	27037.61	5.00
4646	2069	286	3	29466.98	5.00
4647	2070	2	1	24015.17	0.00
4648	2070	174	2	28177.73	0.00
4649	2071	32	5	26325.66	0.00
4650	2071	247	5	17789.48	0.00
4651	2071	66	2	17427.59	0.00
4652	2072	100	2	8325.24	5.00
4653	2072	51	4	24451.03	5.00
4654	2073	204	5	7103.30	0.00
4655	2073	127	3	14788.94	0.00
4656	2073	105	1	18324.05	0.00
4657	2074	43	3	29453.15	0.00
4658	2075	312	2	7030.98	0.00
4659	2075	98	2	3266.66	5.00
4660	2075	317	2	29835.28	0.00
4661	2076	77	1	20201.77	5.00
4662	2076	273	4	19698.88	0.00
4663	2076	262	5	316.65	5.00
4664	2077	151	2	2056.97	0.00
4665	2077	28	4	20966.76	0.00
4666	2078	10	3	1535.56	0.00
4667	2078	197	2	13698.28	0.00
4668	2079	82	5	32104.18	5.00
4669	2079	317	3	29835.28	5.00
4670	2080	67	2	6504.44	5.00
4671	2081	208	3	8508.53	0.00
4672	2081	280	5	18825.63	0.00
4673	2081	265	2	33033.81	0.00
4674	2082	319	4	28695.55	0.00
4675	2082	200	4	2196.15	0.00
4676	2082	14	2	17741.79	0.00
4677	2083	71	5	5597.63	0.00
4678	2084	258	3	4070.91	5.00
4679	2084	242	4	26069.06	5.00
4680	2084	143	1	21267.26	5.00
4681	2084	182	1	8176.49	0.00
4682	2085	278	4	12560.12	0.00
4683	2085	211	2	12736.65	0.00
4684	2085	259	5	12682.03	5.00
4685	2086	59	4	23956.82	0.00
4686	2086	324	3	35511.98	0.00
4687	2086	91	2	17167.44	0.00
4688	2086	311	1	14989.38	0.00
4689	2087	310	1	390.07	0.00
4690	2087	42	5	22822.73	0.00
4691	2087	325	2	12556.36	0.00
4692	2088	229	2	18071.36	0.00
4693	2088	242	1	26069.06	0.00
4694	2089	159	1	8802.38	0.00
4695	2089	23	2	8278.99	0.00
4696	2089	60	5	28605.81	5.00
4697	2089	131	1	32528.88	0.00
4698	2089	229	2	18071.36	0.00
4699	2090	69	2	20390.90	10.00
4700	2090	265	1	33033.81	0.00
4701	2090	133	5	19101.95	5.00
4702	2090	135	3	22949.80	0.00
4703	2091	47	5	17054.16	5.00
4704	2091	90	5	18037.96	0.00
4705	2092	56	4	27131.00	10.00
4706	2093	327	3	8103.13	10.00
4707	2093	158	2	28494.74	0.00
4708	2093	228	1	31317.59	5.00
4709	2094	241	1	25166.29	0.00
4710	2095	84	2	9912.34	5.00
4711	2096	84	4	9912.34	5.00
4712	2096	186	2	10556.47	0.00
4713	2096	12	2	14641.07	0.00
4714	2097	189	5	7295.82	0.00
4715	2097	264	4	3231.57	10.00
4716	2097	62	5	8722.93	0.00
4717	2097	124	1	10512.87	0.00
4718	2098	222	3	3056.85	0.00
4719	2098	325	1	12556.36	0.00
4720	2098	94	5	19130.25	0.00
4721	2098	136	2	9436.00	0.00
4722	2099	305	5	5777.48	0.00
4723	2099	33	5	4281.57	10.00
4724	2099	291	3	4154.47	0.00
4725	2100	80	5	38259.20	0.00
4726	2101	94	5	19130.25	5.00
4727	2101	187	3	2994.33	0.00
4728	2101	323	3	23922.51	10.00
4729	2102	70	3	1664.51	0.00
4730	2102	81	5	5090.35	5.00
4731	2102	20	4	21995.92	10.00
4732	2103	296	5	21692.65	0.00
4733	2103	57	5	25319.11	0.00
4734	2103	96	2	8770.71	0.00
4735	2104	121	1	3250.20	5.00
4736	2104	234	4	27391.73	5.00
4737	2105	27	1	7946.20	0.00
4738	2106	312	3	7030.98	5.00
4739	2106	182	4	8176.49	5.00
4740	2107	305	3	5777.48	0.00
4741	2108	212	2	13620.27	0.00
4742	2109	217	4	3368.23	0.00
4743	2109	326	5	13740.29	5.00
4744	2110	145	4	26900.06	0.00
4745	2111	109	4	24975.44	0.00
4746	2111	212	5	13620.27	0.00
4747	2112	66	5	17427.59	0.00
4748	2112	198	1	26581.95	0.00
4749	2112	321	3	15006.91	10.00
4750	2113	11	3	23322.36	0.00
4751	2114	273	4	19698.88	0.00
4752	2114	321	3	15006.91	0.00
4753	2114	283	5	18689.10	0.00
4754	2115	64	2	6770.97	0.00
4755	2115	229	4	18071.36	0.00
4756	2116	151	1	2056.97	0.00
4757	2117	288	2	23034.91	5.00
4758	2117	286	4	29466.98	0.00
4759	2118	46	4	32347.10	0.00
4760	2119	290	3	20830.98	0.00
4761	2119	228	1	31317.59	0.00
4762	2120	137	3	18272.97	0.00
4763	2121	243	2	32934.99	5.00
4764	2121	37	4	32619.07	0.00
4765	2121	328	3	22158.52	5.00
4766	2121	89	3	773.73	0.00
4767	2121	165	2	10583.30	5.00
4768	2122	16	2	2894.98	10.00
4769	2123	95	1	873.16	0.00
4770	2123	28	1	20966.76	0.00
4771	2124	264	2	3231.57	0.00
4772	2124	117	4	30916.88	0.00
4773	2124	305	3	5777.48	0.00
4774	2124	180	1	18260.88	0.00
4775	2125	106	3	8994.82	0.00
4776	2126	282	1	26158.78	0.00
4777	2126	290	4	20830.98	5.00
4778	2126	217	2	3368.23	0.00
4779	2127	197	4	13698.28	5.00
4780	2127	240	4	6679.87	0.00
4781	2127	7	3	25378.21	5.00
4782	2127	288	1	23034.91	5.00
4783	2127	32	3	26325.66	0.00
4784	2128	277	2	31244.88	0.00
4785	2129	12	3	14641.07	0.00
4786	2129	50	5	32360.23	0.00
4787	2129	151	2	2056.97	10.00
4788	2130	99	2	16911.90	5.00
4789	2130	165	3	10583.30	0.00
4790	2130	116	3	23884.82	10.00
4791	2130	52	3	5082.07	0.00
4792	2130	233	3	16609.25	0.00
4793	2131	128	3	7835.32	0.00
4794	2132	54	5	16118.63	0.00
4795	2132	71	4	5597.63	0.00
4796	2132	213	2	4846.86	0.00
4797	2132	282	2	26158.78	0.00
4798	2133	316	5	340.50	0.00
4799	2133	210	4	31221.02	0.00
4800	2134	313	5	8702.12	0.00
4801	2134	138	3	29598.30	0.00
4802	2134	167	5	6664.74	5.00
4803	2134	208	1	8508.53	0.00
4804	2135	302	3	10847.55	0.00
4805	2135	220	2	18064.29	10.00
4806	2136	130	3	21694.52	5.00
4807	2137	312	4	7030.98	0.00
4808	2137	131	5	32528.88	0.00
4809	2137	316	4	340.50	5.00
4810	2137	112	5	18453.69	0.00
4811	2137	3	5	26253.43	0.00
4812	2138	87	2	25661.61	0.00
4813	2139	243	4	32934.99	5.00
4814	2139	59	1	23956.82	0.00
4815	2139	159	2	8802.38	0.00
4816	2140	39	1	3995.01	0.00
4817	2141	316	1	340.50	0.00
4818	2141	35	5	14893.01	5.00
4819	2142	113	5	26136.34	0.00
4820	2142	243	1	32934.99	0.00
4821	2143	261	3	22618.18	0.00
4822	2143	138	3	29598.30	0.00
4823	2144	118	4	26976.56	0.00
4824	2144	69	1	20390.90	0.00
4825	2144	179	3	1556.32	0.00
4826	2144	208	1	8508.53	0.00
4827	2145	68	4	30368.50	0.00
4828	2146	328	4	22158.52	0.00
4829	2146	68	1	30368.50	0.00
4830	2146	37	4	32619.07	0.00
4831	2147	6	5	17267.65	0.00
4832	2147	1	5	15858.11	0.00
4833	2147	4	4	8942.68	0.00
4834	2147	273	3	19698.88	5.00
4835	2148	123	4	16598.57	5.00
4836	2149	92	5	20118.27	0.00
4837	2150	220	3	18064.29	0.00
4838	2150	297	3	2879.78	0.00
4839	2150	98	5	3266.66	0.00
4840	2150	41	1	11834.74	5.00
4841	2151	74	4	20327.04	5.00
4842	2151	238	1	18623.67	0.00
4843	2152	21	2	28885.66	0.00
4844	2152	122	1	12832.42	5.00
4845	2152	230	3	28400.61	0.00
4846	2152	242	2	26069.06	5.00
4847	2152	232	3	10580.70	5.00
4848	2153	107	5	359.68	0.00
4849	2153	170	3	26345.81	0.00
4850	2154	295	1	15122.86	0.00
4851	2154	141	4	18976.68	0.00
4852	2155	243	5	32934.99	0.00
4853	2155	69	5	20390.90	5.00
4854	2155	117	5	30916.88	0.00
4855	2156	269	5	6147.83	0.00
4856	2157	25	1	21791.44	0.00
4857	2157	225	5	27871.38	10.00
4858	2157	194	3	18125.11	0.00
4859	2158	238	3	18623.67	0.00
4860	2158	24	2	2371.03	0.00
4861	2159	209	2	14780.53	5.00
4862	2159	304	3	25507.59	0.00
4863	2159	245	4	20516.11	0.00
4864	2159	128	4	7835.32	5.00
4865	2160	325	4	12556.36	0.00
4866	2161	254	5	15942.44	0.00
4867	2161	66	4	17427.59	0.00
4868	2161	108	2	19316.06	0.00
4869	2162	224	4	3586.39	0.00
4870	2162	93	2	2239.83	0.00
4871	2162	309	3	29167.36	0.00
4872	2162	197	5	13698.28	5.00
4873	2163	136	5	9436.00	0.00
4874	2163	88	3	24686.97	0.00
4875	2163	204	1	7103.30	0.00
4876	2164	207	5	23472.26	0.00
4877	2164	260	5	10785.43	10.00
4878	2165	123	1	16598.57	0.00
4879	2165	75	2	27128.62	0.00
4880	2166	143	3	21267.26	0.00
4881	2167	167	3	6664.74	10.00
4882	2167	108	5	19316.06	5.00
4883	2168	180	3	18260.88	0.00
4884	2168	8	2	28612.40	0.00
4885	2169	159	2	8802.38	0.00
4886	2169	150	4	6436.80	5.00
4887	2169	50	3	32360.23	5.00
4888	2169	208	4	8508.53	0.00
4889	2170	113	4	26136.34	0.00
4890	2171	226	3	14516.18	5.00
4891	2172	21	4	28885.66	5.00
4892	2173	11	1	23322.36	0.00
4893	2173	192	5	22314.85	5.00
4894	2173	257	4	17467.13	0.00
4895	2174	68	5	30368.50	0.00
4896	2175	255	1	37063.14	0.00
4897	2176	6	2	17267.65	0.00
4898	2176	225	1	27871.38	0.00
4899	2177	288	4	23034.91	5.00
4900	2178	195	5	17434.24	0.00
4901	2179	201	3	10598.73	5.00
4902	2179	228	5	31317.59	0.00
4903	2179	116	4	23884.82	10.00
4904	2179	143	1	21267.26	5.00
4905	2179	318	1	32370.18	0.00
4906	2180	285	3	11004.33	0.00
4907	2180	166	3	18050.91	0.00
4908	2181	224	5	3586.39	0.00
4909	2181	255	1	37063.14	0.00
4910	2182	309	3	29167.36	0.00
4911	2183	63	5	26923.17	0.00
4912	2184	300	4	17477.32	0.00
4913	2185	243	4	32934.99	0.00
4914	2185	72	3	3396.14	10.00
4915	2185	14	4	17741.79	0.00
4916	2185	35	2	14893.01	0.00
4917	2186	47	4	17054.16	0.00
4918	2186	300	5	17477.32	5.00
4919	2187	19	3	7630.10	0.00
4920	2188	197	5	13698.28	0.00
4921	2188	74	3	20327.04	0.00
4922	2188	191	5	13943.67	5.00
4923	2188	329	2	21671.36	0.00
4924	2188	201	5	10598.73	5.00
4925	2189	276	4	21618.85	0.00
4926	2190	145	1	26900.06	0.00
4927	2191	48	1	18931.60	0.00
4928	2191	15	1	5791.98	0.00
4929	2192	35	5	14893.01	0.00
4930	2192	193	2	7905.39	0.00
4931	2192	47	5	17054.16	0.00
4932	2193	220	4	18064.29	5.00
4933	2194	9	1	33482.70	0.00
4934	2195	287	1	26929.25	10.00
4935	2195	186	4	10556.47	0.00
4936	2196	198	3	26581.95	0.00
4937	2196	39	2	3995.01	5.00
4938	2196	91	4	17167.44	5.00
4939	2197	270	1	29941.52	0.00
4940	2197	309	2	29167.36	0.00
4941	2197	41	1	11834.74	5.00
4942	2197	67	5	6504.44	0.00
4943	2197	160	2	21111.41	0.00
4944	2198	24	4	2371.03	0.00
4945	2199	82	5	32104.18	0.00
4946	2200	184	2	8109.22	0.00
4947	2200	237	4	8720.64	0.00
4948	2201	323	5	23922.51	0.00
4949	2201	152	3	6462.82	0.00
4950	2201	53	1	1943.06	0.00
4951	2201	12	3	14641.07	0.00
4952	2202	4	2	8942.68	0.00
4953	2203	154	1	3570.74	0.00
4954	2204	12	5	14641.07	0.00
4955	2205	131	2	32528.88	5.00
4956	2205	164	3	15959.84	0.00
4957	2205	185	5	27147.39	5.00
4958	2205	80	2	38259.20	0.00
4959	2206	37	1	32619.07	5.00
4960	2206	133	4	19101.95	5.00
4961	2207	162	5	1341.67	5.00
4962	2208	121	1	3250.20	0.00
4963	2208	109	1	24975.44	5.00
4964	2208	98	2	3266.66	0.00
4965	2208	110	1	21067.54	0.00
4966	2209	253	4	6539.82	0.00
4967	2209	72	5	3396.14	0.00
4968	2209	106	2	8994.82	5.00
4969	2210	109	3	24975.44	5.00
4970	2211	78	1	21716.19	5.00
4971	2212	265	5	33033.81	0.00
4972	2213	111	5	9004.05	0.00
4973	2213	26	5	28783.35	0.00
4974	2214	24	5	2371.03	0.00
4975	2215	265	5	33033.81	0.00
4976	2216	288	1	23034.91	0.00
4977	2216	217	5	3368.23	0.00
4978	2217	260	1	10785.43	0.00
4979	2217	326	3	13740.29	0.00
4980	2218	266	5	30350.30	0.00
4981	2218	216	3	33300.54	0.00
4982	2218	92	5	20118.27	0.00
4983	2219	269	5	6147.83	0.00
4984	2219	232	4	10580.70	0.00
4985	2219	249	5	340.08	0.00
4986	2219	304	3	25507.59	0.00
4987	2219	224	3	3586.39	0.00
4988	2220	177	4	1037.15	0.00
4989	2220	295	3	15122.86	0.00
4990	2220	272	5	17566.50	0.00
4991	2220	325	4	12556.36	0.00
4992	2221	21	4	28885.66	10.00
4993	2222	75	2	27128.62	10.00
4994	2223	284	5	13885.78	0.00
4995	2223	299	3	11746.03	0.00
4996	2224	282	4	26158.78	0.00
4997	2224	107	5	359.68	5.00
4998	2225	319	3	28695.55	5.00
4999	2225	201	4	10598.73	0.00
5000	2226	55	1	25249.73	5.00
5001	2226	140	3	30696.33	0.00
5002	2227	175	3	431.66	0.00
5003	2228	291	2	4154.47	10.00
5004	2228	97	2	14554.24	0.00
5005	2229	228	5	31317.59	0.00
5006	2229	30	1	20705.47	10.00
5007	2230	304	4	25507.59	5.00
5008	2230	194	3	18125.11	0.00
5009	2231	192	3	22314.85	10.00
5010	2231	266	1	30350.30	0.00
5011	2232	180	1	18260.88	0.00
5012	2232	241	1	25166.29	0.00
5013	2233	8	2	28612.40	0.00
5014	2234	328	3	22158.52	5.00
5015	2235	214	5	8996.93	0.00
5016	2235	6	3	17267.65	0.00
5017	2235	194	5	18125.11	5.00
5018	2235	180	3	18260.88	0.00
5019	2236	148	1	33398.34	5.00
5020	2236	110	3	21067.54	0.00
5021	2236	223	3	13014.71	0.00
5022	2237	203	1	11026.49	0.00
5023	2237	34	3	34435.26	0.00
5024	2237	273	3	19698.88	0.00
5025	2238	67	2	6504.44	5.00
5026	2238	222	5	3056.85	0.00
5027	2239	19	5	7630.10	0.00
5028	2240	120	2	6107.02	0.00
5029	2240	25	5	21791.44	0.00
5030	2241	239	4	23450.80	0.00
5031	2241	240	3	6679.87	0.00
5032	2241	141	3	18976.68	10.00
5033	2242	234	3	27391.73	0.00
5034	2242	28	1	20966.76	0.00
5035	2243	103	1	20005.99	10.00
5036	2243	106	4	8994.82	5.00
5037	2243	100	4	8325.24	0.00
5038	2243	149	5	12786.74	10.00
5039	2243	117	2	30916.88	0.00
5040	2244	183	4	5758.05	5.00
5041	2244	121	1	3250.20	0.00
5042	2244	132	5	11440.30	5.00
5043	2244	11	2	23322.36	0.00
5044	2244	75	2	27128.62	0.00
5045	2245	228	5	31317.59	5.00
5046	2246	173	4	29095.13	0.00
5047	2246	241	5	25166.29	0.00
5048	2247	17	3	1197.66	5.00
5049	2248	45	1	6595.34	0.00
5050	2249	262	4	316.65	0.00
5051	2249	89	2	773.73	5.00
5052	2250	261	5	22618.18	0.00
5053	2251	226	1	14516.18	0.00
5054	2251	132	1	11440.30	5.00
5055	2252	65	3	28661.97	10.00
5056	2252	238	1	18623.67	5.00
5057	2252	41	1	11834.74	0.00
5058	2253	276	2	21618.85	0.00
5059	2253	287	2	26929.25	0.00
5060	2254	135	3	22949.80	0.00
5061	2254	222	1	3056.85	0.00
5062	2254	120	5	6107.02	0.00
5063	2255	101	3	7061.05	0.00
5064	2255	163	2	20880.95	5.00
5065	2256	236	1	17409.10	0.00
5066	2257	229	3	18071.36	10.00
5067	2257	95	4	873.16	0.00
5068	2257	230	2	28400.61	0.00
5069	2258	308	4	14634.32	0.00
5070	2258	277	2	31244.88	0.00
5071	2258	14	4	17741.79	0.00
5072	2259	56	3	27131.00	10.00
5073	2259	170	2	26345.81	5.00
5074	2259	182	4	8176.49	0.00
5075	2260	232	1	10580.70	0.00
5076	2260	11	3	23322.36	10.00
5077	2260	139	5	25656.53	0.00
5078	2261	111	3	9004.05	0.00
5079	2261	203	2	11026.49	0.00
5080	2262	17	2	1197.66	5.00
5081	2262	205	4	23585.50	0.00
5082	2262	125	3	30636.77	10.00
5083	2263	257	1	17467.13	0.00
5084	2263	147	1	16118.15	5.00
5085	2263	20	5	21995.92	0.00
5086	2264	267	3	13684.84	0.00
5087	2264	266	1	30350.30	0.00
5088	2265	214	4	8996.93	0.00
5089	2265	200	5	2196.15	0.00
5090	2266	276	2	21618.85	0.00
5091	2267	253	5	6539.82	0.00
5092	2267	298	5	14592.86	0.00
5093	2267	266	5	30350.30	10.00
5094	2268	9	5	33482.70	0.00
5095	2268	256	2	18150.18	10.00
5096	2269	267	1	13684.84	10.00
5097	2269	37	2	32619.07	0.00
5098	2269	7	2	25378.21	0.00
5099	2270	98	5	3266.66	0.00
5100	2270	42	2	22822.73	5.00
5101	2271	134	3	32564.64	5.00
5102	2271	203	3	11026.49	0.00
5103	2271	247	2	17789.48	5.00
5104	2272	75	3	27128.62	0.00
5105	2272	169	4	16701.06	0.00
5106	2272	12	5	14641.07	5.00
5107	2273	148	1	33398.34	5.00
5108	2273	257	3	17467.13	0.00
5109	2273	285	3	11004.33	0.00
5110	2274	15	2	5791.98	0.00
5111	2275	77	3	20201.77	5.00
5112	2275	115	2	10525.91	0.00
5113	2276	49	2	10492.89	0.00
5114	2276	152	5	6462.82	0.00
5115	2276	90	1	18037.96	0.00
5116	2276	146	4	23311.85	5.00
5117	2277	140	5	30696.33	0.00
5118	2278	152	5	6462.82	0.00
5119	2278	17	4	1197.66	0.00
5120	2279	173	2	29095.13	0.00
5121	2280	56	2	27131.00	0.00
5122	2280	91	2	17167.44	0.00
5123	2281	293	3	8008.05	0.00
5124	2281	279	2	267.97	10.00
5125	2281	325	2	12556.36	0.00
5126	2281	25	1	21791.44	0.00
5127	2282	44	2	6287.16	0.00
5128	2282	122	1	12832.42	0.00
5129	2283	6	4	17267.65	0.00
5130	2283	316	2	340.50	0.00
5131	2284	186	3	10556.47	0.00
5132	2285	301	2	9631.41	5.00
5133	2285	97	1	14554.24	0.00
5134	2286	272	3	17566.50	0.00
5135	2286	69	5	20390.90	0.00
5136	2286	66	1	17427.59	0.00
5137	2287	1	3	15858.11	0.00
5138	2287	263	4	21676.55	0.00
5139	2287	190	1	2205.28	0.00
5140	2288	1	3	15858.11	10.00
5141	2288	196	3	29103.79	5.00
5142	2289	64	3	6770.97	0.00
5143	2289	261	2	22618.18	5.00
5144	2289	70	5	1664.51	0.00
5145	2289	94	1	19130.25	0.00
5146	2289	88	2	24686.97	0.00
5147	2290	81	5	5090.35	0.00
5148	2290	62	2	8722.93	10.00
5149	2290	112	5	18453.69	0.00
5150	2290	292	5	20342.09	5.00
5151	2291	96	4	8770.71	0.00
5152	2292	71	1	5597.63	5.00
5153	2293	317	1	29835.28	0.00
5154	2293	44	1	6287.16	0.00
5155	2293	201	5	10598.73	0.00
5156	2294	48	5	18931.60	0.00
5157	2294	1	3	15858.11	10.00
5158	2294	169	2	16701.06	5.00
5159	2295	277	3	31244.88	5.00
5160	2295	46	5	32347.10	0.00
5161	2295	151	1	2056.97	0.00
5162	2295	127	5	14788.94	0.00
5163	2296	276	4	21618.85	0.00
5164	2296	45	1	6595.34	0.00
5165	2297	53	3	1943.06	0.00
5166	2297	56	2	27131.00	5.00
5167	2298	229	3	18071.36	0.00
5168	2298	27	1	7946.20	10.00
5169	2298	41	3	11834.74	0.00
5170	2299	287	4	26929.25	0.00
5171	2299	268	3	4330.51	0.00
5172	2299	71	2	5597.63	0.00
5173	2299	15	1	5791.98	0.00
5174	2300	97	2	14554.24	5.00
5175	2300	324	2	35511.98	0.00
5176	2301	289	5	15260.25	0.00
5177	2301	105	3	18324.05	10.00
5178	2302	65	3	28661.97	0.00
5179	2302	27	4	7946.20	0.00
5180	2302	327	4	8103.13	0.00
5181	2303	218	4	9097.50	10.00
5182	2304	73	4	19639.03	5.00
5183	2305	316	2	340.50	0.00
5184	2305	160	5	21111.41	0.00
5185	2305	139	3	25656.53	5.00
5186	2305	10	2	1535.56	0.00
5187	2305	50	2	32360.23	0.00
5188	2306	233	4	16609.25	0.00
5189	2306	23	1	8278.99	0.00
5190	2307	281	4	30869.24	10.00
5191	2307	261	4	22618.18	5.00
5192	2308	32	2	26325.66	0.00
5193	2308	70	3	1664.51	0.00
5194	2309	73	4	19639.03	5.00
5195	2310	200	3	2196.15	0.00
5196	2310	267	1	13684.84	0.00
5197	2311	67	5	6504.44	0.00
5198	2311	85	1	18592.18	0.00
5199	2311	176	1	37396.28	0.00
5200	2312	313	5	8702.12	0.00
5201	2313	34	4	34435.26	10.00
5202	2313	145	3	26900.06	0.00
5203	2314	314	1	21132.86	5.00
5204	2314	237	2	8720.64	0.00
5205	2315	289	5	15260.25	0.00
5206	2316	115	2	10525.91	0.00
5207	2316	139	3	25656.53	5.00
5208	2316	184	1	8109.22	0.00
5209	2317	308	4	14634.32	0.00
5210	2318	108	2	19316.06	10.00
5211	2318	61	1	26987.99	0.00
5212	2318	26	2	28783.35	0.00
5213	2319	133	5	19101.95	0.00
5214	2319	174	2	28177.73	0.00
5215	2320	276	3	21618.85	0.00
5216	2321	187	4	2994.33	5.00
5217	2321	41	2	11834.74	5.00
5218	2321	299	3	11746.03	10.00
5219	2322	152	3	6462.82	5.00
5220	2323	289	5	15260.25	0.00
5221	2323	72	3	3396.14	0.00
5222	2323	9	5	33482.70	0.00
5223	2324	108	4	19316.06	5.00
5224	2324	38	5	11721.98	5.00
5225	2324	51	5	24451.03	0.00
5226	2325	68	2	30368.50	5.00
5227	2326	320	5	19956.45	0.00
5228	2327	236	2	17409.10	0.00
5229	2327	152	5	6462.82	5.00
5230	2328	113	3	26136.34	0.00
5231	2328	2	3	24015.17	5.00
5232	2329	291	4	4154.47	0.00
5233	2329	156	4	32839.76	5.00
5234	2330	223	2	13014.71	0.00
5235	2331	260	3	10785.43	5.00
5236	2331	33	5	4281.57	5.00
5237	2331	7	3	25378.21	0.00
5238	2332	259	5	12682.03	5.00
5239	2333	82	2	32104.18	10.00
5240	2334	223	2	13014.71	5.00
5241	2334	193	4	7905.39	5.00
5242	2334	190	1	2205.28	0.00
5243	2334	189	3	7295.82	5.00
5244	2334	200	2	2196.15	0.00
5245	2335	21	3	28885.66	0.00
5246	2335	41	3	11834.74	0.00
5247	2336	323	4	23922.51	0.00
5248	2336	187	1	2994.33	0.00
5249	2336	169	4	16701.06	10.00
5250	2337	108	5	19316.06	0.00
5251	2337	175	5	431.66	0.00
5252	2337	317	2	29835.28	0.00
5253	2337	75	4	27128.62	5.00
5254	2338	52	4	5082.07	0.00
5255	2339	217	4	3368.23	5.00
5256	2339	187	4	2994.33	0.00
5257	2339	214	1	8996.93	0.00
5258	2340	184	3	8109.22	0.00
5259	2341	60	1	28605.81	0.00
5260	2342	210	5	31221.02	0.00
5261	2342	236	2	17409.10	0.00
5262	2343	144	3	18427.13	0.00
5263	2343	300	4	17477.32	0.00
5264	2343	209	2	14780.53	0.00
5265	2343	80	3	38259.20	0.00
5266	2343	117	4	30916.88	0.00
5267	2344	255	3	37063.14	0.00
5268	2344	307	3	20775.79	0.00
5269	2345	115	1	10525.91	0.00
5270	2345	127	4	14788.94	10.00
5271	2345	213	4	4846.86	0.00
5272	2346	24	3	2371.03	5.00
5273	2346	189	3	7295.82	0.00
5274	2346	110	3	21067.54	10.00
5275	2347	52	3	5082.07	0.00
5276	2347	220	5	18064.29	0.00
5277	2347	186	1	10556.47	0.00
5278	2348	262	4	316.65	0.00
5279	2348	160	4	21111.41	0.00
5280	2349	190	1	2205.28	0.00
5281	2349	232	4	10580.70	5.00
5282	2349	201	2	10598.73	0.00
5283	2349	157	3	11935.44	0.00
5284	2349	220	4	18064.29	0.00
5285	2350	51	5	24451.03	10.00
5286	2351	234	2	27391.73	0.00
5287	2352	173	4	29095.13	0.00
5288	2352	223	5	13014.71	0.00
5289	2352	215	1	13820.74	10.00
5290	2353	255	4	37063.14	0.00
5291	2353	254	4	15942.44	0.00
5292	2353	84	3	9912.34	0.00
5293	2353	100	4	8325.24	0.00
5294	2354	241	4	25166.29	0.00
5295	2354	322	2	13830.37	0.00
5296	2354	61	1	26987.99	10.00
5297	2355	66	5	17427.59	5.00
5298	2355	101	3	7061.05	5.00
5299	2355	131	2	32528.88	0.00
5300	2356	45	4	6595.34	0.00
5301	2357	95	1	873.16	0.00
5302	2357	217	5	3368.23	0.00
5303	2358	305	3	5777.48	10.00
5304	2359	37	2	32619.07	0.00
5305	2359	288	1	23034.91	0.00
5306	2360	324	2	35511.98	5.00
5307	2361	214	1	8996.93	0.00
5308	2361	248	2	5704.91	0.00
5309	2362	21	1	28885.66	0.00
5310	2362	273	2	19698.88	0.00
5311	2362	169	4	16701.06	0.00
5312	2363	94	5	19130.25	0.00
5313	2363	158	5	28494.74	0.00
5314	2364	45	2	6595.34	0.00
5315	2364	33	5	4281.57	5.00
5316	2364	22	5	34187.79	0.00
5317	2365	198	5	26581.95	0.00
5318	2365	110	1	21067.54	10.00
5319	2366	152	3	6462.82	0.00
5320	2367	203	1	11026.49	0.00
5321	2367	208	1	8508.53	0.00
5322	2368	270	2	29941.52	0.00
5323	2368	179	4	1556.32	0.00
5324	2369	7	1	25378.21	0.00
5325	2369	149	1	12786.74	0.00
5326	2369	264	4	3231.57	5.00
5327	2370	299	3	11746.03	5.00
5328	2370	268	1	4330.51	0.00
5329	2370	249	5	340.08	0.00
5330	2370	185	4	27147.39	0.00
5331	2370	272	2	17566.50	0.00
5332	2371	73	5	19639.03	0.00
5333	2371	235	3	23624.80	0.00
5334	2372	135	5	22949.80	10.00
5335	2372	138	5	29598.30	0.00
5336	2372	173	4	29095.13	10.00
5337	2373	32	1	26325.66	0.00
5338	2374	68	1	30368.50	5.00
5339	2374	203	3	11026.49	5.00
5340	2375	266	3	30350.30	0.00
5341	2375	88	4	24686.97	0.00
5342	2376	25	1	21791.44	0.00
5343	2376	184	1	8109.22	0.00
5344	2377	317	2	29835.28	5.00
5345	2377	300	4	17477.32	0.00
5346	2377	223	2	13014.71	10.00
5347	2378	181	5	7647.49	0.00
5348	2378	203	4	11026.49	0.00
5349	2379	230	1	28400.61	5.00
5350	2379	21	3	28885.66	0.00
5351	2380	125	1	30636.77	10.00
5352	2380	139	4	25656.53	0.00
5353	2380	105	2	18324.05	0.00
5354	2381	95	2	873.16	0.00
5355	2381	64	2	6770.97	0.00
5356	2382	46	3	32347.10	0.00
5357	2382	89	1	773.73	0.00
5358	2382	9	5	33482.70	0.00
5359	2382	166	4	18050.91	0.00
5360	2382	250	5	22128.51	0.00
5361	2383	262	2	316.65	10.00
5362	2383	230	3	28400.61	0.00
5363	2383	18	3	31259.75	5.00
5364	2384	62	1	8722.93	0.00
5365	2385	29	1	35509.97	0.00
5366	2385	245	5	20516.11	0.00
5367	2386	224	3	3586.39	0.00
5368	2386	239	3	23450.80	10.00
5369	2387	116	3	23884.82	10.00
5370	2387	143	4	21267.26	10.00
5371	2388	58	4	26928.89	0.00
5372	2388	186	4	10556.47	0.00
5373	2389	42	2	22822.73	0.00
5374	2389	9	2	33482.70	0.00
5375	2389	41	2	11834.74	0.00
5376	2390	255	3	37063.14	0.00
5377	2390	82	1	32104.18	0.00
5378	2390	219	4	27037.61	0.00
5379	2390	258	1	4070.91	0.00
5380	2391	140	2	30696.33	0.00
5381	2392	313	3	8702.12	5.00
5382	2393	141	5	18976.68	0.00
5383	2393	70	1	1664.51	0.00
5384	2393	150	4	6436.80	0.00
5385	2394	115	2	10525.91	0.00
5386	2394	300	1	17477.32	5.00
5387	2395	325	5	12556.36	0.00
5388	2395	194	4	18125.11	0.00
5389	2395	254	3	15942.44	0.00
5390	2396	248	2	5704.91	0.00
5391	2396	220	1	18064.29	10.00
5392	2396	205	4	23585.50	0.00
5393	2396	272	1	17566.50	0.00
5394	2397	232	3	10580.70	5.00
5395	2397	253	3	6539.82	0.00
5396	2398	9	2	33482.70	0.00
5397	2398	269	4	6147.83	0.00
5398	2398	266	3	30350.30	5.00
5399	2399	179	5	1556.32	0.00
5400	2399	130	5	21694.52	0.00
5401	2399	84	4	9912.34	0.00
5402	2400	25	5	21791.44	0.00
5403	2401	23	5	8278.99	0.00
5404	2401	179	3	1556.32	5.00
5405	2401	145	5	26900.06	0.00
5406	2401	234	1	27391.73	5.00
5407	2402	218	5	9097.50	0.00
5408	2402	26	4	28783.35	0.00
5409	2403	113	5	26136.34	0.00
5410	2403	294	3	18000.72	5.00
5411	2403	118	4	26976.56	5.00
5412	2404	5	1	23066.77	0.00
5413	2404	15	2	5791.98	0.00
5414	2404	130	4	21694.52	5.00
5415	2404	93	3	2239.83	0.00
5416	2404	246	5	14044.38	5.00
5417	2405	154	2	3570.74	0.00
5418	2405	324	2	35511.98	5.00
5419	2406	5	2	23066.77	10.00
5420	2406	188	4	27164.75	0.00
5421	2407	323	4	23922.51	0.00
5422	2407	41	1	11834.74	0.00
5423	2408	228	3	31317.59	0.00
5424	2408	284	3	13885.78	0.00
5425	2408	32	2	26325.66	0.00
5426	2409	96	5	8770.71	0.00
5427	2409	135	5	22949.80	0.00
5428	2410	168	2	4961.32	0.00
5429	2410	293	5	8008.05	0.00
5430	2411	21	3	28885.66	0.00
5431	2412	267	5	13684.84	5.00
5432	2412	205	4	23585.50	0.00
5433	2413	43	1	29453.15	0.00
5434	2413	197	4	13698.28	10.00
5435	2413	166	4	18050.91	5.00
5436	2413	256	1	18150.18	0.00
5437	2414	100	4	8325.24	10.00
5438	2414	67	3	6504.44	0.00
5439	2415	17	4	1197.66	0.00
5440	2415	93	4	2239.83	0.00
5441	2415	175	2	431.66	0.00
5442	2415	327	5	8103.13	0.00
5443	2416	110	1	21067.54	0.00
5444	2416	219	2	27037.61	5.00
5445	2417	86	3	27867.51	0.00
5446	2418	184	4	8109.22	0.00
5447	2418	141	5	18976.68	5.00
5448	2419	136	1	9436.00	0.00
5449	2420	307	4	20775.79	0.00
5450	2420	305	2	5777.48	0.00
5451	2421	73	5	19639.03	0.00
5452	2421	273	5	19698.88	0.00
5453	2422	57	1	25319.11	0.00
5454	2423	85	2	18592.18	0.00
5455	2423	102	5	19901.11	0.00
5456	2424	126	4	18009.84	5.00
5457	2424	78	2	21716.19	0.00
5458	2425	251	3	28879.67	10.00
5459	2426	51	2	24451.03	0.00
5460	2426	53	4	1943.06	10.00
5461	2426	219	5	27037.61	5.00
5462	2427	229	3	18071.36	0.00
5463	2427	34	3	34435.26	0.00
5464	2427	258	4	4070.91	0.00
5465	2428	197	3	13698.28	0.00
5466	2428	104	2	31420.14	0.00
5467	2428	60	5	28605.81	5.00
5468	2429	238	5	18623.67	5.00
5469	2430	57	1	25319.11	0.00
5470	2430	48	5	18931.60	0.00
5471	2430	266	3	30350.30	5.00
5472	2430	294	3	18000.72	0.00
5473	2431	329	1	21671.36	0.00
5474	2432	116	5	23884.82	0.00
5475	2432	171	2	1914.19	0.00
5476	2432	285	3	11004.33	0.00
5477	2432	278	5	12560.12	5.00
5478	2433	281	1	30869.24	0.00
5479	2433	149	3	12786.74	0.00
5480	2433	82	5	32104.18	0.00
5481	2434	240	4	6679.87	0.00
5482	2434	174	2	28177.73	5.00
5483	2435	287	1	26929.25	0.00
5484	2435	265	3	33033.81	10.00
5485	2436	303	2	19580.63	0.00
5486	2437	103	2	20005.99	0.00
5487	2437	104	2	31420.14	10.00
5488	2437	251	3	28879.67	5.00
5489	2438	308	3	14634.32	0.00
5490	2438	326	5	13740.29	0.00
5491	2439	75	1	27128.62	0.00
5492	2440	240	2	6679.87	0.00
5493	2441	293	1	8008.05	0.00
5494	2441	66	5	17427.59	0.00
5495	2442	142	4	32902.97	0.00
5496	2442	272	2	17566.50	0.00
5497	2442	84	3	9912.34	0.00
5498	2442	289	5	15260.25	0.00
5499	2443	295	1	15122.86	0.00
5500	2444	219	2	27037.61	5.00
5501	2444	191	3	13943.67	0.00
5502	2444	78	3	21716.19	0.00
5503	2444	34	4	34435.26	0.00
5504	2444	322	2	13830.37	5.00
5505	2445	20	3	21995.92	10.00
5506	2445	218	4	9097.50	5.00
5507	2445	215	1	13820.74	10.00
5508	2445	180	4	18260.88	10.00
5509	2445	134	4	32564.64	0.00
5510	2446	290	4	20830.98	5.00
5511	2446	192	3	22314.85	0.00
5512	2446	187	5	2994.33	5.00
5513	2447	67	2	6504.44	0.00
5514	2447	176	1	37396.28	0.00
5515	2447	232	1	10580.70	5.00
5516	2447	285	5	11004.33	0.00
5517	2447	131	4	32528.88	0.00
5518	2448	242	5	26069.06	0.00
5519	2448	280	3	18825.63	10.00
5520	2448	42	5	22822.73	5.00
5521	2449	302	5	10847.55	0.00
5522	2449	62	4	8722.93	0.00
5523	2450	239	3	23450.80	0.00
5524	2450	266	4	30350.30	0.00
5525	2451	41	4	11834.74	10.00
5526	2451	177	2	1037.15	5.00
5527	2452	26	1	28783.35	0.00
5528	2453	36	3	1735.10	0.00
5529	2453	293	3	8008.05	5.00
5530	2454	303	1	19580.63	0.00
5531	2454	20	4	21995.92	10.00
5532	2455	214	2	8996.93	0.00
5533	2455	33	1	4281.57	0.00
5534	2455	155	4	2596.48	0.00
5535	2455	217	2	3368.23	0.00
5536	2456	260	4	10785.43	0.00
5537	2456	100	2	8325.24	0.00
5538	2456	229	3	18071.36	0.00
5539	2457	75	2	27128.62	10.00
5540	2457	202	2	32567.80	0.00
5541	2457	10	5	1535.56	0.00
5542	2457	190	2	2205.28	0.00
5543	2457	209	1	14780.53	10.00
5544	2458	119	5	20568.93	5.00
5545	2458	149	4	12786.74	0.00
5546	2458	73	2	19639.03	5.00
5547	2458	53	5	1943.06	0.00
5548	2458	129	2	6063.22	10.00
5549	2459	283	1	18689.10	0.00
5550	2460	267	3	13684.84	0.00
5551	2460	279	5	267.97	0.00
5552	2461	259	2	12682.03	0.00
5553	2461	96	3	8770.71	0.00
5554	2461	220	5	18064.29	5.00
5555	2462	73	3	19639.03	0.00
5556	2462	153	1	32619.22	0.00
5557	2463	58	2	26928.89	0.00
5558	2463	111	4	9004.05	0.00
5559	2464	284	2	13885.78	0.00
5560	2464	266	4	30350.30	0.00
5561	2464	81	1	5090.35	5.00
5562	2465	242	3	26069.06	5.00
5563	2465	26	1	28783.35	5.00
5564	2465	191	3	13943.67	0.00
5565	2465	164	4	15959.84	0.00
5566	2466	152	1	6462.82	10.00
5567	2467	318	4	32370.18	0.00
5568	2467	21	2	28885.66	5.00
5569	2468	315	1	19913.45	0.00
5570	2469	241	1	25166.29	0.00
5571	2470	264	4	3231.57	0.00
5572	2470	290	3	20830.98	5.00
5573	2471	6	3	17267.65	5.00
5574	2471	1	3	15858.11	0.00
5575	2471	142	5	32902.97	0.00
5576	2472	190	4	2205.28	0.00
5577	2472	118	2	26976.56	0.00
5578	2473	295	2	15122.86	0.00
5579	2473	177	3	1037.15	0.00
5580	2474	244	2	10146.51	10.00
5581	2474	62	4	8722.93	10.00
5582	2475	38	2	11721.98	0.00
5583	2475	149	2	12786.74	10.00
5584	2476	297	1	2879.78	5.00
5585	2477	262	2	316.65	0.00
5586	2477	192	1	22314.85	0.00
5587	2477	121	5	3250.20	0.00
5588	2477	160	5	21111.41	10.00
5589	2477	27	5	7946.20	0.00
5590	2478	134	4	32564.64	0.00
5591	2478	18	5	31259.75	0.00
5592	2478	40	4	14719.88	0.00
5593	2478	106	2	8994.82	0.00
5594	2479	252	4	19842.18	0.00
5595	2480	36	1	1735.10	0.00
5596	2481	323	5	23922.51	10.00
5597	2481	308	3	14634.32	0.00
5598	2481	125	4	30636.77	0.00
5599	2481	58	1	26928.89	0.00
5600	2482	168	5	4961.32	0.00
5601	2482	53	1	1943.06	0.00
5602	2482	171	1	1914.19	0.00
5603	2483	325	4	12556.36	10.00
5604	2483	83	4	7497.50	0.00
5605	2484	21	1	28885.66	0.00
5606	2484	30	1	20705.47	10.00
5607	2484	307	5	20775.79	0.00
5608	2485	77	5	20201.77	5.00
5609	2486	135	5	22949.80	0.00
5610	2486	4	5	8942.68	0.00
5611	2487	187	1	2994.33	5.00
5612	2487	109	1	24975.44	0.00
5613	2488	166	2	18050.91	5.00
5614	2488	33	5	4281.57	0.00
5615	2488	216	5	33300.54	0.00
5616	2488	154	4	3570.74	5.00
5617	2489	1	4	15858.11	0.00
5618	2489	21	1	28885.66	5.00
5619	2489	304	5	25507.59	0.00
5620	2490	71	4	5597.63	5.00
5621	2490	283	4	18689.10	10.00
5622	2491	278	4	12560.12	5.00
5623	2491	280	2	18825.63	0.00
5624	2492	178	5	8358.65	0.00
5625	2492	243	1	32934.99	0.00
5626	2493	130	1	21694.52	5.00
5627	2493	52	5	5082.07	0.00
5628	2493	101	2	7061.05	0.00
5629	2493	4	4	8942.68	0.00
5630	2494	216	4	33300.54	0.00
5631	2495	257	4	17467.13	5.00
5632	2495	124	5	10512.87	0.00
5633	2496	15	2	5791.98	0.00
5634	2496	93	2	2239.83	5.00
5635	2496	258	5	4070.91	0.00
5636	2497	160	5	21111.41	5.00
5637	2498	287	1	26929.25	0.00
5638	2498	28	2	20966.76	0.00
5639	2498	119	4	20568.93	0.00
5640	2499	44	2	6287.16	0.00
5641	2499	227	2	35785.16	0.00
5642	2499	237	5	8720.64	0.00
5643	2500	213	5	4846.86	0.00
5644	2501	167	2	6664.74	0.00
5645	2502	218	1	9097.50	0.00
5646	2502	25	1	21791.44	0.00
5647	2503	95	2	873.16	10.00
5648	2504	269	5	6147.83	0.00
5649	2504	270	1	29941.52	0.00
5650	2505	70	3	1664.51	0.00
5651	2506	213	1	4846.86	0.00
5652	2506	180	1	18260.88	0.00
5653	2506	66	3	17427.59	0.00
5654	2507	25	5	21791.44	10.00
5655	2507	179	1	1556.32	0.00
5656	2507	27	4	7946.20	0.00
5657	2507	18	5	31259.75	0.00
5658	2508	322	1	13830.37	5.00
5659	2508	64	3	6770.97	0.00
5660	2508	43	3	29453.15	0.00
5661	2509	176	1	37396.28	10.00
5662	2509	31	5	14239.86	0.00
5663	2509	39	3	3995.01	0.00
5664	2510	203	1	11026.49	0.00
5665	2510	240	1	6679.87	0.00
5666	2511	5	4	23066.77	0.00
5667	2512	310	2	390.07	0.00
5668	2513	56	3	27131.00	0.00
5669	2513	308	3	14634.32	0.00
5670	2513	48	4	18931.60	5.00
5671	2513	17	5	1197.66	5.00
5672	2514	254	3	15942.44	5.00
5673	2515	290	3	20830.98	0.00
5674	2516	152	3	6462.82	10.00
5675	2516	277	1	31244.88	5.00
5676	2516	123	4	16598.57	0.00
5677	2517	214	2	8996.93	0.00
5678	2518	315	2	19913.45	5.00
5679	2518	317	2	29835.28	10.00
5680	2518	29	3	35509.97	0.00
5681	2518	182	1	8176.49	5.00
5682	2519	296	5	21692.65	0.00
5683	2519	36	4	1735.10	0.00
5684	2519	248	4	5704.91	10.00
5685	2520	18	3	31259.75	0.00
5686	2521	283	1	18689.10	0.00
5687	2521	38	3	11721.98	0.00
5688	2522	12	4	14641.07	5.00
5689	2523	219	2	27037.61	10.00
5690	2523	222	4	3056.85	0.00
5691	2524	200	2	2196.15	5.00
5692	2524	53	1	1943.06	0.00
5693	2524	18	4	31259.75	0.00
5694	2524	146	3	23311.85	0.00
5695	2525	74	1	20327.04	0.00
5696	2525	257	4	17467.13	0.00
5697	2526	240	5	6679.87	0.00
5698	2527	220	5	18064.29	0.00
5699	2528	163	4	20880.95	0.00
5700	2528	126	1	18009.84	5.00
5701	2528	134	3	32564.64	10.00
5702	2529	154	3	3570.74	0.00
5703	2530	144	5	18427.13	0.00
5704	2530	211	4	12736.65	0.00
5705	2531	306	5	12630.20	10.00
5706	2531	177	5	1037.15	0.00
5707	2531	50	2	32360.23	0.00
5708	2532	97	1	14554.24	0.00
5709	2532	144	3	18427.13	10.00
5710	2532	316	5	340.50	5.00
5711	2532	156	5	32839.76	0.00
5712	2533	233	2	16609.25	0.00
5713	2533	46	5	32347.10	0.00
5714	2534	211	1	12736.65	0.00
5715	2534	61	2	26987.99	0.00
5716	2534	201	2	10598.73	5.00
5717	2535	321	5	15006.91	0.00
5718	2535	253	5	6539.82	5.00
5719	2535	257	5	17467.13	0.00
5720	2535	228	5	31317.59	0.00
5721	2535	35	2	14893.01	0.00
5722	2536	231	4	6896.87	0.00
5723	2537	153	1	32619.22	0.00
5724	2537	25	1	21791.44	5.00
5725	2538	325	3	12556.36	0.00
5726	2538	170	4	26345.81	0.00
5727	2538	14	1	17741.79	0.00
5728	2538	300	1	17477.32	0.00
5729	2539	94	3	19130.25	5.00
5730	2539	187	5	2994.33	0.00
5731	2540	234	5	27391.73	0.00
5732	2540	102	4	19901.11	0.00
5733	2540	236	3	17409.10	5.00
5734	2541	89	1	773.73	0.00
5735	2541	138	1	29598.30	0.00
5736	2542	98	2	3266.66	0.00
5737	2542	256	1	18150.18	0.00
5738	2542	292	2	20342.09	5.00
5739	2542	325	2	12556.36	5.00
5740	2542	226	1	14516.18	0.00
5741	2543	64	5	6770.97	10.00
5742	2544	11	3	23322.36	0.00
5743	2545	163	2	20880.95	0.00
5744	2545	24	4	2371.03	10.00
5745	2545	88	3	24686.97	5.00
5746	2546	62	3	8722.93	0.00
5747	2546	177	4	1037.15	0.00
5748	2546	194	1	18125.11	0.00
5749	2547	264	2	3231.57	5.00
5750	2548	276	2	21618.85	5.00
5751	2549	18	2	31259.75	5.00
5752	2550	56	4	27131.00	10.00
5753	2550	164	2	15959.84	0.00
5754	2550	74	4	20327.04	0.00
5755	2551	253	4	6539.82	0.00
5756	2551	161	5	30174.43	0.00
5757	2552	230	3	28400.61	0.00
5758	2552	73	1	19639.03	0.00
5759	2553	126	3	18009.84	10.00
5760	2553	217	5	3368.23	0.00
5761	2554	299	2	11746.03	5.00
5762	2554	134	2	32564.64	0.00
5763	2554	302	3	10847.55	0.00
5764	2555	325	5	12556.36	0.00
5765	2556	102	2	19901.11	0.00
5766	2556	41	4	11834.74	0.00
5767	2557	303	4	19580.63	0.00
5768	2557	101	1	7061.05	0.00
5769	2558	260	5	10785.43	5.00
5770	2558	44	2	6287.16	5.00
5771	2559	12	4	14641.07	0.00
5772	2559	216	3	33300.54	0.00
5773	2559	35	1	14893.01	5.00
5774	2560	136	2	9436.00	0.00
5775	2560	294	4	18000.72	10.00
5776	2561	215	3	13820.74	10.00
5777	2562	101	3	7061.05	0.00
5778	2562	139	1	25656.53	0.00
5779	2562	140	5	30696.33	0.00
5780	2563	161	1	30174.43	0.00
5781	2563	304	4	25507.59	0.00
5782	2563	305	4	5777.48	0.00
5783	2564	127	4	14788.94	0.00
5784	2564	161	2	30174.43	5.00
5785	2565	276	5	21618.85	0.00
5786	2565	218	1	9097.50	0.00
5787	2566	105	2	18324.05	0.00
5788	2566	284	1	13885.78	0.00
5789	2566	202	4	32567.80	5.00
5790	2566	169	5	16701.06	0.00
5791	2566	149	5	12786.74	0.00
5792	2567	135	5	22949.80	10.00
5793	2568	313	3	8702.12	5.00
5794	2568	113	4	26136.34	0.00
5795	2569	23	1	8278.99	0.00
5796	2569	50	5	32360.23	0.00
5797	2569	114	4	14824.91	0.00
5798	2570	41	3	11834.74	5.00
5799	2570	64	1	6770.97	0.00
5800	2571	200	3	2196.15	0.00
5801	2572	60	3	28605.81	0.00
5802	2572	5	4	23066.77	0.00
5803	2572	207	4	23472.26	0.00
5804	2572	272	3	17566.50	0.00
5805	2573	297	1	2879.78	0.00
5806	2574	227	3	35785.16	0.00
5807	2575	218	3	9097.50	0.00
5808	2575	154	1	3570.74	0.00
5809	2576	83	3	7497.50	0.00
5810	2577	229	3	18071.36	0.00
5811	2577	222	3	3056.85	0.00
5812	2577	328	2	22158.52	0.00
5813	2578	34	5	34435.26	0.00
5814	2579	194	2	18125.11	5.00
5815	2579	270	1	29941.52	0.00
5816	2580	82	4	32104.18	0.00
5817	2580	296	2	21692.65	0.00
5818	2580	232	1	10580.70	0.00
5819	2581	40	2	14719.88	0.00
5820	2581	111	4	9004.05	0.00
5821	2581	188	5	27164.75	0.00
5822	2581	15	5	5791.98	0.00
5823	2581	329	2	21671.36	0.00
5824	2582	244	4	10146.51	0.00
5825	2583	87	3	25661.61	0.00
5826	2583	149	5	12786.74	10.00
5827	2584	188	3	27164.75	0.00
5828	2584	139	4	25656.53	0.00
5829	2584	290	1	20830.98	0.00
5830	2584	223	2	13014.71	5.00
5831	2584	277	1	31244.88	0.00
5832	2585	47	4	17054.16	10.00
5833	2586	147	3	16118.15	0.00
5834	2586	140	5	30696.33	0.00
5835	2587	89	4	773.73	0.00
5836	2587	140	1	30696.33	0.00
5837	2588	191	3	13943.67	10.00
5838	2588	165	4	10583.30	10.00
5839	2589	19	4	7630.10	0.00
5840	2590	197	4	13698.28	5.00
5841	2590	285	2	11004.33	0.00
5842	2590	22	2	34187.79	0.00
5843	2590	275	5	17459.90	0.00
5844	2590	23	4	8278.99	0.00
5845	2591	164	2	15959.84	10.00
5846	2591	102	5	19901.11	0.00
5847	2592	52	5	5082.07	0.00
5848	2593	311	5	14989.38	0.00
5849	2593	294	1	18000.72	0.00
5850	2593	27	3	7946.20	0.00
5851	2593	186	3	10556.47	0.00
5852	2593	258	3	4070.91	0.00
5853	2594	60	1	28605.81	5.00
5854	2594	35	3	14893.01	0.00
5855	2594	271	1	35488.48	5.00
5856	2594	268	4	4330.51	0.00
5857	2595	110	3	21067.54	0.00
5858	2595	277	5	31244.88	0.00
5859	2596	203	1	11026.49	10.00
5860	2596	126	4	18009.84	0.00
5861	2596	256	5	18150.18	0.00
5862	2597	71	1	5597.63	0.00
5863	2597	202	3	32567.80	0.00
5864	2598	147	5	16118.15	0.00
5865	2599	315	1	19913.45	0.00
5866	2599	11	2	23322.36	5.00
5867	2600	5	1	23066.77	0.00
5868	2601	150	2	6436.80	0.00
5869	2601	304	5	25507.59	0.00
5870	2602	242	4	26069.06	0.00
5871	2603	185	5	27147.39	0.00
5872	2603	123	2	16598.57	0.00
5873	2603	100	2	8325.24	5.00
5874	2604	64	2	6770.97	5.00
5875	2605	64	5	6770.97	10.00
5876	2605	42	3	22822.73	5.00
5877	2606	29	2	35509.97	5.00
5878	2606	254	4	15942.44	0.00
5879	2606	130	3	21694.52	0.00
5880	2607	250	3	22128.51	0.00
5881	2607	197	2	13698.28	0.00
5882	2607	22	3	34187.79	10.00
5883	2607	324	3	35511.98	5.00
5884	2607	110	2	21067.54	5.00
5885	2608	217	3	3368.23	10.00
5886	2609	127	2	14788.94	0.00
5887	2610	82	1	32104.18	5.00
5888	2610	324	2	35511.98	0.00
5889	2610	194	2	18125.11	0.00
5890	2611	52	3	5082.07	0.00
5891	2611	256	3	18150.18	0.00
5892	2612	37	1	32619.07	0.00
5893	2612	234	5	27391.73	5.00
5894	2612	113	1	26136.34	5.00
5895	2613	43	2	29453.15	0.00
5896	2613	295	2	15122.86	0.00
5897	2614	88	2	24686.97	0.00
5898	2614	307	5	20775.79	0.00
5899	2614	224	2	3586.39	0.00
5900	2615	117	5	30916.88	0.00
5901	2615	77	4	20201.77	5.00
5902	2615	16	5	2894.98	0.00
5903	2616	311	2	14989.38	0.00
5904	2616	91	4	17167.44	0.00
5905	2616	313	1	8702.12	0.00
5906	2617	139	3	25656.53	0.00
5907	2617	305	3	5777.48	0.00
5908	2618	238	5	18623.67	0.00
5909	2618	114	2	14824.91	0.00
5910	2618	251	3	28879.67	0.00
5911	2618	76	2	16330.99	0.00
5912	2618	220	3	18064.29	0.00
5913	2619	327	4	8103.13	0.00
5914	2619	324	1	35511.98	0.00
5915	2619	113	5	26136.34	0.00
5916	2620	55	1	25249.73	0.00
5917	2620	200	4	2196.15	0.00
5918	2620	169	4	16701.06	0.00
5919	2620	111	5	9004.05	0.00
5920	2621	227	1	35785.16	5.00
5921	2621	18	4	31259.75	0.00
5922	2621	182	5	8176.49	0.00
5923	2621	245	5	20516.11	0.00
5924	2622	116	2	23884.82	0.00
5925	2623	324	3	35511.98	0.00
5926	2624	172	5	21684.08	0.00
5927	2625	29	1	35509.97	0.00
5928	2625	125	2	30636.77	0.00
5929	2625	134	2	32564.64	0.00
5930	2626	66	1	17427.59	10.00
5931	2626	68	4	30368.50	0.00
5932	2626	17	5	1197.66	10.00
5933	2627	323	5	23922.51	0.00
5934	2627	221	5	4679.42	0.00
5935	2627	21	4	28885.66	0.00
5936	2627	204	1	7103.30	5.00
5937	2628	319	4	28695.55	5.00
5938	2629	277	2	31244.88	10.00
5939	2629	209	5	14780.53	0.00
5940	2630	220	1	18064.29	0.00
5941	2630	288	5	23034.91	0.00
5942	2631	42	1	22822.73	0.00
5943	2631	45	5	6595.34	0.00
5944	2632	270	3	29941.52	0.00
5945	2632	98	5	3266.66	0.00
5946	2633	189	4	7295.82	0.00
5947	2633	98	5	3266.66	5.00
5948	2633	66	2	17427.59	5.00
5949	2633	317	2	29835.28	0.00
5950	2634	125	2	30636.77	0.00
5951	2634	7	2	25378.21	0.00
5952	2634	203	4	11026.49	10.00
5953	2634	166	5	18050.91	0.00
5954	2635	286	4	29466.98	0.00
5955	2636	57	4	25319.11	0.00
5956	2636	38	3	11721.98	10.00
5957	2636	174	3	28177.73	0.00
5958	2636	48	2	18931.60	0.00
5959	2637	192	4	22314.85	0.00
5960	2637	305	4	5777.48	0.00
5961	2638	8	1	28612.40	0.00
5962	2639	96	2	8770.71	0.00
5963	2640	271	3	35488.48	5.00
5964	2640	259	2	12682.03	10.00
5965	2640	273	1	19698.88	0.00
5966	2641	318	3	32370.18	0.00
5967	2641	236	5	17409.10	0.00
5968	2641	126	5	18009.84	0.00
5969	2641	61	2	26987.99	0.00
5970	2641	11	1	23322.36	0.00
5971	2642	140	2	30696.33	5.00
5972	2642	83	1	7497.50	0.00
5973	2642	258	1	4070.91	0.00
5974	2642	75	5	27128.62	10.00
5975	2643	287	5	26929.25	0.00
5976	2644	273	2	19698.88	0.00
5977	2645	328	1	22158.52	10.00
5978	2645	49	1	10492.89	0.00
5979	2645	21	4	28885.66	10.00
5980	2646	307	5	20775.79	0.00
5981	2646	251	1	28879.67	0.00
5982	2646	264	2	3231.57	0.00
5983	2646	155	5	2596.48	0.00
5984	2647	235	1	23624.80	10.00
5985	2647	208	1	8508.53	0.00
5986	2647	219	3	27037.61	0.00
5987	2647	124	1	10512.87	0.00
5988	2648	324	2	35511.98	0.00
5989	2648	143	2	21267.26	0.00
5990	2648	72	1	3396.14	0.00
5991	2648	69	4	20390.90	5.00
5992	2649	178	1	8358.65	0.00
5993	2650	79	2	13282.08	5.00
5994	2650	101	4	7061.05	10.00
5995	2651	298	3	14592.86	5.00
5996	2651	140	3	30696.33	0.00
5997	2652	147	5	16118.15	5.00
5998	2653	213	1	4846.86	5.00
5999	2654	42	4	22822.73	5.00
6000	2655	197	1	13698.28	10.00
6001	2655	115	2	10525.91	0.00
6002	2656	162	4	1341.67	0.00
6003	2657	124	4	10512.87	0.00
6004	2658	17	1	1197.66	5.00
6005	2659	315	1	19913.45	0.00
6006	2659	286	5	29466.98	0.00
6007	2659	280	4	18825.63	0.00
6008	2660	107	2	359.68	0.00
6009	2661	173	2	29095.13	0.00
6010	2661	272	2	17566.50	0.00
6011	2661	220	2	18064.29	5.00
6012	2661	70	2	1664.51	0.00
6013	2662	9	3	33482.70	0.00
6014	2662	63	2	26923.17	0.00
6015	2663	196	4	29103.79	5.00
6016	2664	232	4	10580.70	0.00
6017	2664	216	2	33300.54	0.00
6018	2664	7	1	25378.21	0.00
6019	2665	89	1	773.73	0.00
6020	2666	316	5	340.50	10.00
6021	2666	275	2	17459.90	0.00
6022	2667	128	4	7835.32	0.00
6023	2667	52	3	5082.07	0.00
6024	2668	6	4	17267.65	0.00
6025	2668	77	5	20201.77	0.00
6026	2668	201	1	10598.73	0.00
6027	2668	285	4	11004.33	0.00
6028	2669	219	4	27037.61	10.00
6029	2669	59	5	23956.82	0.00
6030	2669	76	5	16330.99	0.00
6031	2669	144	4	18427.13	0.00
6032	2669	252	4	19842.18	0.00
6033	2670	189	2	7295.82	0.00
6034	2670	307	2	20775.79	0.00
6035	2670	327	4	8103.13	0.00
6036	2670	21	4	28885.66	0.00
6037	2671	279	3	267.97	5.00
6038	2671	94	4	19130.25	0.00
6039	2671	171	3	1914.19	0.00
6040	2672	286	1	29466.98	0.00
6041	2672	88	2	24686.97	0.00
6042	2673	127	2	14788.94	10.00
6043	2673	186	5	10556.47	0.00
6044	2674	136	1	9436.00	10.00
6045	2674	89	4	773.73	5.00
6046	2675	161	2	30174.43	0.00
6047	2676	32	4	26325.66	0.00
6048	2676	173	4	29095.13	0.00
6049	2677	23	2	8278.99	5.00
6050	2677	25	1	21791.44	0.00
6051	2678	103	1	20005.99	10.00
6052	2679	290	1	20830.98	0.00
6053	2679	10	2	1535.56	10.00
6054	2680	100	5	8325.24	0.00
6055	2680	93	1	2239.83	5.00
6056	2680	127	5	14788.94	0.00
6057	2681	220	4	18064.29	0.00
6058	2681	83	1	7497.50	0.00
6059	2682	306	5	12630.20	0.00
6060	2683	279	1	267.97	0.00
6061	2684	196	4	29103.79	0.00
6062	2684	139	5	25656.53	5.00
6063	2685	216	1	33300.54	0.00
6064	2685	166	4	18050.91	0.00
6065	2685	33	3	4281.57	10.00
6066	2685	205	2	23585.50	0.00
6067	2685	179	3	1556.32	0.00
6068	2686	156	2	32839.76	0.00
6069	2686	62	4	8722.93	0.00
6070	2686	187	5	2994.33	0.00
6071	2687	14	1	17741.79	0.00
6072	2688	178	4	8358.65	0.00
6073	2688	29	2	35509.97	5.00
6074	2689	205	2	23585.50	0.00
6075	2689	123	1	16598.57	0.00
6076	2690	153	1	32619.22	10.00
6077	2690	100	2	8325.24	0.00
6078	2690	110	4	21067.54	10.00
6079	2690	221	1	4679.42	0.00
6080	2691	323	4	23922.51	0.00
6081	2691	256	2	18150.18	10.00
6082	2691	17	4	1197.66	5.00
6083	2692	47	4	17054.16	5.00
6084	2693	223	4	13014.71	5.00
6085	2693	9	1	33482.70	0.00
6086	2694	221	1	4679.42	0.00
6087	2694	12	5	14641.07	5.00
6088	2695	299	5	11746.03	10.00
6089	2695	297	3	2879.78	0.00
6090	2695	143	5	21267.26	0.00
6091	2696	44	1	6287.16	0.00
6092	2696	187	5	2994.33	0.00
6093	2696	317	5	29835.28	5.00
6094	2697	89	3	773.73	0.00
6095	2697	72	3	3396.14	0.00
6096	2698	55	3	25249.73	5.00
6097	2698	318	1	32370.18	0.00
6098	2699	20	4	21995.92	0.00
6099	2699	223	1	13014.71	0.00
6100	2699	197	1	13698.28	5.00
6101	2699	13	4	13999.33	5.00
6102	2699	119	1	20568.93	10.00
6103	2700	64	2	6770.97	0.00
6104	2700	126	2	18009.84	0.00
6105	2701	89	3	773.73	0.00
6106	2701	274	2	9735.42	0.00
6107	2701	16	4	2894.98	0.00
6108	2702	192	5	22314.85	0.00
6109	2703	140	1	30696.33	5.00
6110	2703	213	2	4846.86	0.00
6111	2704	59	5	23956.82	0.00
6112	2704	168	4	4961.32	0.00
6113	2705	10	5	1535.56	0.00
6114	2705	323	1	23922.51	0.00
6115	2705	250	5	22128.51	10.00
6116	2706	9	5	33482.70	10.00
6117	2707	177	4	1037.15	5.00
6118	2708	80	5	38259.20	5.00
6119	2708	316	2	340.50	0.00
6120	2709	225	3	27871.38	0.00
6121	2709	35	4	14893.01	0.00
6122	2710	169	1	16701.06	5.00
6123	2710	17	1	1197.66	0.00
6124	2711	292	4	20342.09	0.00
6125	2712	216	3	33300.54	0.00
6126	2712	156	4	32839.76	0.00
6127	2712	228	1	31317.59	0.00
6128	2712	4	4	8942.68	0.00
6129	2713	211	3	12736.65	0.00
6130	2713	69	5	20390.90	0.00
6131	2714	191	1	13943.67	0.00
6132	2715	70	1	1664.51	0.00
6133	2715	257	1	17467.13	5.00
6134	2715	323	3	23922.51	0.00
6135	2716	270	3	29941.52	0.00
6136	2717	250	3	22128.51	5.00
6137	2717	267	2	13684.84	0.00
6138	2718	311	5	14989.38	0.00
6139	2718	141	3	18976.68	0.00
6140	2719	173	1	29095.13	5.00
6141	2719	282	2	26158.78	10.00
6142	2720	71	1	5597.63	0.00
6143	2720	313	3	8702.12	0.00
6144	2721	93	5	2239.83	0.00
6145	2722	268	2	4330.51	10.00
6146	2722	258	2	4070.91	0.00
6147	2722	150	2	6436.80	0.00
6148	2722	35	2	14893.01	10.00
6149	2722	299	3	11746.03	0.00
6150	2723	239	1	23450.80	5.00
6151	2723	263	2	21676.55	0.00
6152	2724	66	5	17427.59	10.00
6153	2724	56	2	27131.00	0.00
6154	2724	302	5	10847.55	0.00
6155	2724	121	1	3250.20	0.00
6156	2725	116	1	23884.82	0.00
6157	2726	160	1	21111.41	0.00
6158	2726	248	5	5704.91	5.00
6159	2726	298	5	14592.86	5.00
6160	2726	232	5	10580.70	10.00
6161	2727	41	3	11834.74	5.00
6162	2727	90	5	18037.96	0.00
6163	2727	9	3	33482.70	0.00
6164	2727	194	2	18125.11	10.00
6165	2727	19	3	7630.10	0.00
6166	2728	67	5	6504.44	0.00
6167	2728	306	4	12630.20	0.00
6168	2729	139	4	25656.53	0.00
6169	2729	104	1	31420.14	0.00
6170	2729	40	5	14719.88	0.00
6171	2729	2	3	24015.17	0.00
6172	2730	4	5	8942.68	0.00
6173	2731	52	4	5082.07	0.00
6174	2731	273	4	19698.88	0.00
6175	2731	288	5	23034.91	5.00
6176	2732	76	2	16330.99	5.00
6177	2732	293	1	8008.05	0.00
6178	2733	262	1	316.65	5.00
6179	2733	11	5	23322.36	5.00
6180	2734	238	1	18623.67	5.00
6181	2734	124	4	10512.87	5.00
6182	2734	88	1	24686.97	0.00
6183	2734	266	2	30350.30	0.00
6184	2735	285	4	11004.33	10.00
6185	2735	318	3	32370.18	0.00
6186	2735	10	3	1535.56	0.00
6187	2735	221	3	4679.42	0.00
6188	2736	12	1	14641.07	0.00
6189	2736	26	4	28783.35	0.00
6190	2736	77	4	20201.77	0.00
6191	2736	223	2	13014.71	0.00
6192	2736	253	5	6539.82	10.00
6193	2737	108	1	19316.06	0.00
6194	2738	220	1	18064.29	0.00
6195	2738	49	5	10492.89	0.00
6196	2739	89	5	773.73	0.00
6197	2739	60	2	28605.81	0.00
6198	2739	260	1	10785.43	5.00
6199	2739	190	3	2205.28	0.00
6200	2740	298	3	14592.86	0.00
6201	2741	320	1	19956.45	0.00
6202	2741	240	4	6679.87	5.00
6203	2741	206	1	6045.35	0.00
6204	2741	323	4	23922.51	0.00
6205	2742	11	5	23322.36	0.00
6206	2743	244	4	10146.51	0.00
6207	2743	119	3	20568.93	0.00
6208	2743	227	4	35785.16	5.00
6209	2743	283	5	18689.10	0.00
6210	2744	248	3	5704.91	0.00
6211	2744	85	2	18592.18	0.00
6212	2744	291	3	4154.47	0.00
6213	2744	22	4	34187.79	10.00
6214	2744	98	2	3266.66	0.00
6215	2745	249	2	340.08	0.00
6216	2746	15	2	5791.98	0.00
6217	2746	204	2	7103.30	0.00
6218	2747	185	1	27147.39	0.00
6219	2747	39	5	3995.01	0.00
6220	2747	24	5	2371.03	5.00
6221	2748	140	4	30696.33	0.00
6222	2748	268	1	4330.51	0.00
6223	2749	168	5	4961.32	0.00
6224	2750	44	5	6287.16	0.00
6225	2750	30	1	20705.47	10.00
6226	2751	175	5	431.66	0.00
6227	2752	185	4	27147.39	0.00
6228	2752	312	3	7030.98	0.00
6229	2753	142	5	32902.97	10.00
6230	2753	201	5	10598.73	0.00
6231	2754	99	1	16911.90	0.00
6232	2755	120	3	6107.02	0.00
6233	2755	201	1	10598.73	0.00
6234	2755	101	3	7061.05	0.00
6235	2755	239	5	23450.80	5.00
6236	2756	234	2	27391.73	0.00
6237	2756	254	4	15942.44	0.00
6238	2756	277	4	31244.88	0.00
6239	2757	156	3	32839.76	10.00
6240	2757	204	4	7103.30	0.00
6241	2757	136	2	9436.00	0.00
6242	2758	70	5	1664.51	5.00
6243	2758	211	3	12736.65	5.00
6244	2758	220	2	18064.29	0.00
6245	2758	287	4	26929.25	10.00
6246	2759	305	1	5777.48	0.00
6247	2760	68	1	30368.50	0.00
6248	2760	318	3	32370.18	0.00
6249	2761	254	3	15942.44	0.00
6250	2761	291	3	4154.47	0.00
6251	2762	171	4	1914.19	0.00
6252	2762	283	3	18689.10	10.00
6253	2762	212	2	13620.27	0.00
6254	2763	132	3	11440.30	5.00
6255	2764	272	2	17566.50	5.00
6256	2765	77	2	20201.77	0.00
6257	2765	141	5	18976.68	5.00
6258	2765	15	1	5791.98	0.00
6259	2766	298	4	14592.86	0.00
6260	2766	145	3	26900.06	10.00
6261	2766	100	1	8325.24	0.00
6262	2766	316	2	340.50	0.00
6263	2767	67	5	6504.44	0.00
6264	2768	155	4	2596.48	5.00
6265	2768	21	3	28885.66	0.00
6266	2768	63	1	26923.17	0.00
6267	2768	227	5	35785.16	0.00
6268	2769	190	1	2205.28	0.00
6269	2770	219	1	27037.61	0.00
6270	2770	232	2	10580.70	5.00
6271	2771	38	5	11721.98	5.00
6272	2771	213	2	4846.86	5.00
6273	2772	286	4	29466.98	0.00
6274	2772	232	4	10580.70	0.00
6275	2772	238	4	18623.67	0.00
6276	2773	2	4	24015.17	0.00
6277	2774	249	5	340.08	5.00
6278	2774	284	2	13885.78	0.00
6279	2774	90	1	18037.96	5.00
6280	2774	38	1	11721.98	0.00
6281	2775	130	3	21694.52	0.00
6282	2775	202	4	32567.80	10.00
6283	2776	227	2	35785.16	0.00
6284	2776	199	3	31720.32	0.00
6285	2777	99	1	16911.90	5.00
6286	2777	50	3	32360.23	0.00
6287	2777	45	5	6595.34	0.00
6288	2778	241	3	25166.29	0.00
6289	2778	141	3	18976.68	0.00
6290	2779	106	2	8994.82	10.00
6291	2780	192	4	22314.85	0.00
6292	2781	96	2	8770.71	10.00
6293	2781	113	2	26136.34	0.00
6294	2782	150	4	6436.80	0.00
6295	2783	150	4	6436.80	10.00
6296	2783	198	1	26581.95	0.00
6297	2784	271	1	35488.48	5.00
6298	2785	245	5	20516.11	0.00
6299	2786	250	1	22128.51	0.00
6300	2786	310	3	390.07	0.00
6301	2787	82	4	32104.18	0.00
6302	2787	251	1	28879.67	0.00
6303	2788	253	2	6539.82	10.00
6304	2788	165	4	10583.30	0.00
6305	2788	8	2	28612.40	0.00
6306	2788	239	3	23450.80	0.00
6307	2789	204	2	7103.30	0.00
6308	2789	128	5	7835.32	10.00
6309	2789	84	5	9912.34	5.00
6310	2789	88	4	24686.97	0.00
6311	2790	41	1	11834.74	0.00
6312	2790	54	4	16118.63	0.00
6313	2790	43	5	29453.15	5.00
6314	2790	109	4	24975.44	5.00
6315	2791	302	5	10847.55	0.00
6316	2791	221	1	4679.42	0.00
6317	2792	251	3	28879.67	0.00
6318	2792	49	5	10492.89	0.00
6319	2793	187	1	2994.33	0.00
6320	2793	298	2	14592.86	10.00
6321	2793	253	1	6539.82	10.00
6322	2794	38	2	11721.98	0.00
6323	2795	318	1	32370.18	0.00
6324	2795	228	4	31317.59	5.00
6325	2796	56	4	27131.00	0.00
6326	2796	220	3	18064.29	10.00
6327	2797	284	2	13885.78	0.00
6328	2797	133	5	19101.95	0.00
6329	2798	230	5	28400.61	5.00
6330	2799	154	5	3570.74	0.00
6331	2800	58	2	26928.89	5.00
6332	2800	66	5	17427.59	5.00
6333	2800	9	2	33482.70	0.00
6334	2800	209	1	14780.53	0.00
6335	2800	55	5	25249.73	0.00
6336	2801	258	5	4070.91	0.00
6337	2801	234	5	27391.73	5.00
6338	2801	248	2	5704.91	5.00
6339	2801	52	4	5082.07	0.00
6340	2801	188	1	27164.75	10.00
6341	2802	184	5	8109.22	0.00
6342	2803	289	5	15260.25	0.00
6343	2804	297	4	2879.78	0.00
6344	2804	110	3	21067.54	0.00
6345	2805	42	4	22822.73	0.00
6346	2805	69	1	20390.90	0.00
6347	2806	70	5	1664.51	5.00
6348	2807	162	3	1341.67	0.00
6349	2807	194	5	18125.11	5.00
6350	2808	252	4	19842.18	0.00
6351	2808	220	2	18064.29	0.00
6352	2808	321	3	15006.91	10.00
6353	2809	213	4	4846.86	0.00
6354	2810	135	2	22949.80	5.00
6355	2811	71	5	5597.63	0.00
6356	2811	249	2	340.08	0.00
6357	2812	235	4	23624.80	0.00
6358	2812	38	4	11721.98	0.00
6359	2812	208	3	8508.53	0.00
6360	2812	73	1	19639.03	0.00
6361	2812	249	4	340.08	0.00
6362	2813	118	1	26976.56	5.00
6363	2813	41	5	11834.74	5.00
6364	2813	12	4	14641.07	0.00
6365	2813	206	3	6045.35	0.00
6366	2813	202	2	32567.80	10.00
6367	2814	211	5	12736.65	0.00
6368	2814	4	1	8942.68	0.00
6369	2815	8	1	28612.40	0.00
6370	2815	206	4	6045.35	0.00
6371	2815	284	5	13885.78	5.00
6372	2816	1	4	15858.11	5.00
6373	2816	105	2	18324.05	0.00
6374	2817	244	3	10146.51	0.00
6375	2817	166	2	18050.91	5.00
6376	2817	12	1	14641.07	10.00
6377	2817	172	4	21684.08	0.00
6378	2817	324	4	35511.98	10.00
6379	2818	146	2	23311.85	10.00
6380	2818	29	3	35509.97	0.00
6381	2818	193	3	7905.39	5.00
6382	2818	265	5	33033.81	0.00
6383	2819	74	4	20327.04	0.00
6384	2819	110	1	21067.54	0.00
6385	2819	10	3	1535.56	0.00
6386	2820	12	4	14641.07	0.00
6387	2821	191	4	13943.67	0.00
6388	2821	269	3	6147.83	0.00
6389	2822	12	5	14641.07	0.00
6390	2823	51	3	24451.03	5.00
6391	2824	190	3	2205.28	0.00
6392	2824	9	4	33482.70	0.00
6393	2824	233	5	16609.25	0.00
6394	2825	294	2	18000.72	0.00
6395	2826	62	4	8722.93	0.00
6396	2826	292	3	20342.09	5.00
6397	2827	145	2	26900.06	0.00
6398	2828	166	1	18050.91	0.00
6399	2829	219	1	27037.61	0.00
6400	2830	71	2	5597.63	0.00
6401	2831	170	2	26345.81	0.00
6402	2831	217	2	3368.23	0.00
6403	2831	253	3	6539.82	10.00
6404	2831	306	1	12630.20	5.00
6405	2831	317	5	29835.28	10.00
6406	2832	155	5	2596.48	0.00
6407	2833	313	4	8702.12	0.00
6408	2834	286	3	29466.98	0.00
6409	2834	196	2	29103.79	0.00
6410	2834	53	1	1943.06	0.00
6411	2835	114	4	14824.91	5.00
6412	2835	196	4	29103.79	0.00
6413	2835	276	1	21618.85	0.00
6414	2836	261	4	22618.18	0.00
6415	2837	129	3	6063.22	0.00
6416	2838	37	4	32619.07	0.00
6417	2838	276	1	21618.85	0.00
6418	2839	131	5	32528.88	0.00
6419	2839	19	4	7630.10	0.00
6420	2840	119	4	20568.93	0.00
6421	2840	163	2	20880.95	0.00
6422	2840	168	5	4961.32	0.00
6423	2841	43	2	29453.15	10.00
6424	2842	172	5	21684.08	5.00
6425	2843	172	2	21684.08	0.00
6426	2844	148	4	33398.34	0.00
6427	2844	62	2	8722.93	10.00
6428	2844	85	1	18592.18	0.00
6429	2845	201	1	10598.73	5.00
6430	2845	212	5	13620.27	0.00
6431	2845	23	3	8278.99	0.00
6432	2845	315	1	19913.45	5.00
6433	2846	15	3	5791.98	0.00
6434	2846	47	4	17054.16	5.00
6435	2847	172	4	21684.08	10.00
6436	2847	190	4	2205.28	0.00
6437	2847	131	1	32528.88	0.00
6438	2847	78	1	21716.19	5.00
6439	2848	184	5	8109.22	0.00
6440	2848	70	4	1664.51	0.00
6441	2849	262	5	316.65	0.00
6442	2849	11	3	23322.36	10.00
6443	2850	80	3	38259.20	5.00
6444	2850	195	1	17434.24	10.00
6445	2850	15	5	5791.98	10.00
6446	2851	197	2	13698.28	0.00
6447	2851	142	5	32902.97	0.00
6448	2851	49	2	10492.89	0.00
6449	2852	135	5	22949.80	0.00
6450	2853	213	2	4846.86	0.00
6451	2853	217	3	3368.23	0.00
6452	2853	259	5	12682.03	0.00
6453	2853	17	5	1197.66	5.00
6454	2854	325	3	12556.36	5.00
6455	2854	306	2	12630.20	5.00
6456	2854	229	3	18071.36	5.00
6457	2855	20	4	21995.92	0.00
6458	2855	30	3	20705.47	0.00
6459	2855	178	2	8358.65	5.00
6460	2856	319	5	28695.55	0.00
6461	2856	329	1	21671.36	0.00
6462	2856	17	5	1197.66	10.00
6463	2857	127	5	14788.94	5.00
6464	2858	327	2	8103.13	0.00
6465	2858	223	3	13014.71	5.00
6466	2858	47	1	17054.16	10.00
6467	2859	254	3	15942.44	0.00
6468	2860	76	5	16330.99	0.00
6469	2860	64	5	6770.97	10.00
6470	2860	77	4	20201.77	0.00
6471	2860	5	4	23066.77	0.00
6472	2861	229	3	18071.36	5.00
6473	2861	48	3	18931.60	0.00
6474	2861	186	2	10556.47	0.00
6475	2862	214	3	8996.93	5.00
6476	2863	316	3	340.50	0.00
6477	2863	33	3	4281.57	0.00
6478	2863	145	1	26900.06	0.00
6479	2864	282	1	26158.78	0.00
6480	2865	32	4	26325.66	0.00
6481	2865	184	2	8109.22	5.00
6482	2866	208	3	8508.53	5.00
6483	2866	69	1	20390.90	0.00
6484	2867	128	5	7835.32	0.00
6485	2867	13	1	13999.33	0.00
6486	2868	84	3	9912.34	0.00
6487	2869	215	5	13820.74	10.00
6488	2869	320	4	19956.45	5.00
6489	2869	216	4	33300.54	10.00
6490	2869	284	1	13885.78	0.00
6491	2870	319	1	28695.55	0.00
6492	2871	289	4	15260.25	0.00
6493	2871	315	3	19913.45	5.00
6494	2871	223	5	13014.71	0.00
6495	2872	324	4	35511.98	0.00
6496	2873	104	3	31420.14	5.00
6497	2874	40	1	14719.88	0.00
6498	2875	176	1	37396.28	0.00
6499	2875	253	5	6539.82	0.00
6500	2875	321	2	15006.91	10.00
6501	2876	158	3	28494.74	0.00
6502	2876	304	4	25507.59	0.00
6503	2877	220	4	18064.29	5.00
6504	2877	107	3	359.68	0.00
6505	2878	95	4	873.16	5.00
6506	2878	260	4	10785.43	10.00
6507	2879	120	1	6107.02	5.00
6508	2879	129	2	6063.22	0.00
6509	2879	41	3	11834.74	5.00
6510	2880	182	4	8176.49	10.00
6511	2880	26	3	28783.35	0.00
6512	2881	14	3	17741.79	0.00
6513	2882	207	3	23472.26	0.00
6514	2882	292	5	20342.09	0.00
6515	2882	218	5	9097.50	0.00
6516	2883	209	2	14780.53	10.00
6517	2884	32	5	26325.66	5.00
6518	2885	80	3	38259.20	5.00
6519	2886	243	4	32934.99	0.00
6520	2887	99	4	16911.90	0.00
6521	2887	220	4	18064.29	5.00
6522	2888	34	1	34435.26	5.00
6523	2888	54	5	16118.63	10.00
6524	2888	176	2	37396.28	5.00
6525	2888	68	5	30368.50	5.00
6526	2889	296	4	21692.65	0.00
6527	2889	301	2	9631.41	5.00
6528	2890	187	2	2994.33	0.00
6529	2890	52	2	5082.07	0.00
6530	2891	220	5	18064.29	10.00
6531	2891	278	4	12560.12	0.00
6532	2892	52	2	5082.07	0.00
6533	2892	73	4	19639.03	5.00
6534	2893	231	3	6896.87	0.00
6535	2893	155	4	2596.48	0.00
6536	2894	80	3	38259.20	0.00
6537	2894	70	5	1664.51	5.00
6538	2895	15	2	5791.98	0.00
6539	2896	317	1	29835.28	0.00
6540	2897	99	5	16911.90	10.00
6541	2898	142	2	32902.97	0.00
6542	2898	30	3	20705.47	0.00
6543	2899	129	2	6063.22	0.00
6544	2900	72	4	3396.14	0.00
6545	2900	70	5	1664.51	0.00
6546	2901	241	3	25166.29	0.00
6547	2901	155	1	2596.48	0.00
6548	2902	84	4	9912.34	0.00
6549	2902	312	2	7030.98	10.00
6550	2903	147	2	16118.15	0.00
6551	2903	166	2	18050.91	5.00
6552	2904	322	3	13830.37	0.00
6553	2904	223	1	13014.71	5.00
6554	2904	30	5	20705.47	0.00
6555	2905	217	5	3368.23	5.00
6556	2906	241	2	25166.29	0.00
6557	2907	45	3	6595.34	0.00
6558	2907	273	4	19698.88	10.00
6559	2908	22	1	34187.79	0.00
6560	2909	128	1	7835.32	10.00
6561	2910	66	3	17427.59	0.00
6562	2910	84	2	9912.34	0.00
6563	2910	214	4	8996.93	0.00
6564	2911	325	1	12556.36	5.00
6565	2911	184	2	8109.22	0.00
6566	2912	156	5	32839.76	0.00
6567	2912	247	2	17789.48	5.00
6568	2912	218	2	9097.50	0.00
6569	2912	144	3	18427.13	0.00
6570	2913	152	2	6462.82	0.00
6571	2913	93	4	2239.83	0.00
6572	2914	131	2	32528.88	5.00
6573	2915	184	3	8109.22	5.00
6574	2916	200	3	2196.15	0.00
6575	2916	21	5	28885.66	10.00
6576	2917	180	5	18260.88	0.00
6577	2917	278	5	12560.12	0.00
6578	2917	257	1	17467.13	0.00
6579	2917	174	3	28177.73	0.00
6580	2918	130	5	21694.52	0.00
6581	2918	141	5	18976.68	0.00
6582	2918	316	5	340.50	5.00
6583	2919	64	1	6770.97	5.00
6584	2919	36	2	1735.10	0.00
6585	2919	115	1	10525.91	5.00
6586	2920	219	1	27037.61	5.00
6587	2921	232	1	10580.70	5.00
6588	2921	215	5	13820.74	0.00
6589	2921	72	1	3396.14	0.00
6590	2921	183	2	5758.05	5.00
6591	2922	265	2	33033.81	10.00
6592	2922	326	2	13740.29	0.00
6593	2922	128	2	7835.32	0.00
6594	2923	29	4	35509.97	0.00
6595	2924	313	4	8702.12	0.00
6596	2924	280	1	18825.63	0.00
6597	2924	281	5	30869.24	0.00
6598	2924	276	3	21618.85	5.00
6599	2925	285	4	11004.33	0.00
6600	2925	28	3	20966.76	0.00
6601	2925	30	1	20705.47	0.00
6602	2925	278	2	12560.12	0.00
6603	2926	194	2	18125.11	0.00
6604	2926	80	4	38259.20	0.00
6605	2926	75	3	27128.62	0.00
6606	2926	124	3	10512.87	0.00
6607	2926	315	3	19913.45	0.00
6608	2927	74	5	20327.04	0.00
6609	2927	8	3	28612.40	0.00
6610	2927	186	2	10556.47	0.00
6611	2927	154	4	3570.74	0.00
6612	2928	318	4	32370.18	5.00
6613	2928	30	2	20705.47	0.00
6614	2929	96	2	8770.71	10.00
6615	2930	314	4	21132.86	0.00
6616	2931	69	1	20390.90	0.00
6617	2931	175	1	431.66	0.00
6618	2932	282	3	26158.78	0.00
6619	2933	266	2	30350.30	0.00
6620	2933	263	4	21676.55	0.00
6621	2934	165	5	10583.30	0.00
6622	2934	304	1	25507.59	0.00
6623	2935	259	3	12682.03	0.00
6624	2935	242	3	26069.06	0.00
6625	2935	248	4	5704.91	10.00
6626	2935	106	4	8994.82	0.00
6627	2936	97	4	14554.24	0.00
6628	2936	247	4	17789.48	10.00
6629	2936	323	2	23922.51	0.00
6630	2936	98	1	3266.66	0.00
6631	2937	63	5	26923.17	0.00
6632	2937	295	4	15122.86	5.00
6633	2938	46	3	32347.10	0.00
6634	2938	96	2	8770.71	10.00
6635	2938	99	2	16911.90	0.00
6636	2939	314	4	21132.86	10.00
6637	2940	113	2	26136.34	0.00
6638	2940	157	5	11935.44	0.00
6639	2940	25	2	21791.44	0.00
6640	2940	223	3	13014.71	0.00
6641	2941	243	4	32934.99	10.00
6642	2941	251	3	28879.67	0.00
6643	2942	142	5	32902.97	0.00
6644	2942	63	5	26923.17	5.00
6645	2942	257	1	17467.13	0.00
6646	2943	269	2	6147.83	0.00
6647	2943	32	4	26325.66	0.00
6648	2943	301	3	9631.41	0.00
6649	2944	34	3	34435.26	10.00
6650	2944	244	3	10146.51	10.00
6651	2945	118	2	26976.56	5.00
6652	2945	308	3	14634.32	0.00
6653	2945	34	3	34435.26	0.00
6654	2946	99	1	16911.90	0.00
6655	2947	239	4	23450.80	0.00
6656	2947	103	2	20005.99	0.00
6657	2947	244	5	10146.51	0.00
6658	2948	128	2	7835.32	0.00
6659	2948	69	2	20390.90	0.00
6660	2948	59	5	23956.82	0.00
6661	2948	174	3	28177.73	0.00
6662	2948	257	4	17467.13	0.00
6663	2949	323	4	23922.51	0.00
6664	2950	318	5	32370.18	0.00
6665	2950	272	4	17566.50	0.00
6666	2951	59	3	23956.82	0.00
6667	2951	225	1	27871.38	0.00
6668	2952	238	1	18623.67	0.00
6669	2953	7	5	25378.21	0.00
6670	2953	200	3	2196.15	0.00
6671	2954	44	5	6287.16	0.00
6672	2954	300	2	17477.32	5.00
6673	2954	63	4	26923.17	0.00
6674	2954	142	5	32902.97	5.00
6675	2954	84	2	9912.34	0.00
6676	2955	200	1	2196.15	5.00
6677	2955	40	4	14719.88	0.00
6678	2956	88	5	24686.97	0.00
6679	2956	232	1	10580.70	0.00
6680	2956	234	3	27391.73	5.00
6681	2957	263	5	21676.55	0.00
6682	2957	313	2	8702.12	5.00
6683	2958	75	4	27128.62	0.00
6684	2959	146	1	23311.85	0.00
6685	2959	329	3	21671.36	0.00
6686	2960	122	2	12832.42	0.00
6687	2961	122	2	12832.42	0.00
6688	2961	57	1	25319.11	0.00
6689	2961	206	2	6045.35	10.00
6690	2961	256	3	18150.18	0.00
6691	2962	300	3	17477.32	10.00
6692	2962	131	2	32528.88	0.00
6693	2962	61	3	26987.99	0.00
6694	2962	314	2	21132.86	10.00
6695	2963	5	2	23066.77	0.00
6696	2964	328	1	22158.52	5.00
6697	2964	11	2	23322.36	0.00
6698	2964	188	2	27164.75	5.00
6699	2964	245	2	20516.11	0.00
6700	2965	2	4	24015.17	0.00
6701	2965	106	2	8994.82	0.00
6702	2965	28	1	20966.76	5.00
6703	2966	134	5	32564.64	0.00
6704	2966	76	4	16330.99	0.00
6705	2967	181	5	7647.49	5.00
6706	2967	251	1	28879.67	5.00
6707	2968	98	1	3266.66	0.00
6708	2969	102	2	19901.11	0.00
6709	2969	27	3	7946.20	0.00
6710	2969	277	1	31244.88	10.00
6711	2969	314	3	21132.86	10.00
6712	2969	308	2	14634.32	5.00
6713	2970	26	1	28783.35	5.00
6714	2970	261	1	22618.18	0.00
6715	2971	37	5	32619.07	10.00
6716	2971	239	2	23450.80	5.00
6717	2971	251	5	28879.67	0.00
6718	2972	113	3	26136.34	10.00
6719	2973	75	2	27128.62	0.00
6720	2974	245	4	20516.11	0.00
6721	2975	91	4	17167.44	0.00
6722	2975	58	4	26928.89	0.00
6723	2975	141	1	18976.68	0.00
6724	2975	82	2	32104.18	0.00
6725	2976	62	4	8722.93	0.00
6726	2977	72	3	3396.14	0.00
6727	2977	33	1	4281.57	0.00
6728	2978	135	1	22949.80	10.00
6729	2979	200	3	2196.15	10.00
6730	2979	145	2	26900.06	0.00
6731	2979	165	5	10583.30	0.00
6732	2980	66	3	17427.59	0.00
6733	2981	50	5	32360.23	0.00
6734	2982	127	1	14788.94	0.00
6735	2982	238	2	18623.67	5.00
6736	2983	312	2	7030.98	0.00
6737	2983	266	2	30350.30	5.00
6738	2983	121	2	3250.20	5.00
6739	2984	226	3	14516.18	0.00
6740	2984	13	3	13999.33	10.00
6741	2984	306	3	12630.20	0.00
6742	2984	283	1	18689.10	0.00
6743	2984	291	1	4154.47	0.00
6744	2985	257	2	17467.13	0.00
6745	2985	274	3	9735.42	10.00
6746	2985	47	3	17054.16	10.00
6747	2986	296	5	21692.65	0.00
6748	2987	259	4	12682.03	0.00
6749	2988	53	4	1943.06	0.00
6750	2989	14	1	17741.79	0.00
6751	2989	159	2	8802.38	5.00
6752	2990	67	4	6504.44	0.00
6753	2991	328	4	22158.52	0.00
6754	2991	3	1	26253.43	5.00
6755	2992	293	4	8008.05	0.00
6756	2993	305	1	5777.48	0.00
6757	2993	241	5	25166.29	5.00
6758	2993	225	1	27871.38	0.00
6759	2993	262	2	316.65	5.00
6760	2994	156	4	32839.76	0.00
6761	2994	279	1	267.97	0.00
6762	2994	121	4	3250.20	0.00
6763	2994	188	4	27164.75	0.00
6764	2994	186	4	10556.47	0.00
6765	2995	150	5	6436.80	0.00
6766	2995	268	3	4330.51	0.00
6767	2996	135	4	22949.80	0.00
6768	2997	274	1	9735.42	0.00
6769	2998	314	1	21132.86	0.00
6770	2998	216	2	33300.54	5.00
6771	2999	82	2	32104.18	0.00
6772	2999	199	1	31720.32	0.00
6773	3000	10	5	1535.56	0.00
6774	3000	145	1	26900.06	0.00
6775	3001	75	5	27128.62	0.00
6776	3001	36	1	1735.10	0.00
6777	3001	231	5	6896.87	10.00
6778	3001	107	2	359.68	5.00
6779	3002	94	1	19130.25	0.00
6780	3002	146	2	23311.85	0.00
6781	3002	245	5	20516.11	0.00
6782	3003	205	1	23585.50	0.00
6783	3003	244	4	10146.51	0.00
6784	3003	120	2	6107.02	5.00
6785	3003	315	1	19913.45	10.00
6786	3004	262	3	316.65	0.00
6787	3004	190	2	2205.28	5.00
6788	3004	274	3	9735.42	0.00
6789	3005	282	4	26158.78	5.00
6790	3005	182	3	8176.49	0.00
6791	3006	265	5	33033.81	0.00
6792	3006	223	1	13014.71	10.00
6793	3006	237	3	8720.64	10.00
6794	3006	174	2	28177.73	10.00
6795	3006	282	4	26158.78	0.00
6796	3007	189	1	7295.82	5.00
6797	3007	192	1	22314.85	5.00
6798	3007	244	2	10146.51	0.00
6799	3007	234	5	27391.73	5.00
6800	3007	81	5	5090.35	0.00
6801	3008	140	3	30696.33	10.00
6802	3008	113	2	26136.34	5.00
6803	3009	53	5	1943.06	0.00
6804	3010	41	5	11834.74	0.00
6805	3010	84	3	9912.34	5.00
6806	3011	190	5	2205.28	0.00
6807	3011	114	4	14824.91	5.00
6808	3011	324	4	35511.98	0.00
6809	3011	2	4	24015.17	0.00
6810	3012	210	2	31221.02	0.00
6811	3013	143	4	21267.26	10.00
6812	3014	298	3	14592.86	0.00
6813	3014	220	4	18064.29	0.00
6814	3014	241	2	25166.29	0.00
6815	3015	183	2	5758.05	0.00
6816	3016	187	4	2994.33	10.00
6817	3016	171	4	1914.19	0.00
6818	3017	63	1	26923.17	0.00
6819	3017	57	3	25319.11	0.00
6820	3017	84	3	9912.34	0.00
6821	3018	125	3	30636.77	0.00
6822	3018	25	3	21791.44	0.00
6823	3019	105	4	18324.05	5.00
6824	3019	272	4	17566.50	0.00
6825	3019	235	3	23624.80	0.00
6826	3019	81	2	5090.35	0.00
6827	3020	91	2	17167.44	0.00
6828	3020	147	3	16118.15	0.00
6829	3021	67	5	6504.44	0.00
6830	3021	127	4	14788.94	0.00
6831	3021	78	4	21716.19	0.00
6832	3021	279	5	267.97	10.00
6833	3022	63	5	26923.17	5.00
6834	3022	280	2	18825.63	0.00
6835	3022	221	5	4679.42	0.00
6836	3023	176	3	37396.28	0.00
6837	3023	134	4	32564.64	0.00
6838	3023	98	1	3266.66	0.00
6839	3024	29	5	35509.97	0.00
6840	3024	112	1	18453.69	5.00
6841	3025	272	1	17566.50	0.00
6842	3025	238	5	18623.67	5.00
6843	3026	291	4	4154.47	0.00
6844	3026	102	2	19901.11	5.00
6845	3026	59	3	23956.82	0.00
6846	3026	281	3	30869.24	0.00
6847	3027	72	2	3396.14	0.00
6848	3027	97	1	14554.24	0.00
6849	3028	291	2	4154.47	0.00
6850	3028	126	2	18009.84	0.00
6851	3028	284	5	13885.78	0.00
6852	3028	316	2	340.50	0.00
6853	3028	279	5	267.97	0.00
6854	3029	282	5	26158.78	10.00
6855	3029	83	5	7497.50	0.00
6856	3029	314	5	21132.86	5.00
6857	3030	265	5	33033.81	0.00
6858	3031	172	4	21684.08	0.00
6859	3031	35	4	14893.01	0.00
6860	3031	180	2	18260.88	0.00
6861	3031	176	1	37396.28	0.00
6862	3032	151	4	2056.97	0.00
6863	3033	246	2	14044.38	0.00
6864	3033	31	1	14239.86	10.00
6865	3033	151	5	2056.97	5.00
6866	3034	310	5	390.07	0.00
6867	3034	73	3	19639.03	0.00
6868	3035	326	4	13740.29	0.00
6869	3036	123	1	16598.57	10.00
6870	3036	262	4	316.65	5.00
6871	3037	5	2	23066.77	10.00
6872	3038	6	5	17267.65	0.00
6873	3038	139	1	25656.53	5.00
6874	3039	240	3	6679.87	0.00
6875	3039	11	4	23322.36	0.00
6876	3040	27	2	7946.20	0.00
6877	3041	117	4	30916.88	0.00
6878	3042	163	3	20880.95	0.00
6879	3042	189	5	7295.82	0.00
6880	3042	249	2	340.08	0.00
6881	3042	267	1	13684.84	0.00
6882	3043	260	5	10785.43	0.00
6883	3043	261	1	22618.18	0.00
6884	3043	219	4	27037.61	5.00
6885	3044	8	5	28612.40	0.00
6886	3044	316	4	340.50	0.00
6887	3044	158	3	28494.74	0.00
6888	3044	41	4	11834.74	0.00
6889	3045	327	2	8103.13	5.00
6890	3045	132	5	11440.30	10.00
6891	3045	180	1	18260.88	0.00
6892	3046	179	2	1556.32	0.00
6893	3046	103	3	20005.99	0.00
6894	3046	159	2	8802.38	0.00
6895	3046	5	5	23066.77	0.00
6896	3046	187	1	2994.33	0.00
6897	3047	119	3	20568.93	0.00
6898	3047	139	1	25656.53	5.00
6899	3048	14	2	17741.79	0.00
6900	3048	241	3	25166.29	5.00
6901	3049	128	4	7835.32	0.00
6902	3049	116	5	23884.82	0.00
6903	3049	315	1	19913.45	0.00
6904	3050	16	4	2894.98	0.00
6905	3050	94	2	19130.25	5.00
6906	3051	247	2	17789.48	10.00
6907	3051	83	2	7497.50	10.00
6908	3052	217	4	3368.23	0.00
6909	3052	58	2	26928.89	5.00
6910	3052	240	5	6679.87	5.00
6911	3052	57	3	25319.11	0.00
6912	3053	260	3	10785.43	0.00
6913	3053	49	3	10492.89	0.00
6914	3053	15	3	5791.98	0.00
6915	3054	109	3	24975.44	0.00
6916	3054	188	1	27164.75	10.00
6917	3055	323	4	23922.51	0.00
6918	3055	174	3	28177.73	0.00
6919	3055	243	1	32934.99	0.00
6920	3055	317	5	29835.28	0.00
6921	3056	156	1	32839.76	5.00
6922	3056	113	2	26136.34	0.00
6923	3057	319	1	28695.55	0.00
6924	3057	44	3	6287.16	0.00
6925	3057	57	3	25319.11	10.00
6926	3058	122	2	12832.42	0.00
6927	3058	5	1	23066.77	0.00
6928	3059	208	2	8508.53	0.00
6929	3059	178	1	8358.65	0.00
6930	3060	329	2	21671.36	5.00
6931	3060	148	4	33398.34	10.00
6932	3060	82	1	32104.18	0.00
6933	3061	152	3	6462.82	0.00
6934	3061	257	1	17467.13	0.00
6935	3062	152	1	6462.82	0.00
6936	3062	173	2	29095.13	0.00
6937	3063	12	5	14641.07	0.00
6938	3064	282	2	26158.78	0.00
6939	3064	227	5	35785.16	0.00
6940	3064	166	4	18050.91	0.00
6941	3065	193	3	7905.39	0.00
6942	3066	302	1	10847.55	5.00
6943	3067	14	3	17741.79	10.00
6944	3067	289	2	15260.25	0.00
6945	3067	251	4	28879.67	0.00
6946	3067	224	4	3586.39	5.00
6947	3068	70	5	1664.51	0.00
6948	3068	7	5	25378.21	0.00
6949	3068	267	5	13684.84	0.00
6950	3069	90	3	18037.96	0.00
6951	3069	292	4	20342.09	0.00
6952	3070	320	1	19956.45	0.00
6953	3070	5	1	23066.77	0.00
6954	3071	143	3	21267.26	0.00
6955	3071	232	1	10580.70	10.00
6956	3072	264	2	3231.57	0.00
6957	3072	63	3	26923.17	5.00
6958	3072	184	5	8109.22	5.00
6959	3072	235	5	23624.80	0.00
6960	3073	10	2	1535.56	0.00
6961	3074	272	3	17566.50	0.00
6962	3074	63	3	26923.17	10.00
6963	3074	305	3	5777.48	0.00
6964	3074	236	3	17409.10	5.00
6965	3074	30	5	20705.47	0.00
6966	3075	6	4	17267.65	0.00
6967	3075	101	5	7061.05	0.00
6968	3076	48	1	18931.60	0.00
6969	3076	285	3	11004.33	0.00
6970	3077	209	3	14780.53	0.00
6971	3077	9	1	33482.70	5.00
6972	3078	119	3	20568.93	0.00
6973	3078	282	2	26158.78	0.00
6974	3079	119	5	20568.93	5.00
6975	3079	152	4	6462.82	0.00
6976	3079	102	5	19901.11	0.00
6977	3080	125	1	30636.77	0.00
6978	3080	260	3	10785.43	0.00
6979	3081	88	3	24686.97	5.00
6980	3081	311	3	14989.38	0.00
6981	3081	307	5	20775.79	0.00
6982	3081	183	1	5758.05	0.00
6983	3082	130	2	21694.52	5.00
6984	3082	37	1	32619.07	10.00
6985	3083	141	2	18976.68	0.00
6986	3083	129	4	6063.22	0.00
6987	3084	2	2	24015.17	0.00
6988	3084	96	2	8770.71	0.00
6989	3084	71	4	5597.63	5.00
6990	3085	118	2	26976.56	0.00
6991	3086	71	5	5597.63	0.00
6992	3086	269	4	6147.83	5.00
6993	3086	257	2	17467.13	10.00
6994	3087	16	3	2894.98	0.00
6995	3087	30	4	20705.47	5.00
6996	3087	326	1	13740.29	0.00
6997	3088	148	4	33398.34	5.00
6998	3088	56	4	27131.00	0.00
6999	3088	13	4	13999.33	0.00
7000	3089	125	4	30636.77	0.00
7001	3089	282	4	26158.78	5.00
7002	3089	202	2	32567.80	0.00
7003	3089	99	5	16911.90	0.00
7004	3090	242	3	26069.06	5.00
7005	3090	83	2	7497.50	0.00
7006	3090	87	1	25661.61	0.00
7007	3090	264	3	3231.57	10.00
7008	3090	10	2	1535.56	5.00
7009	3091	28	4	20966.76	0.00
7010	3091	275	1	17459.90	0.00
7011	3092	28	5	20966.76	5.00
7012	3093	243	3	32934.99	0.00
7013	3094	231	2	6896.87	0.00
7014	3094	164	1	15959.84	5.00
7015	3094	327	3	8103.13	10.00
7016	3095	89	2	773.73	0.00
7017	3095	103	3	20005.99	10.00
7018	3095	113	1	26136.34	0.00
7019	3095	198	5	26581.95	0.00
7020	3096	26	5	28783.35	0.00
7021	3096	125	1	30636.77	0.00
7022	3097	219	4	27037.61	5.00
7023	3097	133	4	19101.95	0.00
7024	3097	298	5	14592.86	0.00
7025	3097	11	4	23322.36	0.00
7026	3097	125	2	30636.77	0.00
7027	3098	20	1	21995.92	0.00
7028	3099	140	3	30696.33	0.00
7029	3099	6	1	17267.65	5.00
7030	3099	192	5	22314.85	0.00
7031	3099	249	4	340.08	0.00
7032	3099	133	3	19101.95	0.00
7033	3100	12	5	14641.07	0.00
7034	3100	243	2	32934.99	0.00
7035	3101	248	2	5704.91	0.00
7036	3102	170	4	26345.81	0.00
7037	3103	26	4	28783.35	5.00
7038	3103	237	5	8720.64	0.00
7039	3103	86	5	27867.51	5.00
7040	3103	198	5	26581.95	5.00
7041	3104	52	5	5082.07	0.00
7042	3105	308	4	14634.32	0.00
7043	3105	184	3	8109.22	10.00
7044	3106	145	2	26900.06	0.00
7045	3106	96	3	8770.71	0.00
7046	3107	103	2	20005.99	0.00
7047	3107	131	5	32528.88	5.00
7048	3108	158	3	28494.74	0.00
7049	3108	131	1	32528.88	0.00
7050	3109	190	5	2205.28	0.00
7051	3109	158	1	28494.74	0.00
7052	3109	173	4	29095.13	0.00
7053	3109	272	2	17566.50	0.00
7054	3110	163	1	20880.95	5.00
7055	3110	329	2	21671.36	0.00
7056	3110	223	4	13014.71	5.00
7057	3110	207	1	23472.26	0.00
7058	3110	276	4	21618.85	0.00
7059	3111	181	1	7647.49	0.00
7060	3111	166	3	18050.91	0.00
7061	3112	40	3	14719.88	5.00
7062	3113	79	1	13282.08	10.00
7063	3113	24	4	2371.03	0.00
7064	3113	78	4	21716.19	0.00
7065	3114	234	3	27391.73	0.00
7066	3114	179	3	1556.32	0.00
7067	3114	268	4	4330.51	10.00
7068	3114	42	4	22822.73	5.00
7069	3114	106	4	8994.82	5.00
7070	3115	292	4	20342.09	0.00
7071	3116	282	4	26158.78	0.00
7072	3117	3	4	26253.43	5.00
7073	3117	134	4	32564.64	5.00
7074	3117	181	3	7647.49	0.00
7075	3117	319	5	28695.55	0.00
7076	3117	253	1	6539.82	0.00
7077	3118	307	5	20775.79	10.00
7078	3118	86	1	27867.51	0.00
7079	3118	179	3	1556.32	0.00
7080	3118	44	2	6287.16	0.00
7081	3119	285	1	11004.33	0.00
7082	3120	133	1	19101.95	5.00
7083	3120	282	3	26158.78	0.00
7084	3121	312	2	7030.98	0.00
7085	3121	113	5	26136.34	0.00
7086	3122	78	5	21716.19	0.00
7087	3122	321	2	15006.91	0.00
7088	3122	238	4	18623.67	0.00
7089	3123	56	2	27131.00	0.00
7090	3123	136	1	9436.00	0.00
7091	3123	46	5	32347.10	0.00
7092	3124	161	1	30174.43	5.00
7093	3124	42	1	22822.73	0.00
7094	3124	154	5	3570.74	0.00
7095	3124	37	4	32619.07	10.00
7096	3124	91	2	17167.44	5.00
7097	3125	90	4	18037.96	10.00
7098	3125	121	3	3250.20	10.00
7099	3126	63	3	26923.17	0.00
7100	3126	60	3	28605.81	0.00
7101	3127	245	3	20516.11	0.00
7102	3127	98	5	3266.66	0.00
7103	3127	260	1	10785.43	0.00
7104	3128	86	3	27867.51	0.00
7105	3129	217	4	3368.23	5.00
7106	3129	212	1	13620.27	0.00
7107	3129	247	4	17789.48	5.00
7108	3129	268	4	4330.51	0.00
7109	3130	265	2	33033.81	0.00
7110	3131	24	4	2371.03	5.00
7111	3132	225	2	27871.38	0.00
7112	3132	205	4	23585.50	0.00
7113	3132	13	2	13999.33	0.00
7114	3133	296	4	21692.65	0.00
7115	3134	159	1	8802.38	0.00
7116	3135	190	5	2205.28	0.00
7117	3135	246	2	14044.38	0.00
7118	3135	292	2	20342.09	0.00
7119	3136	101	2	7061.05	10.00
7120	3136	170	1	26345.81	0.00
7121	3137	272	4	17566.50	0.00
7122	3137	233	1	16609.25	0.00
7123	3137	184	4	8109.22	0.00
7124	3137	175	5	431.66	0.00
7125	3137	160	1	21111.41	10.00
7126	3138	266	4	30350.30	0.00
7127	3138	10	3	1535.56	0.00
7128	3138	288	1	23034.91	0.00
7129	3139	38	1	11721.98	0.00
7130	3139	19	2	7630.10	0.00
7131	3140	176	2	37396.28	5.00
7132	3140	325	4	12556.36	10.00
7133	3141	168	4	4961.32	5.00
7134	3142	209	5	14780.53	10.00
7135	3142	99	3	16911.90	0.00
7136	3143	72	3	3396.14	0.00
7137	3143	279	3	267.97	0.00
7138	3143	160	1	21111.41	5.00
7139	3143	55	4	25249.73	0.00
7140	3143	307	2	20775.79	0.00
7141	3144	278	3	12560.12	0.00
7142	3144	102	5	19901.11	5.00
7143	3144	293	3	8008.05	0.00
7144	3145	98	4	3266.66	0.00
7145	3145	168	3	4961.32	0.00
7146	3146	239	4	23450.80	0.00
7147	3146	285	5	11004.33	0.00
7148	3147	238	5	18623.67	0.00
7149	3147	266	4	30350.30	0.00
7150	3147	195	5	17434.24	0.00
7151	3147	317	4	29835.28	5.00
7152	3148	306	3	12630.20	0.00
7153	3148	314	5	21132.86	5.00
7154	3149	266	4	30350.30	0.00
7155	3149	166	2	18050.91	0.00
7156	3149	307	4	20775.79	5.00
7157	3150	328	3	22158.52	0.00
7158	3151	194	5	18125.11	0.00
7159	3151	138	1	29598.30	0.00
7160	3152	48	5	18931.60	0.00
7161	3153	193	2	7905.39	0.00
7162	3153	156	1	32839.76	0.00
7163	3153	64	2	6770.97	0.00
7164	3153	3	3	26253.43	0.00
7165	3154	268	2	4330.51	0.00
7166	3154	11	4	23322.36	5.00
7167	3154	273	4	19698.88	0.00
7168	3155	276	1	21618.85	0.00
7169	3155	93	4	2239.83	0.00
7170	3155	227	2	35785.16	0.00
7171	3155	203	1	11026.49	10.00
7172	3156	242	5	26069.06	0.00
7173	3157	51	5	24451.03	10.00
7174	3157	49	5	10492.89	5.00
7175	3158	167	4	6664.74	5.00
7176	3159	294	2	18000.72	0.00
7177	3159	313	2	8702.12	0.00
7178	3159	122	2	12832.42	0.00
7179	3160	131	1	32528.88	5.00
7180	3160	25	4	21791.44	0.00
7181	3161	88	1	24686.97	5.00
7182	3162	238	2	18623.67	0.00
7183	3163	35	3	14893.01	0.00
7184	3163	251	1	28879.67	0.00
7185	3164	281	2	30869.24	0.00
7186	3164	292	3	20342.09	10.00
7187	3164	66	1	17427.59	0.00
7188	3164	231	3	6896.87	0.00
7189	3165	149	4	12786.74	0.00
7190	3166	72	4	3396.14	5.00
7191	3167	72	5	3396.14	10.00
7192	3167	132	4	11440.30	10.00
7193	3167	78	4	21716.19	5.00
7194	3167	298	5	14592.86	0.00
7195	3168	142	4	32902.97	0.00
7196	3168	68	5	30368.50	10.00
7197	3168	198	5	26581.95	0.00
7198	3169	14	1	17741.79	0.00
7199	3170	242	1	26069.06	0.00
7200	3171	210	2	31221.02	0.00
7201	3171	11	1	23322.36	0.00
7202	3171	320	2	19956.45	0.00
7203	3172	58	2	26928.89	0.00
7204	3173	281	1	30869.24	0.00
7205	3174	324	3	35511.98	0.00
7206	3175	227	2	35785.16	0.00
7207	3175	180	5	18260.88	0.00
7208	3175	42	5	22822.73	0.00
7209	3175	173	2	29095.13	0.00
7210	3176	196	2	29103.79	5.00
7211	3176	234	2	27391.73	0.00
7212	3176	39	1	3995.01	0.00
7213	3176	116	2	23884.82	0.00
7214	3176	73	3	19639.03	10.00
7215	3177	117	1	30916.88	5.00
7216	3177	310	3	390.07	0.00
7217	3178	296	3	21692.65	0.00
7218	3179	97	3	14554.24	0.00
7219	3179	69	5	20390.90	0.00
7220	3179	217	2	3368.23	10.00
7221	3180	158	5	28494.74	0.00
7222	3181	154	5	3570.74	5.00
7223	3181	171	1	1914.19	0.00
7224	3182	27	5	7946.20	0.00
7225	3182	30	2	20705.47	0.00
7226	3182	199	5	31720.32	5.00
7227	3182	239	4	23450.80	0.00
7228	3183	178	4	8358.65	0.00
7229	3184	253	3	6539.82	0.00
7230	3185	249	4	340.08	0.00
7231	3185	93	4	2239.83	0.00
7232	3185	109	4	24975.44	5.00
7233	3185	156	3	32839.76	10.00
7234	3185	20	2	21995.92	0.00
7235	3186	305	1	5777.48	10.00
7236	3186	249	2	340.08	5.00
7237	3187	65	1	28661.97	0.00
7238	3188	262	5	316.65	0.00
7239	3188	315	2	19913.45	5.00
7240	3188	105	5	18324.05	10.00
7241	3188	56	5	27131.00	5.00
7242	3188	204	2	7103.30	10.00
7243	3189	326	3	13740.29	0.00
7244	3189	15	5	5791.98	0.00
7245	3190	184	4	8109.22	0.00
7246	3190	88	4	24686.97	0.00
7247	3191	277	1	31244.88	0.00
7248	3192	20	1	21995.92	0.00
7249	3192	100	1	8325.24	5.00
7250	3192	204	4	7103.30	10.00
7251	3193	171	1	1914.19	5.00
7252	3193	56	5	27131.00	0.00
7253	3193	2	1	24015.17	0.00
7254	3193	12	5	14641.07	5.00
7255	3194	139	4	25656.53	0.00
7256	3195	234	3	27391.73	5.00
7257	3196	185	3	27147.39	5.00
7258	3196	294	1	18000.72	0.00
7259	3196	126	4	18009.84	5.00
7260	3197	254	3	15942.44	0.00
7261	3198	145	5	26900.06	0.00
7262	3198	77	5	20201.77	5.00
7263	3198	167	3	6664.74	0.00
7264	3199	159	5	8802.38	0.00
7265	3199	220	4	18064.29	0.00
7266	3199	167	3	6664.74	0.00
7267	3199	46	1	32347.10	5.00
7268	3200	105	2	18324.05	0.00
7269	3201	262	5	316.65	10.00
7270	3201	302	4	10847.55	0.00
7271	3201	133	5	19101.95	0.00
7272	3202	253	2	6539.82	0.00
7273	3202	65	3	28661.97	0.00
7274	3202	221	5	4679.42	0.00
7275	3203	6	1	17267.65	0.00
7276	3203	272	1	17566.50	0.00
7277	3203	83	2	7497.50	0.00
7278	3203	110	1	21067.54	0.00
7279	3204	295	5	15122.86	0.00
7280	3205	213	5	4846.86	0.00
7281	3206	245	5	20516.11	0.00
7282	3207	134	4	32564.64	0.00
7283	3207	194	5	18125.11	0.00
7284	3208	259	1	12682.03	5.00
7285	3208	169	1	16701.06	0.00
7286	3209	78	1	21716.19	0.00
7287	3210	274	1	9735.42	0.00
7288	3210	267	2	13684.84	0.00
7289	3211	314	2	21132.86	0.00
7290	3211	261	2	22618.18	5.00
7291	3211	244	2	10146.51	10.00
7292	3211	138	5	29598.30	10.00
7293	3212	156	4	32839.76	0.00
7294	3212	160	3	21111.41	0.00
7295	3212	205	3	23585.50	10.00
7296	3212	36	4	1735.10	5.00
7297	3212	47	1	17054.16	0.00
7298	3213	316	3	340.50	0.00
7299	3214	325	3	12556.36	10.00
7300	3214	37	4	32619.07	10.00
7301	3215	37	5	32619.07	5.00
7302	3216	118	2	26976.56	0.00
7303	3217	57	1	25319.11	0.00
7304	3217	194	5	18125.11	0.00
7305	3217	243	3	32934.99	0.00
7306	3218	30	4	20705.47	0.00
7307	3219	195	5	17434.24	0.00
7308	3220	216	1	33300.54	0.00
7309	3220	150	4	6436.80	0.00
7310	3221	27	3	7946.20	0.00
7311	3221	173	2	29095.13	0.00
7312	3221	283	2	18689.10	10.00
7313	3221	148	2	33398.34	0.00
7314	3221	151	2	2056.97	5.00
7315	3222	39	4	3995.01	10.00
7316	3222	57	4	25319.11	5.00
7317	3223	306	4	12630.20	0.00
7318	3224	127	2	14788.94	0.00
7319	3225	254	5	15942.44	0.00
7320	3225	154	1	3570.74	5.00
7321	3226	106	2	8994.82	0.00
7322	3226	256	3	18150.18	5.00
7323	3226	181	2	7647.49	5.00
7324	3226	298	2	14592.86	0.00
7325	3226	297	1	2879.78	0.00
7326	3227	303	3	19580.63	0.00
7327	3228	177	5	1037.15	5.00
7328	3228	222	5	3056.85	0.00
7329	3229	310	2	390.07	0.00
7330	3230	209	4	14780.53	0.00
7331	3230	266	4	30350.30	0.00
7332	3230	17	4	1197.66	0.00
7333	3231	98	3	3266.66	5.00
7334	3231	48	4	18931.60	0.00
7335	3232	217	1	3368.23	0.00
7336	3232	78	4	21716.19	5.00
7337	3233	316	5	340.50	0.00
7338	3233	146	3	23311.85	0.00
7339	3234	256	4	18150.18	0.00
7340	3234	70	5	1664.51	0.00
7341	3234	160	4	21111.41	0.00
7342	3234	182	1	8176.49	0.00
7343	3234	166	5	18050.91	0.00
7344	3235	104	2	31420.14	0.00
7345	3236	108	1	19316.06	10.00
7346	3236	316	3	340.50	10.00
7347	3236	290	4	20830.98	0.00
7348	3236	221	5	4679.42	0.00
7349	3237	39	3	3995.01	10.00
7350	3237	295	3	15122.86	0.00
7351	3238	316	1	340.50	0.00
7352	3238	202	5	32567.80	5.00
7353	3239	159	5	8802.38	0.00
7354	3239	44	2	6287.16	10.00
7355	3240	15	3	5791.98	5.00
7356	3241	186	2	10556.47	10.00
7357	3242	90	2	18037.96	10.00
7358	3243	249	1	340.08	0.00
7359	3243	98	4	3266.66	0.00
7360	3244	143	2	21267.26	0.00
7361	3244	173	4	29095.13	0.00
7362	3245	40	3	14719.88	0.00
7363	3245	240	2	6679.87	0.00
7364	3246	177	2	1037.15	0.00
7365	3246	84	5	9912.34	5.00
7366	3247	6	3	17267.65	5.00
7367	3247	182	4	8176.49	0.00
7368	3248	213	4	4846.86	10.00
7369	3248	287	1	26929.25	0.00
7370	3248	271	5	35488.48	0.00
7371	3249	177	4	1037.15	0.00
7372	3250	201	3	10598.73	0.00
7373	3251	209	5	14780.53	5.00
7374	3251	76	4	16330.99	0.00
7375	3252	286	4	29466.98	0.00
7376	3252	282	1	26158.78	5.00
7377	3252	91	4	17167.44	5.00
7378	3253	89	3	773.73	0.00
7379	3253	192	4	22314.85	5.00
7380	3254	272	1	17566.50	10.00
7381	3255	213	3	4846.86	0.00
7382	3255	260	5	10785.43	0.00
7383	3255	78	4	21716.19	0.00
7384	3255	6	1	17267.65	5.00
7385	3256	152	5	6462.82	0.00
7386	3256	87	3	25661.61	0.00
7387	3256	247	5	17789.48	0.00
7388	3257	139	4	25656.53	0.00
7389	3257	71	1	5597.63	0.00
7390	3258	168	5	4961.32	0.00
7391	3258	30	5	20705.47	0.00
7392	3258	170	2	26345.81	0.00
7393	3259	226	3	14516.18	0.00
7394	3259	25	5	21791.44	5.00
7395	3259	192	4	22314.85	0.00
7396	3259	313	3	8702.12	0.00
7397	3260	321	2	15006.91	0.00
7398	3260	111	3	9004.05	0.00
7399	3261	262	2	316.65	0.00
7400	3261	294	5	18000.72	0.00
7401	3261	121	4	3250.20	0.00
7402	3262	19	1	7630.10	0.00
7403	3262	281	1	30869.24	0.00
7404	3262	96	3	8770.71	0.00
7405	3262	74	4	20327.04	0.00
7406	3262	280	5	18825.63	5.00
7407	3263	197	4	13698.28	5.00
7408	3264	264	5	3231.57	5.00
7409	3265	298	5	14592.86	0.00
7410	3265	17	5	1197.66	0.00
7411	3266	73	1	19639.03	5.00
7412	3266	119	1	20568.93	0.00
7413	3267	256	4	18150.18	0.00
7414	3267	204	5	7103.30	5.00
7415	3267	144	2	18427.13	5.00
7416	3268	195	5	17434.24	0.00
7417	3268	127	2	14788.94	10.00
7418	3269	229	1	18071.36	10.00
7419	3270	324	4	35511.98	0.00
7420	3270	298	1	14592.86	0.00
7421	3270	242	3	26069.06	10.00
7422	3270	256	5	18150.18	5.00
7423	3271	31	4	14239.86	0.00
7424	3271	231	2	6896.87	0.00
7425	3272	28	4	20966.76	5.00
7426	3272	133	4	19101.95	0.00
7427	3273	10	1	1535.56	5.00
7428	3274	154	1	3570.74	0.00
7429	3274	193	3	7905.39	5.00
7430	3275	47	2	17054.16	0.00
7431	3275	90	4	18037.96	0.00
7432	3275	328	2	22158.52	0.00
7433	3276	62	5	8722.93	5.00
7434	3276	328	5	22158.52	10.00
7435	3277	164	1	15959.84	0.00
7436	3277	54	5	16118.63	0.00
7437	3278	93	2	2239.83	0.00
7438	3279	86	5	27867.51	0.00
7439	3279	52	4	5082.07	0.00
7440	3280	314	1	21132.86	10.00
7441	3280	80	5	38259.20	5.00
7442	3281	119	2	20568.93	0.00
7443	3281	167	5	6664.74	0.00
7444	3281	305	4	5777.48	0.00
7445	3281	243	2	32934.99	0.00
7446	3282	25	1	21791.44	0.00
7447	3283	158	4	28494.74	0.00
7448	3283	186	3	10556.47	5.00
7449	3284	4	3	8942.68	0.00
7450	3285	168	4	4961.32	0.00
7451	3286	134	5	32564.64	0.00
7452	3286	321	3	15006.91	0.00
7453	3286	5	1	23066.77	0.00
7454	3287	325	4	12556.36	0.00
7455	3287	290	2	20830.98	0.00
7456	3288	145	4	26900.06	0.00
7457	3289	140	1	30696.33	0.00
7458	3289	214	2	8996.93	0.00
7459	3290	13	4	13999.33	0.00
7460	3291	197	1	13698.28	10.00
7461	3291	229	1	18071.36	0.00
7462	3291	130	3	21694.52	0.00
7463	3292	219	5	27037.61	5.00
7464	3292	198	3	26581.95	0.00
7465	3292	300	5	17477.32	0.00
7466	3293	45	3	6595.34	10.00
7467	3293	75	1	27128.62	0.00
7468	3294	244	4	10146.51	0.00
7469	3295	15	3	5791.98	0.00
7470	3296	153	4	32619.22	0.00
7471	3297	327	5	8103.13	0.00
7472	3298	322	3	13830.37	0.00
7473	3299	53	1	1943.06	10.00
7474	3300	163	4	20880.95	0.00
7475	3300	268	4	4330.51	5.00
7476	3300	96	1	8770.71	5.00
7477	3301	236	4	17409.10	0.00
7478	3301	296	2	21692.65	0.00
7479	3302	260	1	10785.43	0.00
7480	3303	156	1	32839.76	0.00
7481	3303	257	2	17467.13	0.00
7482	3304	205	4	23585.50	0.00
7483	3304	104	3	31420.14	0.00
7484	3305	218	4	9097.50	0.00
7485	3305	124	5	10512.87	0.00
7486	3305	109	2	24975.44	0.00
7487	3306	223	4	13014.71	0.00
7488	3306	187	4	2994.33	5.00
7489	3306	235	1	23624.80	0.00
7490	3306	84	5	9912.34	5.00
7491	3307	59	3	23956.82	5.00
7492	3308	122	1	12832.42	0.00
7493	3308	261	4	22618.18	0.00
7494	3309	149	4	12786.74	0.00
7495	3309	209	4	14780.53	0.00
7496	3309	36	4	1735.10	5.00
7497	3309	286	3	29466.98	0.00
7498	3310	216	1	33300.54	0.00
7499	3311	295	2	15122.86	0.00
7500	3311	297	2	2879.78	0.00
7501	3311	45	2	6595.34	5.00
7502	3312	16	2	2894.98	0.00
7503	3313	262	1	316.65	0.00
7504	3313	3	3	26253.43	0.00
7505	3314	22	4	34187.79	10.00
7506	3314	290	5	20830.98	5.00
7507	3314	223	4	13014.71	0.00
7508	3315	320	3	19956.45	0.00
7509	3315	221	4	4679.42	10.00
7510	3316	125	5	30636.77	10.00
7511	3316	320	1	19956.45	0.00
7512	3316	89	5	773.73	0.00
7513	3316	247	4	17789.48	0.00
7514	3316	155	1	2596.48	0.00
7515	3317	282	2	26158.78	0.00
7516	3318	19	3	7630.10	0.00
7517	3318	53	4	1943.06	10.00
7518	3319	43	5	29453.15	0.00
7519	3319	326	5	13740.29	0.00
7520	3320	250	2	22128.51	5.00
7521	3320	27	2	7946.20	0.00
7522	3320	124	5	10512.87	0.00
7523	3321	20	3	21995.92	5.00
7524	3322	177	4	1037.15	0.00
7525	3322	190	4	2205.28	5.00
7526	3323	127	5	14788.94	0.00
7527	3323	292	2	20342.09	0.00
7528	3323	156	5	32839.76	5.00
7529	3323	10	3	1535.56	5.00
7530	3324	251	3	28879.67	10.00
7531	3324	226	4	14516.18	0.00
7532	3324	189	2	7295.82	0.00
7533	3324	304	1	25507.59	0.00
7534	3325	131	4	32528.88	0.00
7535	3325	193	3	7905.39	0.00
7536	3326	197	2	13698.28	0.00
7537	3326	106	1	8994.82	0.00
7538	3327	238	5	18623.67	0.00
7539	3327	16	1	2894.98	0.00
7540	3328	57	4	25319.11	0.00
7541	3329	225	2	27871.38	0.00
7542	3329	203	3	11026.49	0.00
7543	3329	35	1	14893.01	0.00
7544	3330	169	3	16701.06	0.00
7545	3330	124	2	10512.87	0.00
7546	3330	279	4	267.97	0.00
7547	3330	133	3	19101.95	0.00
7548	3331	104	5	31420.14	0.00
7549	3331	318	5	32370.18	0.00
7550	3332	18	1	31259.75	0.00
7551	3333	76	5	16330.99	10.00
7552	3333	314	2	21132.86	0.00
7553	3333	86	5	27867.51	5.00
7554	3333	102	5	19901.11	0.00
7555	3333	248	4	5704.91	10.00
7556	3334	195	1	17434.24	0.00
7557	3334	214	1	8996.93	0.00
7558	3335	205	1	23585.50	0.00
7559	3335	182	1	8176.49	0.00
7560	3336	283	5	18689.10	0.00
7561	3336	53	1	1943.06	0.00
7562	3337	183	4	5758.05	0.00
7563	3337	217	2	3368.23	0.00
7564	3337	248	2	5704.91	10.00
7565	3338	276	3	21618.85	5.00
7566	3339	277	2	31244.88	5.00
7567	3339	18	5	31259.75	5.00
7568	3339	13	4	13999.33	0.00
7569	3339	218	2	9097.50	0.00
7570	3340	59	5	23956.82	5.00
7571	3340	7	4	25378.21	0.00
7572	3340	309	4	29167.36	0.00
7573	3341	296	1	21692.65	0.00
7574	3341	51	5	24451.03	5.00
7575	3341	197	4	13698.28	0.00
7576	3341	102	4	19901.11	0.00
7577	3342	247	2	17789.48	0.00
7578	3343	242	1	26069.06	0.00
7579	3344	261	4	22618.18	5.00
7580	3345	31	1	14239.86	0.00
7581	3345	96	3	8770.71	10.00
7582	3346	187	4	2994.33	10.00
7583	3346	8	5	28612.40	0.00
7584	3346	56	1	27131.00	0.00
7585	3346	279	2	267.97	0.00
7586	3347	74	3	20327.04	0.00
7587	3347	116	3	23884.82	5.00
7588	3347	68	2	30368.50	0.00
7589	3348	88	2	24686.97	0.00
7590	3349	89	1	773.73	0.00
7591	3349	155	5	2596.48	0.00
7592	3349	102	2	19901.11	0.00
7593	3350	205	1	23585.50	0.00
7594	3351	252	4	19842.18	5.00
7595	3352	131	4	32528.88	10.00
7596	3353	255	2	37063.14	0.00
7597	3354	263	1	21676.55	5.00
7598	3354	53	4	1943.06	10.00
7599	3355	7	4	25378.21	5.00
7600	3355	286	4	29466.98	0.00
7601	3355	250	3	22128.51	0.00
7602	3356	149	3	12786.74	0.00
7603	3356	327	4	8103.13	0.00
7604	3356	98	2	3266.66	0.00
7605	3356	125	1	30636.77	0.00
7606	3357	24	2	2371.03	5.00
7607	3357	102	4	19901.11	5.00
7608	3358	109	4	24975.44	5.00
7609	3359	216	3	33300.54	0.00
7610	3359	12	2	14641.07	10.00
7611	3360	50	4	32360.23	0.00
7612	3360	58	3	26928.89	10.00
7613	3360	203	3	11026.49	0.00
7614	3360	121	4	3250.20	0.00
7615	3361	87	3	25661.61	5.00
7616	3362	126	3	18009.84	0.00
7617	3363	222	1	3056.85	0.00
7618	3364	96	5	8770.71	0.00
7619	3364	66	4	17427.59	0.00
7620	3364	206	5	6045.35	0.00
7621	3365	310	3	390.07	5.00
7622	3366	251	3	28879.67	0.00
7623	3367	2	5	24015.17	0.00
7624	3367	96	3	8770.71	10.00
7625	3367	292	5	20342.09	5.00
7626	3367	122	5	12832.42	0.00
7627	3368	286	3	29466.98	0.00
7628	3368	291	3	4154.47	5.00
7629	3369	269	4	6147.83	0.00
7630	3369	47	1	17054.16	0.00
7631	3370	75	2	27128.62	5.00
7632	3370	288	1	23034.91	0.00
7633	3370	150	3	6436.80	5.00
7634	3370	153	2	32619.22	0.00
7635	3371	118	1	26976.56	0.00
7636	3371	20	2	21995.92	0.00
7637	3371	32	4	26325.66	0.00
7638	3372	67	5	6504.44	0.00
7639	3373	174	5	28177.73	0.00
7640	3374	87	1	25661.61	5.00
7641	3375	26	2	28783.35	0.00
7642	3375	11	4	23322.36	0.00
7643	3376	222	1	3056.85	0.00
7644	3377	327	1	8103.13	0.00
7645	3378	145	2	26900.06	0.00
7646	3378	155	2	2596.48	0.00
7647	3379	181	5	7647.49	0.00
7648	3380	212	5	13620.27	10.00
7649	3380	121	4	3250.20	0.00
7650	3380	8	2	28612.40	10.00
7651	3380	18	2	31259.75	0.00
7652	3381	126	4	18009.84	10.00
7653	3381	311	4	14989.38	10.00
7654	3382	281	1	30869.24	0.00
7655	3383	141	1	18976.68	0.00
7656	3383	75	4	27128.62	0.00
7657	3384	159	3	8802.38	0.00
7658	3384	33	3	4281.57	0.00
7659	3385	271	5	35488.48	0.00
7660	3386	83	3	7497.50	0.00
7661	3386	314	2	21132.86	5.00
7662	3387	264	3	3231.57	5.00
7663	3387	301	2	9631.41	0.00
7664	3388	275	5	17459.90	5.00
7665	3389	260	5	10785.43	0.00
7666	3389	188	5	27164.75	5.00
7667	3389	211	2	12736.65	0.00
7668	3389	114	1	14824.91	0.00
7669	3390	47	4	17054.16	0.00
7670	3391	185	3	27147.39	0.00
7671	3391	48	4	18931.60	0.00
7672	3392	17	5	1197.66	0.00
7673	3392	97	2	14554.24	0.00
7674	3392	70	1	1664.51	5.00
7675	3392	62	5	8722.93	5.00
7676	3393	265	2	33033.81	5.00
7677	3393	144	3	18427.13	0.00
7678	3394	36	4	1735.10	0.00
7679	3395	218	2	9097.50	0.00
7680	3395	283	4	18689.10	0.00
7681	3395	36	4	1735.10	5.00
7682	3396	148	4	33398.34	5.00
7683	3397	171	4	1914.19	0.00
7684	3397	187	2	2994.33	0.00
7685	3397	211	3	12736.65	5.00
7686	3397	63	4	26923.17	0.00
7687	3397	252	3	19842.18	10.00
7688	3398	234	2	27391.73	0.00
7689	3398	305	3	5777.48	0.00
7690	3399	143	4	21267.26	0.00
7691	3400	116	4	23884.82	0.00
7692	3401	147	1	16118.15	0.00
7693	3401	149	4	12786.74	0.00
7694	3401	256	5	18150.18	5.00
7695	3402	198	5	26581.95	0.00
7696	3402	16	1	2894.98	0.00
7697	3402	79	4	13282.08	5.00
7698	3403	220	3	18064.29	0.00
7699	3404	75	4	27128.62	0.00
7700	3404	100	5	8325.24	10.00
7701	3404	183	1	5758.05	5.00
7702	3404	261	5	22618.18	10.00
7703	3405	146	5	23311.85	0.00
7704	3405	269	3	6147.83	0.00
7705	3405	154	1	3570.74	0.00
7706	3405	278	2	12560.12	10.00
7707	3405	326	5	13740.29	0.00
7708	3406	218	2	9097.50	5.00
7709	3406	318	1	32370.18	0.00
7710	3406	43	2	29453.15	5.00
7711	3406	128	5	7835.32	0.00
7712	3406	285	2	11004.33	0.00
7713	3407	221	5	4679.42	5.00
7714	3407	228	2	31317.59	5.00
7715	3408	209	4	14780.53	5.00
7716	3408	248	4	5704.91	5.00
7717	3408	166	5	18050.91	0.00
7718	3409	204	4	7103.30	5.00
7719	3409	115	5	10525.91	0.00
7720	3409	231	5	6896.87	5.00
7721	3409	286	1	29466.98	5.00
7722	3410	268	3	4330.51	5.00
7723	3410	318	1	32370.18	0.00
7724	3410	247	4	17789.48	0.00
7725	3410	68	4	30368.50	0.00
7726	3411	276	3	21618.85	10.00
7727	3411	234	2	27391.73	5.00
7728	3412	227	4	35785.16	5.00
7729	3412	109	1	24975.44	0.00
7730	3412	85	1	18592.18	0.00
7731	3413	316	3	340.50	0.00
7732	3413	114	4	14824.91	0.00
7733	3413	205	2	23585.50	10.00
7734	3414	15	3	5791.98	0.00
7735	3414	247	5	17789.48	10.00
7736	3415	316	2	340.50	5.00
7737	3415	210	3	31221.02	0.00
7738	3416	74	3	20327.04	0.00
7739	3417	56	3	27131.00	0.00
7740	3417	67	1	6504.44	0.00
7741	3417	123	1	16598.57	5.00
7742	3417	38	5	11721.98	0.00
7743	3418	131	2	32528.88	0.00
7744	3418	176	5	37396.28	10.00
7745	3418	61	3	26987.99	0.00
7746	3418	129	5	6063.22	10.00
7747	3419	310	2	390.07	10.00
7748	3419	302	3	10847.55	0.00
7749	3420	39	3	3995.01	0.00
7750	3421	318	2	32370.18	0.00
7751	3421	71	3	5597.63	0.00
7752	3421	279	2	267.97	0.00
7753	3422	70	1	1664.51	0.00
7754	3422	227	1	35785.16	0.00
7755	3422	32	4	26325.66	0.00
7756	3422	215	2	13820.74	0.00
7757	3423	55	3	25249.73	0.00
7758	3423	253	2	6539.82	0.00
7759	3423	24	4	2371.03	10.00
7760	3423	121	4	3250.20	0.00
7761	3423	68	2	30368.50	5.00
7762	3424	54	1	16118.63	0.00
7763	3424	235	3	23624.80	0.00
7764	3424	31	5	14239.86	0.00
7765	3425	49	4	10492.89	5.00
7766	3425	82	4	32104.18	0.00
7767	3426	276	3	21618.85	10.00
7768	3427	18	5	31259.75	0.00
7769	3428	180	5	18260.88	5.00
7770	3428	88	1	24686.97	0.00
7771	3428	60	5	28605.81	5.00
7772	3428	48	2	18931.60	0.00
7773	3428	312	4	7030.98	0.00
7774	3429	209	2	14780.53	0.00
7775	3430	205	4	23585.50	0.00
7776	3430	140	3	30696.33	0.00
7777	3431	166	4	18050.91	0.00
7778	3432	213	2	4846.86	0.00
7779	3433	324	4	35511.98	5.00
7780	3434	287	1	26929.25	0.00
7781	3434	323	4	23922.51	10.00
7782	3435	38	2	11721.98	0.00
7783	3435	104	3	31420.14	0.00
7784	3435	211	1	12736.65	0.00
7785	3436	48	4	18931.60	5.00
7786	3436	73	3	19639.03	0.00
7787	3436	251	4	28879.67	5.00
7788	3436	27	5	7946.20	5.00
7789	3437	293	5	8008.05	5.00
7790	3438	297	4	2879.78	0.00
7791	3439	123	1	16598.57	5.00
7792	3440	244	5	10146.51	0.00
7793	3441	263	1	21676.55	0.00
7794	3441	172	4	21684.08	0.00
7795	3442	220	3	18064.29	0.00
7796	3443	108	1	19316.06	5.00
7797	3444	226	1	14516.18	0.00
7798	3444	218	1	9097.50	0.00
7799	3445	201	3	10598.73	0.00
7800	3445	12	5	14641.07	0.00
7801	3445	23	3	8278.99	10.00
7802	3446	286	5	29466.98	5.00
7803	3447	227	3	35785.16	0.00
7804	3447	158	1	28494.74	0.00
7805	3448	280	5	18825.63	0.00
7806	3448	67	2	6504.44	5.00
7807	3448	162	3	1341.67	0.00
7808	3449	236	2	17409.10	0.00
7809	3449	106	1	8994.82	10.00
7810	3450	52	4	5082.07	0.00
7811	3450	254	5	15942.44	0.00
7812	3451	107	5	359.68	0.00
7813	3452	6	1	17267.65	0.00
7814	3452	204	5	7103.30	0.00
7815	3452	111	3	9004.05	0.00
7816	3452	56	4	27131.00	0.00
7817	3453	135	5	22949.80	0.00
7818	3454	223	1	13014.71	0.00
7819	3454	306	2	12630.20	10.00
7820	3455	75	1	27128.62	0.00
7821	3456	24	5	2371.03	0.00
7822	3457	270	5	29941.52	0.00
7823	3458	285	5	11004.33	10.00
7824	3458	179	5	1556.32	5.00
7825	3458	12	3	14641.07	0.00
7826	3459	267	2	13684.84	0.00
7827	3460	132	4	11440.30	0.00
7828	3460	201	1	10598.73	0.00
7829	3460	309	1	29167.36	0.00
7830	3460	6	2	17267.65	0.00
7831	3461	76	2	16330.99	0.00
7832	3462	94	2	19130.25	0.00
7833	3462	123	3	16598.57	0.00
7834	3462	192	2	22314.85	0.00
7835	3463	314	2	21132.86	5.00
7836	3464	34	5	34435.26	0.00
7837	3464	279	1	267.97	0.00
7838	3465	226	4	14516.18	0.00
7839	3465	255	4	37063.14	0.00
7840	3466	242	1	26069.06	0.00
7841	3466	63	3	26923.17	5.00
7842	3466	98	5	3266.66	0.00
7843	3467	1	4	15858.11	5.00
7844	3467	21	2	28885.66	0.00
7845	3468	261	5	22618.18	10.00
7846	3468	289	3	15260.25	0.00
7847	3469	301	4	9631.41	0.00
7848	3469	125	1	30636.77	0.00
7849	3470	254	3	15942.44	0.00
7850	3471	40	3	14719.88	0.00
7851	3472	286	5	29466.98	0.00
7852	3473	105	3	18324.05	10.00
7853	3473	36	1	1735.10	0.00
7854	3474	273	3	19698.88	0.00
7855	3474	108	3	19316.06	0.00
7856	3475	285	2	11004.33	0.00
7857	3475	151	4	2056.97	0.00
7858	3476	33	2	4281.57	5.00
7859	3476	227	4	35785.16	0.00
7860	3476	267	1	13684.84	5.00
7861	3476	155	2	2596.48	0.00
7862	3477	293	1	8008.05	10.00
7863	3477	262	4	316.65	0.00
7864	3478	119	3	20568.93	0.00
7865	3478	188	4	27164.75	5.00
7866	3478	77	5	20201.77	0.00
7867	3479	27	3	7946.20	0.00
7868	3479	134	5	32564.64	0.00
7869	3479	95	1	873.16	0.00
7870	3480	294	5	18000.72	0.00
7871	3480	161	5	30174.43	5.00
7872	3480	287	2	26929.25	5.00
7873	3480	295	3	15122.86	5.00
7874	3481	186	3	10556.47	5.00
7875	3481	255	3	37063.14	0.00
7876	3482	182	1	8176.49	0.00
7877	3482	323	2	23922.51	0.00
7878	3483	171	2	1914.19	5.00
7879	3483	73	5	19639.03	0.00
7880	3483	300	1	17477.32	0.00
7881	3484	283	2	18689.10	0.00
7882	3484	178	1	8358.65	0.00
7883	3485	173	1	29095.13	0.00
7884	3485	306	2	12630.20	5.00
7885	3486	237	3	8720.64	0.00
7886	3486	12	1	14641.07	5.00
7887	3487	77	2	20201.77	5.00
7888	3487	143	1	21267.26	0.00
7889	3488	167	5	6664.74	0.00
7890	3488	259	3	12682.03	10.00
7891	3489	113	5	26136.34	0.00
7892	3490	205	1	23585.50	0.00
7893	3491	70	2	1664.51	5.00
7894	3491	202	3	32567.80	5.00
7895	3492	57	2	25319.11	5.00
7896	3492	137	3	18272.97	0.00
7897	3493	185	3	27147.39	0.00
7898	3493	305	1	5777.48	0.00
7899	3494	8	4	28612.40	0.00
7900	3495	249	5	340.08	5.00
7901	3495	317	5	29835.28	0.00
7902	3496	100	4	8325.24	0.00
7903	3497	50	4	32360.23	10.00
7904	3497	177	2	1037.15	0.00
7905	3497	94	5	19130.25	5.00
7906	3498	273	3	19698.88	0.00
7907	3499	297	3	2879.78	0.00
7908	3499	9	1	33482.70	0.00
7909	3500	26	5	28783.35	0.00
7910	3501	86	4	27867.51	0.00
7911	3501	176	3	37396.28	5.00
7912	3501	165	2	10583.30	10.00
7913	3501	265	2	33033.81	0.00
7914	3502	16	2	2894.98	0.00
7915	3503	323	1	23922.51	5.00
7916	3503	178	3	8358.65	0.00
7917	3503	155	2	2596.48	0.00
7918	3504	1	1	15858.11	0.00
7919	3505	236	1	17409.10	0.00
7920	3505	279	2	267.97	0.00
7921	3505	185	1	27147.39	0.00
7922	3505	32	4	26325.66	0.00
7923	3505	214	3	8996.93	0.00
7924	3506	36	3	1735.10	0.00
7925	3507	54	5	16118.63	5.00
7926	3508	89	4	773.73	10.00
7927	3508	86	1	27867.51	0.00
7928	3508	12	3	14641.07	5.00
7929	3509	41	4	11834.74	0.00
7930	3510	227	3	35785.16	0.00
7931	3510	289	1	15260.25	0.00
7932	3510	161	4	30174.43	0.00
7933	3510	11	3	23322.36	5.00
7934	3511	39	5	3995.01	0.00
7935	3511	232	3	10580.70	5.00
7936	3511	253	5	6539.82	0.00
7937	3511	171	5	1914.19	10.00
7938	3512	289	2	15260.25	0.00
7939	3513	158	3	28494.74	0.00
7940	3514	323	4	23922.51	0.00
7941	3514	10	3	1535.56	0.00
7942	3515	165	4	10583.30	0.00
7943	3515	66	5	17427.59	0.00
7944	3516	49	2	10492.89	5.00
7945	3517	258	2	4070.91	10.00
7946	3517	82	1	32104.18	0.00
7947	3518	230	1	28400.61	0.00
7948	3518	5	2	23066.77	0.00
7949	3519	138	4	29598.30	0.00
7950	3519	177	4	1037.15	0.00
7951	3519	37	4	32619.07	0.00
7952	3520	278	3	12560.12	0.00
7953	3521	116	3	23884.82	5.00
7954	3521	63	2	26923.17	10.00
7955	3522	326	2	13740.29	0.00
7956	3522	150	5	6436.80	5.00
7957	3523	289	1	15260.25	0.00
7958	3524	143	5	21267.26	0.00
7959	3524	162	5	1341.67	0.00
7960	3525	296	3	21692.65	5.00
7961	3526	254	5	15942.44	10.00
7962	3526	315	4	19913.45	0.00
7963	3526	172	2	21684.08	0.00
7964	3527	305	2	5777.48	5.00
7965	3527	98	1	3266.66	0.00
7966	3527	326	4	13740.29	5.00
7967	3528	73	1	19639.03	0.00
7968	3529	262	2	316.65	0.00
7969	3529	145	2	26900.06	0.00
7970	3529	173	4	29095.13	0.00
7971	3530	229	2	18071.36	0.00
7972	3530	164	4	15959.84	0.00
7973	3530	77	1	20201.77	0.00
7974	3531	61	5	26987.99	0.00
7975	3532	164	1	15959.84	0.00
7976	3533	164	2	15959.84	0.00
7977	3533	34	5	34435.26	5.00
7978	3534	201	5	10598.73	0.00
7979	3534	89	4	773.73	0.00
7980	3535	252	4	19842.18	0.00
7981	3535	9	3	33482.70	0.00
7982	3536	183	3	5758.05	0.00
7983	3537	132	1	11440.30	0.00
7984	3537	79	1	13282.08	0.00
7985	3538	249	5	340.08	5.00
7986	3538	182	3	8176.49	0.00
7987	3539	8	3	28612.40	0.00
7988	3539	129	5	6063.22	0.00
7989	3540	255	2	37063.14	0.00
7990	3540	270	3	29941.52	0.00
7991	3541	268	4	4330.51	0.00
7992	3541	199	1	31720.32	5.00
7993	3542	228	3	31317.59	0.00
7994	3542	30	5	20705.47	0.00
7995	3542	7	1	25378.21	0.00
7996	3542	225	1	27871.38	0.00
7997	3543	17	2	1197.66	0.00
7998	3544	238	3	18623.67	0.00
7999	3544	237	4	8720.64	0.00
8000	3545	81	3	5090.35	5.00
8001	3545	321	3	15006.91	10.00
8002	3546	15	4	5791.98	10.00
8003	3546	231	3	6896.87	0.00
8004	3547	263	5	21676.55	0.00
8005	3547	296	5	21692.65	0.00
8006	3547	50	4	32360.23	10.00
8007	3547	163	1	20880.95	5.00
8008	3547	191	2	13943.67	0.00
8009	3548	11	2	23322.36	0.00
8010	3548	255	2	37063.14	0.00
8011	3548	152	2	6462.82	10.00
8012	3549	110	1	21067.54	0.00
8013	3549	212	3	13620.27	0.00
8014	3549	7	2	25378.21	0.00
8015	3550	320	1	19956.45	5.00
8016	3551	18	3	31259.75	5.00
8017	3552	109	3	24975.44	0.00
8018	3552	294	3	18000.72	0.00
8019	3553	37	4	32619.07	0.00
8020	3553	262	1	316.65	0.00
8021	3553	156	3	32839.76	0.00
8022	3553	211	3	12736.65	0.00
8023	3554	112	2	18453.69	0.00
8024	3554	120	4	6107.02	5.00
8025	3554	50	3	32360.23	0.00
8026	3555	27	4	7946.20	0.00
8027	3556	212	4	13620.27	5.00
8028	3557	90	5	18037.96	5.00
8029	3557	122	3	12832.42	0.00
8030	3558	14	4	17741.79	5.00
8031	3558	50	5	32360.23	0.00
8032	3559	111	5	9004.05	0.00
8033	3560	141	4	18976.68	0.00
8034	3560	81	3	5090.35	0.00
8035	3561	253	3	6539.82	0.00
8036	3561	184	4	8109.22	0.00
8037	3562	81	2	5090.35	0.00
8038	3563	281	2	30869.24	0.00
8039	3563	35	1	14893.01	0.00
8040	3564	289	1	15260.25	0.00
8041	3565	42	2	22822.73	5.00
8042	3565	295	4	15122.86	0.00
8043	3565	270	1	29941.52	0.00
8044	3566	255	3	37063.14	10.00
8045	3566	266	5	30350.30	0.00
8046	3567	63	1	26923.17	5.00
8047	3567	80	4	38259.20	5.00
8048	3568	133	3	19101.95	5.00
8049	3568	160	3	21111.41	0.00
8050	3568	56	2	27131.00	10.00
8051	3569	247	5	17789.48	0.00
8052	3569	172	5	21684.08	0.00
8053	3569	308	2	14634.32	10.00
8054	3570	60	1	28605.81	10.00
8055	3570	259	5	12682.03	0.00
8056	3570	8	3	28612.40	0.00
8057	3571	163	3	20880.95	0.00
8058	3571	230	3	28400.61	0.00
8059	3571	97	4	14554.24	0.00
8060	3572	156	1	32839.76	0.00
8061	3572	322	1	13830.37	0.00
8062	3572	293	3	8008.05	0.00
8063	3573	135	4	22949.80	0.00
8064	3573	183	3	5758.05	5.00
8065	3574	92	5	20118.27	0.00
8066	3575	91	3	17167.44	0.00
8067	3575	217	5	3368.23	0.00
8068	3576	299	2	11746.03	0.00
8069	3577	231	1	6896.87	10.00
8070	3578	18	2	31259.75	5.00
8071	3578	307	5	20775.79	5.00
8072	3578	179	1	1556.32	0.00
8073	3578	63	2	26923.17	5.00
8074	3578	36	2	1735.10	0.00
8075	3579	222	2	3056.85	0.00
8076	3579	51	1	24451.03	0.00
8077	3579	180	5	18260.88	5.00
8078	3579	284	4	13885.78	0.00
8079	3579	131	2	32528.88	0.00
8080	3580	169	5	16701.06	0.00
8081	3581	112	2	18453.69	0.00
8082	3582	14	3	17741.79	10.00
8083	3582	103	1	20005.99	0.00
8084	3583	275	3	17459.90	0.00
8085	3583	48	4	18931.60	0.00
8086	3583	138	4	29598.30	10.00
8087	3583	274	3	9735.42	0.00
8088	3584	55	4	25249.73	5.00
8089	3584	288	3	23034.91	0.00
8090	3584	238	4	18623.67	0.00
8091	3584	98	2	3266.66	5.00
8092	3584	60	5	28605.81	0.00
8093	3585	200	5	2196.15	0.00
8094	3585	282	1	26158.78	0.00
8095	3585	163	3	20880.95	0.00
8096	3585	64	4	6770.97	5.00
8097	3586	146	2	23311.85	0.00
8098	3587	28	2	20966.76	0.00
8099	3588	63	1	26923.17	0.00
8100	3589	55	1	25249.73	0.00
8101	3590	149	5	12786.74	0.00
8102	3590	255	4	37063.14	0.00
8103	3591	26	3	28783.35	0.00
8104	3592	238	1	18623.67	0.00
8105	3592	2	2	24015.17	0.00
8106	3592	66	4	17427.59	5.00
8107	3593	41	4	11834.74	0.00
8108	3594	217	1	3368.23	10.00
8109	3594	67	4	6504.44	0.00
8110	3594	297	5	2879.78	0.00
8111	3594	162	4	1341.67	0.00
8112	3594	264	3	3231.57	0.00
8113	3595	27	3	7946.20	0.00
8114	3595	208	5	8508.53	10.00
8115	3596	269	3	6147.83	0.00
8116	3596	277	2	31244.88	0.00
8117	3596	147	1	16118.15	10.00
8118	3597	260	3	10785.43	5.00
8119	3597	262	2	316.65	0.00
8120	3597	207	5	23472.26	10.00
8121	3598	162	4	1341.67	0.00
8122	3598	55	2	25249.73	0.00
8123	3598	89	4	773.73	0.00
8124	3599	122	3	12832.42	5.00
8125	3599	56	1	27131.00	0.00
8126	3599	176	5	37396.28	10.00
8127	3599	189	2	7295.82	0.00
8128	3599	89	2	773.73	0.00
8129	3600	56	4	27131.00	0.00
8130	3600	284	1	13885.78	5.00
8131	3601	153	5	32619.22	0.00
8132	3601	167	4	6664.74	5.00
8133	3602	249	1	340.08	0.00
8134	3602	33	4	4281.57	0.00
8135	3603	284	2	13885.78	0.00
8136	3603	94	3	19130.25	0.00
8137	3603	223	3	13014.71	0.00
8138	3604	267	4	13684.84	0.00
8139	3604	327	1	8103.13	0.00
8140	3605	108	2	19316.06	0.00
8141	3605	202	2	32567.80	0.00
8142	3606	207	1	23472.26	0.00
8143	3606	61	3	26987.99	0.00
8144	3606	260	5	10785.43	0.00
8145	3606	95	5	873.16	0.00
8146	3607	59	3	23956.82	0.00
8147	3608	60	1	28605.81	5.00
8148	3608	88	4	24686.97	10.00
8149	3609	233	2	16609.25	0.00
8150	3609	323	2	23922.51	10.00
8151	3610	49	1	10492.89	5.00
8152	3611	115	5	10525.91	0.00
8153	3611	223	2	13014.71	0.00
8154	3611	284	4	13885.78	5.00
8155	3612	277	3	31244.88	0.00
8156	3612	6	3	17267.65	5.00
8157	3612	87	3	25661.61	0.00
8158	3612	100	5	8325.24	0.00
8159	3612	119	5	20568.93	0.00
8160	3613	265	1	33033.81	0.00
8161	3613	158	5	28494.74	10.00
8162	3613	201	4	10598.73	5.00
8163	3614	64	3	6770.97	0.00
8164	3614	163	1	20880.95	0.00
8165	3615	27	4	7946.20	0.00
8166	3615	160	1	21111.41	5.00
8167	3616	95	3	873.16	5.00
8168	3617	285	4	11004.33	0.00
8169	3617	134	5	32564.64	0.00
8170	3618	174	4	28177.73	0.00
8171	3619	281	3	30869.24	0.00
8172	3619	185	3	27147.39	0.00
8173	3619	99	3	16911.90	5.00
8174	3619	260	4	10785.43	10.00
8175	3620	232	5	10580.70	0.00
8176	3620	79	2	13282.08	0.00
8177	3621	38	1	11721.98	10.00
8178	3621	153	3	32619.22	5.00
8179	3622	27	5	7946.20	0.00
8180	3622	271	4	35488.48	0.00
8181	3622	255	1	37063.14	0.00
8182	3622	308	5	14634.32	0.00
8183	3623	77	2	20201.77	10.00
8184	3623	139	4	25656.53	0.00
8185	3623	187	2	2994.33	0.00
8186	3624	48	1	18931.60	0.00
8187	3624	57	5	25319.11	0.00
8188	3624	265	5	33033.81	10.00
8189	3625	43	2	29453.15	0.00
8190	3625	42	3	22822.73	0.00
8191	3626	217	2	3368.23	0.00
8192	3626	126	1	18009.84	5.00
8193	3627	292	2	20342.09	0.00
8194	3627	275	4	17459.90	10.00
8195	3627	130	1	21694.52	0.00
8196	3628	193	1	7905.39	0.00
8197	3628	319	3	28695.55	10.00
8198	3629	240	2	6679.87	0.00
8199	3629	32	5	26325.66	5.00
8200	3629	64	5	6770.97	0.00
8201	3629	307	4	20775.79	5.00
8202	3630	133	3	19101.95	0.00
8203	3630	328	5	22158.52	0.00
8204	3630	111	5	9004.05	0.00
8205	3630	209	3	14780.53	5.00
8206	3631	302	1	10847.55	5.00
8207	3632	243	1	32934.99	0.00
8208	3633	141	3	18976.68	5.00
8209	3633	6	4	17267.65	5.00
8210	3634	127	4	14788.94	0.00
8211	3634	14	3	17741.79	0.00
8212	3635	250	5	22128.51	0.00
8213	3636	325	4	12556.36	5.00
8214	3637	180	3	18260.88	0.00
8215	3637	196	5	29103.79	0.00
8216	3638	174	2	28177.73	0.00
8217	3638	296	5	21692.65	5.00
8218	3639	164	4	15959.84	0.00
8219	3639	158	1	28494.74	0.00
8220	3640	314	3	21132.86	0.00
8221	3640	227	4	35785.16	5.00
8222	3640	217	3	3368.23	0.00
8223	3640	141	5	18976.68	0.00
8224	3640	200	4	2196.15	0.00
8225	3641	243	2	32934.99	0.00
8226	3641	136	1	9436.00	5.00
8227	3641	66	2	17427.59	0.00
8228	3642	122	4	12832.42	0.00
8229	3643	96	5	8770.71	5.00
8230	3643	201	5	10598.73	0.00
8231	3644	306	4	12630.20	0.00
8232	3644	34	1	34435.26	0.00
8233	3645	283	5	18689.10	0.00
8234	3646	201	4	10598.73	10.00
8235	3647	112	5	18453.69	0.00
8236	3648	62	2	8722.93	5.00
8237	3648	235	2	23624.80	0.00
8238	3649	167	4	6664.74	0.00
8239	3650	179	2	1556.32	0.00
8240	3651	27	4	7946.20	5.00
8241	3651	327	5	8103.13	0.00
8242	3652	3	3	26253.43	0.00
8243	3652	270	2	29941.52	0.00
8244	3653	313	5	8702.12	5.00
8245	3653	322	5	13830.37	5.00
8246	3654	28	5	20966.76	5.00
8247	3654	29	5	35509.97	5.00
8248	3654	249	2	340.08	0.00
8249	3654	281	1	30869.24	0.00
8250	3655	233	2	16609.25	0.00
8251	3655	93	3	2239.83	0.00
8252	3655	105	2	18324.05	0.00
8253	3655	262	4	316.65	0.00
8254	3656	215	1	13820.74	0.00
8255	3656	286	2	29466.98	0.00
8256	3657	2	1	24015.17	0.00
8257	3658	287	5	26929.25	0.00
8258	3658	43	3	29453.15	5.00
8259	3658	164	3	15959.84	0.00
8260	3659	134	4	32564.64	0.00
8261	3660	3	5	26253.43	0.00
8262	3661	125	1	30636.77	0.00
8263	3661	230	3	28400.61	0.00
8264	3661	281	2	30869.24	0.00
8265	3661	52	1	5082.07	5.00
8266	3661	146	4	23311.85	0.00
8267	3662	136	1	9436.00	0.00
8268	3662	21	4	28885.66	0.00
8269	3662	191	5	13943.67	0.00
8270	3662	41	2	11834.74	0.00
8271	3662	104	5	31420.14	0.00
8272	3663	113	1	26136.34	0.00
8273	3664	71	5	5597.63	5.00
8274	3665	282	4	26158.78	5.00
8275	3665	34	3	34435.26	0.00
8276	3666	151	2	2056.97	0.00
8277	3667	177	2	1037.15	0.00
8278	3668	26	2	28783.35	0.00
8279	3668	73	2	19639.03	0.00
8280	3669	254	5	15942.44	10.00
8281	3669	157	4	11935.44	10.00
8282	3669	203	2	11026.49	10.00
8283	3670	180	3	18260.88	5.00
8284	3671	28	2	20966.76	5.00
8285	3672	298	4	14592.86	5.00
8286	3672	232	5	10580.70	10.00
8287	3672	307	1	20775.79	0.00
8288	3673	149	4	12786.74	0.00
8289	3673	52	4	5082.07	10.00
8290	3674	115	2	10525.91	0.00
8291	3674	316	2	340.50	0.00
8292	3675	305	4	5777.48	0.00
8293	3675	301	2	9631.41	0.00
8294	3675	169	3	16701.06	0.00
8295	3676	277	1	31244.88	0.00
8296	3677	214	1	8996.93	0.00
8297	3677	271	5	35488.48	5.00
8298	3677	324	5	35511.98	5.00
8299	3678	38	2	11721.98	0.00
8300	3679	148	5	33398.34	0.00
8301	3680	69	2	20390.90	0.00
8302	3680	143	1	21267.26	0.00
8303	3680	311	3	14989.38	0.00
8304	3681	285	1	11004.33	5.00
8305	3681	171	2	1914.19	0.00
8306	3682	37	3	32619.07	0.00
8307	3682	211	5	12736.65	0.00
8308	3682	141	4	18976.68	0.00
8309	3682	22	1	34187.79	0.00
8310	3683	224	1	3586.39	0.00
8311	3683	314	5	21132.86	0.00
8312	3684	263	2	21676.55	0.00
8313	3685	58	2	26928.89	5.00
8314	3685	87	3	25661.61	10.00
8315	3685	1	1	15858.11	0.00
8316	3685	193	1	7905.39	0.00
8317	3686	215	1	13820.74	0.00
8318	3686	150	3	6436.80	10.00
8319	3686	41	3	11834.74	0.00
8320	3686	175	1	431.66	0.00
8321	3687	114	1	14824.91	0.00
8322	3688	308	3	14634.32	0.00
8323	3688	114	5	14824.91	0.00
8324	3688	49	5	10492.89	0.00
8325	3689	107	4	359.68	0.00
8326	3689	188	4	27164.75	5.00
8327	3689	313	2	8702.12	5.00
8328	3690	139	1	25656.53	5.00
8329	3690	228	2	31317.59	0.00
8330	3691	86	4	27867.51	5.00
8331	3691	228	2	31317.59	0.00
8332	3692	70	1	1664.51	0.00
8333	3692	130	3	21694.52	0.00
8334	3693	7	1	25378.21	0.00
8335	3693	85	3	18592.18	10.00
8336	3693	182	4	8176.49	0.00
8337	3693	148	4	33398.34	0.00
8338	3694	252	3	19842.18	5.00
8339	3694	75	2	27128.62	0.00
8340	3694	248	2	5704.91	0.00
8341	3694	256	4	18150.18	0.00
8342	3695	150	1	6436.80	0.00
8343	3695	133	2	19101.95	0.00
8344	3696	189	5	7295.82	0.00
8345	3697	94	1	19130.25	0.00
8346	3697	131	2	32528.88	10.00
8347	3697	7	5	25378.21	0.00
8348	3697	122	3	12832.42	0.00
8349	3698	154	3	3570.74	0.00
8350	3699	304	1	25507.59	0.00
8351	3700	282	3	26158.78	5.00
8352	3700	28	3	20966.76	0.00
8353	3701	209	3	14780.53	0.00
8354	3701	155	3	2596.48	0.00
8355	3702	249	2	340.08	0.00
8356	3702	296	1	21692.65	0.00
8357	3703	258	2	4070.91	10.00
8358	3704	65	5	28661.97	0.00
8359	3705	168	1	4961.32	0.00
8360	3706	88	2	24686.97	5.00
8361	3706	317	1	29835.28	0.00
8362	3706	264	4	3231.57	10.00
8363	3707	138	1	29598.30	0.00
8364	3707	16	3	2894.98	0.00
8365	3707	27	5	7946.20	10.00
8366	3708	26	4	28783.35	5.00
8367	3708	115	5	10525.91	0.00
8368	3709	79	4	13282.08	0.00
8369	3709	59	5	23956.82	0.00
8370	3710	257	4	17467.13	0.00
8371	3711	233	2	16609.25	5.00
8372	3711	298	5	14592.86	5.00
8373	3712	222	3	3056.85	0.00
8374	3712	97	2	14554.24	5.00
8375	3713	44	4	6287.16	0.00
8376	3713	162	4	1341.67	0.00
8377	3713	65	5	28661.97	0.00
8378	3714	272	1	17566.50	0.00
8379	3714	62	3	8722.93	0.00
8380	3715	33	3	4281.57	10.00
8381	3715	92	4	20118.27	0.00
8382	3716	277	1	31244.88	5.00
8383	3716	138	2	29598.30	5.00
8384	3716	262	2	316.65	0.00
8385	3717	254	4	15942.44	5.00
8386	3717	27	4	7946.20	0.00
8387	3717	227	2	35785.16	5.00
8388	3717	268	2	4330.51	0.00
8389	3717	296	1	21692.65	0.00
8390	3718	189	3	7295.82	0.00
8391	3719	75	2	27128.62	0.00
8392	3720	19	1	7630.10	0.00
8393	3721	74	5	20327.04	10.00
8394	3721	202	5	32567.80	0.00
8395	3722	86	1	27867.51	0.00
8396	3722	31	2	14239.86	0.00
8397	3722	315	5	19913.45	0.00
8398	3722	295	5	15122.86	0.00
8399	3722	324	1	35511.98	5.00
8400	3723	265	3	33033.81	5.00
8401	3724	248	4	5704.91	0.00
8402	3724	74	4	20327.04	0.00
8403	3725	108	5	19316.06	5.00
8404	3726	246	1	14044.38	0.00
8405	3726	227	4	35785.16	0.00
8406	3727	25	2	21791.44	0.00
8407	3727	319	4	28695.55	0.00
8408	3728	81	3	5090.35	0.00
8409	3728	249	2	340.08	10.00
8410	3729	148	4	33398.34	5.00
8411	3729	328	2	22158.52	0.00
8412	3730	57	4	25319.11	0.00
8413	3730	185	3	27147.39	10.00
8414	3731	32	1	26325.66	0.00
8415	3731	73	3	19639.03	10.00
8416	3732	72	5	3396.14	0.00
8417	3732	45	3	6595.34	0.00
8418	3733	126	4	18009.84	0.00
8419	3733	262	5	316.65	0.00
8420	3734	5	2	23066.77	5.00
8421	3734	323	2	23922.51	0.00
8422	3735	190	3	2205.28	0.00
8423	3735	166	3	18050.91	0.00
8424	3736	6	4	17267.65	0.00
8425	3736	167	4	6664.74	5.00
8426	3737	72	3	3396.14	0.00
8427	3737	2	2	24015.17	0.00
8428	3737	311	4	14989.38	0.00
8429	3737	89	1	773.73	0.00
8430	3737	73	1	19639.03	0.00
8431	3738	12	2	14641.07	0.00
8432	3738	52	1	5082.07	0.00
8433	3738	44	2	6287.16	0.00
8434	3739	128	2	7835.32	0.00
8435	3739	182	4	8176.49	5.00
8436	3739	157	3	11935.44	0.00
8437	3740	172	2	21684.08	0.00
8438	3740	205	3	23585.50	5.00
8439	3740	20	2	21995.92	0.00
8440	3741	261	3	22618.18	0.00
8441	3741	85	4	18592.18	10.00
8442	3742	117	5	30916.88	0.00
8443	3743	276	3	21618.85	0.00
8444	3744	26	5	28783.35	0.00
8445	3744	306	1	12630.20	5.00
8446	3745	298	1	14592.86	0.00
8447	3745	41	1	11834.74	0.00
8448	3746	236	1	17409.10	0.00
8449	3747	272	1	17566.50	0.00
8450	3748	190	5	2205.28	5.00
8451	3748	103	5	20005.99	0.00
8452	3748	175	1	431.66	5.00
8453	3749	103	2	20005.99	0.00
8454	3749	321	5	15006.91	0.00
8455	3750	191	2	13943.67	0.00
8456	3751	328	1	22158.52	5.00
8457	3751	310	3	390.07	10.00
8458	3751	170	2	26345.81	5.00
8459	3752	8	3	28612.40	5.00
8460	3752	28	4	20966.76	0.00
8461	3752	214	3	8996.93	0.00
8462	3753	302	2	10847.55	10.00
8463	3753	298	2	14592.86	0.00
8464	3754	205	2	23585.50	10.00
8465	3754	137	5	18272.97	0.00
8466	3754	310	5	390.07	0.00
8467	3755	211	1	12736.65	0.00
8468	3755	261	4	22618.18	0.00
8469	3756	99	3	16911.90	0.00
8470	3756	28	4	20966.76	0.00
8471	3756	18	2	31259.75	5.00
8472	3757	158	5	28494.74	0.00
8473	3757	73	5	19639.03	0.00
8474	3758	99	3	16911.90	0.00
8475	3758	80	2	38259.20	0.00
8476	3759	305	5	5777.48	0.00
8477	3759	34	4	34435.26	0.00
8478	3759	248	4	5704.91	5.00
8479	3760	223	5	13014.71	0.00
8480	3761	220	2	18064.29	10.00
8481	3761	10	5	1535.56	0.00
8482	3762	183	1	5758.05	0.00
8483	3763	31	3	14239.86	10.00
8484	3764	107	3	359.68	10.00
8485	3765	246	4	14044.38	0.00
8486	3766	250	4	22128.51	0.00
8487	3766	59	5	23956.82	0.00
8488	3766	103	4	20005.99	0.00
8489	3767	16	3	2894.98	5.00
8490	3768	279	4	267.97	5.00
8491	3769	253	2	6539.82	0.00
8492	3769	272	5	17566.50	0.00
8493	3769	215	2	13820.74	0.00
8494	3770	77	5	20201.77	0.00
8495	3770	67	3	6504.44	0.00
8496	3770	199	3	31720.32	0.00
8497	3771	259	4	12682.03	5.00
8498	3772	178	1	8358.65	0.00
8499	3773	76	2	16330.99	5.00
8500	3773	34	5	34435.26	5.00
8501	3773	209	2	14780.53	5.00
8502	3774	267	3	13684.84	0.00
8503	3775	255	5	37063.14	0.00
8504	3775	151	1	2056.97	0.00
8505	3775	294	2	18000.72	5.00
8506	3775	102	2	19901.11	0.00
8507	3776	262	3	316.65	10.00
8508	3776	256	1	18150.18	0.00
8509	3776	142	1	32902.97	10.00
8510	3777	78	4	21716.19	0.00
8511	3778	106	5	8994.82	10.00
8512	3779	289	3	15260.25	0.00
8513	3779	53	1	1943.06	0.00
8514	3779	211	2	12736.65	10.00
8515	3780	170	2	26345.81	0.00
8516	3780	33	5	4281.57	0.00
8517	3781	58	3	26928.89	0.00
8518	3781	265	2	33033.81	5.00
8519	3781	16	1	2894.98	0.00
8520	3782	15	4	5791.98	0.00
8521	3782	152	3	6462.82	0.00
8522	3783	56	5	27131.00	0.00
8523	3783	281	5	30869.24	0.00
8524	3784	186	2	10556.47	0.00
8525	3784	123	3	16598.57	0.00
8526	3785	162	2	1341.67	10.00
8527	3785	125	3	30636.77	0.00
8528	3786	101	4	7061.05	0.00
8529	3786	168	5	4961.32	5.00
8530	3786	10	3	1535.56	0.00
8531	3787	318	3	32370.18	10.00
8532	3787	11	4	23322.36	5.00
8533	3787	83	2	7497.50	0.00
8534	3788	202	3	32567.80	5.00
8535	3788	194	5	18125.11	0.00
8536	3789	209	5	14780.53	0.00
8537	3789	248	4	5704.91	0.00
8538	3790	257	3	17467.13	5.00
8539	3791	246	1	14044.38	5.00
8540	3792	105	4	18324.05	0.00
8541	3793	116	3	23884.82	0.00
8542	3793	255	3	37063.14	0.00
8543	3793	7	3	25378.21	0.00
8544	3793	165	3	10583.30	0.00
8545	3793	173	2	29095.13	0.00
8546	3794	39	3	3995.01	0.00
8547	3794	157	3	11935.44	0.00
8548	3795	285	2	11004.33	5.00
8549	3795	88	5	24686.97	0.00
8550	3796	44	1	6287.16	0.00
8551	3796	326	5	13740.29	0.00
8552	3796	5	1	23066.77	0.00
8553	3797	88	4	24686.97	0.00
8554	3797	278	3	12560.12	0.00
8555	3797	53	1	1943.06	0.00
8556	3798	18	4	31259.75	5.00
8557	3798	325	3	12556.36	0.00
8558	3799	74	2	20327.04	0.00
8559	3799	205	3	23585.50	0.00
8560	3800	283	3	18689.10	0.00
8561	3800	82	5	32104.18	0.00
8562	3801	162	3	1341.67	0.00
8563	3801	274	2	9735.42	0.00
8564	3801	130	3	21694.52	0.00
8565	3802	197	4	13698.28	0.00
8566	3802	12	5	14641.07	0.00
8567	3802	72	4	3396.14	5.00
8568	3803	63	2	26923.17	0.00
8569	3803	300	5	17477.32	5.00
8570	3804	226	3	14516.18	0.00
8571	3804	229	3	18071.36	0.00
8572	3805	153	1	32619.22	0.00
8573	3805	119	5	20568.93	0.00
8574	3806	196	1	29103.79	0.00
8575	3806	228	2	31317.59	5.00
8576	3807	92	2	20118.27	10.00
8577	3808	287	5	26929.25	0.00
8578	3808	204	5	7103.30	0.00
8579	3808	86	5	27867.51	0.00
8580	3809	329	5	21671.36	5.00
8581	3809	240	4	6679.87	0.00
8582	3809	175	4	431.66	0.00
8583	3810	40	3	14719.88	0.00
8584	3811	12	1	14641.07	10.00
8585	3811	242	5	26069.06	0.00
8586	3812	239	5	23450.80	0.00
8587	3813	27	5	7946.20	0.00
8588	3813	228	3	31317.59	0.00
8589	3814	44	1	6287.16	0.00
8590	3815	209	3	14780.53	5.00
8591	3816	279	4	267.97	0.00
8592	3816	166	4	18050.91	0.00
8593	3816	26	1	28783.35	0.00
8594	3817	137	1	18272.97	5.00
8595	3817	236	3	17409.10	5.00
8596	3817	158	2	28494.74	0.00
8597	3818	210	1	31221.02	0.00
8598	3819	23	4	8278.99	0.00
8599	3819	143	4	21267.26	0.00
8600	3820	68	5	30368.50	0.00
8601	3820	119	2	20568.93	0.00
8602	3820	246	4	14044.38	5.00
8603	3820	91	5	17167.44	0.00
8604	3821	320	4	19956.45	0.00
8605	3822	317	1	29835.28	0.00
8606	3822	297	3	2879.78	0.00
8607	3822	303	4	19580.63	0.00
8608	3823	50	4	32360.23	0.00
8609	3823	217	3	3368.23	0.00
8610	3823	270	5	29941.52	0.00
8611	3824	173	1	29095.13	0.00
8612	3824	53	1	1943.06	0.00
8613	3824	222	2	3056.85	0.00
8614	3825	176	1	37396.28	0.00
8615	3825	55	4	25249.73	0.00
8616	3826	229	2	18071.36	10.00
8617	3826	322	3	13830.37	5.00
8618	3826	222	3	3056.85	0.00
8619	3826	13	1	13999.33	0.00
8620	3827	326	1	13740.29	0.00
8621	3827	97	4	14554.24	0.00
8622	3827	144	2	18427.13	5.00
8623	3828	276	5	21618.85	10.00
8624	3828	63	2	26923.17	5.00
8625	3828	126	5	18009.84	0.00
8626	3828	103	5	20005.99	5.00
8627	3828	31	5	14239.86	10.00
8628	3829	181	1	7647.49	5.00
8629	3829	97	2	14554.24	5.00
8630	3829	233	1	16609.25	0.00
8631	3829	153	2	32619.22	10.00
8632	3830	225	3	27871.38	0.00
8633	3830	137	5	18272.97	0.00
8634	3831	292	2	20342.09	5.00
8635	3831	326	4	13740.29	0.00
8636	3831	132	3	11440.30	0.00
8637	3832	67	2	6504.44	5.00
8638	3832	16	2	2894.98	0.00
8639	3833	220	3	18064.29	5.00
8640	3834	12	3	14641.07	0.00
8641	3835	269	2	6147.83	0.00
8642	3835	32	3	26325.66	0.00
8643	3836	60	1	28605.81	0.00
8644	3836	201	3	10598.73	0.00
8645	3837	306	1	12630.20	5.00
8646	3838	156	1	32839.76	0.00
8647	3838	55	1	25249.73	0.00
8648	3838	280	2	18825.63	5.00
8649	3838	188	3	27164.75	0.00
8650	3839	185	4	27147.39	0.00
8651	3839	149	5	12786.74	0.00
8652	3840	284	4	13885.78	0.00
8653	3840	166	1	18050.91	0.00
8654	3840	154	5	3570.74	5.00
8655	3841	146	4	23311.85	0.00
8656	3841	262	1	316.65	10.00
8657	3841	200	2	2196.15	0.00
8658	3842	201	4	10598.73	5.00
8659	3842	62	2	8722.93	0.00
8660	3843	43	2	29453.15	5.00
8661	3843	247	2	17789.48	0.00
8662	3844	179	5	1556.32	5.00
8663	3845	12	5	14641.07	0.00
8664	3845	64	5	6770.97	0.00
8665	3846	48	1	18931.60	10.00
8666	3847	194	2	18125.11	5.00
8667	3848	21	1	28885.66	0.00
8668	3848	7	1	25378.21	0.00
8669	3849	140	5	30696.33	5.00
8670	3850	1	2	15858.11	0.00
8671	3851	1	4	15858.11	5.00
8672	3851	232	1	10580.70	10.00
8673	3852	237	1	8720.64	0.00
8674	3852	91	3	17167.44	0.00
8675	3852	305	3	5777.48	0.00
8676	3852	249	5	340.08	5.00
8677	3853	88	4	24686.97	0.00
8678	3853	129	5	6063.22	0.00
8679	3853	130	2	21694.52	0.00
8680	3854	242	2	26069.06	0.00
8681	3854	149	4	12786.74	0.00
8682	3854	93	5	2239.83	0.00
8683	3855	68	3	30368.50	0.00
8684	3855	54	5	16118.63	0.00
8685	3856	123	2	16598.57	5.00
8686	3856	87	1	25661.61	0.00
8687	3856	47	5	17054.16	0.00
8688	3857	326	2	13740.29	0.00
8689	3857	264	2	3231.57	0.00
8690	3857	84	4	9912.34	0.00
8691	3858	148	4	33398.34	0.00
8692	3858	99	4	16911.90	5.00
8693	3859	301	5	9631.41	0.00
8694	3859	230	2	28400.61	0.00
8695	3860	108	3	19316.06	0.00
8696	3860	37	3	32619.07	5.00
8697	3860	273	4	19698.88	0.00
8698	3860	329	3	21671.36	0.00
8699	3861	201	2	10598.73	10.00
8700	3862	221	5	4679.42	0.00
8701	3862	284	4	13885.78	0.00
8702	3863	280	4	18825.63	10.00
8703	3864	134	4	32564.64	0.00
8704	3864	21	1	28885.66	0.00
8705	3865	207	3	23472.26	5.00
8706	3866	18	4	31259.75	0.00
8707	3867	74	3	20327.04	0.00
8708	3867	42	3	22822.73	5.00
8709	3867	12	1	14641.07	0.00
8710	3868	120	3	6107.02	5.00
8711	3869	323	5	23922.51	0.00
8712	3869	252	2	19842.18	0.00
8713	3869	298	1	14592.86	5.00
8714	3870	22	4	34187.79	0.00
8715	3870	226	3	14516.18	5.00
8716	3871	166	5	18050.91	0.00
8717	3871	313	5	8702.12	0.00
8718	3872	77	4	20201.77	0.00
8719	3872	61	5	26987.99	5.00
8720	3873	117	3	30916.88	0.00
8721	3873	273	5	19698.88	0.00
8722	3873	121	4	3250.20	0.00
8723	3874	203	1	11026.49	0.00
8724	3874	61	4	26987.99	0.00
8725	3874	170	1	26345.81	0.00
8726	3875	320	1	19956.45	10.00
8727	3875	7	1	25378.21	0.00
8728	3875	256	3	18150.18	0.00
8729	3875	274	4	9735.42	0.00
8730	3875	208	1	8508.53	0.00
8731	3876	238	4	18623.67	10.00
8732	3876	11	4	23322.36	10.00
8733	3876	18	4	31259.75	5.00
8734	3876	260	4	10785.43	0.00
8735	3876	68	3	30368.50	0.00
8736	3877	235	2	23624.80	0.00
8737	3877	223	5	13014.71	5.00
8738	3878	279	5	267.97	0.00
8739	3878	111	1	9004.05	0.00
8740	3878	164	3	15959.84	0.00
8741	3879	34	5	34435.26	0.00
8742	3880	168	1	4961.32	0.00
8743	3880	62	3	8722.93	0.00
8744	3881	99	5	16911.90	5.00
8745	3881	147	3	16118.15	5.00
8746	3881	92	4	20118.27	0.00
8747	3882	58	4	26928.89	0.00
8748	3882	55	1	25249.73	10.00
8749	3882	25	2	21791.44	0.00
8750	3882	64	1	6770.97	0.00
8751	3883	39	5	3995.01	10.00
8752	3883	177	3	1037.15	0.00
8753	3883	142	1	32902.97	0.00
8754	3883	19	5	7630.10	5.00
8755	3883	318	3	32370.18	0.00
8756	3884	125	2	30636.77	0.00
8757	3885	294	1	18000.72	0.00
8758	3885	97	3	14554.24	5.00
8759	3886	222	3	3056.85	10.00
8760	3887	44	4	6287.16	5.00
8761	3887	185	5	27147.39	5.00
8762	3888	199	3	31720.32	0.00
8763	3888	228	4	31317.59	0.00
8764	3888	268	5	4330.51	0.00
8765	3888	307	2	20775.79	0.00
8766	3889	280	3	18825.63	0.00
8767	3889	69	4	20390.90	5.00
8768	3890	96	4	8770.71	0.00
8769	3890	314	1	21132.86	0.00
8770	3891	264	3	3231.57	0.00
8771	3891	87	3	25661.61	5.00
8772	3892	95	1	873.16	5.00
8773	3893	82	1	32104.18	0.00
8774	3894	94	5	19130.25	0.00
8775	3894	276	3	21618.85	0.00
8776	3894	269	4	6147.83	0.00
8777	3894	87	3	25661.61	10.00
8778	3895	128	2	7835.32	0.00
8779	3896	302	3	10847.55	0.00
8780	3897	99	2	16911.90	5.00
8781	3897	73	2	19639.03	0.00
8782	3897	142	4	32902.97	0.00
8783	3897	150	1	6436.80	5.00
8784	3898	16	5	2894.98	0.00
8785	3898	281	5	30869.24	5.00
8786	3899	27	4	7946.20	0.00
8787	3899	277	4	31244.88	0.00
8788	3899	43	2	29453.15	0.00
8789	3900	52	1	5082.07	0.00
8790	3901	33	2	4281.57	0.00
8791	3901	163	2	20880.95	0.00
8792	3902	304	1	25507.59	0.00
8793	3902	147	1	16118.15	5.00
8794	3903	49	3	10492.89	0.00
8795	3903	228	4	31317.59	0.00
8796	3904	20	5	21995.92	0.00
8797	3904	62	1	8722.93	5.00
8798	3905	5	1	23066.77	0.00
8799	3906	304	4	25507.59	5.00
8800	3907	301	5	9631.41	0.00
8801	3908	117	5	30916.88	5.00
8802	3908	199	3	31720.32	0.00
8803	3908	57	4	25319.11	0.00
8804	3909	68	5	30368.50	0.00
8805	3909	104	4	31420.14	10.00
8806	3909	240	1	6679.87	0.00
8807	3909	272	3	17566.50	0.00
8808	3910	101	2	7061.05	5.00
8809	3910	5	3	23066.77	0.00
8810	3911	92	2	20118.27	0.00
8811	3912	26	1	28783.35	5.00
8812	3913	137	3	18272.97	0.00
8813	3913	315	3	19913.45	0.00
8814	3913	121	2	3250.20	0.00
8815	3914	43	1	29453.15	0.00
8816	3914	190	1	2205.28	5.00
8817	3914	39	5	3995.01	0.00
8818	3914	53	1	1943.06	0.00
8819	3915	308	4	14634.32	5.00
8820	3915	116	3	23884.82	5.00
8821	3915	176	1	37396.28	0.00
8822	3916	180	2	18260.88	5.00
8823	3917	283	5	18689.10	0.00
8824	3917	201	1	10598.73	0.00
8825	3917	6	3	17267.65	0.00
8826	3917	207	1	23472.26	10.00
8827	3918	171	2	1914.19	0.00
8828	3919	317	5	29835.28	0.00
8829	3919	136	5	9436.00	0.00
8830	3920	292	1	20342.09	0.00
8831	3920	62	5	8722.93	0.00
8832	3920	194	4	18125.11	0.00
8833	3920	16	5	2894.98	0.00
8834	3921	38	5	11721.98	0.00
8835	3921	179	4	1556.32	0.00
8836	3921	65	3	28661.97	0.00
8837	3922	222	5	3056.85	10.00
8838	3922	228	3	31317.59	0.00
8839	3923	161	4	30174.43	0.00
8840	3924	177	5	1037.15	10.00
8841	3924	297	4	2879.78	0.00
8842	3924	263	2	21676.55	0.00
8843	3924	33	2	4281.57	10.00
8844	3925	275	1	17459.90	5.00
8845	3925	181	2	7647.49	10.00
8846	3926	263	1	21676.55	0.00
8847	3927	320	3	19956.45	0.00
8848	3927	272	1	17566.50	0.00
8849	3928	4	5	8942.68	0.00
8850	3928	171	2	1914.19	0.00
8851	3928	295	1	15122.86	0.00
8852	3929	206	2	6045.35	10.00
8853	3929	192	5	22314.85	0.00
8854	3929	202	4	32567.80	0.00
8855	3930	270	4	29941.52	0.00
8856	3931	319	4	28695.55	10.00
8857	3932	276	2	21618.85	0.00
8858	3932	48	1	18931.60	0.00
8859	3933	279	3	267.97	0.00
8860	3933	256	5	18150.18	0.00
8861	3934	215	3	13820.74	0.00
8862	3935	128	1	7835.32	0.00
8863	3936	234	5	27391.73	0.00
8864	3936	285	5	11004.33	0.00
8865	3937	10	5	1535.56	10.00
8866	3938	65	4	28661.97	0.00
8867	3938	28	5	20966.76	10.00
8868	3939	182	4	8176.49	5.00
8869	3940	261	1	22618.18	5.00
8870	3940	48	4	18931.60	10.00
8871	3941	312	4	7030.98	0.00
8872	3942	89	3	773.73	0.00
8873	3942	257	4	17467.13	5.00
8874	3943	244	5	10146.51	10.00
8875	3943	137	1	18272.97	0.00
8876	3944	93	5	2239.83	0.00
8877	3945	271	1	35488.48	0.00
8878	3945	65	4	28661.97	0.00
8879	3945	225	2	27871.38	5.00
8880	3945	76	5	16330.99	10.00
8881	3945	210	4	31221.02	0.00
8882	3946	158	5	28494.74	0.00
8883	3946	54	4	16118.63	0.00
8884	3947	87	5	25661.61	0.00
8885	3948	306	3	12630.20	5.00
8886	3948	83	5	7497.50	0.00
8887	3949	80	1	38259.20	10.00
8888	3949	152	3	6462.82	0.00
8889	3950	187	4	2994.33	0.00
8890	3951	207	4	23472.26	0.00
8891	3951	292	2	20342.09	5.00
8892	3952	71	3	5597.63	5.00
8893	3952	185	1	27147.39	0.00
8894	3952	249	3	340.08	0.00
8895	3952	220	5	18064.29	0.00
8896	3952	179	3	1556.32	0.00
8897	3953	305	3	5777.48	0.00
8898	3954	296	2	21692.65	0.00
8899	3955	186	1	10556.47	0.00
8900	3955	128	5	7835.32	5.00
8901	3956	189	5	7295.82	0.00
8902	3956	135	2	22949.80	0.00
8903	3957	218	1	9097.50	0.00
8904	3957	256	4	18150.18	0.00
8905	3958	43	4	29453.15	0.00
8906	3958	263	3	21676.55	0.00
8907	3959	243	4	32934.99	0.00
8908	3959	52	2	5082.07	0.00
8909	3960	24	3	2371.03	0.00
8910	3960	315	1	19913.45	10.00
8911	3960	234	2	27391.73	0.00
8912	3961	289	4	15260.25	0.00
8913	3961	118	5	26976.56	0.00
8914	3961	141	1	18976.68	10.00
8915	3962	33	5	4281.57	5.00
8916	3963	5	1	23066.77	0.00
8917	3963	220	4	18064.29	10.00
8918	3964	305	2	5777.48	5.00
8919	3964	266	2	30350.30	5.00
8920	3964	158	5	28494.74	0.00
8921	3965	220	5	18064.29	0.00
8922	3965	164	4	15959.84	0.00
8923	3966	150	3	6436.80	0.00
8924	3966	16	5	2894.98	10.00
8925	3966	322	2	13830.37	0.00
8926	3967	103	4	20005.99	0.00
8927	3968	15	2	5791.98	5.00
8928	3968	118	1	26976.56	0.00
8929	3969	77	4	20201.77	0.00
8930	3970	23	5	8278.99	0.00
8931	3970	199	1	31720.32	0.00
8932	3971	215	4	13820.74	0.00
8933	3971	140	3	30696.33	5.00
8934	3972	87	1	25661.61	0.00
8935	3972	1	5	15858.11	0.00
8936	3972	177	1	1037.15	10.00
8937	3973	78	4	21716.19	10.00
8938	3974	95	1	873.16	0.00
8939	3974	32	1	26325.66	5.00
8940	3974	61	5	26987.99	0.00
8941	3975	311	3	14989.38	0.00
8942	3975	21	2	28885.66	10.00
8943	3975	299	4	11746.03	0.00
8944	3975	28	3	20966.76	0.00
8945	3976	19	3	7630.10	5.00
8946	3976	325	4	12556.36	0.00
8947	3977	76	3	16330.99	5.00
8948	3978	8	2	28612.40	0.00
8949	3979	168	2	4961.32	0.00
8950	3980	135	5	22949.80	0.00
8951	3980	128	3	7835.32	0.00
8952	3980	176	1	37396.28	10.00
8953	3981	104	1	31420.14	0.00
8954	3981	241	3	25166.29	0.00
8955	3982	157	4	11935.44	10.00
8956	3982	160	4	21111.41	0.00
8957	3982	44	3	6287.16	5.00
8958	3983	264	3	3231.57	0.00
8959	3983	157	1	11935.44	0.00
8960	3983	265	5	33033.81	0.00
8961	3984	51	3	24451.03	0.00
8962	3984	253	2	6539.82	0.00
8963	3985	274	3	9735.42	0.00
8964	3985	33	3	4281.57	0.00
8965	3986	45	3	6595.34	0.00
8966	3987	7	1	25378.21	5.00
8967	3987	145	4	26900.06	10.00
8968	3988	235	5	23624.80	10.00
8969	3988	172	1	21684.08	0.00
8970	3989	216	2	33300.54	0.00
8971	3989	40	5	14719.88	0.00
8972	3990	169	1	16701.06	0.00
8973	3990	230	1	28400.61	0.00
8974	3991	313	5	8702.12	5.00
8975	3992	294	3	18000.72	0.00
8976	3992	153	3	32619.22	5.00
8977	3992	87	3	25661.61	0.00
8978	3993	154	2	3570.74	0.00
8979	3994	184	5	8109.22	10.00
8980	3994	320	3	19956.45	10.00
8981	3994	300	1	17477.32	0.00
8982	3995	300	5	17477.32	0.00
8983	3996	266	1	30350.30	0.00
8984	3996	72	3	3396.14	5.00
8985	3997	219	1	27037.61	0.00
8986	3997	97	5	14554.24	0.00
8987	3998	245	3	20516.11	0.00
8988	3998	71	5	5597.63	10.00
8989	3999	288	5	23034.91	0.00
8990	4000	301	1	9631.41	0.00
8991	4000	41	4	11834.74	0.00
\.


--
-- TOC entry 5093 (class 0 OID 25087)
-- Dependencies: 223
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (empleado_id, nombre, apellido, email, puesto, salario, fecha_contrato, departamento_id, jefe_id) FROM stdin;
1	Alejandro	Sánchez Sánchez	alejandro.sánchez1@techstore.mx	Analista de Marketing	65762.40	2018-10-11	2	\N
2	Mario	Hernández García	mario.hernández2@techstore.mx	Jefe de Compras	27960.57	2020-09-12	9	\N
3	Fernando	Castillo Vargas	fernando.castillo3@techstore.mx	Paralegal	28092.17	2019-10-04	10	\N
4	María	Herrera Mendoza	maría.herrera4@techstore.mx	Contador	62964.18	2022-07-20	5	\N
5	David	Martínez López	david.martínez5@techstore.mx	Auditor Interno	19060.30	2016-11-10	5	\N
6	Ana	Ramos Cruz	ana.ramos6@techstore.mx	Director de Operaciones	83037.45	2022-02-13	6	\N
7	Adriana	Castro Vega	adriana.castro7@techstore.mx	Especialista en SEO	54146.71	2018-06-19	2	\N
8	Ricardo	Herrera Torres	ricardo.herrera8@techstore.mx	Director de Marketing	74438.19	2016-08-24	2	\N
9	Andrés	Vargas Aguilar	andrés.vargas9@techstore.mx	Especialista en SEO	23873.75	2022-05-19	2	\N
10	Laura	Jiménez Vargas	laura.jiménez10@techstore.mx	Reclutador	50992.21	2023-08-15	4	\N
11	Alejandro	Núñez Vargas	alejandro.núñez11@techstore.mx	DBA	28031.91	2022-09-23	3	1
12	Valeria	Gómez Ramírez	valeria.gómez12@techstore.mx	Director de RH	27401.75	2020-01-02	4	6
13	Fernanda	Castro Núñez	fernanda.castro13@techstore.mx	Coordinador de Capacitación	22429.63	2024-10-19	4	4
14	Liliana	Díaz Castro	liliana.díaz14@techstore.mx	Negociador de Proveedores	38425.74	2024-10-24	9	9
15	Miguel	Vega Martínez	miguel.vega15@techstore.mx	Agente de Soporte	57803.56	2017-06-25	8	11
16	Fernanda	Gómez Jiménez	fernanda.gómez16@techstore.mx	Controlador de Inventario	50625.35	2020-02-28	7	14
17	Sofía	Moreno Castro	sofía.moreno17@techstore.mx	Representante de Ventas	68107.71	2022-07-20	1	4
18	Andrés	García Ramos	andrés.garcía18@techstore.mx	Analista Financiero	82947.83	2017-10-27	5	6
19	Gabriela	Aguilar Vargas	gabriela.aguilar19@techstore.mx	Analista de Compras	23157.27	2017-10-24	9	6
20	Sandra	Núñez García	sandra.núñez20@techstore.mx	Comprador Senior	47668.22	2025-02-09	9	12
21	Ricardo	Castro Ortega	ricardo.castro21@techstore.mx	CFO	18252.70	2020-11-30	5	3
22	Patricia	Moreno Morales	patricia.moreno22@techstore.mx	Analista de Compras	31349.13	2016-07-31	9	20
23	Verónica	Herrera Ramos	verónica.herrera23@techstore.mx	Coordinador de Envíos	64045.28	2021-11-21	7	22
24	Francisco	Cruz Martínez	francisco.cruz24@techstore.mx	Supervisor de Almacén	28402.91	2022-07-29	6	1
25	Liliana	Sánchez García	liliana.sánchez25@techstore.mx	Director Legal	63672.39	2025-09-14	10	8
26	Valeria	López Reyes	valeria.lópez26@techstore.mx	Analista de Marketing	32328.84	2020-12-02	2	7
27	Ramón	Ortega Morales	ramón.ortega27@techstore.mx	Analista de Compras	69277.22	2017-04-23	9	14
28	Mario	Rivera Díaz	mario.rivera28@techstore.mx	Coordinador de Capacitación	46092.80	2018-03-10	4	2
29	David	Mendoza Vega	david.mendoza29@techstore.mx	Director de Marketing	30151.91	2024-03-25	2	18
30	Roberto	Ramírez Cruz	roberto.ramírez30@techstore.mx	Agente de Soporte	75837.47	2025-07-09	8	15
31	Manuel	Aguilar García	manuel.aguilar31@techstore.mx	Jefe de Compras	79624.79	2016-11-05	9	8
32	Diego	Pérez Vega	diego.pérez32@techstore.mx	Analista de Sistemas	77878.33	2024-07-08	3	13
33	Isabel	Núñez Mendoza	isabel.núñez33@techstore.mx	Asesor Comercial	32823.19	2018-07-21	1	32
34	Fernando	Hernández Ortega	fernando.hernández34@techstore.mx	DBA	16449.90	2022-11-06	3	4
35	Sandra	Núñez Vega	sandra.núñez35@techstore.mx	Ejecutivo de Ventas	16152.21	2020-09-01	1	6
36	José	Moreno Vega	josé.moreno36@techstore.mx	Desarrollador Senior	41475.62	2019-12-23	3	16
37	Adriana	López Díaz	adriana.lópez37@techstore.mx	Asesor Legal	80233.56	2024-01-28	10	21
38	Juan	Moreno Vargas	juan.moreno38@techstore.mx	Especialista en Nómina	45377.39	2017-12-07	4	5
39	Ramón	Martínez López	ramón.martínez39@techstore.mx	Ejecutivo de Ventas	48929.58	2024-11-17	1	23
40	Daniela	Torres Rodríguez	daniela.torres40@techstore.mx	Diseñador Gráfico	72863.38	2018-06-23	2	20
41	Sandra	García Moreno	sandra.garcía41@techstore.mx	Asesor Legal	80018.19	2025-03-15	10	9
42	Luis	Ramos Gutiérrez	luis.ramos42@techstore.mx	Contador	31881.42	2019-08-01	5	14
43	Alejandro	Reyes Morales	alejandro.reyes43@techstore.mx	Coordinador de Operaciones	78089.56	2016-11-16	6	4
44	Isabel	Hernández García	isabel.hernández44@techstore.mx	Especialista en SEO	68291.70	2019-03-22	2	17
45	Verónica	Castillo Díaz	verónica.castillo45@techstore.mx	DBA	12705.89	2025-07-09	3	10
46	Eduardo	Ortega Gutiérrez	eduardo.ortega46@techstore.mx	Analista de Compras	43374.43	2025-11-23	9	20
47	Ana	Castro Rivera	ana.castro47@techstore.mx	Supervisor de Almacén	61790.87	2018-11-20	6	7
48	Alejandra	Jiménez Ramos	alejandra.jiménez48@techstore.mx	Supervisor de Almacén	79580.76	2023-09-17	6	11
49	María	Rodríguez Ramos	maría.rodríguez49@techstore.mx	Desarrollador Junior	69114.21	2021-09-30	3	43
50	Luis	Gómez Vega	luis.gómez50@techstore.mx	Director de RH	74677.31	2023-11-14	4	13
51	Ricardo	Sánchez García	ricardo.sánchez51@techstore.mx	Agente de Soporte	41088.02	2023-03-29	8	5
52	Francisco	Gómez Moreno	francisco.gómez52@techstore.mx	Analista Financiero	80564.31	2025-01-26	5	17
53	Isabel	Hernández Martínez	isabel.hernández53@techstore.mx	DBA	43723.15	2018-03-12	3	51
54	Francisco	Martínez Gómez	francisco.martínez54@techstore.mx	Supervisor de Almacén	30594.74	2018-06-01	6	28
55	Verónica	Moreno Ramos	verónica.moreno55@techstore.mx	Ejecutivo de Ventas	38588.17	2025-07-31	1	43
56	Sofía	Ramos Castro	sofía.ramos56@techstore.mx	Coordinador de Operaciones	49019.94	2018-11-20	6	27
57	Sergio	Gutiérrez González	sergio.gutiérrez57@techstore.mx	Supervisor de Almacén	42692.58	2022-02-11	6	44
58	Gabriela	Gómez Gutiérrez	gabriela.gómez58@techstore.mx	CTO	34182.87	2024-01-04	3	28
59	Valeria	Cruz Cruz	valeria.cruz59@techstore.mx	Paralegal	61320.79	2020-08-19	10	31
60	Gabriela	Reyes Moreno	gabriela.reyes60@techstore.mx	DBA	36468.74	2017-03-09	3	49
61	Elena	Mendoza Pérez	elena.mendoza61@techstore.mx	Reclutador	13783.05	2023-08-15	4	31
62	Laura	Cruz Díaz	laura.cruz62@techstore.mx	Abogado Corporativo	64439.25	2022-01-22	10	32
63	Carlos	Castro Herrera	carlos.castro63@techstore.mx	Jefe de Logística	68824.69	2023-11-29	7	12
64	Manuel	Sánchez Núñez	manuel.sánchez64@techstore.mx	Jefe de Compras	45321.71	2017-05-18	9	30
65	Adriana	Flores Herrera	adriana.flores65@techstore.mx	Negociador de Proveedores	56723.62	2018-04-19	9	55
66	Roberto	Ramos Vega	roberto.ramos66@techstore.mx	Negociador de Proveedores	44855.09	2017-12-07	9	32
67	Sandra	Morales Vargas	sandra.morales67@techstore.mx	Contador	32045.61	2025-06-30	5	37
68	David	Castro Gutiérrez	david.castro68@techstore.mx	Director de RH	22101.31	2023-10-09	4	50
69	Laura	Díaz Díaz	laura.díaz69@techstore.mx	Desarrollador Junior	51610.61	2021-09-13	3	8
70	Fernanda	Castro Herrera	fernanda.castro70@techstore.mx	Director de RH	74541.44	2017-10-12	4	49
71	Eduardo	Torres Herrera	eduardo.torres71@techstore.mx	Coordinador de CX	74301.70	2016-12-28	8	54
72	Verónica	Mendoza Jiménez	verónica.mendoza72@techstore.mx	Analista de Compras	47640.75	2023-04-22	9	56
73	David	Moreno Moreno	david.moreno73@techstore.mx	Coordinador de CX	64865.24	2016-12-09	8	60
74	Verónica	García Núñez	verónica.garcía74@techstore.mx	Analista de Sistemas	55208.17	2018-12-06	3	4
75	Patricia	Vega Cruz	patricia.vega75@techstore.mx	Analista de Marketing	15670.78	2022-02-11	2	42
76	David	Herrera Castro	david.herrera76@techstore.mx	Coordinador de Capacitación	32312.73	2017-01-13	4	54
77	Claudia	García Ramos	claudia.garcía77@techstore.mx	CFO	84993.27	2022-06-10	5	29
78	Ana	Herrera García	ana.herrera78@techstore.mx	Analista de Marketing	26553.33	2026-02-19	2	20
79	Luis	Ortega Pérez	luis.ortega79@techstore.mx	Coordinador de Capacitación	63060.94	2017-10-06	4	48
80	Sofía	Herrera Aguilar	sofía.herrera80@techstore.mx	Desarrollador Senior	82424.62	2025-02-25	3	75
81	Liliana	Moreno Núñez	liliana.moreno81@techstore.mx	Asesor Comercial	40955.77	2018-05-07	1	26
82	Elena	Martínez Castillo	elena.martínez82@techstore.mx	Especialista en SEO	74071.41	2019-08-19	2	16
83	Daniela	Gutiérrez Díaz	daniela.gutiérrez83@techstore.mx	Asesor Legal	17033.84	2019-02-07	10	44
84	Claudia	Martínez Díaz	claudia.martínez84@techstore.mx	Representante de Ventas	58397.71	2017-01-26	1	59
85	Francisco	Vargas Ramírez	francisco.vargas85@techstore.mx	DBA	70998.54	2020-04-30	3	62
86	Ramón	Ramírez Flores	ramón.ramírez86@techstore.mx	Agente de Soporte	72643.36	2025-05-24	8	36
87	Andrés	Ortega Jiménez	andrés.ortega87@techstore.mx	Coordinador de CX	36556.95	2020-10-27	8	42
88	Eduardo	Mendoza Ramírez	eduardo.mendoza88@techstore.mx	Desarrollador Junior	32415.07	2019-09-06	3	36
89	Fernando	López Sánchez	fernando.lópez89@techstore.mx	Negociador de Proveedores	47666.18	2017-11-11	9	31
90	Claudia	Cruz Mendoza	claudia.cruz90@techstore.mx	Jefe de Soporte	18792.89	2023-11-18	8	52
91	Ramón	Rivera Morales	ramón.rivera91@techstore.mx	Especialista en Nómina	43061.78	2017-12-31	4	71
92	Andrés	Ramírez Torres	andrés.ramírez92@techstore.mx	Coordinador de Operaciones	28829.28	2018-04-11	6	25
93	Manuel	Herrera Castillo	manuel.herrera93@techstore.mx	Supervisor de Almacén	25982.49	2018-01-30	6	62
94	Sandra	Jiménez Torres	sandra.jiménez94@techstore.mx	CFO	72781.87	2023-01-16	5	30
95	Carlos	Castillo Gutiérrez	carlos.castillo95@techstore.mx	Supervisor de Almacén	32024.73	2025-10-02	6	71
96	Patricia	Vargas Vega	patricia.vargas96@techstore.mx	Auditor Interno	19488.90	2026-03-24	5	74
97	Andrés	Flores Rodríguez	andrés.flores97@techstore.mx	CFO	30430.92	2016-09-13	5	62
98	Fernanda	Morales López	fernanda.morales98@techstore.mx	Director de Marketing	23076.07	2017-04-08	2	73
99	Ricardo	Martínez Gutiérrez	ricardo.martínez99@techstore.mx	Auditor Interno	56261.19	2017-07-01	5	80
100	Fernanda	Cruz Núñez	fernanda.cruz100@techstore.mx	Coordinador de Capacitación	33706.78	2019-10-07	4	55
101	Ana	Jiménez Ramos	ana.jiménez101@techstore.mx	CFO	81174.08	2024-01-13	5	81
102	José	Rodríguez Sánchez	josé.rodríguez102@techstore.mx	Reclutador	52295.43	2024-08-10	4	1
103	Alberto	Morales Torres	alberto.morales103@techstore.mx	Jefe de Logística	28897.77	2018-06-09	7	37
104	Ricardo	Núñez Ramírez	ricardo.núñez104@techstore.mx	Agente de Soporte	43035.14	2020-04-04	8	29
105	Patricia	López Hernández	patricia.lópez105@techstore.mx	Desarrollador Senior	69861.89	2019-09-10	3	96
106	Mónica	Martínez Cruz	mónica.martínez106@techstore.mx	Asesor Legal	63080.56	2023-04-24	10	65
107	José	Jiménez Hernández	josé.jiménez107@techstore.mx	Negociador de Proveedores	65620.98	2019-08-06	9	33
108	Ramón	Ortega García	ramón.ortega108@techstore.mx	Representante de Ventas	54066.03	2017-10-22	1	97
109	Andrés	Núñez Ramírez	andrés.núñez109@techstore.mx	Desarrollador Senior	84777.02	2021-06-23	3	82
110	Claudia	Rivera Díaz	claudia.rivera110@techstore.mx	Técnico de Soporte	35437.25	2025-03-11	8	21
111	Diego	Torres Moreno	diego.torres111@techstore.mx	Analista de Procesos	71390.32	2020-03-12	6	5
112	Alejandro	Flores Martínez	alejandro.flores112@techstore.mx	Coordinador de CX	75138.47	2017-02-11	8	1
113	Miguel	Pérez Reyes	miguel.pérez113@techstore.mx	Comprador Senior	57452.27	2020-10-10	9	81
114	Rosa	Ramírez Gutiérrez	rosa.ramírez114@techstore.mx	Agente de Soporte	79720.11	2021-06-14	8	113
115	Alberto	Mendoza Sánchez	alberto.mendoza115@techstore.mx	Agente de Soporte	34684.76	2026-03-18	8	71
116	Luis	Cruz Martínez	luis.cruz116@techstore.mx	Coordinador de Envíos	48381.41	2018-04-30	7	38
117	Alejandra	Aguilar Morales	alejandra.aguilar117@techstore.mx	Negociador de Proveedores	29792.36	2020-03-08	9	19
118	Alberto	Reyes Ramos	alberto.reyes118@techstore.mx	Coordinador de Envíos	75073.97	2023-04-08	7	99
119	Francisco	Ramírez Aguilar	francisco.ramírez119@techstore.mx	Jefe de Logística	32647.25	2023-01-07	7	108
120	Claudia	Vega González	claudia.vega120@techstore.mx	Paralegal	51316.38	2022-06-30	10	43
121	Fernanda	Cruz Núñez	fernanda.cruz121@techstore.mx	Comprador Senior	75480.92	2018-07-18	9	31
122	Mario	Hernández Flores	mario.hernández122@techstore.mx	Paralegal	63481.64	2017-04-07	10	49
123	Patricia	Morales Hernández	patricia.morales123@techstore.mx	Coordinador de Envíos	48667.25	2019-09-30	7	43
124	Mónica	Martínez Reyes	mónica.martínez124@techstore.mx	Diseñador Gráfico	13120.37	2024-09-30	2	53
125	Alejandro	Flores Jiménez	alejandro.flores125@techstore.mx	Analista de Sistemas	59438.08	2016-10-24	3	43
126	David	Vargas Castillo	david.vargas126@techstore.mx	Negociador de Proveedores	75683.96	2025-12-17	9	80
127	Sergio	Sánchez Ramos	sergio.sánchez127@techstore.mx	Director de Marketing	43679.92	2025-04-05	2	98
128	Sergio	Castro García	sergio.castro128@techstore.mx	Director de Marketing	35679.35	2025-09-26	2	38
129	Juan	Sánchez Reyes	juan.sánchez129@techstore.mx	Analista de Procesos	53312.75	2017-06-23	6	47
130	Alberto	Vega Gómez	alberto.vega130@techstore.mx	DBA	61868.82	2020-10-13	3	37
131	Alejandro	Cruz Ramírez	alejandro.cruz131@techstore.mx	Director de RH	77620.32	2021-02-23	4	74
132	Andrés	Rivera Ortega	andrés.rivera132@techstore.mx	Comprador Senior	58642.53	2021-08-10	9	65
133	Rosa	Gómez Vega	rosa.gómez133@techstore.mx	Coordinador de CX	19785.69	2022-02-01	8	92
134	Sergio	García Aguilar	sergio.garcía134@techstore.mx	Paralegal	32037.07	2020-01-07	10	13
135	Gabriela	Herrera Mendoza	gabriela.herrera135@techstore.mx	Abogado Corporativo	56315.74	2022-05-31	10	57
136	Patricia	Vargas Martínez	patricia.vargas136@techstore.mx	Director de RH	34552.10	2021-06-03	4	9
137	Juan	López Núñez	juan.lópez137@techstore.mx	Asesor Legal	35850.50	2021-09-15	10	45
138	Manuel	Castro Rivera	manuel.castro138@techstore.mx	Especialista en Nómina	72624.50	2023-06-26	4	124
139	Valeria	Mendoza Martínez	valeria.mendoza139@techstore.mx	Auditor Interno	82291.21	2024-10-14	5	58
140	Verónica	Rivera López	verónica.rivera140@techstore.mx	Controlador de Inventario	13016.06	2020-05-07	7	32
141	Alejandro	Ortega Gómez	alejandro.ortega141@techstore.mx	Técnico de Soporte	19909.27	2023-09-29	8	121
142	Verónica	Flores Núñez	verónica.flores142@techstore.mx	Ejecutivo de Ventas	59278.62	2019-03-29	1	119
143	Sofía	González Hernández	sofía.gonzález143@techstore.mx	CFO	34218.61	2020-11-03	5	30
144	Manuel	González Gómez	manuel.gonzález144@techstore.mx	Diseñador Gráfico	39083.84	2018-01-12	2	139
145	Patricia	Castro Díaz	patricia.castro145@techstore.mx	Jefe de Logística	72859.60	2019-06-18	7	105
146	Eduardo	Pérez Cruz	eduardo.pérez146@techstore.mx	Auditor Interno	81390.53	2016-10-09	5	93
147	Daniela	Gutiérrez Castro	daniela.gutiérrez147@techstore.mx	Especialista en SEO	16420.16	2023-04-09	2	49
148	Mónica	López Moreno	mónica.lópez148@techstore.mx	Analista de Marketing	58844.43	2019-09-02	2	6
149	Elena	González Mendoza	elena.gonzález149@techstore.mx	Ejecutivo de Ventas	17008.54	2017-10-13	1	142
150	Elena	Flores Herrera	elena.flores150@techstore.mx	Reclutador	69570.99	2019-09-06	4	1
151	Patricia	González Gutiérrez	patricia.gonzález151@techstore.mx	Analista Financiero	70291.51	2025-02-17	5	7
152	Ricardo	Ortega Flores	ricardo.ortega152@techstore.mx	CTO	24719.97	2025-10-11	3	33
153	Laura	Morales Cruz	laura.morales153@techstore.mx	Operador de Almacén	49466.37	2025-02-21	7	116
154	Alberto	Hernández Ramos	alberto.hernández154@techstore.mx	Comprador Senior	45437.10	2026-01-06	9	16
155	Alejandra	Moreno Martínez	alejandra.moreno155@techstore.mx	Coordinador de CX	64005.30	2021-05-23	8	19
156	Juan	López González	juan.lópez156@techstore.mx	Especialista en SEO	57575.18	2019-10-20	2	141
157	Alberto	Reyes Torres	alberto.reyes157@techstore.mx	Analista de Procesos	48905.23	2021-07-16	6	26
158	Verónica	Ramos Vega	verónica.ramos158@techstore.mx	Analista de Marketing	43395.11	2023-10-21	2	106
159	Fernanda	Díaz Ramos	fernanda.díaz159@techstore.mx	Director de Operaciones	34816.03	2022-11-10	6	66
160	Claudia	López López	claudia.lópez160@techstore.mx	Director de Operaciones	18805.80	2025-04-13	6	96
161	Liliana	Gutiérrez Gutiérrez	liliana.gutiérrez161@techstore.mx	Desarrollador Junior	60910.97	2021-10-04	3	91
162	Ana	Torres Jiménez	ana.torres162@techstore.mx	Operador de Almacén	37670.17	2019-11-19	7	130
163	Diego	Sánchez Vega	diego.sánchez163@techstore.mx	Director de RH	37558.32	2020-02-16	4	95
164	Liliana	Sánchez Mendoza	liliana.sánchez164@techstore.mx	Diseñador Gráfico	73696.33	2017-10-04	2	160
165	Verónica	García Jiménez	verónica.garcía165@techstore.mx	Asesor Legal	14113.58	2023-04-20	10	80
166	Roberto	Vega González	roberto.vega166@techstore.mx	Analista de Procesos	17079.74	2018-01-20	6	163
167	Francisco	Pérez Gómez	francisco.pérez167@techstore.mx	Asesor Comercial	45116.14	2024-08-07	1	95
168	Liliana	Jiménez López	liliana.jiménez168@techstore.mx	CFO	23357.33	2017-11-26	5	159
169	Isabel	Cruz Moreno	isabel.cruz169@techstore.mx	Asesor Comercial	47453.30	2021-05-29	1	107
170	Francisco	Martínez Rivera	francisco.martínez170@techstore.mx	Auditor Interno	20094.95	2018-10-05	5	152
171	Gabriela	Hernández Sánchez	gabriela.hernández171@techstore.mx	Coordinador de CX	83864.53	2025-10-01	8	2
172	Fernando	Herrera González	fernando.herrera172@techstore.mx	Especialista en Nómina	33129.64	2025-01-07	4	2
173	Carmen	González Gómez	carmen.gonzález173@techstore.mx	Agente de Soporte	48519.15	2017-01-07	8	172
174	Miguel	Díaz García	miguel.díaz174@techstore.mx	Analista de Procesos	79244.86	2016-09-11	6	81
175	Pablo	Castillo Vargas	pablo.castillo175@techstore.mx	Paralegal	33134.61	2021-10-27	10	6
176	Alberto	Cruz Aguilar	alberto.cruz176@techstore.mx	Coordinador de Operaciones	18433.48	2016-11-22	6	28
177	Pablo	Reyes López	pablo.reyes177@techstore.mx	Coordinador de Capacitación	75548.28	2018-01-01	4	87
178	Roberto	López Reyes	roberto.lópez178@techstore.mx	Director de RH	50734.15	2024-03-10	4	90
179	Patricia	Sánchez Martínez	patricia.sánchez179@techstore.mx	Supervisor de Almacén	30685.68	2024-06-02	6	155
180	Laura	Rodríguez Herrera	laura.rodríguez180@techstore.mx	Analista de Sistemas	45868.57	2020-01-16	3	149
181	Liliana	Vargas Vargas	liliana.vargas181@techstore.mx	Técnico de Soporte	75090.02	2019-05-01	8	81
182	Diego	Cruz Vargas	diego.cruz182@techstore.mx	Desarrollador Junior	70132.07	2019-09-25	3	15
183	Gabriela	Cruz Cruz	gabriela.cruz183@techstore.mx	Director de Operaciones	16152.97	2017-01-14	6	74
184	Laura	Jiménez Jiménez	laura.jiménez184@techstore.mx	Diseñador Gráfico	45777.95	2020-02-24	2	11
185	Liliana	Vargas Pérez	liliana.vargas185@techstore.mx	Técnico de Soporte	56165.43	2020-09-28	8	39
186	David	Castillo López	david.castillo186@techstore.mx	Ejecutivo de Ventas	14857.38	2018-06-06	1	113
187	Adriana	Rodríguez Rivera	adriana.rodríguez187@techstore.mx	Técnico de Soporte	79009.39	2022-01-08	8	105
188	Ana	Mendoza Vargas	ana.mendoza188@techstore.mx	Coordinador de Operaciones	16811.57	2025-04-21	6	143
189	Alberto	Vega González	alberto.vega189@techstore.mx	Operador de Almacén	17949.65	2018-12-03	7	37
190	Pablo	González Jiménez	pablo.gonzález190@techstore.mx	Director de Operaciones	34599.48	2022-02-21	6	165
191	Sandra	López Vargas	sandra.lópez191@techstore.mx	Analista de Procesos	49119.66	2026-02-28	6	93
192	Fernando	Flores Herrera	fernando.flores192@techstore.mx	Auditor Interno	26016.38	2024-10-27	5	40
193	Luis	Reyes Herrera	luis.reyes193@techstore.mx	Director de Marketing	60320.83	2016-07-15	2	159
194	Patricia	Rodríguez Rodríguez	patricia.rodríguez194@techstore.mx	DBA	71060.19	2024-07-04	3	185
195	Eduardo	Moreno Ramos	eduardo.moreno195@techstore.mx	Agente de Soporte	82779.97	2019-07-09	8	73
196	Ricardo	Torres Mendoza	ricardo.torres196@techstore.mx	Coordinador de CX	77990.13	2024-03-10	8	95
197	Mónica	Herrera Torres	mónica.herrera197@techstore.mx	Paralegal	48712.19	2021-09-02	10	42
198	Patricia	Vega Ramírez	patricia.vega198@techstore.mx	Director de RH	58806.07	2016-07-24	4	96
199	Sandra	Vega Martínez	sandra.vega199@techstore.mx	Comprador Senior	18122.88	2024-07-26	9	70
200	Patricia	Aguilar Díaz	patricia.aguilar200@techstore.mx	Jefe de Soporte	81088.17	2023-11-16	8	116
\.


--
-- TOC entry 5089 (class 0 OID 24622)
-- Dependencies: 219
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados (id, nombre) FROM stdin;
1	Aguascalientes
2	Baja California
3	CDMX
4	Chihuahua
5	Coahuila
6	Guanajuato
7	Guerrero
8	Jalisco
9	Michoacán
10	Nuevo León
11	Puebla
12	Querétaro
13	San Luis Potosí
14	Sinaloa
15	Sonora
16	Veracruz
17	Yucatán
\.


--
-- TOC entry 5097 (class 0 OID 25148)
-- Dependencies: 227
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (pedido_id, cliente_id, empleado_id, fecha_pedido, fecha_entrega, estado, total, descuento, metodo_pago, region_id) FROM stdin;
784	1130	150	2025-05-22	2025-06-01	entregado	138911.58	10.00	PayPal	6
1	1546	185	2023-11-03	2023-11-15	entregado	116339.82	10.00	efectivo	4
2	260	173	2024-03-25	2024-03-26	procesando	71570.32	0.00	PayPal	4
3	1613	150	2025-12-30	2025-12-31	entregado	52061.62	15.00	tarjeta_debito	8
4	630	35	2024-09-04	2024-09-10	entregado	153779.70	10.00	tarjeta_credito	1
5	1414	136	2024-08-09	2024-08-23	enviado	39423.23	0.00	PayPal	2
6	88	73	2024-08-09	2024-08-10	cancelado	66360.84	0.00	OXXO	8
7	424	103	2026-01-20	2026-02-04	entregado	168111.23	5.00	PayPal	8
8	422	98	2024-03-10	2024-03-13	pendiente	89199.54	0.00	OXXO	6
9	1044	185	2024-03-12	2024-03-22	entregado	10164.14	0.00	PayPal	1
10	1443	2	2024-07-28	2024-08-06	entregado	79805.68	15.00	transferencia	2
11	752	163	2024-10-22	2024-10-30	procesando	72464.52	0.00	efectivo	7
12	1681	97	2025-02-06	2025-02-16	entregado	169713.91	0.00	efectivo	2
13	208	98	2024-10-25	2024-10-29	entregado	34718.64	5.00	tarjeta_credito	3
14	1717	131	2025-02-05	2025-02-13	entregado	122780.05	0.00	tarjeta_debito	7
15	1569	167	2024-04-28	2024-05-05	entregado	158019.47	15.00	efectivo	3
16	1068	22	2024-04-29	2024-05-12	entregado	92372.91	0.00	OXXO	7
17	157	9	2025-11-09	2025-11-19	devuelto	127580.68	0.00	efectivo	4
18	686	138	2024-10-06	2024-10-13	cancelado	32835.90	0.00	efectivo	2
19	77	49	2026-06-09	2026-06-12	entregado	74926.32	0.00	efectivo	3
20	997	108	2025-04-10	2025-04-17	entregado	60409.83	15.00	tarjeta_credito	5
21	1298	67	2024-12-04	2024-12-12	entregado	42641.00	10.00	tarjeta_debito	6
22	1627	55	2026-04-28	2026-05-08	entregado	114784.16	10.00	transferencia	8
23	824	67	2026-06-04	2026-06-14	entregado	38068.00	5.00	efectivo	8
24	1568	70	2024-08-25	2024-09-07	devuelto	348027.98	0.00	OXXO	4
25	1703	197	2024-08-07	2024-08-16	procesando	62886.73	0.00	transferencia	2
26	929	69	2025-05-05	2025-05-06	enviado	147003.44	0.00	PayPal	2
27	1616	28	2024-04-17	2024-05-01	cancelado	314440.41	0.00	OXXO	1
28	416	79	2025-04-11	2025-04-21	enviado	28296.72	5.00	tarjeta_credito	8
29	421	141	2023-10-23	2023-10-31	procesando	24291.71	0.00	PayPal	4
30	1500	60	2025-03-29	2025-04-05	entregado	21539.86	0.00	tarjeta_credito	5
31	194	60	2026-05-25	2026-06-04	entregado	16426.24	15.00	efectivo	4
32	1050	164	2024-02-04	2024-02-05	entregado	469316.76	0.00	tarjeta_debito	6
33	542	43	2026-03-23	2026-04-07	entregado	68258.63	5.00	tarjeta_debito	4
34	1832	22	2026-04-01	2026-04-13	procesando	150499.24	0.00	tarjeta_debito	1
35	550	195	2024-11-16	2024-11-18	entregado	277629.71	10.00	transferencia	5
36	205	145	2025-03-28	2025-03-31	entregado	53214.36	20.00	tarjeta_debito	2
37	122	160	2023-09-27	2023-10-09	enviado	306139.82	0.00	OXXO	3
38	296	193	2024-11-21	2024-11-30	devuelto	24451.03	0.00	OXXO	8
39	310	191	2024-04-04	2024-04-09	cancelado	54939.53	5.00	tarjeta_debito	3
40	364	96	2026-01-02	2026-01-10	cancelado	227195.80	10.00	tarjeta_debito	5
41	29	68	2025-03-30	2025-04-02	entregado	187195.06	0.00	PayPal	1
42	73	50	2024-09-24	2024-10-01	enviado	111437.40	0.00	transferencia	4
43	103	122	2026-05-18	2026-05-21	enviado	19102.86	0.00	OXXO	3
44	115	39	2026-04-01	2026-04-02	enviado	31189.63	10.00	tarjeta_debito	7
45	1830	107	2025-09-07	2025-09-09	enviado	120292.24	0.00	PayPal	1
46	21	87	2023-11-02	2023-11-10	enviado	51362.09	0.00	tarjeta_credito	8
47	499	35	2024-07-28	2024-08-10	enviado	45964.67	0.00	transferencia	4
48	1261	119	2025-12-10	2025-12-14	procesando	26581.95	0.00	transferencia	3
49	329	24	2025-10-31	2025-11-04	enviado	65987.76	0.00	tarjeta_credito	8
50	1812	20	2024-04-04	2024-04-12	entregado	61752.30	0.00	efectivo	6
51	1783	182	2024-11-16	2024-11-28	entregado	35238.09	0.00	transferencia	2
52	1167	43	2026-01-22	2026-01-30	cancelado	9922.64	0.00	efectivo	4
53	834	14	2025-08-19	2025-09-02	entregado	153645.81	0.00	tarjeta_debito	3
54	739	37	2025-12-03	2025-12-14	entregado	76301.25	0.00	tarjeta_debito	4
55	1867	151	2024-12-06	2024-12-19	entregado	82821.88	20.00	OXXO	1
56	1195	70	2024-09-25	2024-10-07	cancelado	3445.54	10.00	transferencia	3
57	770	158	2026-04-26	2026-04-30	procesando	4679.42	0.00	OXXO	6
58	647	25	2025-03-08	2025-03-23	entregado	110093.16	0.00	OXXO	8
59	1235	77	2026-04-23	2026-05-04	entregado	105439.51	15.00	OXXO	6
60	1197	139	2024-06-23	2024-06-25	entregado	65380.91	0.00	tarjeta_credito	2
61	655	138	2025-12-07	2025-12-10	cancelado	13909.02	5.00	transferencia	5
62	1501	156	2024-02-15	2024-02-20	entregado	203691.89	0.00	PayPal	7
63	260	55	2023-11-05	2023-11-12	devuelto	149888.38	15.00	PayPal	5
64	639	117	2024-12-28	2024-12-29	enviado	136119.75	0.00	OXXO	2
65	1157	29	2026-04-06	2026-04-14	entregado	104728.37	10.00	tarjeta_debito	2
66	896	77	2026-03-14	2026-03-15	entregado	142445.39	10.00	PayPal	4
67	805	156	2025-09-23	2025-10-07	entregado	122551.03	0.00	tarjeta_debito	5
68	1107	69	2023-08-02	2023-08-09	entregado	46211.38	15.00	tarjeta_credito	3
69	241	58	2023-06-27	2023-07-04	entregado	192344.88	0.00	tarjeta_debito	1
70	345	17	2025-07-06	2025-07-10	procesando	59373.73	0.00	OXXO	3
71	1775	4	2024-06-06	2024-06-21	entregado	20290.25	15.00	tarjeta_debito	1
72	125	6	2026-05-05	2026-05-14	enviado	131743.79	0.00	efectivo	7
73	929	62	2025-10-27	2025-11-06	entregado	13662.93	5.00	PayPal	2
74	249	65	2025-10-11	2025-10-18	procesando	167659.50	0.00	tarjeta_credito	7
75	1163	193	2025-08-04	2025-08-18	entregado	178922.78	5.00	tarjeta_debito	8
76	1520	149	2023-06-18	2023-07-01	enviado	15953.25	0.00	OXXO	1
77	796	3	2024-07-22	2024-07-27	enviado	25751.16	10.00	tarjeta_credito	7
78	984	67	2024-04-07	2024-04-11	entregado	25927.88	0.00	PayPal	5
79	1402	57	2025-01-17	2025-01-24	entregado	53800.12	0.00	tarjeta_debito	8
80	169	25	2023-07-06	2023-07-21	entregado	87094.29	0.00	PayPal	6
81	1422	67	2024-08-05	2024-08-14	entregado	77961.22	5.00	efectivo	3
82	1993	5	2025-05-20	2025-05-31	entregado	249552.21	10.00	tarjeta_credito	2
83	744	53	2024-08-17	2024-08-30	entregado	128154.73	0.00	tarjeta_credito	8
84	659	97	2025-01-15	2025-01-20	enviado	103004.64	10.00	transferencia	7
85	905	38	2026-02-22	2026-02-24	entregado	263252.69	0.00	OXXO	1
86	1660	36	2025-12-06	2025-12-18	enviado	84874.90	15.00	OXXO	4
87	1052	115	2024-10-28	2024-10-29	entregado	25648.27	15.00	tarjeta_debito	1
88	1088	89	2023-08-21	2023-09-05	entregado	81624.14	0.00	efectivo	3
89	958	59	2024-06-07	2024-06-18	devuelto	207174.06	0.00	tarjeta_debito	4
90	706	117	2026-05-07	2026-05-08	entregado	191734.83	0.00	tarjeta_credito	3
91	1130	180	2024-08-01	2024-08-03	enviado	122387.55	5.00	tarjeta_credito	3
92	1611	162	2024-08-10	2024-08-16	enviado	10571.43	0.00	transferencia	2
93	1810	9	2026-02-07	2026-02-15	enviado	67508.14	0.00	efectivo	7
94	837	7	2026-02-21	2026-02-23	entregado	44597.29	0.00	tarjeta_debito	8
95	178	8	2025-12-10	2025-12-22	cancelado	142078.65	15.00	tarjeta_debito	3
96	1163	189	2024-01-19	2024-01-21	entregado	100856.29	0.00	OXXO	5
97	1939	137	2024-05-06	2024-05-07	entregado	17409.10	0.00	efectivo	4
98	1958	198	2024-12-29	2025-01-03	entregado	496102.21	0.00	efectivo	3
99	1831	37	2023-12-24	2023-12-31	devuelto	11952.67	15.00	efectivo	7
100	1691	7	2025-11-04	2025-11-14	entregado	85087.57	0.00	efectivo	8
101	1473	191	2025-04-18	2025-04-30	entregado	210513.25	10.00	efectivo	4
102	717	143	2024-01-30	2024-02-01	entregado	98136.72	0.00	tarjeta_debito	3
103	1926	82	2025-11-16	2025-11-28	procesando	51752.97	10.00	OXXO	3
104	808	116	2026-06-04	2026-06-13	entregado	12556.36	0.00	transferencia	6
105	1909	179	2024-03-14	2024-03-17	cancelado	142769.06	0.00	tarjeta_credito	8
106	1811	105	2023-12-19	2023-12-28	cancelado	37669.08	0.00	PayPal	5
107	970	120	2025-12-29	2026-01-09	entregado	64512.01	0.00	tarjeta_debito	6
108	31	10	2024-02-17	2024-03-03	entregado	32296.11	5.00	PayPal	8
109	618	38	2025-09-27	2025-10-01	entregado	73724.83	0.00	tarjeta_debito	5
110	110	79	2024-02-04	2024-02-19	procesando	22949.80	0.00	tarjeta_debito	2
111	309	23	2024-07-23	2024-08-05	enviado	82173.96	10.00	PayPal	6
112	336	92	2025-01-02	2025-01-12	procesando	135641.94	0.00	transferencia	5
113	1641	73	2025-12-13	2025-12-26	entregado	77419.54	5.00	PayPal	8
114	1586	51	2025-12-29	2026-01-07	entregado	52682.03	0.00	OXXO	7
115	479	79	2025-03-07	2025-03-13	procesando	53186.98	10.00	PayPal	3
116	1483	17	2023-06-26	2023-07-05	entregado	57037.59	10.00	PayPal	1
117	830	104	2024-12-27	2025-01-10	procesando	121948.67	0.00	tarjeta_credito	2
118	90	47	2025-12-07	2025-12-10	cancelado	11721.98	0.00	tarjeta_debito	5
119	169	186	2025-05-26	2025-05-30	cancelado	124734.19	0.00	transferencia	1
120	637	157	2023-06-26	2023-07-03	entregado	38974.15	15.00	transferencia	3
121	206	183	2023-08-12	2023-08-19	entregado	78582.40	0.00	tarjeta_debito	1
122	1432	52	2025-11-08	2025-11-18	entregado	91750.17	10.00	PayPal	1
123	165	23	2024-11-23	2024-11-24	pendiente	29726.35	0.00	transferencia	2
124	493	28	2023-08-30	2023-09-11	entregado	192173.62	10.00	OXXO	7
125	94	200	2025-11-09	2025-11-24	enviado	236151.49	0.00	tarjeta_debito	6
126	1401	184	2026-02-27	2026-03-11	enviado	72403.37	0.00	OXXO	5
127	1732	163	2023-10-30	2023-11-13	enviado	119764.15	15.00	tarjeta_credito	2
128	158	53	2023-12-28	2024-01-03	entregado	18594.24	5.00	OXXO	2
129	47	121	2025-07-06	2025-07-15	enviado	3868.44	15.00	transferencia	1
130	966	36	2023-10-27	2023-11-06	procesando	211237.24	10.00	transferencia	2
131	1937	107	2025-11-07	2025-11-14	entregado	245337.45	5.00	tarjeta_credito	8
132	1999	40	2025-09-19	2025-10-04	entregado	103938.18	5.00	PayPal	7
133	515	124	2023-09-11	2023-09-24	entregado	36521.76	0.00	efectivo	4
134	83	115	2024-02-04	2024-02-13	cancelado	30474.51	15.00	tarjeta_credito	3
135	1635	74	2026-05-12	2026-05-23	procesando	99158.57	5.00	efectivo	8
136	1776	129	2026-04-08	2026-04-09	entregado	140638.29	0.00	efectivo	4
137	1636	197	2025-09-08	2025-09-12	cancelado	27329.71	20.00	tarjeta_debito	2
138	801	150	2026-03-26	2026-04-08	devuelto	137703.03	5.00	transferencia	6
139	1735	117	2024-12-27	2025-01-03	procesando	125249.44	0.00	transferencia	6
140	136	112	2025-10-12	2025-10-16	enviado	116920.33	20.00	efectivo	3
141	184	83	2026-02-19	2026-03-03	entregado	419058.68	0.00	efectivo	3
142	796	19	2026-06-02	2026-06-10	pendiente	200579.59	0.00	efectivo	1
143	1928	167	2023-07-07	2023-07-20	entregado	23993.06	10.00	efectivo	4
144	1440	192	2025-10-24	2025-11-03	enviado	11693.86	0.00	tarjeta_debito	5
145	1110	75	2023-08-16	2023-08-18	entregado	74879.62	0.00	tarjeta_credito	7
146	1231	20	2026-05-11	2026-05-17	cancelado	27175.52	0.00	tarjeta_credito	6
147	1867	19	2024-04-30	2024-05-08	procesando	68715.11	10.00	OXXO	7
148	1431	75	2024-03-06	2024-03-18	procesando	14592.86	0.00	PayPal	6
149	477	80	2025-12-08	2025-12-10	entregado	6792.28	0.00	tarjeta_credito	5
150	1868	128	2024-02-01	2024-02-06	procesando	159216.93	0.00	PayPal	7
151	1753	32	2024-08-25	2024-09-02	entregado	103656.07	0.00	OXXO	2
152	281	140	2026-01-06	2026-01-21	entregado	14223.07	0.00	tarjeta_credito	3
153	480	152	2024-05-10	2024-05-23	enviado	29386.11	5.00	efectivo	6
154	532	40	2024-05-02	2024-05-16	pendiente	26900.06	0.00	OXXO	8
155	330	59	2024-04-17	2024-04-18	entregado	39872.51	10.00	transferencia	6
156	1581	72	2024-01-28	2024-02-10	entregado	25830.57	0.00	efectivo	2
157	905	27	2026-04-17	2026-04-25	entregado	29288.39	10.00	transferencia	2
158	741	99	2024-12-19	2025-01-01	procesando	13299.36	5.00	OXXO	4
159	986	171	2026-02-06	2026-02-10	entregado	2994.33	0.00	tarjeta_debito	1
160	1590	48	2023-12-19	2023-12-24	cancelado	158355.84	10.00	PayPal	6
161	1446	118	2025-06-06	2025-06-13	entregado	18657.08	5.00	efectivo	5
162	1579	193	2024-03-26	2024-04-06	enviado	48434.39	20.00	transferencia	3
163	1137	133	2024-10-05	2024-10-06	entregado	94257.20	0.00	tarjeta_debito	1
164	913	168	2024-04-30	2024-05-11	entregado	17993.86	0.00	tarjeta_credito	4
165	1932	87	2025-04-11	2025-04-23	enviado	152172.99	15.00	transferencia	7
166	1417	36	2024-06-08	2024-06-18	entregado	117494.17	15.00	transferencia	8
167	1244	14	2024-03-01	2024-03-16	procesando	46243.25	0.00	efectivo	7
168	1212	174	2025-02-18	2025-02-21	entregado	39912.90	0.00	efectivo	4
169	532	2	2024-07-01	2024-07-14	entregado	194817.47	5.00	PayPal	3
170	972	52	2024-02-06	2024-02-18	entregado	46640.67	15.00	PayPal	8
171	879	66	2026-05-24	2026-05-30	entregado	64101.70	5.00	efectivo	7
172	923	15	2023-10-15	2023-10-24	enviado	129440.92	0.00	OXXO	6
173	706	66	2025-07-21	2025-07-28	cancelado	37275.44	5.00	tarjeta_credito	4
174	1703	135	2024-12-27	2024-12-30	cancelado	41073.88	0.00	transferencia	3
175	933	187	2025-04-15	2025-04-18	entregado	204762.06	0.00	OXXO	3
176	988	27	2025-11-06	2025-11-19	entregado	159521.52	0.00	efectivo	8
177	873	156	2025-10-07	2025-10-15	entregado	62284.70	0.00	efectivo	3
178	1264	140	2024-05-11	2024-05-13	entregado	31421.36	10.00	transferencia	4
179	67	96	2025-06-17	2025-06-19	cancelado	178288.00	20.00	tarjeta_credito	4
180	1198	46	2025-05-24	2025-05-25	pendiente	279924.57	10.00	PayPal	1
181	196	69	2025-05-30	2025-06-10	entregado	111146.81	0.00	tarjeta_credito	1
182	865	140	2026-04-21	2026-05-05	entregado	33817.98	0.00	tarjeta_credito	4
183	1652	21	2024-03-14	2024-03-29	entregado	47801.25	15.00	tarjeta_credito	6
184	1404	3	2026-04-05	2026-04-10	enviado	114777.60	0.00	transferencia	8
185	376	65	2024-11-16	2024-11-23	enviado	206993.99	15.00	transferencia	3
186	1154	72	2023-12-16	2023-12-23	devuelto	3972.61	15.00	tarjeta_credito	4
187	1962	145	2026-04-06	2026-04-18	entregado	66574.14	15.00	efectivo	1
188	321	90	2024-08-15	2024-08-17	procesando	54969.26	0.00	PayPal	4
189	261	119	2025-07-23	2025-08-05	entregado	86665.34	5.00	tarjeta_credito	3
190	1833	147	2025-10-13	2025-10-27	entregado	100366.52	0.00	tarjeta_credito	5
191	1997	198	2024-01-14	2024-01-15	entregado	1079.04	0.00	transferencia	8
192	810	166	2024-08-02	2024-08-16	entregado	41367.54	15.00	PayPal	5
193	729	53	2023-09-14	2023-09-19	enviado	108929.89	5.00	efectivo	1
194	928	186	2026-06-10	2026-06-19	cancelado	130430.45	0.00	tarjeta_credito	7
195	1533	127	2024-05-28	2024-06-10	entregado	117514.90	15.00	tarjeta_debito	1
196	1118	3	2025-11-12	2025-11-22	devuelto	91164.58	10.00	PayPal	1
197	340	48	2026-01-03	2026-01-18	entregado	239965.23	10.00	efectivo	4
198	1270	9	2024-11-16	2024-11-21	enviado	161006.96	15.00	PayPal	4
199	356	41	2024-06-28	2024-07-02	entregado	132135.24	0.00	tarjeta_debito	4
200	733	18	2026-03-20	2026-03-23	cancelado	56809.56	15.00	efectivo	6
201	1748	16	2025-10-22	2025-11-01	pendiente	19311.87	0.00	efectivo	5
202	673	184	2026-04-04	2026-04-08	cancelado	126173.11	5.00	PayPal	5
203	1424	54	2025-05-11	2025-05-24	procesando	200808.95	0.00	tarjeta_debito	5
204	1741	64	2024-03-26	2024-04-10	entregado	192795.42	0.00	tarjeta_credito	1
205	711	145	2025-02-24	2025-02-26	entregado	32749.61	20.00	efectivo	5
206	186	42	2026-02-14	2026-02-22	procesando	49988.81	10.00	transferencia	6
207	1859	157	2025-09-10	2025-09-11	entregado	340.50	0.00	transferencia	7
208	406	20	2023-09-30	2023-10-08	entregado	261897.97	0.00	tarjeta_debito	2
209	1857	4	2024-04-16	2024-04-19	enviado	7635.54	15.00	OXXO	2
210	1160	53	2023-12-07	2023-12-13	enviado	55619.67	10.00	PayPal	3
211	371	102	2023-12-10	2023-12-12	procesando	7772.24	0.00	efectivo	4
212	1480	103	2025-09-22	2025-09-29	cancelado	263038.96	0.00	efectivo	3
213	1368	131	2024-03-17	2024-03-22	entregado	46887.26	15.00	tarjeta_debito	1
214	1824	159	2024-01-22	2024-01-24	entregado	18132.01	10.00	tarjeta_credito	1
215	1170	152	2025-07-22	2025-08-02	procesando	38118.45	5.00	efectivo	6
216	1792	36	2024-12-05	2024-12-06	entregado	7794.92	10.00	tarjeta_credito	6
217	1416	59	2024-08-01	2024-08-07	entregado	348536.29	0.00	tarjeta_debito	3
218	206	149	2025-11-08	2025-11-13	entregado	51263.68	10.00	PayPal	8
219	994	152	2023-11-10	2023-11-21	entregado	126737.71	0.00	tarjeta_debito	6
220	1419	190	2025-01-13	2025-01-27	entregado	171428.33	20.00	PayPal	4
221	1451	66	2024-08-22	2024-09-03	pendiente	43317.41	10.00	PayPal	3
222	1508	2	2024-09-30	2024-10-13	enviado	24309.39	0.00	transferencia	8
223	1299	98	2025-05-01	2025-05-05	pendiente	33720.78	10.00	PayPal	7
224	726	25	2024-06-08	2024-06-22	enviado	59807.64	0.00	efectivo	8
225	1468	139	2024-10-26	2024-11-02	entregado	98845.23	15.00	efectivo	6
226	1506	135	2023-06-21	2023-06-25	cancelado	84688.77	5.00	efectivo	7
227	1456	123	2025-09-08	2025-09-15	procesando	95710.54	0.00	PayPal	5
228	815	124	2025-09-28	2025-10-09	enviado	61829.38	0.00	efectivo	4
229	1766	200	2024-08-27	2024-09-08	entregado	37440.02	10.00	transferencia	3
230	1138	41	2025-06-23	2025-06-26	cancelado	131242.06	0.00	tarjeta_credito	3
231	723	187	2024-03-03	2024-03-06	procesando	189418.54	20.00	transferencia	3
232	1132	106	2025-05-21	2025-05-31	procesando	18708.10	15.00	OXXO	1
233	186	44	2025-07-14	2025-07-18	pendiente	127874.64	0.00	PayPal	3
234	1217	3	2026-05-15	2026-05-25	procesando	271829.11	0.00	tarjeta_debito	8
235	82	35	2024-02-23	2024-03-01	entregado	143218.59	15.00	efectivo	1
236	1972	149	2024-06-02	2024-06-09	entregado	56794.80	0.00	efectivo	1
237	39	184	2025-02-22	2025-03-04	entregado	76830.49	10.00	tarjeta_credito	4
238	504	95	2025-04-26	2025-05-05	enviado	84531.44	0.00	efectivo	8
239	192	23	2025-03-13	2025-03-20	cancelado	100059.89	5.00	transferencia	1
240	1909	136	2025-08-21	2025-08-29	entregado	268373.59	0.00	transferencia	5
241	820	29	2024-02-06	2024-02-20	cancelado	63933.70	0.00	transferencia	3
242	801	73	2025-03-21	2025-04-02	enviado	14273.96	15.00	tarjeta_credito	1
243	1173	84	2025-03-01	2025-03-09	entregado	3368.23	0.00	tarjeta_credito	8
244	1692	109	2025-08-15	2025-08-29	entregado	186678.60	0.00	tarjeta_debito	7
245	235	4	2024-12-28	2025-01-02	procesando	1033.84	20.00	efectivo	3
246	1923	52	2025-11-20	2025-11-27	entregado	48203.69	15.00	efectivo	2
247	1875	192	2025-05-05	2025-05-13	entregado	219268.69	0.00	transferencia	6
248	977	108	2026-04-08	2026-04-15	cancelado	45381.58	0.00	efectivo	5
249	369	160	2026-03-11	2026-03-25	entregado	151312.08	0.00	tarjeta_credito	8
250	672	88	2025-11-19	2025-11-28	enviado	126123.84	0.00	tarjeta_credito	8
251	1270	158	2025-05-21	2025-05-24	entregado	59057.70	0.00	tarjeta_debito	5
252	1148	57	2023-12-13	2023-12-18	entregado	165479.36	0.00	transferencia	3
253	449	69	2024-07-04	2024-07-11	procesando	53057.44	10.00	PayPal	7
254	1173	66	2023-12-06	2023-12-16	procesando	44549.67	0.00	efectivo	5
255	1583	138	2024-05-15	2024-05-27	entregado	14699.97	10.00	tarjeta_debito	7
256	1146	146	2026-03-19	2026-03-24	procesando	76948.06	0.00	PayPal	7
257	1504	181	2024-12-13	2024-12-15	procesando	250099.15	20.00	tarjeta_credito	6
258	466	129	2024-07-21	2024-08-01	pendiente	60354.81	0.00	efectivo	3
259	188	101	2024-11-18	2024-11-22	entregado	72480.54	5.00	tarjeta_credito	1
260	1192	200	2025-03-17	2025-03-25	enviado	43563.04	0.00	transferencia	1
261	625	126	2024-02-22	2024-03-05	entregado	101069.65	0.00	PayPal	5
262	565	55	2023-11-18	2023-11-19	entregado	25806.51	0.00	PayPal	8
263	1727	167	2024-06-22	2024-07-07	entregado	181618.45	15.00	transferencia	3
264	1392	100	2025-02-18	2025-02-25	enviado	136362.88	10.00	tarjeta_credito	6
265	1350	77	2025-12-15	2025-12-24	entregado	22981.13	5.00	PayPal	1
266	1922	16	2025-08-10	2025-08-18	entregado	149627.78	5.00	PayPal	2
267	23	199	2023-07-19	2023-07-24	entregado	71518.78	5.00	OXXO	7
268	42	75	2025-02-13	2025-02-19	entregado	46605.56	15.00	tarjeta_credito	6
269	1843	10	2025-03-02	2025-03-14	entregado	4479.66	0.00	transferencia	4
270	433	7	2024-03-22	2024-03-30	enviado	92619.52	5.00	tarjeta_credito	7
271	965	180	2025-10-08	2025-10-17	pendiente	64472.60	0.00	tarjeta_debito	7
272	841	122	2024-11-13	2024-11-26	entregado	308531.73	0.00	PayPal	8
273	1041	166	2023-08-08	2023-08-15	entregado	86576.97	5.00	efectivo	1
274	794	121	2025-04-17	2025-04-27	entregado	175676.84	0.00	tarjeta_debito	8
275	819	7	2024-09-05	2024-09-18	devuelto	135408.14	0.00	tarjeta_credito	5
276	1170	36	2025-08-31	2025-09-14	entregado	122018.44	0.00	efectivo	7
277	1567	180	2026-01-03	2026-01-12	cancelado	52449.42	5.00	transferencia	1
278	834	101	2025-04-16	2025-04-19	cancelado	199611.40	10.00	transferencia	3
279	1184	174	2026-05-12	2026-05-20	entregado	115353.38	10.00	PayPal	3
280	1571	131	2025-12-29	2026-01-09	devuelto	125355.93	10.00	tarjeta_debito	8
281	246	144	2025-07-31	2025-08-07	procesando	75932.86	20.00	tarjeta_debito	4
282	950	24	2023-11-17	2023-11-29	pendiente	78556.12	0.00	transferencia	5
283	1251	68	2025-06-25	2025-07-02	enviado	216505.52	0.00	tarjeta_debito	4
284	1992	23	2025-02-10	2025-02-16	entregado	64560.14	20.00	PayPal	1
285	232	73	2024-06-07	2024-06-20	enviado	70221.14	20.00	transferencia	1
286	780	154	2025-06-09	2025-06-11	enviado	50283.91	10.00	transferencia	4
287	5	95	2024-12-29	2025-01-08	enviado	18473.34	20.00	efectivo	4
288	1150	132	2024-11-19	2024-11-30	procesando	121181.63	10.00	OXXO	3
289	1604	178	2026-01-08	2026-01-16	procesando	462420.48	0.00	transferencia	1
290	792	163	2024-05-01	2024-05-12	entregado	141979.56	0.00	tarjeta_credito	6
291	1809	166	2023-06-27	2023-07-07	cancelado	37318.39	10.00	tarjeta_credito	2
292	778	167	2025-01-10	2025-01-25	procesando	21682.46	15.00	OXXO	3
293	1846	168	2023-07-31	2023-08-02	entregado	59957.52	0.00	transferencia	1
294	235	122	2026-02-20	2026-03-07	enviado	107456.83	0.00	OXXO	5
295	88	115	2026-03-05	2026-03-09	entregado	68443.23	5.00	tarjeta_credito	2
296	931	41	2024-03-10	2024-03-13	enviado	47458.49	5.00	transferencia	3
297	1334	198	2024-10-13	2024-10-27	entregado	85778.81	5.00	tarjeta_credito	1
298	938	38	2023-07-20	2023-07-29	procesando	203484.28	20.00	PayPal	3
299	1314	166	2023-10-29	2023-11-09	entregado	55321.48	0.00	PayPal	1
300	867	152	2025-10-24	2025-11-05	enviado	158449.28	15.00	tarjeta_credito	3
301	1639	121	2024-03-02	2024-03-09	entregado	111286.16	5.00	PayPal	3
302	1722	5	2025-02-05	2025-02-15	entregado	114673.59	0.00	tarjeta_debito	7
303	399	173	2024-12-17	2024-12-22	entregado	81316.88	0.00	PayPal	7
304	1291	167	2025-05-31	2025-06-11	entregado	2395.46	20.00	OXXO	8
305	1844	2	2025-12-27	2025-12-30	entregado	82162.25	10.00	OXXO	3
306	611	42	2024-05-07	2024-05-11	entregado	132783.68	0.00	tarjeta_credito	3
307	1960	58	2023-11-15	2023-11-21	entregado	6658.04	0.00	efectivo	8
308	830	181	2026-02-11	2026-02-15	enviado	250593.87	5.00	transferencia	1
309	271	194	2024-10-18	2024-10-22	entregado	9842.09	0.00	OXXO	5
310	87	91	2024-06-15	2024-06-19	procesando	5037.87	0.00	PayPal	2
311	1434	137	2023-12-24	2024-01-06	entregado	160036.53	15.00	OXXO	1
312	1989	63	2024-03-14	2024-03-28	procesando	58616.35	10.00	PayPal	3
313	244	91	2023-11-29	2023-12-07	entregado	185622.90	0.00	OXXO	7
314	842	39	2025-05-03	2025-05-06	entregado	160641.44	0.00	transferencia	8
315	1238	199	2023-06-24	2023-07-01	entregado	6265.57	0.00	efectivo	5
316	1162	125	2025-06-20	2025-06-23	procesando	131739.96	20.00	tarjeta_debito	7
317	378	43	2024-02-21	2024-03-02	enviado	158504.10	0.00	transferencia	7
318	149	117	2024-02-27	2024-03-01	entregado	233447.22	0.00	PayPal	3
319	1205	189	2025-01-20	2025-01-24	entregado	1143.11	5.00	transferencia	7
320	1139	132	2023-11-04	2023-11-16	entregado	68626.82	5.00	efectivo	7
321	26	78	2025-10-06	2025-10-10	entregado	21570.86	0.00	PayPal	5
322	1834	156	2025-01-22	2025-01-24	entregado	127775.29	5.00	OXXO	4
323	1999	196	2025-12-20	2025-12-23	devuelto	268184.27	0.00	tarjeta_credito	1
324	1837	18	2024-10-26	2024-10-31	entregado	77634.96	20.00	OXXO	8
325	1905	103	2025-08-15	2025-08-29	enviado	115423.88	10.00	tarjeta_credito	5
326	1518	167	2025-03-04	2025-03-18	entregado	108714.41	0.00	PayPal	2
327	446	77	2025-10-12	2025-10-13	entregado	105353.25	10.00	transferencia	6
328	312	163	2023-10-23	2023-10-26	entregado	153177.41	5.00	transferencia	6
329	1706	172	2024-04-17	2024-04-22	entregado	97237.19	10.00	OXXO	3
330	608	3	2024-08-06	2024-08-16	devuelto	238084.40	5.00	tarjeta_credito	3
331	479	87	2025-02-21	2025-02-22	enviado	151296.82	0.00	transferencia	7
332	1247	27	2024-12-24	2025-01-02	pendiente	83867.04	0.00	PayPal	1
333	1330	95	2024-03-10	2024-03-19	entregado	197223.19	0.00	transferencia	6
334	504	161	2026-06-06	2026-06-14	enviado	240465.14	0.00	PayPal	7
335	1172	86	2023-10-02	2023-10-05	procesando	24964.05	5.00	OXXO	5
336	1740	2	2024-09-15	2024-09-19	procesando	27686.38	0.00	efectivo	2
337	1456	42	2024-08-29	2024-09-02	devuelto	224040.30	5.00	transferencia	6
338	1742	104	2025-11-25	2025-11-26	entregado	74212.07	0.00	tarjeta_debito	3
339	151	128	2024-06-25	2024-06-26	entregado	137244.85	0.00	PayPal	3
340	1979	12	2025-08-15	2025-08-27	entregado	71272.66	5.00	PayPal	2
341	1210	51	2023-07-21	2023-07-29	entregado	57305.85	0.00	tarjeta_debito	5
342	1499	48	2024-10-18	2024-11-01	devuelto	89494.46	0.00	transferencia	5
343	1127	156	2026-06-11	2026-06-24	entregado	29012.55	0.00	transferencia	7
344	1774	33	2025-03-07	2025-03-13	devuelto	140837.54	15.00	tarjeta_credito	8
345	847	83	2026-01-06	2026-01-19	procesando	17931.95	0.00	transferencia	1
346	1882	177	2024-06-10	2024-06-12	entregado	184895.36	0.00	OXXO	3
347	1770	138	2024-07-01	2024-07-03	entregado	174072.94	0.00	efectivo	1
348	1240	19	2024-06-16	2024-06-25	entregado	192695.96	0.00	OXXO	2
349	1493	189	2025-11-28	2025-12-04	pendiente	131115.35	0.00	efectivo	7
350	1371	94	2025-01-18	2025-01-28	procesando	61028.29	15.00	tarjeta_credito	8
351	1682	122	2026-06-06	2026-06-07	entregado	229037.12	5.00	tarjeta_credito	5
352	654	80	2025-10-14	2025-10-23	entregado	139397.05	0.00	tarjeta_debito	3
353	365	21	2026-04-23	2026-05-04	entregado	146893.81	0.00	tarjeta_debito	1
354	489	132	2024-05-11	2024-05-26	cancelado	32548.80	5.00	OXXO	5
355	1287	178	2026-04-29	2026-05-10	entregado	132507.71	5.00	tarjeta_debito	7
356	659	41	2024-07-19	2024-07-21	devuelto	21671.36	0.00	OXXO	7
357	1453	154	2025-04-14	2025-04-28	entregado	32542.65	0.00	OXXO	7
358	271	52	2026-02-18	2026-03-05	entregado	113903.34	20.00	efectivo	5
359	1741	6	2023-08-16	2023-08-31	enviado	143916.75	0.00	transferencia	8
360	88	130	2023-09-26	2023-09-27	enviado	12873.60	0.00	OXXO	2
361	1228	180	2025-12-04	2025-12-13	cancelado	12830.91	10.00	OXXO	5
362	1773	57	2026-01-01	2026-01-03	entregado	68394.11	15.00	tarjeta_debito	7
363	776	26	2025-11-26	2025-12-02	enviado	29371.04	5.00	PayPal	1
364	703	42	2024-03-16	2024-03-20	entregado	168836.56	0.00	PayPal	7
365	67	76	2023-11-23	2023-12-06	procesando	1198.45	20.00	tarjeta_debito	1
366	643	58	2023-10-22	2023-11-02	entregado	75726.59	0.00	efectivo	6
367	1457	72	2024-10-13	2024-10-21	procesando	118587.32	20.00	tarjeta_credito	3
368	1882	164	2025-05-05	2025-05-07	entregado	55281.39	0.00	transferencia	2
369	1686	159	2024-07-17	2024-07-29	entregado	102499.86	0.00	transferencia	7
370	836	34	2024-02-28	2024-03-02	entregado	140522.84	10.00	PayPal	7
371	1890	1	2024-05-28	2024-06-01	devuelto	24249.31	0.00	transferencia	2
372	1516	137	2024-10-03	2024-10-04	entregado	126248.65	0.00	PayPal	8
373	13	56	2024-04-07	2024-04-16	entregado	106215.08	0.00	tarjeta_credito	7
374	485	11	2024-03-22	2024-03-29	entregado	182764.55	10.00	efectivo	1
375	265	188	2023-06-20	2023-07-05	enviado	95960.84	5.00	transferencia	5
376	1716	3	2025-10-07	2025-10-08	cancelado	152032.35	5.00	PayPal	2
377	338	16	2025-02-11	2025-02-22	entregado	92363.51	0.00	tarjeta_credito	5
378	695	41	2025-04-28	2025-05-11	pendiente	137793.12	10.00	PayPal	8
379	1426	153	2024-05-22	2024-05-26	cancelado	24232.21	5.00	tarjeta_debito	7
380	86	13	2023-06-15	2023-06-22	entregado	25475.23	15.00	transferencia	6
381	1879	127	2024-10-15	2024-10-26	entregado	125144.98	10.00	OXXO	3
382	90	82	2024-11-03	2024-11-15	enviado	52267.97	5.00	OXXO	5
383	1896	85	2025-03-07	2025-03-16	entregado	113257.81	5.00	OXXO	2
384	1472	141	2024-04-05	2024-04-11	enviado	214766.07	5.00	efectivo	5
385	1561	85	2024-03-18	2024-03-25	entregado	312054.12	0.00	OXXO	6
386	306	32	2023-09-05	2023-09-15	entregado	351002.00	0.00	transferencia	7
387	25	61	2024-02-26	2024-02-28	cancelado	13992.06	10.00	efectivo	7
388	63	115	2026-05-21	2026-05-26	entregado	115402.93	5.00	transferencia	7
389	33	34	2025-05-05	2025-05-11	procesando	110580.32	0.00	PayPal	6
390	56	19	2024-05-06	2024-05-10	procesando	193781.19	0.00	tarjeta_debito	2
391	867	128	2025-12-01	2025-12-07	entregado	105265.05	0.00	transferencia	1
392	765	34	2025-06-09	2025-06-14	entregado	4824.76	0.00	PayPal	6
393	630	114	2024-12-15	2024-12-16	procesando	21002.74	20.00	OXXO	6
394	438	25	2024-08-25	2024-09-06	pendiente	199303.83	15.00	PayPal	1
395	654	186	2023-11-12	2023-11-14	enviado	39017.79	10.00	OXXO	7
396	891	191	2024-10-04	2024-10-18	procesando	45322.20	5.00	transferencia	6
397	796	32	2025-02-15	2025-02-19	pendiente	178528.10	10.00	transferencia	5
398	1285	172	2023-11-12	2023-11-19	enviado	103806.48	0.00	OXXO	8
399	101	198	2025-05-27	2025-05-31	devuelto	168327.14	5.00	transferencia	2
400	1111	68	2025-01-27	2025-02-10	entregado	112759.71	5.00	PayPal	3
401	336	7	2024-06-04	2024-06-11	entregado	119973.31	0.00	tarjeta_debito	8
402	436	175	2025-09-12	2025-09-16	enviado	257508.95	15.00	efectivo	5
403	82	48	2025-09-11	2025-09-17	entregado	169397.80	0.00	transferencia	8
404	771	159	2025-05-25	2025-05-30	entregado	23987.24	0.00	tarjeta_debito	3
405	459	185	2024-07-19	2024-07-30	entregado	222094.31	0.00	OXXO	3
406	45	148	2025-12-01	2025-12-06	procesando	94633.69	0.00	transferencia	4
407	467	195	2025-06-18	2025-06-27	entregado	29439.76	0.00	efectivo	8
408	1352	19	2023-07-02	2023-07-05	pendiente	95185.27	0.00	OXXO	8
409	679	83	2025-12-21	2025-12-27	cancelado	115985.03	5.00	tarjeta_debito	7
410	118	114	2024-08-18	2024-08-25	enviado	43491.71	5.00	tarjeta_credito	4
411	1129	57	2025-09-30	2025-10-01	entregado	97335.40	10.00	efectivo	4
412	438	173	2025-07-30	2025-08-02	procesando	257942.31	0.00	OXXO	3
413	1872	33	2023-09-06	2023-09-14	entregado	95989.86	0.00	tarjeta_credito	7
414	1816	186	2023-08-10	2023-08-22	devuelto	94336.14	20.00	transferencia	5
415	1496	123	2026-04-15	2026-04-30	cancelado	265842.04	0.00	PayPal	6
416	108	61	2024-04-27	2024-05-10	entregado	86112.27	5.00	tarjeta_debito	5
417	278	162	2024-10-30	2024-11-01	procesando	123518.46	0.00	transferencia	5
418	1491	14	2025-09-14	2025-09-29	entregado	235258.00	0.00	OXXO	7
419	970	195	2024-05-21	2024-05-30	entregado	16991.09	0.00	tarjeta_debito	6
420	1166	1	2024-01-13	2024-01-27	entregado	48915.94	10.00	tarjeta_debito	7
421	391	131	2024-06-11	2024-06-22	cancelado	34530.43	10.00	transferencia	5
422	1938	106	2026-01-17	2026-01-22	enviado	327368.92	0.00	PayPal	8
423	1323	151	2025-04-10	2025-04-12	enviado	75957.33	0.00	PayPal	8
424	1534	148	2024-11-20	2024-12-04	devuelto	15556.73	10.00	efectivo	7
425	71	151	2024-09-04	2024-09-18	entregado	44031.81	15.00	PayPal	4
426	293	107	2023-12-31	2024-01-05	entregado	297420.84	0.00	tarjeta_debito	5
427	1830	98	2025-11-16	2025-11-19	entregado	85341.12	10.00	PayPal	2
428	1353	27	2024-08-06	2024-08-16	entregado	173330.09	15.00	tarjeta_debito	5
429	34	2	2026-01-13	2026-01-16	procesando	105447.63	0.00	OXXO	3
430	282	50	2023-06-20	2023-07-02	pendiente	13776.20	15.00	efectivo	3
431	1694	164	2025-07-16	2025-07-22	entregado	114423.24	0.00	PayPal	8
432	132	132	2023-08-20	2023-08-29	entregado	103061.26	20.00	tarjeta_debito	8
433	1077	165	2023-09-26	2023-09-27	entregado	136804.39	5.00	efectivo	2
434	795	134	2026-03-02	2026-03-09	procesando	2470.15	20.00	tarjeta_debito	5
435	1179	165	2024-05-15	2024-05-22	entregado	40260.40	10.00	PayPal	5
436	802	7	2024-08-16	2024-08-25	entregado	97762.99	0.00	efectivo	7
437	395	174	2025-02-02	2025-02-03	cancelado	9791.25	15.00	transferencia	3
438	413	102	2025-10-10	2025-10-11	cancelado	191732.49	0.00	tarjeta_debito	7
439	172	99	2024-03-13	2024-03-16	entregado	266877.28	0.00	efectivo	6
440	1501	116	2023-08-09	2023-08-16	devuelto	154187.02	0.00	OXXO	7
441	661	84	2024-06-07	2024-06-22	entregado	130375.55	0.00	tarjeta_debito	5
442	964	111	2024-11-26	2024-11-27	entregado	2940.17	0.00	transferencia	6
443	1068	107	2023-06-20	2023-07-04	entregado	72007.25	5.00	efectivo	2
444	850	98	2024-06-19	2024-06-24	entregado	61470.14	0.00	efectivo	5
445	533	18	2023-07-28	2023-08-07	enviado	14708.80	15.00	tarjeta_credito	3
446	1642	52	2025-04-25	2025-05-04	entregado	13122.87	5.00	transferencia	1
447	1050	199	2025-02-19	2025-03-05	entregado	151432.39	0.00	tarjeta_credito	2
448	927	6	2025-01-25	2025-02-01	entregado	242177.99	15.00	efectivo	5
449	316	55	2023-07-28	2023-08-08	entregado	49684.09	0.00	OXXO	6
450	1498	13	2025-03-11	2025-03-12	devuelto	125488.60	10.00	efectivo	2
451	436	69	2026-05-18	2026-05-28	procesando	18068.60	5.00	PayPal	8
452	1222	125	2023-09-18	2023-09-21	cancelado	141145.55	0.00	tarjeta_debito	5
453	225	54	2024-05-30	2024-06-06	enviado	75794.14	5.00	efectivo	6
454	1873	11	2023-11-04	2023-11-08	entregado	27782.32	10.00	OXXO	8
455	613	131	2026-05-13	2026-05-23	entregado	35723.48	5.00	tarjeta_debito	5
456	1387	5	2024-07-22	2024-08-01	cancelado	152409.13	10.00	tarjeta_credito	3
457	1348	111	2026-06-09	2026-06-12	procesando	197153.03	0.00	tarjeta_debito	1
458	1642	60	2025-12-09	2025-12-15	pendiente	66154.58	5.00	tarjeta_debito	6
459	1067	72	2026-05-07	2026-05-15	entregado	140469.87	0.00	tarjeta_credito	4
460	198	145	2023-12-23	2024-01-03	entregado	167429.31	0.00	transferencia	8
461	743	157	2024-05-24	2024-05-26	procesando	33484.00	0.00	transferencia	5
462	1862	176	2023-07-07	2023-07-19	entregado	54109.01	0.00	PayPal	3
463	1719	156	2024-08-25	2024-09-07	enviado	148643.84	15.00	OXXO	5
464	218	147	2024-02-02	2024-02-05	entregado	9706.89	10.00	tarjeta_debito	7
465	64	189	2024-06-03	2024-06-15	enviado	167314.21	10.00	efectivo	3
466	941	108	2023-10-01	2023-10-06	pendiente	234610.50	0.00	transferencia	4
467	1434	1	2024-04-16	2024-04-23	entregado	161468.54	5.00	OXXO	2
468	761	24	2023-06-23	2023-07-08	pendiente	113856.44	10.00	transferencia	3
469	604	200	2025-08-15	2025-08-30	entregado	218191.55	0.00	efectivo	5
470	849	160	2026-04-25	2026-05-10	entregado	131739.96	0.00	tarjeta_debito	8
471	1485	37	2025-03-18	2025-03-29	entregado	118768.17	0.00	PayPal	1
472	311	44	2025-03-02	2025-03-10	procesando	52187.15	5.00	tarjeta_credito	7
473	648	70	2023-12-07	2023-12-08	procesando	70410.77	5.00	transferencia	8
474	1190	83	2024-12-27	2024-12-29	enviado	199654.51	0.00	transferencia	6
475	643	52	2023-07-03	2023-07-05	devuelto	8918.96	15.00	PayPal	1
476	1727	116	2025-04-07	2025-04-15	enviado	65349.20	0.00	tarjeta_credito	6
477	1012	155	2026-02-13	2026-02-22	enviado	265060.68	0.00	PayPal	7
478	344	104	2025-04-07	2025-04-16	entregado	53128.85	5.00	transferencia	4
479	1076	6	2025-07-28	2025-07-29	procesando	240585.37	0.00	tarjeta_debito	4
480	1216	103	2025-11-01	2025-11-04	entregado	41222.03	5.00	OXXO	1
481	1295	86	2025-12-13	2025-12-22	cancelado	138415.90	5.00	tarjeta_debito	7
482	1736	168	2025-11-22	2025-12-01	procesando	133476.71	10.00	tarjeta_credito	8
483	15	103	2024-04-08	2024-04-20	procesando	47439.71	20.00	tarjeta_credito	2
484	97	117	2025-09-14	2025-09-18	entregado	216277.74	0.00	PayPal	3
485	794	142	2025-02-23	2025-02-27	entregado	287500.51	10.00	OXXO	7
486	1355	78	2023-11-24	2023-12-09	entregado	26507.84	10.00	tarjeta_credito	7
487	1006	84	2023-11-12	2023-11-21	enviado	64118.42	15.00	OXXO	4
488	1996	49	2024-07-19	2024-07-25	procesando	241968.44	0.00	transferencia	8
489	484	190	2025-11-16	2025-11-29	entregado	5199.73	10.00	tarjeta_debito	2
490	662	85	2024-07-15	2024-07-26	entregado	50396.76	10.00	efectivo	8
491	1385	9	2024-06-09	2024-06-12	enviado	109789.54	5.00	PayPal	4
492	1058	71	2024-11-15	2024-11-20	entregado	28151.80	0.00	PayPal	4
493	215	20	2024-09-12	2024-09-14	entregado	174721.60	0.00	tarjeta_credito	2
494	1542	40	2025-03-04	2025-03-15	procesando	64775.63	15.00	tarjeta_debito	7
495	1098	114	2025-10-21	2025-10-27	enviado	122547.08	0.00	PayPal	2
496	1524	10	2023-12-28	2024-01-12	cancelado	101740.75	5.00	PayPal	1
497	1790	37	2025-02-21	2025-03-04	devuelto	87479.33	10.00	OXXO	5
498	732	110	2023-07-28	2023-08-02	entregado	106327.80	20.00	PayPal	5
499	51	195	2025-02-22	2025-03-08	procesando	30249.48	10.00	transferencia	5
500	1668	6	2026-01-27	2026-02-03	entregado	52963.29	0.00	efectivo	8
501	448	195	2023-08-25	2023-09-03	procesando	158706.52	15.00	efectivo	8
502	750	116	2025-07-18	2025-07-28	pendiente	57478.49	5.00	OXXO	8
503	479	27	2023-08-04	2023-08-11	devuelto	146644.50	10.00	tarjeta_debito	1
504	280	145	2025-12-12	2025-12-18	enviado	24807.86	15.00	OXXO	5
505	1316	42	2025-03-04	2025-03-08	entregado	172391.85	0.00	OXXO	6
506	142	141	2024-07-01	2024-07-12	procesando	41335.07	5.00	PayPal	7
507	1633	100	2026-04-23	2026-05-01	pendiente	158371.91	0.00	transferencia	8
508	1453	66	2024-04-06	2024-04-09	procesando	67506.32	0.00	OXXO	6
509	1116	73	2025-12-25	2026-01-09	enviado	209397.43	0.00	PayPal	2
510	870	17	2023-12-19	2023-12-20	entregado	115215.75	15.00	tarjeta_debito	2
511	1052	171	2025-12-01	2025-12-08	enviado	112618.98	0.00	efectivo	2
512	467	196	2024-10-05	2024-10-19	entregado	211827.71	0.00	OXXO	1
513	1445	152	2025-01-05	2025-01-19	enviado	57665.57	5.00	transferencia	5
514	53	189	2025-09-21	2025-10-01	cancelado	120973.96	15.00	PayPal	7
515	592	171	2025-02-02	2025-02-06	procesando	50152.01	0.00	tarjeta_debito	7
516	1970	163	2024-06-29	2024-07-14	procesando	1818.48	5.00	OXXO	7
517	1449	48	2025-10-16	2025-10-25	pendiente	101512.84	0.00	transferencia	8
518	253	154	2024-04-29	2024-05-06	entregado	70617.22	20.00	tarjeta_credito	3
519	642	192	2024-03-26	2024-04-10	entregado	3823.76	0.00	tarjeta_credito	3
520	1625	33	2025-09-11	2025-09-22	procesando	111985.13	0.00	PayPal	1
521	149	54	2023-12-28	2024-01-04	enviado	39996.32	15.00	transferencia	6
522	1265	190	2026-05-09	2026-05-11	entregado	160514.24	0.00	tarjeta_credito	6
523	307	163	2024-09-26	2024-10-01	cancelado	140679.75	0.00	efectivo	1
524	1264	43	2025-04-05	2025-04-09	procesando	126933.69	0.00	transferencia	5
525	1744	102	2024-06-03	2024-06-10	pendiente	55785.71	0.00	transferencia	1
526	226	141	2024-04-17	2024-04-21	entregado	70987.10	0.00	tarjeta_debito	2
527	1163	150	2024-06-11	2024-06-23	pendiente	119708.10	0.00	PayPal	6
528	730	150	2025-07-23	2025-08-03	entregado	129580.87	5.00	transferencia	5
529	1663	24	2024-10-08	2024-10-18	entregado	305694.10	0.00	PayPal	6
530	6	46	2024-07-26	2024-08-01	entregado	187886.88	10.00	tarjeta_debito	5
531	1597	74	2025-01-04	2025-01-19	enviado	134644.45	0.00	tarjeta_debito	4
532	1173	1	2024-10-04	2024-10-12	procesando	125735.19	20.00	tarjeta_credito	5
533	1895	93	2024-11-23	2024-11-30	procesando	62471.19	5.00	efectivo	8
534	599	149	2025-05-02	2025-05-05	entregado	125570.33	0.00	OXXO	8
535	1078	133	2023-10-30	2023-11-09	cancelado	203841.80	0.00	tarjeta_debito	1
536	593	4	2024-08-21	2024-08-26	entregado	114889.25	0.00	transferencia	7
537	195	132	2025-05-10	2025-05-11	procesando	38132.49	10.00	PayPal	1
538	123	26	2023-10-02	2023-10-06	entregado	154936.87	0.00	tarjeta_credito	6
539	189	17	2025-01-15	2025-01-19	entregado	229775.64	5.00	tarjeta_debito	2
540	1936	4	2023-09-20	2023-10-03	enviado	82680.04	5.00	tarjeta_credito	1
541	1260	172	2024-03-03	2024-03-14	enviado	82421.55	0.00	tarjeta_debito	6
542	1559	117	2026-02-23	2026-03-02	enviado	23159.60	5.00	tarjeta_credito	3
543	1769	110	2025-05-02	2025-05-06	pendiente	250707.48	10.00	efectivo	5
544	368	181	2025-05-06	2025-05-07	entregado	243820.41	0.00	tarjeta_debito	1
545	379	129	2024-01-09	2024-01-23	entregado	43213.13	5.00	efectivo	1
546	1383	84	2025-09-02	2025-09-05	entregado	16617.88	0.00	efectivo	3
547	56	104	2024-02-25	2024-03-04	entregado	89134.51	0.00	efectivo	6
548	1513	151	2025-08-25	2025-08-26	entregado	28193.51	15.00	transferencia	4
549	422	190	2023-07-14	2023-07-17	entregado	84579.72	15.00	efectivo	1
550	65	82	2025-02-21	2025-03-07	devuelto	266061.16	0.00	OXXO	3
551	97	96	2024-04-29	2024-05-02	procesando	258790.96	0.00	OXXO	1
552	1742	20	2025-10-21	2025-11-03	entregado	110598.74	5.00	tarjeta_debito	4
553	1180	26	2025-05-13	2025-05-17	enviado	52223.54	0.00	PayPal	7
554	1957	30	2025-03-29	2025-04-01	entregado	11592.35	5.00	efectivo	7
555	1392	73	2024-07-29	2024-08-01	entregado	154373.77	0.00	transferencia	5
556	1583	77	2023-12-18	2023-12-25	procesando	56177.52	0.00	PayPal	7
557	880	50	2024-12-10	2024-12-13	procesando	132695.29	10.00	PayPal	6
558	507	112	2023-11-25	2023-12-06	procesando	369.07	5.00	tarjeta_debito	5
559	1356	147	2024-06-03	2024-06-06	enviado	123415.44	10.00	efectivo	7
560	1710	199	2025-12-05	2025-12-11	procesando	51272.62	20.00	transferencia	6
561	1668	86	2026-01-27	2026-02-01	entregado	81468.16	15.00	tarjeta_debito	6
562	1613	64	2023-07-31	2023-08-01	enviado	104608.10	0.00	efectivo	2
563	546	122	2024-05-16	2024-05-20	entregado	56954.85	10.00	OXXO	6
564	327	74	2023-12-20	2024-01-02	devuelto	88112.84	0.00	transferencia	7
565	1474	82	2025-02-19	2025-02-25	entregado	99007.50	5.00	OXXO	7
566	261	196	2024-07-17	2024-07-29	entregado	154104.38	0.00	OXXO	7
567	1012	152	2025-08-07	2025-08-12	entregado	94822.19	0.00	tarjeta_debito	8
568	1769	166	2024-02-06	2024-02-10	procesando	94610.69	5.00	tarjeta_debito	6
569	556	55	2024-11-02	2024-11-09	enviado	197696.67	5.00	transferencia	4
570	1370	148	2026-04-19	2026-04-26	procesando	20118.27	0.00	PayPal	3
571	607	145	2023-10-22	2023-11-01	enviado	194627.56	5.00	PayPal	2
572	851	25	2024-06-16	2024-06-30	entregado	30582.39	15.00	tarjeta_credito	2
573	807	132	2025-05-05	2025-05-17	entregado	216929.25	0.00	tarjeta_credito	8
574	1652	54	2023-10-15	2023-10-18	entregado	12682.03	0.00	tarjeta_debito	1
575	1932	25	2024-11-28	2024-12-07	enviado	30091.14	10.00	PayPal	1
576	1139	36	2024-04-11	2024-04-23	entregado	11195.26	0.00	tarjeta_debito	2
577	585	102	2025-05-05	2025-05-15	procesando	75188.81	10.00	transferencia	7
578	377	83	2024-11-19	2024-12-03	entregado	216787.26	5.00	OXXO	3
579	796	180	2024-10-12	2024-10-18	procesando	86778.08	0.00	tarjeta_debito	2
580	943	36	2024-10-04	2024-10-05	entregado	18817.40	10.00	efectivo	2
581	1368	29	2025-06-05	2025-06-16	entregado	290777.60	15.00	OXXO	5
582	1162	118	2025-12-12	2025-12-22	entregado	93335.55	20.00	tarjeta_credito	7
583	1397	141	2025-03-09	2025-03-13	entregado	119989.55	5.00	tarjeta_credito	2
584	1958	100	2025-11-03	2025-11-06	entregado	277023.35	10.00	tarjeta_credito	2
585	822	199	2025-01-22	2025-02-01	enviado	88462.33	10.00	tarjeta_credito	2
586	399	58	2025-02-22	2025-02-27	devuelto	54375.33	0.00	OXXO	7
587	1707	124	2025-04-17	2025-04-28	entregado	1722.77	10.00	efectivo	1
588	1691	145	2024-12-15	2024-12-17	procesando	161123.31	20.00	transferencia	8
589	1230	56	2026-03-26	2026-03-28	devuelto	45379.82	15.00	tarjeta_credito	2
590	821	3	2024-11-09	2024-11-19	procesando	18366.41	5.00	OXXO	2
591	1581	7	2026-03-06	2026-03-20	entregado	64585.57	15.00	tarjeta_debito	1
592	309	136	2024-02-08	2024-02-22	entregado	39771.18	0.00	PayPal	1
593	1532	19	2026-03-22	2026-03-26	entregado	153819.14	0.00	tarjeta_debito	5
594	1028	191	2024-08-06	2024-08-11	enviado	147015.53	15.00	tarjeta_credito	4
595	654	51	2026-01-10	2026-01-17	entregado	255629.49	0.00	OXXO	2
596	995	152	2025-11-19	2025-11-23	pendiente	31720.32	0.00	tarjeta_credito	6
597	1613	124	2025-11-21	2025-12-05	procesando	58633.71	0.00	transferencia	2
598	417	35	2025-11-23	2025-12-03	procesando	117472.12	15.00	tarjeta_credito	3
599	622	119	2026-06-03	2026-06-06	devuelto	184357.02	5.00	OXXO	2
600	593	24	2025-10-10	2025-10-13	cancelado	105051.09	0.00	OXXO	5
601	650	35	2023-09-23	2023-10-08	procesando	48320.60	10.00	PayPal	4
602	1987	112	2023-10-10	2023-10-24	enviado	15282.63	0.00	efectivo	7
603	385	155	2026-01-16	2026-01-20	enviado	166649.35	20.00	tarjeta_credito	8
604	618	158	2025-10-27	2025-11-07	devuelto	176755.77	0.00	PayPal	5
605	347	64	2025-08-05	2025-08-07	entregado	51970.08	15.00	tarjeta_credito	4
606	169	86	2025-03-22	2025-03-28	entregado	45936.73	5.00	transferencia	3
607	796	18	2024-03-01	2024-03-10	entregado	40120.13	0.00	tarjeta_debito	6
608	360	194	2023-08-29	2023-09-10	entregado	127744.18	0.00	tarjeta_debito	6
609	580	125	2026-01-29	2026-02-13	procesando	124098.98	5.00	PayPal	5
610	1067	135	2024-06-06	2024-06-13	entregado	137050.25	0.00	PayPal	4
611	120	8	2024-05-16	2024-05-18	enviado	19511.01	5.00	OXXO	6
612	887	116	2024-06-29	2024-07-10	pendiente	15407.52	0.00	efectivo	5
613	1816	38	2025-05-30	2025-06-07	enviado	87221.07	0.00	tarjeta_debito	7
614	828	35	2024-06-01	2024-06-08	entregado	87983.68	0.00	tarjeta_credito	8
615	47	170	2026-03-16	2026-03-18	entregado	44797.86	20.00	efectivo	2
616	1718	57	2026-06-01	2026-06-15	entregado	146380.01	5.00	transferencia	3
617	534	11	2023-07-29	2023-08-06	procesando	146223.41	0.00	tarjeta_credito	1
618	1984	164	2024-02-19	2024-02-26	enviado	279531.12	0.00	efectivo	2
619	996	35	2025-08-27	2025-08-28	entregado	18689.10	0.00	PayPal	2
620	250	90	2025-07-16	2025-07-19	entregado	166512.96	5.00	tarjeta_debito	3
621	1139	40	2024-11-07	2024-11-08	enviado	97515.49	0.00	tarjeta_debito	4
622	734	156	2024-10-11	2024-10-12	entregado	4070.91	0.00	OXXO	5
623	927	155	2025-10-17	2025-10-21	entregado	157141.40	10.00	OXXO	2
624	1917	64	2024-07-01	2024-07-12	entregado	172459.96	15.00	efectivo	4
625	653	200	2023-12-17	2024-01-01	entregado	13898.77	10.00	PayPal	3
626	1892	2	2023-12-30	2024-01-04	entregado	7298.30	10.00	OXXO	6
627	1959	126	2026-03-20	2026-03-30	procesando	195970.55	5.00	tarjeta_credito	3
628	1898	139	2026-05-07	2026-05-21	entregado	65620.14	15.00	tarjeta_credito	5
629	1864	183	2024-08-06	2024-08-10	entregado	44942.52	5.00	tarjeta_debito	2
630	1905	168	2024-12-21	2024-12-26	entregado	76347.12	0.00	transferencia	5
631	1501	161	2025-09-21	2025-09-30	entregado	24574.75	0.00	PayPal	4
632	47	99	2025-03-14	2025-03-27	entregado	34833.37	20.00	PayPal	1
633	1380	59	2023-11-03	2023-11-12	enviado	125538.03	0.00	tarjeta_debito	2
634	455	170	2023-12-14	2023-12-19	pendiente	37803.52	15.00	OXXO	7
635	1222	148	2026-05-14	2026-05-20	cancelado	103086.97	5.00	efectivo	8
636	1607	96	2024-09-23	2024-10-05	procesando	67672.00	5.00	efectivo	3
637	1180	189	2026-06-10	2026-06-24	entregado	88353.86	20.00	PayPal	1
638	1413	77	2024-06-06	2024-06-21	entregado	289294.42	5.00	PayPal	7
639	31	97	2026-01-26	2026-02-07	entregado	15786.99	0.00	transferencia	4
640	479	116	2024-11-29	2024-12-05	entregado	6770.97	0.00	transferencia	6
641	295	114	2024-02-14	2024-02-16	pendiente	138816.12	0.00	PayPal	2
642	613	151	2026-02-12	2026-02-15	entregado	237990.06	5.00	PayPal	5
643	399	123	2024-03-17	2024-03-27	enviado	93505.41	5.00	transferencia	5
644	552	78	2023-11-13	2023-11-26	cancelado	105843.39	15.00	tarjeta_debito	6
645	1644	3	2023-06-19	2023-06-24	procesando	76818.02	0.00	tarjeta_debito	5
646	357	55	2024-10-02	2024-10-11	entregado	107355.48	0.00	tarjeta_credito	8
647	1453	33	2024-09-19	2024-09-21	procesando	188158.95	0.00	transferencia	2
648	671	137	2024-07-19	2024-07-25	entregado	69943.54	10.00	PayPal	1
649	787	45	2023-08-25	2023-09-04	cancelado	125519.79	0.00	efectivo	3
650	756	116	2026-02-06	2026-02-10	devuelto	151993.63	0.00	OXXO	3
651	1271	87	2024-10-23	2024-10-29	entregado	163693.66	0.00	tarjeta_credito	6
652	1311	138	2025-08-30	2025-09-08	entregado	149055.80	0.00	tarjeta_credito	3
653	1240	112	2024-03-30	2024-04-02	pendiente	42124.51	5.00	PayPal	2
654	907	41	2025-11-20	2025-11-28	entregado	44105.96	0.00	tarjeta_debito	3
655	55	78	2025-12-15	2025-12-22	entregado	135199.25	15.00	tarjeta_debito	2
656	736	176	2025-02-03	2025-02-13	entregado	269959.83	0.00	PayPal	4
657	973	2	2024-03-22	2024-03-26	devuelto	198752.39	10.00	tarjeta_credito	4
658	249	60	2025-07-25	2025-08-03	entregado	10068.79	5.00	efectivo	1
659	379	39	2026-03-11	2026-03-18	entregado	258070.57	5.00	tarjeta_credito	4
660	1317	63	2025-04-04	2025-04-10	enviado	63934.49	0.00	transferencia	2
661	1237	16	2026-06-07	2026-06-08	enviado	103097.80	0.00	PayPal	6
662	882	26	2024-05-01	2024-05-04	entregado	32356.29	0.00	OXXO	5
663	1434	127	2026-01-31	2026-02-09	procesando	130110.72	0.00	PayPal	5
664	6	187	2023-12-04	2023-12-14	devuelto	104937.47	10.00	tarjeta_debito	4
665	1	74	2024-07-07	2024-07-19	cancelado	73071.66	0.00	OXXO	4
666	170	99	2023-10-26	2023-11-03	pendiente	95712.51	5.00	tarjeta_credito	5
667	679	97	2024-10-26	2024-11-03	procesando	323235.14	10.00	transferencia	1
668	1603	190	2025-10-12	2025-10-22	entregado	104231.63	10.00	tarjeta_debito	2
669	1885	21	2023-11-30	2023-12-08	entregado	12462.93	0.00	transferencia	6
670	120	89	2025-06-14	2025-06-25	entregado	88992.49	15.00	transferencia	2
671	257	7	2025-07-19	2025-07-28	entregado	3622.51	10.00	efectivo	8
672	1122	15	2024-02-29	2024-03-11	entregado	77387.32	10.00	tarjeta_credito	3
673	271	63	2026-01-21	2026-02-01	entregado	51797.27	0.00	PayPal	8
674	50	99	2023-10-07	2023-10-18	entregado	65602.66	0.00	tarjeta_debito	3
675	407	176	2023-09-20	2023-09-22	enviado	354498.04	5.00	tarjeta_credito	3
676	776	163	2023-07-19	2023-07-31	entregado	36628.90	5.00	transferencia	4
677	1867	128	2025-12-22	2025-12-24	entregado	38777.96	0.00	efectivo	4
678	45	11	2026-04-13	2026-04-25	entregado	160009.92	10.00	tarjeta_debito	3
679	1790	63	2026-01-13	2026-01-17	entregado	6682.19	0.00	PayPal	7
680	779	157	2025-04-10	2025-04-13	devuelto	56992.86	10.00	PayPal	5
681	212	126	2025-04-24	2025-05-07	procesando	23542.90	0.00	PayPal	2
682	1808	88	2025-04-07	2025-04-22	enviado	184793.42	0.00	tarjeta_credito	5
683	1367	8	2024-04-08	2024-04-21	entregado	58502.69	10.00	transferencia	5
684	377	111	2023-12-13	2023-12-27	procesando	236447.76	0.00	efectivo	2
685	1650	37	2023-09-16	2023-09-19	devuelto	148953.73	0.00	efectivo	4
686	1971	64	2023-09-14	2023-09-28	entregado	33854.85	0.00	transferencia	8
687	842	67	2023-06-24	2023-07-02	enviado	54527.61	5.00	tarjeta_debito	3
688	571	148	2024-10-30	2024-11-11	entregado	100831.99	0.00	efectivo	7
689	1281	36	2024-09-05	2024-09-06	devuelto	66898.97	5.00	PayPal	7
690	670	99	2023-06-14	2023-06-29	entregado	77076.84	0.00	OXXO	1
691	1775	108	2025-09-26	2025-10-09	entregado	146778.19	0.00	transferencia	3
692	1224	60	2024-08-26	2024-09-07	entregado	39278.06	0.00	tarjeta_debito	5
693	1403	69	2025-09-01	2025-09-03	entregado	201376.47	0.00	transferencia	6
694	1846	2	2025-05-26	2025-05-29	procesando	35806.32	0.00	transferencia	8
695	1127	177	2026-05-30	2026-06-04	pendiente	119750.21	20.00	OXXO	8
696	1758	36	2024-05-07	2024-05-09	cancelado	186544.62	0.00	OXXO	1
697	940	7	2025-04-21	2025-04-25	enviado	138701.36	5.00	tarjeta_credito	5
698	928	143	2025-08-21	2025-09-03	entregado	30043.43	0.00	OXXO	3
699	1421	15	2024-12-06	2024-12-12	entregado	215688.40	15.00	transferencia	7
700	1569	187	2023-12-13	2023-12-14	entregado	152866.30	0.00	tarjeta_debito	3
701	1739	134	2024-01-20	2024-01-24	entregado	64822.02	0.00	tarjeta_debito	3
702	56	13	2023-07-17	2023-07-22	enviado	150342.46	0.00	transferencia	5
703	1584	140	2025-04-21	2025-04-25	devuelto	81672.88	0.00	transferencia	7
704	47	131	2025-07-06	2025-07-18	enviado	64961.52	0.00	OXXO	2
705	1429	53	2024-04-22	2024-04-23	cancelado	125528.48	5.00	efectivo	5
706	1825	112	2025-09-12	2025-09-13	enviado	45899.60	0.00	transferencia	5
707	1164	184	2026-02-25	2026-02-27	cancelado	601.64	0.00	PayPal	6
708	1564	24	2025-03-28	2025-04-03	entregado	150034.80	5.00	tarjeta_credito	2
709	222	85	2024-10-22	2024-10-29	entregado	40938.75	0.00	PayPal	1
710	1108	13	2025-03-25	2025-04-03	procesando	63198.36	5.00	OXXO	1
711	586	66	2026-01-23	2026-01-24	entregado	31736.40	0.00	tarjeta_credito	6
712	831	99	2023-08-04	2023-08-10	entregado	17126.28	0.00	efectivo	4
713	1070	163	2025-11-12	2025-11-17	enviado	285346.44	0.00	efectivo	8
714	655	91	2023-08-11	2023-08-12	entregado	17884.35	5.00	tarjeta_credito	2
715	1889	104	2023-07-20	2023-08-04	entregado	21067.54	0.00	tarjeta_credito	8
716	1722	116	2024-12-21	2024-12-22	entregado	112096.52	15.00	tarjeta_credito	3
717	1820	119	2025-11-13	2025-11-20	pendiente	23303.00	5.00	PayPal	4
718	991	180	2025-11-13	2025-11-20	entregado	270511.49	0.00	transferencia	7
719	1637	133	2024-01-28	2024-01-30	entregado	113374.06	5.00	transferencia	8
720	730	149	2023-07-10	2023-07-14	procesando	103350.11	0.00	tarjeta_credito	8
721	1782	11	2024-08-23	2024-09-06	entregado	57721.47	20.00	PayPal	4
722	768	49	2025-01-04	2025-01-10	enviado	157685.22	0.00	efectivo	7
723	671	113	2025-08-08	2025-08-17	entregado	58922.97	0.00	tarjeta_debito	4
724	1185	168	2023-08-04	2023-08-07	entregado	45266.43	0.00	OXXO	3
725	194	120	2023-09-28	2023-10-04	enviado	93025.74	0.00	efectivo	5
726	1903	109	2024-01-17	2024-01-26	entregado	23501.31	15.00	tarjeta_credito	4
727	14	39	2023-07-22	2023-07-28	entregado	309052.65	15.00	transferencia	3
728	981	194	2024-04-16	2024-04-23	enviado	20083.37	10.00	tarjeta_debito	5
729	649	18	2024-05-13	2024-05-26	procesando	165480.21	0.00	efectivo	3
730	1792	133	2024-05-13	2024-05-18	entregado	179035.46	20.00	tarjeta_credito	8
731	1676	49	2026-05-27	2026-06-05	pendiente	277024.87	15.00	tarjeta_debito	1
732	1309	117	2025-03-10	2025-03-19	cancelado	66931.85	10.00	transferencia	8
733	961	117	2025-10-17	2025-10-19	cancelado	98411.11	5.00	tarjeta_debito	6
734	263	178	2023-10-01	2023-10-12	enviado	97637.34	0.00	tarjeta_credito	1
735	18	114	2025-12-24	2025-12-27	entregado	53548.12	10.00	OXXO	5
736	289	50	2024-10-15	2024-10-26	entregado	82797.95	0.00	OXXO	1
737	715	190	2023-09-25	2023-10-09	cancelado	197068.82	5.00	transferencia	2
738	1552	159	2024-01-19	2024-02-03	entregado	60515.96	5.00	OXXO	8
739	222	97	2024-05-25	2024-06-06	enviado	117807.47	0.00	transferencia	7
740	1577	117	2024-03-01	2024-03-06	entregado	143662.42	5.00	OXXO	7
741	1074	61	2025-05-09	2025-05-14	procesando	75614.30	0.00	PayPal	6
742	312	42	2024-11-12	2024-11-15	devuelto	23908.07	0.00	OXXO	6
743	402	200	2023-11-15	2023-11-25	entregado	22486.01	5.00	tarjeta_debito	2
744	1187	20	2024-12-29	2025-01-02	devuelto	150954.21	10.00	transferencia	1
745	742	178	2024-11-06	2024-11-14	procesando	36347.48	0.00	tarjeta_credito	6
746	1010	164	2025-10-20	2025-10-22	pendiente	80802.77	0.00	OXXO	2
747	90	18	2024-03-21	2024-04-02	cancelado	863.32	0.00	tarjeta_credito	1
748	1033	9	2025-09-09	2025-09-16	entregado	166161.92	5.00	tarjeta_debito	5
749	1730	120	2024-07-23	2024-08-02	entregado	201350.47	5.00	tarjeta_debito	4
750	653	74	2023-08-07	2023-08-16	procesando	20342.09	0.00	tarjeta_credito	3
751	221	73	2024-03-08	2024-03-16	enviado	95504.43	10.00	transferencia	4
752	1988	182	2023-08-12	2023-08-27	entregado	248718.86	5.00	efectivo	4
753	1664	40	2026-04-26	2026-05-11	entregado	87240.84	15.00	transferencia	3
754	1674	169	2024-02-28	2024-03-06	entregado	85170.08	10.00	tarjeta_debito	5
755	805	138	2024-07-29	2024-08-03	cancelado	112549.79	5.00	tarjeta_debito	8
756	1372	33	2024-10-25	2024-10-26	entregado	33662.94	0.00	OXXO	3
757	43	140	2024-04-01	2024-04-12	entregado	117856.77	0.00	OXXO	7
758	1618	5	2024-08-26	2024-08-28	enviado	46658.68	5.00	efectivo	5
759	427	37	2023-09-01	2023-09-16	entregado	77882.29	20.00	tarjeta_debito	1
760	1801	166	2025-05-02	2025-05-06	entregado	42859.07	0.00	OXXO	4
761	782	154	2025-04-26	2025-05-09	entregado	130291.95	15.00	tarjeta_credito	1
762	1207	14	2023-06-30	2023-07-14	enviado	100731.07	0.00	PayPal	8
763	1068	30	2026-06-04	2026-06-17	pendiente	81181.18	15.00	PayPal	1
764	356	135	2025-02-24	2025-03-02	procesando	80811.88	0.00	efectivo	3
765	1280	175	2026-02-28	2026-03-10	procesando	138397.60	0.00	efectivo	4
766	1298	114	2024-02-08	2024-02-15	entregado	25311.53	10.00	transferencia	3
767	1094	165	2026-04-22	2026-05-01	procesando	25324.58	0.00	tarjeta_debito	7
768	1065	18	2024-06-27	2024-07-11	devuelto	69242.22	10.00	efectivo	8
769	1832	179	2025-01-02	2025-01-15	entregado	111523.11	0.00	efectivo	4
770	151	23	2026-03-29	2026-04-04	procesando	67802.00	15.00	OXXO	4
771	18	157	2024-01-07	2024-01-15	pendiente	15881.44	5.00	PayPal	5
772	286	25	2025-09-29	2025-10-11	entregado	62304.67	5.00	PayPal	4
773	972	105	2024-06-12	2024-06-23	entregado	18989.61	10.00	transferencia	8
774	875	123	2025-11-22	2025-12-01	entregado	218391.64	0.00	tarjeta_debito	4
775	838	61	2024-01-08	2024-01-17	enviado	92401.07	5.00	efectivo	1
776	180	187	2024-03-21	2024-04-05	procesando	92166.58	5.00	transferencia	7
777	353	152	2025-07-21	2025-07-24	entregado	172552.97	0.00	PayPal	1
778	1168	180	2025-05-09	2025-05-17	enviado	229190.09	0.00	transferencia	6
779	347	48	2026-06-10	2026-06-18	entregado	83126.98	5.00	efectivo	2
780	278	83	2024-07-12	2024-07-22	entregado	144908.61	0.00	transferencia	6
781	1996	155	2023-08-31	2023-09-07	entregado	177835.47	5.00	tarjeta_debito	6
782	1966	190	2023-06-18	2023-06-19	entregado	182219.75	15.00	OXXO	5
783	256	198	2023-12-22	2023-12-24	pendiente	104742.47	10.00	efectivo	8
785	1777	102	2024-06-23	2024-07-06	entregado	148083.89	5.00	tarjeta_credito	2
786	1724	79	2023-07-01	2023-07-08	entregado	42782.69	15.00	efectivo	1
787	9	184	2025-05-31	2025-06-05	entregado	56773.72	10.00	tarjeta_debito	8
788	1150	126	2024-06-26	2024-07-07	entregado	27012.44	0.00	tarjeta_debito	1
789	1586	37	2025-05-06	2025-05-07	entregado	23907.74	10.00	tarjeta_debito	6
790	1298	4	2026-02-01	2026-02-12	enviado	155384.31	10.00	tarjeta_credito	8
791	564	44	2026-04-25	2026-05-02	procesando	162763.11	5.00	tarjeta_debito	3
792	332	59	2025-05-20	2025-05-27	enviado	253770.69	10.00	OXXO	1
793	788	44	2026-03-18	2026-03-19	procesando	42477.73	0.00	tarjeta_debito	1
794	1926	35	2024-12-23	2025-01-05	entregado	96928.84	0.00	OXXO	7
795	285	67	2023-11-30	2023-12-06	entregado	132952.01	15.00	OXXO	5
796	51	179	2024-08-12	2024-08-20	pendiente	53197.45	5.00	OXXO	5
797	625	101	2024-05-20	2024-06-04	entregado	31939.63	10.00	transferencia	5
798	102	185	2024-04-23	2024-05-02	pendiente	262396.86	10.00	efectivo	5
799	519	96	2025-03-20	2025-03-25	entregado	97903.15	0.00	transferencia	7
800	1836	141	2024-02-05	2024-02-11	pendiente	124703.79	5.00	OXXO	5
801	1038	51	2024-10-12	2024-10-21	procesando	165274.03	0.00	efectivo	7
802	1291	41	2024-02-10	2024-02-24	entregado	8325.24	0.00	transferencia	5
803	1061	81	2025-02-04	2025-02-07	entregado	267456.58	5.00	transferencia	8
804	748	135	2023-10-21	2023-10-22	pendiente	123640.63	15.00	efectivo	4
805	326	198	2024-02-26	2024-03-10	cancelado	340073.62	5.00	OXXO	5
806	616	63	2024-01-12	2024-01-22	procesando	91354.72	15.00	tarjeta_credito	6
807	49	196	2024-09-24	2024-09-30	procesando	215849.25	0.00	OXXO	1
808	1221	45	2023-06-18	2023-06-23	entregado	183868.44	0.00	tarjeta_credito	1
809	938	51	2024-11-14	2024-11-17	pendiente	87930.53	10.00	tarjeta_debito	1
810	1428	120	2023-12-09	2023-12-13	pendiente	29689.69	0.00	tarjeta_debito	6
811	553	163	2024-07-04	2024-07-15	enviado	184847.21	5.00	tarjeta_debito	1
812	130	108	2025-09-02	2025-09-08	enviado	132396.25	0.00	efectivo	1
813	1386	34	2026-06-02	2026-06-07	devuelto	269330.87	0.00	tarjeta_debito	2
814	639	54	2024-07-08	2024-07-12	pendiente	112333.37	0.00	transferencia	5
815	1581	176	2025-02-20	2025-03-06	entregado	81306.94	0.00	efectivo	4
816	162	185	2025-11-18	2025-11-20	entregado	6687.99	5.00	PayPal	1
817	563	43	2024-03-12	2024-03-18	entregado	85546.23	0.00	efectivo	3
818	1130	112	2024-04-24	2024-05-09	entregado	83003.48	5.00	tarjeta_credito	1
819	1073	94	2023-08-31	2023-09-04	enviado	73685.21	5.00	OXXO	6
820	714	75	2024-07-11	2024-07-13	entregado	2462.21	10.00	tarjeta_credito	2
821	1198	60	2024-08-17	2024-08-19	entregado	278514.91	5.00	efectivo	6
822	1698	92	2024-09-09	2024-09-22	procesando	132037.41	5.00	OXXO	1
823	1892	196	2024-02-07	2024-02-10	entregado	181831.74	5.00	tarjeta_credito	7
824	934	52	2025-01-21	2025-01-29	entregado	27779.52	0.00	tarjeta_debito	2
825	1368	82	2023-10-11	2023-10-17	devuelto	136915.95	10.00	OXXO	3
826	1559	109	2024-12-31	2025-01-15	entregado	77848.98	10.00	tarjeta_credito	5
827	1077	31	2023-07-31	2023-08-13	procesando	69694.86	0.00	tarjeta_credito	1
828	869	147	2025-02-17	2025-02-19	enviado	131483.40	0.00	tarjeta_credito	4
829	1891	159	2024-07-23	2024-07-25	entregado	153481.65	0.00	tarjeta_credito	5
830	688	9	2024-08-05	2024-08-17	enviado	91401.99	5.00	tarjeta_debito	3
831	1873	174	2024-02-05	2024-02-13	entregado	7118.08	10.00	tarjeta_debito	4
832	575	59	2023-06-20	2023-07-05	enviado	22297.10	20.00	efectivo	6
833	1742	24	2024-10-22	2024-11-02	entregado	72699.67	0.00	PayPal	4
834	821	77	2024-05-22	2024-05-23	cancelado	85795.34	0.00	tarjeta_debito	4
835	220	64	2025-01-05	2025-01-08	entregado	21454.74	10.00	transferencia	7
836	956	48	2026-02-01	2026-02-03	procesando	230829.52	0.00	tarjeta_credito	5
837	1288	67	2025-05-10	2025-05-25	entregado	148961.76	15.00	tarjeta_debito	5
838	510	112	2024-05-10	2024-05-14	pendiente	101118.65	0.00	tarjeta_credito	3
839	1361	150	2023-09-25	2023-10-03	entregado	34655.15	5.00	efectivo	1
840	836	38	2025-10-20	2025-10-31	pendiente	105644.26	5.00	transferencia	6
841	1657	17	2023-11-29	2023-12-03	cancelado	13637.86	5.00	transferencia	3
842	1404	158	2025-12-23	2026-01-04	entregado	326054.97	5.00	tarjeta_debito	3
843	321	26	2025-01-23	2025-01-30	enviado	51802.95	0.00	efectivo	8
844	447	174	2023-11-11	2023-11-18	procesando	265276.73	0.00	tarjeta_credito	6
845	281	145	2023-07-25	2023-08-05	entregado	225311.87	0.00	OXXO	5
846	710	153	2025-12-28	2026-01-03	cancelado	35755.31	0.00	efectivo	6
847	105	3	2025-06-13	2025-06-14	entregado	107253.38	5.00	OXXO	4
848	1148	127	2026-04-02	2026-04-17	entregado	85116.86	15.00	OXXO	6
849	1804	15	2025-06-28	2025-07-08	entregado	61381.85	0.00	transferencia	1
850	487	167	2026-03-06	2026-03-11	entregado	286474.84	10.00	tarjeta_debito	5
851	836	176	2023-11-14	2023-11-25	entregado	36599.36	5.00	PayPal	3
852	492	109	2023-08-12	2023-08-14	entregado	151469.20	15.00	PayPal	3
853	915	45	2026-01-16	2026-01-17	cancelado	129907.41	0.00	tarjeta_debito	4
854	576	97	2026-02-08	2026-02-10	enviado	41220.87	0.00	tarjeta_credito	2
855	482	138	2025-06-30	2025-07-06	procesando	9426.51	0.00	PayPal	4
856	1404	188	2026-01-05	2026-01-20	procesando	86955.42	0.00	tarjeta_credito	7
857	456	107	2026-05-24	2026-05-28	enviado	75519.40	5.00	OXXO	2
858	1329	180	2023-10-05	2023-10-09	procesando	310857.55	5.00	transferencia	5
859	1328	125	2024-01-16	2024-01-24	entregado	54795.34	0.00	efectivo	3
860	166	66	2025-11-19	2025-12-02	entregado	25661.61	0.00	tarjeta_credito	8
861	234	112	2025-02-02	2025-02-07	enviado	80574.17	15.00	tarjeta_credito	6
862	214	47	2025-03-25	2025-04-02	entregado	90189.80	0.00	tarjeta_credito	2
863	1275	68	2024-09-27	2024-10-03	entregado	229772.38	0.00	PayPal	8
864	291	158	2024-03-24	2024-03-30	entregado	22925.97	10.00	PayPal	3
865	929	110	2023-08-26	2023-08-28	entregado	108957.20	0.00	OXXO	2
866	1410	194	2023-08-20	2023-08-29	entregado	34016.00	0.00	transferencia	4
867	1198	91	2024-03-13	2024-03-15	entregado	75733.35	0.00	transferencia	8
868	1114	57	2026-04-21	2026-04-27	entregado	204180.84	0.00	tarjeta_credito	4
869	1116	135	2023-10-07	2023-10-19	entregado	32032.20	20.00	tarjeta_debito	3
870	446	176	2024-10-28	2024-11-08	entregado	190440.31	0.00	efectivo	7
871	1815	98	2025-06-16	2025-06-24	entregado	147328.45	10.00	tarjeta_credito	5
872	1949	175	2025-10-28	2025-10-30	cancelado	55907.01	0.00	tarjeta_credito	5
873	357	161	2025-11-14	2025-11-20	entregado	59627.52	5.00	tarjeta_credito	7
874	1090	189	2024-01-30	2024-02-03	pendiente	344439.50	0.00	transferencia	1
875	1724	65	2024-04-07	2024-04-13	entregado	74710.69	20.00	transferencia	8
876	1899	6	2025-03-25	2025-04-01	enviado	49305.11	10.00	tarjeta_debito	1
877	58	72	2025-03-18	2025-03-26	procesando	190634.65	15.00	tarjeta_debito	7
878	1493	59	2026-01-01	2026-01-14	entregado	158856.37	20.00	OXXO	3
879	1597	181	2025-10-22	2025-11-02	enviado	55762.92	0.00	tarjeta_credito	7
880	676	154	2025-03-12	2025-03-17	entregado	311915.68	15.00	tarjeta_credito	7
881	1522	176	2025-08-18	2025-08-28	entregado	148367.59	5.00	tarjeta_debito	3
882	1052	41	2024-11-13	2024-11-21	entregado	144369.93	0.00	tarjeta_credito	2
883	915	179	2024-03-13	2024-03-24	entregado	70888.19	10.00	efectivo	8
884	1077	157	2023-07-11	2023-07-22	entregado	46802.15	5.00	efectivo	8
885	1279	154	2026-02-15	2026-02-21	entregado	23061.35	15.00	tarjeta_credito	8
886	255	29	2024-11-17	2024-11-26	cancelado	88601.34	10.00	transferencia	6
887	1059	189	2025-11-29	2025-12-08	enviado	79188.91	5.00	tarjeta_credito	7
888	158	127	2025-04-05	2025-04-16	cancelado	31549.93	15.00	OXXO	6
889	833	63	2025-11-30	2025-12-07	entregado	236384.75	0.00	PayPal	8
890	1957	94	2024-06-20	2024-06-28	cancelado	119802.86	10.00	transferencia	2
891	858	153	2024-09-25	2024-10-05	entregado	31574.14	0.00	PayPal	2
892	182	147	2025-04-05	2025-04-14	cancelado	6246.36	10.00	OXXO	1
893	803	136	2025-07-05	2025-07-17	entregado	124870.10	10.00	OXXO	1
894	1024	20	2024-01-21	2024-01-29	entregado	55778.61	10.00	OXXO	3
895	236	100	2025-03-14	2025-03-27	devuelto	1702.50	0.00	tarjeta_credito	4
896	158	121	2023-06-28	2023-07-04	entregado	165961.28	0.00	tarjeta_credito	5
897	1412	155	2026-02-16	2026-02-20	entregado	66475.56	0.00	efectivo	5
898	761	133	2024-07-30	2024-08-08	entregado	85211.41	5.00	tarjeta_debito	2
899	314	124	2024-11-18	2024-11-30	entregado	37669.02	5.00	tarjeta_debito	6
900	1592	88	2025-11-07	2025-11-15	cancelado	275023.09	0.00	PayPal	3
901	661	143	2026-01-26	2026-02-06	procesando	53637.88	20.00	efectivo	8
902	1777	108	2025-06-09	2025-06-24	pendiente	3830.11	10.00	tarjeta_debito	4
903	832	10	2025-10-06	2025-10-18	enviado	160807.69	0.00	PayPal	5
904	734	67	2025-11-23	2025-12-07	entregado	95702.67	10.00	efectivo	6
905	479	25	2024-09-07	2024-09-14	entregado	29206.26	0.00	tarjeta_debito	1
906	1833	198	2023-10-22	2023-11-01	entregado	93189.55	5.00	efectivo	1
907	1333	151	2024-01-16	2024-01-28	procesando	49409.42	0.00	PayPal	8
908	278	162	2024-11-20	2024-12-05	procesando	203804.69	5.00	OXXO	3
909	1439	28	2023-11-11	2023-11-19	enviado	104367.52	15.00	efectivo	2
910	858	103	2023-08-06	2023-08-08	entregado	228952.60	0.00	PayPal	8
911	394	110	2023-11-27	2023-11-28	entregado	83545.11	0.00	transferencia	4
912	1448	76	2026-05-20	2026-06-01	pendiente	90441.11	0.00	OXXO	3
913	1324	44	2024-12-05	2024-12-07	procesando	114397.46	5.00	OXXO	4
914	1661	16	2024-02-19	2024-03-01	pendiente	130476.88	0.00	tarjeta_debito	7
915	641	79	2026-05-13	2026-05-15	pendiente	193233.19	0.00	efectivo	5
916	550	44	2024-10-12	2024-10-25	devuelto	120828.64	15.00	efectivo	3
917	1371	172	2026-04-09	2026-04-12	procesando	143284.45	0.00	efectivo	1
918	1429	154	2024-09-19	2024-09-27	entregado	21302.53	10.00	tarjeta_credito	2
919	1369	189	2023-07-23	2023-07-30	procesando	28132.75	20.00	transferencia	5
920	17	157	2024-11-05	2024-11-07	entregado	175044.36	0.00	PayPal	2
921	1838	50	2023-10-28	2023-10-29	entregado	77827.86	10.00	tarjeta_debito	5
922	1718	84	2025-12-02	2025-12-13	enviado	57653.62	0.00	tarjeta_debito	7
923	1762	20	2026-01-18	2026-01-19	enviado	70969.03	0.00	efectivo	5
924	372	192	2025-06-17	2025-06-18	enviado	29990.00	0.00	transferencia	7
925	1457	98	2024-01-07	2024-01-17	procesando	47277.31	20.00	PayPal	3
926	1588	43	2024-07-01	2024-07-05	entregado	201258.47	0.00	PayPal	5
927	191	17	2025-05-15	2025-05-25	procesando	170159.36	10.00	tarjeta_debito	5
928	260	72	2025-08-11	2025-08-16	entregado	97429.31	0.00	tarjeta_debito	4
929	554	105	2025-05-16	2025-05-20	cancelado	7690.57	5.00	PayPal	4
930	1951	61	2024-12-31	2025-01-04	entregado	143902.94	0.00	OXXO	7
931	894	157	2025-01-06	2025-01-18	entregado	8994.82	0.00	efectivo	5
932	360	73	2025-01-17	2025-01-29	enviado	45574.40	0.00	PayPal	3
933	1136	85	2024-07-08	2024-07-09	entregado	182033.25	0.00	tarjeta_credito	6
934	335	195	2023-07-06	2023-07-19	enviado	138220.43	0.00	efectivo	8
935	1728	162	2026-05-26	2026-05-30	enviado	18512.04	10.00	PayPal	7
936	581	84	2025-04-08	2025-04-14	enviado	75503.03	10.00	transferencia	7
937	673	12	2024-12-29	2025-01-06	entregado	52829.90	5.00	tarjeta_debito	1
938	78	196	2024-07-15	2024-07-20	entregado	215957.52	5.00	transferencia	4
939	1914	71	2024-11-05	2024-11-17	procesando	120546.50	5.00	OXXO	7
940	1058	112	2024-01-13	2024-01-21	enviado	57626.64	5.00	efectivo	8
941	34	105	2025-11-05	2025-11-13	procesando	130081.28	15.00	tarjeta_credito	7
942	1197	14	2025-12-19	2026-01-02	entregado	17885.36	0.00	tarjeta_credito	2
943	54	195	2025-03-28	2025-04-10	enviado	199297.60	10.00	OXXO	8
944	211	87	2024-03-30	2024-04-07	cancelado	154157.58	0.00	OXXO	6
945	1	168	2024-07-18	2024-07-20	enviado	201426.57	5.00	tarjeta_credito	2
946	788	126	2024-10-20	2024-10-25	enviado	37430.69	10.00	tarjeta_debito	4
947	582	178	2025-04-13	2025-04-19	enviado	13284.69	5.00	transferencia	6
948	39	72	2024-08-17	2024-08-30	pendiente	157932.74	5.00	transferencia	7
949	1755	182	2025-02-27	2025-03-07	entregado	250382.19	0.00	OXXO	5
950	1846	46	2024-01-03	2024-01-05	entregado	15451.01	10.00	PayPal	3
951	1843	85	2023-12-12	2023-12-14	entregado	56794.80	0.00	tarjeta_debito	6
952	115	175	2025-02-04	2025-02-13	entregado	159118.41	10.00	transferencia	7
953	1525	45	2024-05-02	2024-05-16	cancelado	100023.19	5.00	tarjeta_credito	7
954	1558	194	2025-01-17	2025-01-26	enviado	17540.60	5.00	OXXO	7
955	1761	144	2026-02-25	2026-03-08	entregado	190080.46	0.00	efectivo	4
956	39	185	2025-12-20	2025-12-21	procesando	131133.93	15.00	tarjeta_debito	8
957	1125	148	2024-04-30	2024-05-10	entregado	118373.58	20.00	PayPal	4
958	4	195	2024-10-17	2024-10-28	pendiente	74366.53	15.00	tarjeta_debito	8
959	942	90	2023-07-04	2023-07-11	procesando	66138.03	0.00	tarjeta_debito	7
960	671	107	2025-08-15	2025-08-16	pendiente	224465.05	10.00	tarjeta_debito	5
961	623	175	2024-11-12	2024-11-16	enviado	33323.70	0.00	PayPal	7
962	1531	190	2025-01-27	2025-01-31	entregado	54075.22	0.00	tarjeta_debito	4
963	456	95	2023-12-24	2024-01-04	entregado	38632.12	0.00	OXXO	1
964	919	57	2025-09-30	2025-10-15	entregado	112188.84	0.00	efectivo	8
965	946	110	2025-06-22	2025-07-03	entregado	67713.75	0.00	tarjeta_debito	7
966	911	138	2024-09-08	2024-09-20	entregado	95116.27	5.00	PayPal	8
967	1667	127	2024-12-16	2024-12-29	entregado	167759.56	10.00	efectivo	5
968	1402	74	2025-02-06	2025-02-11	cancelado	63917.95	10.00	tarjeta_debito	6
969	1738	49	2023-12-11	2023-12-23	entregado	73631.00	0.00	tarjeta_credito	4
970	976	100	2023-11-01	2023-11-08	enviado	95436.26	0.00	efectivo	3
971	47	123	2024-01-31	2024-02-08	entregado	42974.54	0.00	transferencia	6
972	410	77	2025-12-13	2025-12-15	entregado	116122.80	0.00	tarjeta_debito	4
973	122	160	2026-02-12	2026-02-25	entregado	47141.73	10.00	PayPal	5
974	1513	9	2024-02-25	2024-03-02	entregado	122849.40	10.00	tarjeta_debito	4
975	1526	75	2024-12-19	2024-12-25	entregado	34394.14	20.00	efectivo	7
976	749	63	2024-07-11	2024-07-14	pendiente	79876.23	15.00	tarjeta_debito	7
977	881	9	2026-05-15	2026-05-29	devuelto	10104.69	0.00	tarjeta_credito	2
978	144	16	2025-01-25	2025-02-08	entregado	8227.88	20.00	OXXO	6
979	1689	108	2026-01-03	2026-01-05	enviado	39046.77	10.00	PayPal	7
980	1708	81	2025-12-29	2025-12-31	enviado	145384.96	5.00	efectivo	4
981	1534	115	2024-11-22	2024-11-29	entregado	176255.66	0.00	efectivo	8
982	919	109	2025-12-03	2025-12-12	enviado	76885.08	5.00	PayPal	8
983	1370	1	2024-11-14	2024-11-26	entregado	202834.19	5.00	transferencia	7
984	1122	38	2026-05-10	2026-05-22	entregado	160312.16	0.00	transferencia	6
985	1230	151	2024-05-05	2024-05-06	enviado	85990.22	5.00	efectivo	3
986	1437	60	2025-02-22	2025-02-23	procesando	249980.20	5.00	tarjeta_debito	8
987	866	74	2026-05-07	2026-05-13	entregado	103450.59	0.00	tarjeta_debito	7
988	358	40	2026-01-25	2026-01-30	entregado	82645.56	0.00	tarjeta_credito	7
989	771	9	2024-09-18	2024-09-26	entregado	157253.28	15.00	tarjeta_debito	2
990	519	117	2023-08-22	2023-08-28	entregado	59703.33	0.00	efectivo	3
991	6	49	2024-08-10	2024-08-20	entregado	131462.06	0.00	OXXO	3
992	1877	185	2025-03-06	2025-03-19	enviado	250036.48	5.00	efectivo	2
993	1101	192	2024-03-01	2024-03-08	entregado	11952.67	15.00	transferencia	8
994	620	25	2025-04-20	2025-04-22	devuelto	311314.06	15.00	tarjeta_credito	4
995	18	37	2024-06-14	2024-06-23	entregado	181758.02	0.00	transferencia	6
996	1095	21	2024-06-26	2024-06-30	devuelto	230781.27	15.00	PayPal	6
997	1307	43	2025-10-11	2025-10-19	enviado	28612.40	0.00	PayPal	1
998	1657	148	2023-07-07	2023-07-12	procesando	14626.15	5.00	tarjeta_credito	3
999	1989	142	2024-05-04	2024-05-10	entregado	146628.89	5.00	tarjeta_credito	7
1000	944	89	2025-06-12	2025-06-16	enviado	176704.23	15.00	tarjeta_credito	4
1001	638	137	2025-12-06	2025-12-15	pendiente	109425.87	10.00	OXXO	1
1002	402	137	2026-01-29	2026-02-12	entregado	201694.22	0.00	efectivo	3
1003	1441	156	2025-06-22	2025-06-27	pendiente	179995.51	0.00	PayPal	6
1004	1177	119	2025-02-01	2025-02-14	cancelado	173268.85	10.00	OXXO	2
1005	356	17	2023-07-23	2023-07-29	entregado	181031.44	15.00	efectivo	2
1006	179	76	2024-03-11	2024-03-13	entregado	69656.59	0.00	OXXO	6
1007	743	51	2026-02-21	2026-02-23	entregado	201008.47	0.00	tarjeta_credito	5
1008	608	3	2023-12-03	2023-12-11	enviado	213628.95	5.00	tarjeta_credito	1
1009	1263	190	2024-02-28	2024-03-05	enviado	58148.63	0.00	efectivo	6
1010	936	105	2024-01-08	2024-01-12	procesando	75896.89	0.00	efectivo	2
1011	1604	143	2025-05-31	2025-06-10	enviado	49795.71	0.00	PayPal	5
1012	699	40	2026-02-19	2026-02-26	entregado	37863.20	0.00	PayPal	2
1013	47	108	2025-11-09	2025-11-24	procesando	92224.38	0.00	OXXO	7
1014	1414	158	2025-12-02	2025-12-03	entregado	114189.48	10.00	OXXO	3
1015	328	171	2025-01-15	2025-01-18	cancelado	157472.45	0.00	PayPal	3
1016	855	129	2025-09-27	2025-09-30	procesando	103810.16	5.00	transferencia	6
1017	1901	164	2024-03-10	2024-03-13	procesando	73377.67	0.00	PayPal	7
1018	1956	38	2026-04-10	2026-04-19	entregado	128522.15	0.00	PayPal	2
1019	1528	1	2026-05-20	2026-05-26	enviado	99611.91	0.00	OXXO	6
1020	1009	34	2025-09-13	2025-09-22	enviado	29032.36	0.00	tarjeta_debito	3
1021	299	8	2026-03-08	2026-03-19	procesando	34273.12	15.00	efectivo	6
1022	1261	127	2025-09-21	2025-09-26	cancelado	42085.03	5.00	tarjeta_credito	3
1023	1250	90	2025-12-13	2025-12-18	entregado	73387.51	15.00	tarjeta_credito	6
1024	1387	132	2026-04-25	2026-05-07	pendiente	5558.85	15.00	PayPal	7
1025	33	98	2026-03-14	2026-03-19	enviado	156108.58	0.00	tarjeta_debito	5
1026	27	108	2024-06-07	2024-06-21	entregado	90783.13	0.00	transferencia	7
1027	1419	156	2024-07-13	2024-07-14	procesando	49669.55	0.00	tarjeta_credito	6
1028	893	101	2024-12-27	2024-12-31	entregado	153803.20	15.00	efectivo	6
1029	884	35	2025-03-17	2025-03-26	enviado	61560.08	5.00	PayPal	8
1030	1491	98	2024-06-30	2024-07-07	procesando	113090.90	15.00	PayPal	4
1031	152	53	2024-04-05	2024-04-16	devuelto	12982.40	0.00	tarjeta_debito	3
1032	1728	152	2026-04-25	2026-05-10	entregado	75665.53	0.00	OXXO	4
1033	1139	98	2026-05-24	2026-06-08	entregado	105402.92	10.00	efectivo	8
1034	1849	21	2026-05-11	2026-05-15	enviado	41039.13	0.00	tarjeta_credito	5
1035	1755	134	2024-08-20	2024-09-01	entregado	129109.70	0.00	OXXO	5
1036	631	19	2025-10-05	2025-10-10	entregado	27234.30	5.00	tarjeta_credito	6
1037	478	79	2023-12-22	2023-12-25	enviado	301253.99	5.00	tarjeta_credito	7
1038	972	56	2026-02-16	2026-03-02	enviado	55125.41	10.00	tarjeta_debito	7
1039	1011	3	2025-01-04	2025-01-18	enviado	77346.99	5.00	OXXO	7
1040	1710	85	2024-04-24	2024-05-06	procesando	230516.36	5.00	tarjeta_debito	6
1041	1586	170	2025-05-27	2025-06-10	pendiente	31510.39	5.00	tarjeta_debito	1
1042	1557	196	2025-10-28	2025-11-06	entregado	24765.61	0.00	tarjeta_debito	1
1043	895	131	2023-07-24	2023-07-30	entregado	158079.38	10.00	OXXO	7
1044	994	105	2023-09-01	2023-09-10	entregado	134363.19	15.00	efectivo	6
1045	1642	142	2025-03-20	2025-03-28	devuelto	147897.46	10.00	PayPal	6
1046	1702	148	2023-10-13	2023-10-19	entregado	150901.30	0.00	OXXO	4
1047	167	123	2024-08-20	2024-09-04	entregado	146945.14	10.00	efectivo	3
1048	1892	129	2023-09-15	2023-09-20	enviado	285495.25	0.00	efectivo	2
1049	1981	176	2026-01-31	2026-02-12	enviado	36907.54	20.00	transferencia	3
1050	878	114	2024-08-19	2024-09-01	entregado	87663.57	10.00	tarjeta_credito	8
1051	870	66	2024-07-26	2024-07-30	entregado	52322.32	0.00	efectivo	2
1052	1572	92	2024-01-01	2024-01-06	pendiente	82548.55	5.00	transferencia	7
1053	487	185	2026-05-26	2026-06-10	cancelado	107026.79	5.00	tarjeta_debito	6
1054	1509	130	2025-05-31	2025-06-01	cancelado	64472.60	0.00	tarjeta_debito	1
1055	176	195	2024-08-10	2024-08-20	entregado	252138.66	5.00	tarjeta_debito	5
1056	297	33	2023-07-04	2023-07-09	procesando	110889.74	10.00	tarjeta_debito	5
1057	1582	170	2025-07-04	2025-07-12	entregado	6452.67	5.00	PayPal	5
1058	893	168	2026-03-03	2026-03-05	cancelado	153425.01	15.00	tarjeta_credito	5
1059	17	53	2025-05-05	2025-05-20	entregado	176046.43	0.00	efectivo	4
1060	899	192	2025-02-01	2025-02-07	procesando	28118.39	5.00	transferencia	8
1061	214	89	2024-08-12	2024-08-17	entregado	62625.01	15.00	efectivo	4
1062	1200	40	2024-03-29	2024-03-30	enviado	5759.56	0.00	efectivo	7
1063	1297	180	2025-09-02	2025-09-10	entregado	133562.33	5.00	OXXO	4
1064	810	179	2024-10-07	2024-10-17	enviado	22314.85	0.00	OXXO	3
1065	1456	136	2024-06-27	2024-07-04	entregado	200513.03	5.00	OXXO	3
1066	1645	129	2024-05-26	2024-06-07	entregado	19312.98	20.00	efectivo	6
1067	1480	167	2025-03-23	2025-04-01	entregado	41773.88	0.00	transferencia	8
1068	697	82	2025-08-31	2025-09-02	pendiente	7141.48	0.00	transferencia	5
1069	446	156	2024-05-13	2024-05-20	entregado	112214.84	5.00	efectivo	7
1070	6	115	2026-04-27	2026-05-11	entregado	91050.90	0.00	OXXO	2
1071	1244	130	2026-01-30	2026-02-07	entregado	85817.43	0.00	tarjeta_debito	5
1072	613	25	2024-09-21	2024-10-01	procesando	167839.55	0.00	OXXO	2
1073	880	71	2025-06-12	2025-06-21	procesando	24236.33	10.00	PayPal	6
1074	1358	147	2023-10-11	2023-10-16	entregado	156441.20	0.00	transferencia	6
1075	1193	10	2023-09-30	2023-10-01	entregado	96685.51	0.00	PayPal	5
1076	1329	182	2025-04-07	2025-04-18	cancelado	134791.01	0.00	transferencia	8
1077	1347	127	2025-11-15	2025-11-21	cancelado	37098.78	10.00	tarjeta_debito	3
1078	1487	1	2024-12-14	2024-12-27	enviado	99100.03	15.00	transferencia	7
1079	1939	178	2025-02-03	2025-02-08	cancelado	24224.27	0.00	efectivo	8
1080	956	32	2026-02-27	2026-03-10	entregado	244272.13	0.00	efectivo	5
1081	947	117	2025-02-28	2025-03-13	entregado	137758.52	20.00	tarjeta_debito	2
1082	1677	169	2024-12-21	2025-01-02	enviado	40236.54	0.00	efectivo	6
1083	960	129	2024-07-22	2024-07-29	entregado	131832.83	0.00	efectivo	8
1084	633	25	2024-03-28	2024-04-06	entregado	71961.73	5.00	transferencia	4
1085	1269	171	2024-09-06	2024-09-09	entregado	96538.91	0.00	efectivo	6
1086	716	142	2026-05-06	2026-05-20	procesando	238820.15	10.00	efectivo	8
1087	1530	154	2024-10-02	2024-10-16	entregado	76503.06	15.00	tarjeta_credito	7
1088	825	12	2025-07-28	2025-08-10	pendiente	52375.60	5.00	efectivo	2
1089	1591	50	2024-02-22	2024-02-25	entregado	10571.43	10.00	OXXO	5
1090	910	1	2024-10-04	2024-10-05	entregado	69868.52	0.00	PayPal	8
1091	1298	184	2025-11-27	2025-12-02	procesando	5185.75	0.00	PayPal	8
1092	1476	178	2025-01-25	2025-01-30	entregado	306609.10	0.00	efectivo	6
1093	86	133	2025-03-25	2025-04-02	pendiente	48557.81	0.00	transferencia	1
1094	252	119	2026-04-20	2026-04-24	enviado	348025.13	0.00	tarjeta_credito	2
1095	943	90	2026-04-09	2026-04-20	cancelado	109360.84	10.00	transferencia	1
1096	1926	99	2023-11-12	2023-11-22	procesando	102489.18	0.00	tarjeta_credito	8
1097	1113	111	2025-06-12	2025-06-21	entregado	7392.52	5.00	transferencia	3
1098	225	192	2024-05-25	2024-06-04	cancelado	107669.65	0.00	PayPal	7
1099	912	103	2025-01-16	2025-01-22	devuelto	42862.37	10.00	transferencia	4
1100	754	173	2024-06-12	2024-06-24	enviado	340659.92	0.00	transferencia	1
1101	931	33	2025-09-12	2025-09-21	enviado	344721.08	0.00	tarjeta_credito	4
1102	473	89	2025-11-05	2025-11-18	entregado	94562.02	0.00	efectivo	4
1103	97	155	2023-10-27	2023-11-11	cancelado	59160.54	0.00	OXXO	5
1104	1998	158	2025-03-04	2025-03-11	entregado	15065.20	5.00	tarjeta_debito	6
1105	983	183	2024-02-15	2024-02-23	procesando	24314.94	15.00	OXXO	5
1106	1066	6	2025-05-06	2025-05-18	procesando	62228.16	20.00	OXXO	1
1107	1361	14	2023-11-20	2023-12-01	procesando	117016.61	10.00	OXXO	7
1108	1728	94	2025-08-01	2025-08-08	cancelado	94284.55	5.00	efectivo	3
1109	1943	172	2024-02-12	2024-02-16	pendiente	121620.63	0.00	PayPal	5
1110	1450	200	2026-01-23	2026-01-26	pendiente	36841.31	15.00	PayPal	7
1111	879	150	2025-11-11	2025-11-13	cancelado	82087.37	5.00	tarjeta_debito	3
1112	155	68	2025-07-06	2025-07-12	cancelado	10136.15	10.00	tarjeta_credito	2
1113	1200	126	2025-08-15	2025-08-29	entregado	99763.03	5.00	efectivo	7
1114	1553	195	2024-08-28	2024-09-05	devuelto	184383.22	5.00	efectivo	7
1115	1874	96	2025-03-29	2025-04-01	entregado	160547.44	10.00	efectivo	5
1116	1894	20	2025-10-30	2025-11-08	entregado	52114.31	10.00	PayPal	6
1117	175	55	2024-04-20	2024-05-05	entregado	77137.06	5.00	tarjeta_credito	6
1118	296	15	2025-04-15	2025-04-24	cancelado	31657.52	5.00	tarjeta_credito	4
1119	911	185	2024-01-15	2024-01-24	entregado	196779.82	0.00	efectivo	8
1120	1924	21	2024-12-26	2025-01-02	procesando	73833.69	0.00	tarjeta_credito	5
1121	1356	134	2025-01-28	2025-02-01	entregado	95737.86	0.00	tarjeta_credito	2
1122	228	48	2023-12-17	2023-12-20	enviado	204137.52	15.00	tarjeta_credito	4
1123	4	131	2023-09-29	2023-10-14	procesando	247172.43	15.00	transferencia	8
1124	95	188	2026-05-21	2026-05-28	procesando	130763.60	0.00	tarjeta_credito	4
1125	1589	120	2024-04-30	2024-05-03	procesando	85304.61	0.00	transferencia	7
1126	1340	124	2026-01-28	2026-02-08	entregado	169608.05	20.00	transferencia	3
1127	86	73	2023-07-05	2023-07-19	enviado	80306.53	5.00	OXXO	5
1128	211	129	2024-04-04	2024-04-18	enviado	56530.94	0.00	OXXO	3
1129	793	77	2024-08-08	2024-08-21	entregado	169902.80	5.00	transferencia	5
1130	224	151	2025-12-23	2025-12-30	entregado	67472.09	10.00	OXXO	4
1131	1248	175	2026-05-01	2026-05-08	procesando	76572.09	0.00	PayPal	1
1132	1977	145	2023-09-19	2023-09-30	entregado	148190.61	0.00	efectivo	2
1133	1445	153	2023-12-02	2023-12-13	entregado	126279.19	5.00	OXXO	6
1134	1145	147	2025-11-19	2025-11-23	entregado	70536.38	5.00	PayPal	7
1135	952	3	2023-11-08	2023-11-13	entregado	5544.82	20.00	tarjeta_debito	2
1136	1226	64	2024-03-18	2024-03-30	entregado	25624.09	15.00	tarjeta_debito	7
1137	1630	1	2025-08-28	2025-08-31	entregado	80622.57	5.00	tarjeta_credito	8
1138	752	71	2023-07-24	2023-07-25	entregado	120847.04	10.00	PayPal	4
1139	408	198	2024-05-19	2024-05-28	entregado	124121.87	5.00	efectivo	4
1140	1398	160	2025-12-24	2025-12-25	entregado	34815.70	0.00	efectivo	2
1141	984	80	2024-07-19	2024-08-03	entregado	82538.54	5.00	OXXO	6
1142	251	7	2025-07-13	2025-07-25	entregado	173754.58	0.00	tarjeta_credito	3
1143	1866	140	2025-01-27	2025-01-31	entregado	86303.48	0.00	PayPal	8
1144	1160	149	2026-05-18	2026-06-02	entregado	109971.55	10.00	PayPal	8
1145	205	127	2023-09-06	2023-09-08	cancelado	198272.52	5.00	tarjeta_debito	1
1146	708	106	2023-08-22	2023-08-30	pendiente	85857.52	15.00	efectivo	2
1147	266	65	2024-04-20	2024-04-21	entregado	21635.66	20.00	efectivo	4
1148	1559	163	2024-08-24	2024-08-28	entregado	39224.59	0.00	efectivo	2
1149	1549	143	2023-11-26	2023-12-09	cancelado	61819.87	0.00	OXXO	7
1150	1757	16	2026-05-23	2026-05-30	entregado	46265.21	0.00	OXXO	8
1151	1386	163	2025-02-19	2025-03-05	entregado	155543.76	10.00	tarjeta_debito	1
1152	467	58	2025-06-14	2025-06-19	enviado	33886.13	0.00	OXXO	8
1153	683	194	2023-08-23	2023-09-07	devuelto	99135.20	20.00	efectivo	2
1154	1597	1	2024-10-01	2024-10-10	entregado	320041.61	5.00	tarjeta_credito	5
1155	1436	113	2025-03-24	2025-04-07	entregado	10580.70	0.00	efectivo	7
1156	41	88	2024-10-27	2024-10-30	entregado	1664.51	0.00	PayPal	6
1157	1675	149	2024-10-07	2024-10-20	entregado	301246.71	10.00	tarjeta_credito	2
1158	105	124	2023-10-17	2023-10-24	entregado	243667.21	0.00	efectivo	6
1159	857	88	2023-11-10	2023-11-13	enviado	84678.88	10.00	tarjeta_debito	3
1160	794	175	2025-04-07	2025-04-12	enviado	276367.07	0.00	OXXO	1
1161	1553	53	2026-05-21	2026-05-31	enviado	83420.99	20.00	transferencia	6
1162	1519	107	2026-05-19	2026-06-02	entregado	10735.69	10.00	OXXO	3
1163	1889	167	2024-02-27	2024-02-29	entregado	18009.84	0.00	transferencia	8
1164	70	160	2023-12-18	2024-01-02	entregado	21561.14	0.00	PayPal	6
1165	960	11	2025-04-17	2025-04-27	enviado	91378.70	10.00	tarjeta_debito	7
1166	457	128	2023-10-26	2023-11-05	entregado	124281.87	10.00	transferencia	2
1167	1373	22	2026-02-19	2026-02-27	procesando	77083.48	20.00	tarjeta_credito	3
1168	1135	153	2024-02-03	2024-02-06	entregado	1145.57	10.00	transferencia	3
1169	589	52	2025-07-11	2025-07-15	entregado	126054.87	15.00	tarjeta_debito	1
1170	1614	37	2025-03-27	2025-04-06	enviado	188680.94	0.00	efectivo	7
1171	47	103	2026-04-16	2026-04-30	cancelado	27003.29	15.00	PayPal	5
1172	1450	59	2026-06-07	2026-06-14	enviado	198141.47	5.00	tarjeta_debito	6
1173	897	138	2024-03-31	2024-04-06	procesando	94913.28	5.00	tarjeta_credito	3
1174	1036	88	2025-01-31	2025-02-08	procesando	63202.62	0.00	transferencia	5
1175	520	136	2024-07-23	2024-07-28	enviado	101152.25	10.00	efectivo	4
1176	219	30	2023-07-12	2023-07-25	entregado	130190.01	0.00	efectivo	5
1177	1853	37	2023-06-23	2023-07-06	entregado	80963.97	0.00	transferencia	7
1178	1557	78	2025-09-14	2025-09-20	entregado	47825.83	0.00	PayPal	7
1179	1128	136	2023-12-10	2023-12-19	entregado	2735.79	5.00	tarjeta_credito	4
1180	1479	152	2025-09-18	2025-09-21	entregado	215144.86	15.00	transferencia	1
1181	1848	24	2024-08-13	2024-08-22	entregado	125654.01	0.00	tarjeta_debito	3
1182	1106	121	2023-07-03	2023-07-16	entregado	267965.57	15.00	PayPal	8
1183	416	180	2026-01-06	2026-01-11	cancelado	34127.84	10.00	PayPal	6
1184	1633	105	2025-06-21	2025-07-01	cancelado	322216.19	0.00	OXXO	7
1185	635	77	2025-10-19	2025-10-26	entregado	72232.56	0.00	tarjeta_debito	1
1186	965	2	2026-05-03	2026-05-09	entregado	123294.22	0.00	PayPal	8
1187	640	87	2025-12-31	2026-01-03	pendiente	73561.36	0.00	tarjeta_debito	1
1188	169	186	2023-09-14	2023-09-20	entregado	80118.25	15.00	tarjeta_credito	7
1189	565	136	2023-08-26	2023-09-05	entregado	108917.86	15.00	tarjeta_credito	1
1190	1779	69	2024-03-02	2024-03-09	entregado	228363.11	0.00	OXXO	1
1191	1598	26	2024-06-13	2024-06-16	entregado	763.71	5.00	transferencia	5
1192	565	44	2026-02-27	2026-03-03	cancelado	24015.17	0.00	transferencia	6
1193	599	189	2025-05-21	2025-05-25	entregado	42199.13	20.00	PayPal	8
1194	291	61	2025-03-26	2025-04-02	enviado	132557.18	5.00	transferencia	1
1195	1630	23	2024-12-27	2025-01-02	entregado	65957.46	5.00	tarjeta_debito	3
1196	822	125	2026-01-08	2026-01-13	procesando	105184.74	5.00	PayPal	2
1197	1272	163	2023-11-12	2023-11-13	entregado	215331.63	0.00	tarjeta_credito	7
1198	1017	156	2023-09-26	2023-10-07	entregado	67117.77	5.00	efectivo	2
1199	1171	34	2026-03-09	2026-03-11	cancelado	20382.10	0.00	OXXO	6
1200	259	61	2025-03-04	2025-03-16	entregado	77132.57	5.00	tarjeta_credito	5
1201	1179	166	2025-05-03	2025-05-16	entregado	57211.62	0.00	tarjeta_debito	2
1202	704	138	2024-05-11	2024-05-26	entregado	30446.64	0.00	transferencia	4
1203	1643	155	2023-12-16	2023-12-18	entregado	171829.70	0.00	tarjeta_credito	8
1204	685	118	2024-09-30	2024-10-12	cancelado	28860.74	20.00	efectivo	3
1205	613	144	2023-10-28	2023-11-11	entregado	209295.99	0.00	transferencia	3
1206	709	154	2025-12-30	2026-01-08	pendiente	163142.48	0.00	tarjeta_credito	3
1207	616	168	2023-10-23	2023-11-04	entregado	217677.84	10.00	OXXO	7
1208	1451	119	2023-10-02	2023-10-05	pendiente	254585.31	0.00	tarjeta_debito	5
1209	405	162	2024-07-10	2024-07-24	entregado	101292.80	15.00	PayPal	8
1210	338	155	2024-05-02	2024-05-08	entregado	39872.98	0.00	transferencia	5
1211	457	133	2026-03-15	2026-03-29	entregado	131947.23	15.00	tarjeta_credito	4
1212	554	137	2026-05-04	2026-05-15	entregado	60734.74	0.00	PayPal	7
1213	1969	13	2026-04-10	2026-04-22	entregado	88064.56	0.00	PayPal	2
1214	859	179	2024-06-16	2024-06-24	entregado	39369.10	0.00	efectivo	3
1215	831	98	2025-09-01	2025-09-04	entregado	95207.67	5.00	tarjeta_credito	4
1216	845	154	2025-02-24	2025-02-25	enviado	42477.73	0.00	efectivo	1
1217	1869	26	2024-07-31	2024-08-03	entregado	237021.37	0.00	OXXO	2
1218	1541	118	2025-05-30	2025-06-13	entregado	80023.96	0.00	tarjeta_credito	5
1219	1007	85	2024-01-31	2024-02-10	devuelto	68166.19	0.00	tarjeta_credito	2
1220	1069	69	2025-09-27	2025-10-12	enviado	158393.52	0.00	efectivo	5
1221	919	79	2025-07-11	2025-07-14	enviado	245591.49	5.00	OXXO	6
1222	1263	107	2024-02-12	2024-02-27	procesando	134195.11	10.00	tarjeta_credito	6
1223	511	153	2026-05-02	2026-05-15	entregado	164452.20	0.00	tarjeta_debito	5
1224	953	187	2025-02-13	2025-02-20	entregado	7103.30	0.00	tarjeta_debito	3
1225	1240	145	2026-05-10	2026-05-20	entregado	92121.84	20.00	tarjeta_credito	7
1226	616	117	2024-03-01	2024-03-03	cancelado	106460.30	5.00	efectivo	3
1227	925	129	2023-09-14	2023-09-18	cancelado	24230.85	10.00	efectivo	5
1228	1349	14	2024-11-07	2024-11-10	enviado	81066.32	0.00	PayPal	8
1229	1227	37	2026-02-06	2026-02-18	entregado	51755.36	20.00	efectivo	4
1230	1274	51	2024-09-23	2024-09-27	procesando	49827.75	0.00	tarjeta_credito	5
1231	655	55	2025-06-01	2025-06-14	devuelto	266904.10	0.00	PayPal	8
1232	1143	178	2025-03-13	2025-03-19	entregado	17467.13	0.00	PayPal	2
1233	1827	57	2025-01-23	2025-01-24	pendiente	32604.86	0.00	efectivo	4
1234	1289	174	2025-04-11	2025-04-12	entregado	42440.10	0.00	efectivo	2
1235	1731	46	2025-08-03	2025-08-08	procesando	7615.42	15.00	tarjeta_credito	6
1236	391	183	2023-11-15	2023-11-18	entregado	206622.84	0.00	tarjeta_credito	6
1237	1876	19	2024-03-15	2024-03-16	entregado	186298.08	10.00	efectivo	2
1238	1678	8	2023-09-17	2023-09-29	entregado	64382.32	15.00	efectivo	8
1239	111	151	2024-12-12	2024-12-23	devuelto	3087.69	0.00	tarjeta_debito	3
1240	1834	166	2024-10-07	2024-10-13	entregado	167872.64	0.00	PayPal	3
1241	761	96	2025-12-14	2025-12-17	entregado	275912.91	5.00	tarjeta_credito	8
1242	1579	133	2026-01-08	2026-01-18	entregado	92535.38	0.00	OXXO	6
1243	1851	6	2024-06-26	2024-07-08	procesando	47815.49	10.00	efectivo	5
1244	1908	196	2026-01-22	2026-02-01	procesando	191033.58	0.00	efectivo	8
1245	1758	194	2024-09-06	2024-09-12	entregado	8227.88	0.00	transferencia	7
1246	1634	60	2025-06-21	2025-06-30	enviado	82175.19	0.00	efectivo	7
1247	504	5	2024-01-12	2024-01-14	procesando	99210.90	0.00	tarjeta_credito	6
1248	1827	184	2024-01-08	2024-01-12	entregado	112280.34	0.00	tarjeta_credito	8
1249	893	19	2024-09-09	2024-09-10	entregado	167057.70	0.00	PayPal	7
1250	1026	92	2024-02-02	2024-02-12	entregado	76944.80	15.00	efectivo	4
1251	1405	56	2024-01-28	2024-01-29	pendiente	49022.56	5.00	OXXO	1
1252	224	12	2026-01-01	2026-01-16	entregado	91155.98	10.00	OXXO	2
1253	1740	13	2025-03-25	2025-04-04	entregado	198188.63	10.00	PayPal	2
1254	1102	153	2025-04-13	2025-04-14	entregado	33394.78	20.00	transferencia	2
1255	791	63	2023-07-06	2023-07-08	entregado	76812.50	5.00	OXXO	6
1256	182	136	2024-06-18	2024-07-03	entregado	53079.75	5.00	efectivo	1
1257	1354	152	2024-04-21	2024-04-27	devuelto	19338.54	10.00	PayPal	3
1258	779	123	2025-06-16	2025-06-25	entregado	123810.78	0.00	tarjeta_debito	8
1259	321	1	2025-10-25	2025-11-05	procesando	164859.44	15.00	transferencia	3
1260	1295	50	2023-11-16	2023-11-20	entregado	21454.74	0.00	transferencia	4
1261	1490	186	2026-04-14	2026-04-23	entregado	187630.43	10.00	PayPal	8
1262	1951	134	2024-05-12	2024-05-14	enviado	103048.97	0.00	efectivo	4
1263	844	119	2025-12-31	2026-01-05	entregado	38459.53	0.00	tarjeta_credito	7
1264	777	135	2023-07-23	2023-08-04	entregado	284216.03	0.00	PayPal	6
1265	1563	126	2025-11-17	2025-11-19	entregado	212157.21	0.00	tarjeta_credito	6
1266	1370	156	2024-05-24	2024-06-07	entregado	55740.83	20.00	tarjeta_debito	2
1267	1032	13	2023-12-26	2023-12-30	enviado	206721.82	0.00	OXXO	1
1268	276	90	2023-06-24	2023-07-08	devuelto	147918.72	0.00	tarjeta_debito	4
1269	1579	121	2023-10-09	2023-10-17	procesando	129847.34	0.00	tarjeta_debito	2
1270	776	127	2023-09-30	2023-10-02	enviado	185846.24	0.00	transferencia	2
1271	761	73	2023-10-01	2023-10-12	entregado	60939.36	15.00	tarjeta_debito	5
1272	1362	15	2025-09-01	2025-09-07	devuelto	253460.58	0.00	efectivo	1
1273	1348	15	2024-07-11	2024-07-16	enviado	111847.12	0.00	OXXO	1
1274	1364	145	2025-04-10	2025-04-20	cancelado	20766.30	0.00	transferencia	4
1275	1066	131	2023-10-06	2023-10-09	entregado	292095.03	0.00	tarjeta_debito	1
1276	415	198	2024-11-11	2024-11-15	enviado	31774.73	10.00	tarjeta_credito	1
1277	62	149	2025-12-31	2026-01-05	entregado	121394.52	0.00	efectivo	4
1278	37	126	2024-11-19	2024-11-21	entregado	106100.36	5.00	OXXO	7
1279	644	70	2024-02-16	2024-02-29	entregado	219851.72	5.00	transferencia	4
1280	736	26	2023-07-09	2023-07-19	procesando	384035.03	0.00	efectivo	3
1281	927	200	2024-08-10	2024-08-21	entregado	32185.54	0.00	tarjeta_debito	4
1282	77	34	2025-03-09	2025-03-24	devuelto	84555.92	0.00	transferencia	8
1283	925	27	2025-05-30	2025-06-05	entregado	37187.63	0.00	PayPal	1
1284	1692	68	2025-11-14	2025-11-29	enviado	91494.05	5.00	PayPal	1
1285	690	18	2024-02-17	2024-02-24	entregado	87532.00	10.00	tarjeta_credito	3
1286	446	149	2025-09-24	2025-10-02	enviado	93692.85	0.00	efectivo	8
1287	1301	158	2026-04-04	2026-04-14	enviado	109601.74	10.00	transferencia	2
1288	669	36	2023-10-15	2023-10-22	enviado	42574.98	10.00	efectivo	5
1289	621	40	2026-05-12	2026-05-15	entregado	84005.83	20.00	OXXO	3
1290	515	138	2024-03-29	2024-04-02	procesando	113403.84	0.00	transferencia	4
1291	947	20	2024-10-05	2024-10-11	entregado	164229.63	15.00	tarjeta_credito	1
1292	1425	40	2024-04-24	2024-05-05	entregado	131157.61	5.00	tarjeta_credito	5
1293	1614	32	2025-01-18	2025-01-29	enviado	366757.78	0.00	tarjeta_credito	1
1294	541	117	2025-12-04	2025-12-18	enviado	43730.65	10.00	tarjeta_credito	2
1295	1669	149	2025-09-28	2025-10-10	entregado	103009.05	15.00	OXXO	3
1296	1820	78	2023-09-20	2023-09-27	enviado	49936.13	5.00	tarjeta_debito	5
1297	130	12	2025-03-17	2025-03-22	entregado	143599.19	0.00	tarjeta_credito	2
1298	228	144	2025-11-11	2025-11-16	entregado	49953.63	20.00	tarjeta_credito	4
1299	321	81	2025-10-17	2025-10-25	cancelado	45749.20	5.00	efectivo	5
1300	923	10	2023-08-18	2023-08-24	entregado	108558.12	5.00	efectivo	1
1301	1653	99	2023-11-26	2023-11-28	entregado	95623.17	10.00	transferencia	4
1302	142	6	2025-05-02	2025-05-04	entregado	87156.19	10.00	transferencia	5
1303	645	122	2025-09-28	2025-10-11	entregado	87495.30	0.00	transferencia	5
1304	1620	14	2023-11-23	2023-12-05	entregado	177774.26	0.00	transferencia	5
1305	529	159	2023-07-02	2023-07-10	entregado	125130.64	15.00	tarjeta_debito	2
1306	1451	59	2024-03-28	2024-04-09	devuelto	88214.61	5.00	tarjeta_credito	3
1307	1671	162	2024-03-05	2024-03-10	entregado	35582.45	10.00	tarjeta_credito	4
1308	344	110	2023-12-01	2023-12-07	entregado	85550.13	0.00	OXXO	1
1309	713	126	2024-03-21	2024-03-25	entregado	161644.69	10.00	tarjeta_credito	1
1310	1094	155	2024-03-02	2024-03-13	entregado	112273.43	0.00	tarjeta_credito	3
1311	660	58	2024-03-22	2024-03-23	entregado	42044.17	0.00	tarjeta_credito	5
1312	903	75	2023-07-10	2023-07-17	entregado	52401.39	0.00	PayPal	7
1313	1587	163	2023-07-15	2023-07-25	entregado	172939.97	0.00	tarjeta_credito	8
1314	25	167	2025-01-23	2025-01-30	cancelado	23172.48	0.00	tarjeta_credito	8
1315	1635	120	2026-06-03	2026-06-16	entregado	59962.38	0.00	tarjeta_debito	8
1316	642	147	2024-09-15	2024-09-25	entregado	121892.65	0.00	tarjeta_credito	8
1317	1081	27	2025-10-28	2025-11-12	pendiente	16534.03	0.00	PayPal	7
1318	1705	14	2026-03-29	2026-04-03	enviado	186094.85	0.00	tarjeta_credito	5
1319	587	76	2025-12-17	2025-12-30	entregado	69072.60	10.00	transferencia	8
1320	573	59	2025-02-21	2025-02-25	procesando	21954.42	5.00	OXXO	7
1321	1437	88	2024-05-06	2024-05-09	entregado	20390.58	20.00	transferencia	1
1322	1677	55	2025-02-17	2025-02-23	entregado	145807.57	0.00	tarjeta_credito	5
1323	1265	178	2025-06-08	2025-06-15	enviado	85435.43	20.00	tarjeta_debito	7
1324	1470	29	2023-10-07	2023-10-18	cancelado	245357.49	0.00	transferencia	4
1325	1970	146	2024-09-28	2024-10-11	entregado	44967.98	15.00	efectivo	8
1326	1470	186	2025-08-04	2025-08-19	pendiente	96367.84	10.00	PayPal	6
1327	1733	135	2024-05-02	2024-05-16	entregado	75998.03	5.00	PayPal	3
1328	1774	123	2024-04-08	2024-04-17	entregado	155556.60	0.00	OXXO	2
1329	1896	62	2024-11-28	2024-12-08	entregado	117064.42	0.00	transferencia	7
1330	902	9	2024-01-12	2024-01-13	entregado	162137.26	5.00	tarjeta_credito	8
1331	1788	59	2024-08-26	2024-09-03	enviado	111116.79	0.00	OXXO	2
1332	796	35	2024-07-17	2024-07-18	entregado	39593.97	10.00	PayPal	4
1333	1914	95	2024-12-20	2024-12-27	entregado	78810.04	0.00	PayPal	8
1334	32	27	2024-10-13	2024-10-24	devuelto	104539.86	5.00	efectivo	8
1335	11	60	2025-02-10	2025-02-15	procesando	140252.94	0.00	tarjeta_credito	7
1336	815	192	2025-08-06	2025-08-12	entregado	38224.71	5.00	OXXO	1
1337	675	7	2025-06-21	2025-06-28	devuelto	88144.62	0.00	OXXO	2
1338	1606	29	2026-02-18	2026-02-20	cancelado	15866.21	0.00	transferencia	2
1339	1733	150	2023-11-13	2023-11-17	enviado	27104.43	10.00	OXXO	2
1340	286	23	2025-02-23	2025-02-24	entregado	246791.81	10.00	PayPal	3
1341	1342	196	2025-05-12	2025-05-21	cancelado	260259.15	5.00	transferencia	1
1342	1566	175	2024-03-04	2024-03-12	entregado	76449.43	5.00	tarjeta_debito	2
1343	126	68	2024-12-21	2024-12-30	entregado	27829.42	5.00	transferencia	4
1344	1287	106	2024-05-29	2024-06-04	procesando	252787.79	0.00	tarjeta_debito	3
1345	148	198	2023-06-21	2023-06-30	entregado	84657.68	0.00	transferencia	4
1346	1538	21	2023-06-30	2023-07-12	devuelto	111637.92	10.00	tarjeta_credito	8
1347	788	17	2025-03-11	2025-03-25	entregado	119299.63	0.00	efectivo	2
1348	1414	161	2023-12-31	2024-01-10	entregado	165928.98	5.00	efectivo	2
1349	848	119	2024-01-04	2024-01-09	entregado	98685.07	0.00	tarjeta_debito	2
1350	1461	147	2025-03-01	2025-03-12	entregado	30158.91	0.00	PayPal	3
1351	1814	163	2024-03-10	2024-03-23	entregado	92280.62	0.00	transferencia	4
1352	945	150	2024-12-26	2025-01-05	cancelado	59010.59	5.00	tarjeta_debito	3
1353	642	48	2024-02-14	2024-02-27	entregado	258966.10	0.00	PayPal	5
1354	1557	64	2024-01-14	2024-01-27	procesando	199580.66	5.00	PayPal	2
1355	1787	30	2026-01-10	2026-01-15	procesando	29185.72	0.00	tarjeta_credito	7
1356	528	7	2023-07-13	2023-07-14	entregado	44152.31	0.00	tarjeta_credito	6
1357	650	180	2024-06-29	2024-07-09	procesando	251700.85	10.00	tarjeta_credito	7
1358	1431	43	2023-09-29	2023-10-08	entregado	92836.71	5.00	tarjeta_debito	6
1359	1182	26	2025-08-04	2025-08-05	procesando	44312.48	0.00	transferencia	4
1360	959	44	2025-10-16	2025-10-23	entregado	276702.89	10.00	transferencia	7
1361	1485	6	2025-03-25	2025-03-28	entregado	43912.42	5.00	tarjeta_credito	1
1362	359	160	2024-08-26	2024-09-01	procesando	74893.55	5.00	transferencia	8
1363	1577	59	2023-11-22	2023-12-07	procesando	126066.76	0.00	efectivo	8
1364	1747	149	2024-09-03	2024-09-16	entregado	68572.27	5.00	OXXO	3
1365	522	185	2023-11-30	2023-12-05	procesando	129495.72	0.00	transferencia	4
1366	802	117	2026-05-18	2026-05-22	procesando	185182.74	0.00	efectivo	7
1367	1962	168	2023-11-06	2023-11-20	entregado	107717.00	0.00	efectivo	5
1368	1496	42	2025-04-17	2025-04-21	entregado	18050.91	0.00	tarjeta_credito	6
1369	815	64	2026-04-07	2026-04-19	pendiente	145807.92	5.00	PayPal	3
1370	1287	65	2025-08-30	2025-09-08	entregado	3952.66	20.00	tarjeta_debito	2
1371	81	121	2023-07-09	2023-07-18	entregado	314997.77	0.00	transferencia	4
1372	1467	110	2024-06-18	2024-07-01	pendiente	233485.68	5.00	tarjeta_debito	3
1373	6	121	2025-09-11	2025-09-12	entregado	141430.45	0.00	tarjeta_credito	5
1374	283	140	2023-10-23	2023-10-28	cancelado	177257.37	0.00	OXXO	3
1375	1004	157	2024-01-13	2024-01-26	pendiente	138201.87	5.00	efectivo	2
1376	322	160	2024-08-10	2024-08-16	entregado	304016.00	5.00	tarjeta_credito	1
1377	1960	94	2025-12-28	2025-12-29	enviado	47604.61	5.00	OXXO	5
1378	1455	33	2025-09-21	2025-09-28	cancelado	75302.52	0.00	tarjeta_credito	1
1379	430	108	2026-05-21	2026-05-29	entregado	96254.54	0.00	tarjeta_credito	3
1380	1528	168	2023-06-24	2023-06-28	entregado	20783.38	15.00	OXXO	5
1381	1399	37	2024-11-26	2024-11-30	devuelto	8391.30	0.00	tarjeta_debito	2
1382	891	197	2025-08-26	2025-09-09	devuelto	116559.25	0.00	PayPal	2
1383	1785	107	2024-03-22	2024-03-26	entregado	21439.94	10.00	transferencia	7
1384	1713	143	2023-10-20	2023-11-01	procesando	237599.95	0.00	tarjeta_debito	1
1385	521	96	2024-11-18	2024-12-03	entregado	112483.78	15.00	transferencia	2
1386	893	101	2024-12-18	2024-12-28	entregado	123843.12	0.00	PayPal	5
1387	595	189	2024-08-02	2024-08-11	entregado	29961.68	0.00	OXXO	2
1388	1004	105	2024-10-06	2024-10-09	enviado	185404.96	0.00	OXXO	3
1389	1057	1	2025-09-19	2025-09-24	entregado	102877.51	0.00	efectivo	1
1390	1340	157	2024-02-27	2024-03-08	enviado	159020.18	10.00	tarjeta_credito	4
1391	251	85	2025-07-14	2025-07-26	entregado	52282.77	0.00	tarjeta_debito	3
1392	273	170	2026-03-05	2026-03-11	enviado	110700.34	5.00	transferencia	8
1393	1303	78	2025-02-15	2025-02-21	pendiente	35402.62	10.00	OXXO	5
1394	1018	104	2025-06-19	2025-06-25	procesando	139181.30	5.00	PayPal	6
1395	96	198	2025-11-05	2025-11-07	entregado	51313.06	0.00	tarjeta_debito	6
1396	655	130	2024-01-02	2024-01-16	entregado	100125.10	0.00	PayPal	3
1397	824	11	2025-03-16	2025-03-18	devuelto	173537.08	0.00	PayPal	1
1398	1986	61	2026-05-02	2026-05-07	pendiente	175454.80	0.00	PayPal	1
1399	1448	195	2023-10-21	2023-10-23	cancelado	34695.67	0.00	efectivo	3
1400	365	156	2025-03-18	2025-03-24	devuelto	46382.50	0.00	OXXO	5
1401	1354	188	2024-05-26	2024-06-05	cancelado	187384.27	0.00	OXXO	6
1402	1155	105	2023-12-17	2023-12-23	entregado	107057.95	5.00	tarjeta_credito	2
1403	1394	49	2023-12-05	2023-12-15	procesando	36390.00	0.00	OXXO	5
1404	1554	85	2023-10-28	2023-11-04	devuelto	131854.68	0.00	efectivo	6
1405	1571	175	2025-11-10	2025-11-12	devuelto	104544.64	0.00	PayPal	6
1406	1983	136	2023-11-03	2023-11-18	pendiente	81044.28	10.00	tarjeta_credito	6
1407	1351	43	2025-06-05	2025-06-07	procesando	283864.24	0.00	OXXO	7
1408	125	2	2023-07-25	2023-07-29	entregado	35139.72	0.00	OXXO	2
1409	267	172	2023-08-07	2023-08-18	enviado	112121.20	5.00	PayPal	4
1410	15	176	2023-08-31	2023-09-05	entregado	228828.09	0.00	tarjeta_credito	4
1411	1497	147	2023-10-04	2023-10-14	pendiente	191717.29	10.00	tarjeta_debito	8
1412	216	163	2024-08-08	2024-08-20	entregado	155493.91	0.00	tarjeta_debito	4
1413	1067	174	2023-09-21	2023-10-03	enviado	41717.61	5.00	efectivo	3
1414	1052	94	2023-07-29	2023-08-05	enviado	25075.95	0.00	efectivo	4
1415	1985	148	2023-10-28	2023-11-04	procesando	18638.49	0.00	PayPal	1
1416	1322	2	2023-10-22	2023-10-26	entregado	244031.67	0.00	PayPal	5
1417	1602	71	2024-09-09	2024-09-17	procesando	204012.49	5.00	efectivo	5
1418	568	29	2026-03-15	2026-03-23	entregado	77108.61	15.00	tarjeta_debito	7
1419	278	99	2024-07-08	2024-07-13	procesando	109833.19	0.00	transferencia	6
1420	1164	28	2024-04-02	2024-04-03	pendiente	185421.12	10.00	tarjeta_debito	6
1421	1188	167	2023-07-22	2023-07-26	pendiente	30130.41	5.00	OXXO	1
1422	947	156	2024-01-15	2024-01-21	enviado	14506.77	0.00	PayPal	4
1423	1889	173	2023-08-29	2023-09-04	entregado	93874.42	20.00	PayPal	2
1424	775	123	2023-06-30	2023-07-05	devuelto	94260.42	0.00	efectivo	1
1425	1002	178	2025-04-06	2025-04-07	devuelto	106685.14	5.00	tarjeta_credito	8
1426	954	100	2025-12-01	2025-12-16	pendiente	86726.37	5.00	tarjeta_debito	6
1427	1347	7	2026-06-06	2026-06-14	enviado	173022.57	0.00	PayPal	3
1428	305	49	2025-05-03	2025-05-15	procesando	68620.44	0.00	tarjeta_credito	4
1429	1852	49	2024-02-25	2024-03-06	enviado	43464.30	0.00	PayPal	6
1430	1397	197	2026-03-15	2026-03-27	entregado	32206.64	0.00	tarjeta_debito	7
1431	646	51	2025-07-22	2025-07-30	entregado	81274.22	5.00	OXXO	6
1432	1657	31	2024-11-05	2024-11-15	entregado	257976.52	0.00	OXXO	1
1433	386	36	2025-09-22	2025-09-26	entregado	94509.16	0.00	efectivo	7
1434	1623	157	2024-08-05	2024-08-20	entregado	92189.24	0.00	efectivo	6
1435	754	89	2023-11-30	2023-12-01	pendiente	148243.32	0.00	tarjeta_credito	7
1436	233	121	2025-01-12	2025-01-14	entregado	99163.10	20.00	efectivo	6
1437	1155	71	2023-10-23	2023-11-05	entregado	20537.68	10.00	tarjeta_credito	4
1438	1899	170	2025-12-03	2025-12-14	entregado	13191.49	5.00	tarjeta_credito	7
1439	666	8	2023-12-28	2024-01-09	entregado	122680.58	15.00	tarjeta_debito	3
1440	1857	139	2025-02-11	2025-02-22	procesando	225623.86	0.00	transferencia	5
1441	581	108	2024-06-19	2024-06-23	procesando	72952.30	15.00	efectivo	6
1442	664	88	2024-07-30	2024-07-31	entregado	279336.66	0.00	OXXO	6
1443	878	2	2023-08-23	2023-08-31	entregado	92259.84	5.00	OXXO	5
1444	1891	56	2025-02-21	2025-03-04	entregado	132651.45	0.00	tarjeta_debito	1
1445	539	174	2024-02-21	2024-02-22	entregado	124132.37	0.00	OXXO	4
1446	820	145	2024-04-30	2024-05-12	procesando	196083.59	10.00	tarjeta_debito	7
1447	1823	145	2026-05-07	2026-05-10	pendiente	61035.03	0.00	tarjeta_credito	8
1448	768	87	2026-04-25	2026-05-02	entregado	98878.18	10.00	tarjeta_credito	7
1449	1318	119	2026-04-24	2026-05-09	procesando	26535.07	20.00	OXXO	2
1450	354	10	2026-02-17	2026-02-21	enviado	188907.96	0.00	efectivo	1
1451	937	112	2023-10-11	2023-10-26	entregado	92403.52	0.00	tarjeta_debito	2
1452	1129	167	2025-05-11	2025-05-22	entregado	158834.22	5.00	tarjeta_debito	2
1453	1517	153	2025-07-24	2025-08-03	pendiente	82780.86	10.00	PayPal	3
1454	231	1	2024-07-21	2024-07-25	entregado	80322.36	0.00	tarjeta_debito	7
1455	87	15	2025-09-27	2025-10-12	entregado	33009.48	0.00	transferencia	8
1456	1534	72	2025-06-04	2025-06-12	procesando	1339.85	0.00	PayPal	6
1457	1006	189	2023-12-13	2023-12-26	entregado	52518.81	5.00	tarjeta_debito	1
1458	820	50	2025-08-07	2025-08-10	procesando	95622.44	5.00	OXXO	1
1459	1967	21	2025-07-04	2025-07-11	devuelto	56959.64	5.00	efectivo	5
1460	852	181	2024-02-04	2024-02-10	enviado	164321.09	0.00	OXXO	5
1461	1006	105	2026-05-16	2026-05-30	enviado	23543.35	10.00	tarjeta_credito	7
1462	1815	68	2023-12-23	2023-12-26	procesando	166582.20	0.00	efectivo	3
1463	741	119	2025-03-23	2025-03-31	enviado	77818.29	5.00	transferencia	8
1464	1122	138	2024-12-24	2024-12-25	entregado	134214.50	10.00	OXXO	5
1465	854	82	2023-10-05	2023-10-13	entregado	113787.01	15.00	transferencia	2
1466	292	158	2023-07-25	2023-08-03	enviado	109032.60	20.00	tarjeta_debito	5
1467	318	103	2023-07-08	2023-07-09	procesando	203890.23	0.00	tarjeta_debito	7
1468	1408	185	2026-01-17	2026-01-29	enviado	10399.46	0.00	tarjeta_credito	8
1469	55	1	2024-07-12	2024-07-16	cancelado	346119.25	0.00	PayPal	7
1470	69	86	2024-04-10	2024-04-22	procesando	121412.61	5.00	tarjeta_credito	4
1471	153	177	2024-03-11	2024-03-18	entregado	137295.32	0.00	PayPal	6
1472	1303	17	2025-08-20	2025-08-28	enviado	107805.69	0.00	tarjeta_credito	3
1473	1559	196	2024-12-21	2024-12-24	enviado	101768.08	0.00	efectivo	5
1474	171	103	2026-05-06	2026-05-08	enviado	278465.03	0.00	PayPal	5
1475	1140	6	2023-07-08	2023-07-16	entregado	19523.39	10.00	transferencia	1
1476	1418	132	2024-03-14	2024-03-22	cancelado	229497.73	0.00	tarjeta_debito	1
1477	983	120	2025-11-12	2025-11-24	pendiente	93952.77	0.00	efectivo	1
1478	584	58	2025-03-08	2025-03-15	devuelto	104653.48	5.00	OXXO	8
1479	1223	98	2023-11-27	2023-12-09	entregado	115405.85	15.00	transferencia	2
1480	1372	14	2024-08-10	2024-08-12	entregado	3531.30	15.00	PayPal	1
1481	105	174	2023-10-25	2023-10-26	cancelado	54350.45	0.00	OXXO	6
1482	58	186	2025-06-15	2025-06-16	entregado	243730.65	0.00	OXXO	5
1483	1158	122	2025-07-12	2025-07-23	procesando	52765.96	5.00	OXXO	3
1484	68	21	2026-05-18	2026-05-29	entregado	98712.60	15.00	transferencia	6
1485	1853	160	2023-10-16	2023-10-21	enviado	319751.04	5.00	OXXO	6
1486	1311	59	2024-01-29	2024-02-04	enviado	31896.97	10.00	transferencia	5
1487	522	195	2025-07-04	2025-07-10	entregado	51504.56	5.00	OXXO	5
1488	1371	167	2025-07-07	2025-07-08	entregado	17434.24	0.00	tarjeta_credito	6
1489	1595	185	2025-04-05	2025-04-13	entregado	196262.52	15.00	OXXO	6
1490	191	49	2025-02-08	2025-02-16	pendiente	121401.20	20.00	tarjeta_debito	8
1491	1617	109	2024-03-24	2024-04-05	enviado	59206.27	10.00	PayPal	8
1492	777	137	2025-10-19	2025-10-31	procesando	73179.75	0.00	tarjeta_credito	6
1493	704	128	2025-12-12	2025-12-25	procesando	131039.47	0.00	OXXO	1
1494	1639	93	2023-07-11	2023-07-16	enviado	41624.49	0.00	PayPal	2
1495	564	70	2026-04-01	2026-04-10	entregado	83447.06	20.00	efectivo	7
1496	351	73	2026-03-11	2026-03-22	entregado	113374.06	0.00	efectivo	1
1497	1157	159	2023-12-30	2024-01-03	entregado	231554.93	0.00	tarjeta_debito	6
1498	298	113	2025-10-31	2025-11-02	pendiente	27818.03	0.00	tarjeta_credito	6
1499	1640	178	2026-01-17	2026-01-26	entregado	225047.07	5.00	PayPal	6
1500	1222	57	2025-07-07	2025-07-09	entregado	149034.19	10.00	transferencia	2
1501	1025	171	2025-04-08	2025-04-09	cancelado	88585.03	0.00	OXXO	4
1502	1333	71	2023-06-18	2023-06-19	cancelado	165390.94	0.00	tarjeta_debito	3
1503	1345	108	2024-12-16	2024-12-19	entregado	70210.05	20.00	transferencia	3
1504	18	86	2024-08-01	2024-08-06	enviado	56687.03	0.00	PayPal	8
1505	1888	141	2025-11-15	2025-11-27	enviado	101116.12	20.00	efectivo	8
1506	1991	175	2025-01-04	2025-01-14	procesando	156343.37	0.00	efectivo	7
1507	11	76	2025-06-19	2025-06-29	entregado	37863.20	0.00	tarjeta_credito	8
1508	1477	141	2025-01-11	2025-01-22	entregado	118134.99	10.00	tarjeta_debito	2
1509	538	111	2026-01-02	2026-01-10	entregado	126293.33	0.00	tarjeta_credito	5
1510	705	37	2025-06-06	2025-06-13	entregado	90400.63	15.00	transferencia	8
1511	1208	139	2023-07-03	2023-07-11	pendiente	178825.56	0.00	efectivo	6
1512	1051	67	2023-11-29	2023-12-12	entregado	137783.13	0.00	efectivo	1
1513	237	157	2025-09-06	2025-09-18	pendiente	102575.04	20.00	tarjeta_debito	7
1514	1824	1	2024-08-08	2024-08-18	entregado	100984.11	5.00	efectivo	2
1515	1431	149	2025-04-10	2025-04-15	entregado	116014.86	0.00	PayPal	1
1516	228	40	2024-11-18	2024-12-02	devuelto	11977.32	0.00	efectivo	8
1517	1238	63	2024-01-29	2024-02-10	procesando	232914.10	0.00	tarjeta_credito	2
1518	738	105	2024-03-10	2024-03-13	procesando	40628.65	10.00	tarjeta_debito	1
1519	1979	120	2026-04-15	2026-04-26	entregado	185860.30	5.00	PayPal	1
1520	1775	81	2025-02-21	2025-02-23	entregado	227687.93	0.00	tarjeta_debito	8
1521	1302	77	2025-02-02	2025-02-06	entregado	133100.59	10.00	OXXO	3
1522	1656	167	2023-09-08	2023-09-10	enviado	137446.78	5.00	tarjeta_debito	5
1523	611	117	2024-06-20	2024-06-27	entregado	62327.37	0.00	tarjeta_credito	3
1524	1282	20	2025-04-08	2025-04-17	procesando	183672.55	0.00	tarjeta_debito	8
1525	1106	195	2026-03-06	2026-03-21	entregado	32522.20	0.00	OXXO	5
1526	711	160	2023-08-01	2023-08-07	enviado	177549.85	0.00	efectivo	7
1527	668	182	2024-10-12	2024-10-14	enviado	25732.48	0.00	OXXO	3
1528	694	36	2026-01-07	2026-01-10	pendiente	54230.49	5.00	PayPal	7
1529	887	150	2026-03-19	2026-04-03	pendiente	84134.45	10.00	PayPal	5
1530	799	151	2023-06-30	2023-07-13	entregado	136766.42	5.00	tarjeta_debito	5
1531	920	10	2024-08-08	2024-08-11	entregado	100665.16	0.00	tarjeta_debito	3
1532	1669	158	2023-11-12	2023-11-14	procesando	45308.78	10.00	tarjeta_debito	4
1533	1528	41	2026-05-08	2026-05-12	cancelado	76654.24	15.00	PayPal	7
1534	601	33	2023-12-18	2024-01-02	cancelado	193222.59	0.00	transferencia	3
1535	876	139	2024-07-19	2024-07-22	entregado	100081.33	5.00	OXXO	7
1536	60	185	2025-01-29	2025-02-01	entregado	219075.25	20.00	transferencia	8
1537	1150	58	2024-12-08	2024-12-16	devuelto	35676.24	20.00	tarjeta_credito	7
1538	373	171	2025-03-02	2025-03-16	entregado	82032.55	5.00	efectivo	6
1539	984	63	2024-07-11	2024-07-26	entregado	176112.88	0.00	OXXO	3
1540	1759	116	2023-08-23	2023-09-03	procesando	12991.53	0.00	efectivo	6
1541	437	87	2023-06-21	2023-06-27	procesando	50735.70	0.00	tarjeta_credito	3
1542	1590	119	2025-03-17	2025-03-29	enviado	16234.16	10.00	tarjeta_debito	6
1543	1671	115	2026-04-26	2026-05-01	procesando	69966.82	10.00	tarjeta_credito	3
1544	679	88	2024-07-20	2024-07-25	pendiente	25028.52	5.00	OXXO	4
1545	1186	116	2023-11-16	2023-11-27	entregado	121845.73	0.00	transferencia	8
1546	1989	143	2026-01-21	2026-01-27	procesando	219619.11	0.00	efectivo	7
1547	1781	166	2023-11-12	2023-11-16	enviado	133001.03	10.00	efectivo	7
1548	1247	3	2024-10-11	2024-10-16	enviado	111139.90	15.00	efectivo	7
1549	1023	192	2025-03-01	2025-03-05	entregado	19275.09	0.00	tarjeta_credito	3
1550	581	140	2024-08-04	2024-08-10	enviado	240212.80	15.00	transferencia	1
1551	22	169	2024-01-27	2024-02-11	entregado	15757.56	5.00	efectivo	6
1552	1194	152	2024-11-17	2024-11-20	entregado	227665.85	0.00	transferencia	1
1553	1303	143	2024-08-19	2024-08-23	entregado	134728.93	0.00	OXXO	1
1554	462	63	2023-07-30	2023-07-31	procesando	160030.12	0.00	PayPal	8
1555	187	195	2024-05-03	2024-05-06	enviado	188935.03	0.00	transferencia	1
1556	657	141	2026-01-07	2026-01-08	enviado	75799.48	0.00	tarjeta_credito	6
1557	1677	56	2025-04-14	2025-04-22	entregado	152638.76	10.00	efectivo	7
1558	939	6	2025-09-20	2025-10-01	procesando	123118.61	0.00	PayPal	8
1559	146	82	2024-04-22	2024-04-28	enviado	216004.49	5.00	efectivo	8
1560	1428	149	2024-10-14	2024-10-20	devuelto	148493.60	0.00	efectivo	6
1561	2000	95	2026-04-20	2026-05-05	entregado	91386.43	15.00	tarjeta_debito	7
1562	275	145	2025-12-24	2026-01-01	entregado	176060.54	5.00	efectivo	2
1563	1146	58	2024-07-05	2024-07-08	procesando	185677.55	0.00	OXXO	6
1564	294	16	2023-11-26	2023-12-11	procesando	78779.39	5.00	PayPal	3
1565	1587	195	2026-01-10	2026-01-17	procesando	87832.50	0.00	tarjeta_credito	3
1566	190	77	2024-05-06	2024-05-14	entregado	330066.33	0.00	tarjeta_debito	1
1567	1647	53	2026-03-21	2026-04-03	cancelado	93205.69	0.00	OXXO	7
1568	1567	160	2024-12-22	2024-12-30	entregado	205690.43	5.00	PayPal	3
1569	615	15	2025-05-21	2025-06-04	procesando	104628.98	5.00	tarjeta_debito	3
1570	1482	24	2025-07-01	2025-07-13	devuelto	23692.13	15.00	efectivo	1
1571	1509	180	2025-06-22	2025-07-02	entregado	53882.42	10.00	tarjeta_debito	5
1572	1319	6	2025-01-14	2025-01-16	entregado	100686.04	10.00	PayPal	1
1573	741	184	2025-07-09	2025-07-15	entregado	52272.68	0.00	PayPal	1
1574	1449	7	2024-11-10	2024-11-25	cancelado	77519.90	5.00	efectivo	2
1575	280	168	2025-02-12	2025-02-27	entregado	110955.53	0.00	tarjeta_credito	2
1576	1134	153	2025-12-15	2025-12-28	entregado	50533.83	10.00	OXXO	4
1577	537	129	2024-05-21	2024-05-29	entregado	35806.32	0.00	OXXO	7
1578	1418	46	2023-11-09	2023-11-16	enviado	56882.36	0.00	transferencia	4
1579	595	33	2025-10-17	2025-10-30	entregado	224970.96	0.00	tarjeta_debito	2
1580	1809	179	2025-04-20	2025-04-29	entregado	173884.76	0.00	tarjeta_credito	5
1581	1213	79	2026-04-02	2026-04-05	enviado	27894.78	20.00	tarjeta_credito	2
1582	1185	98	2024-02-18	2024-02-23	cancelado	29206.26	0.00	tarjeta_credito	2
1583	1385	148	2026-03-30	2026-04-08	entregado	43036.75	5.00	tarjeta_debito	6
1584	804	144	2025-04-14	2025-04-16	entregado	154973.10	0.00	transferencia	7
1585	1002	14	2024-10-04	2024-10-19	procesando	157691.64	5.00	tarjeta_credito	8
1586	175	3	2025-03-23	2025-04-04	enviado	81014.52	5.00	PayPal	2
1587	1819	130	2023-10-04	2023-10-09	entregado	135943.06	10.00	tarjeta_credito	2
1588	490	185	2025-04-16	2025-04-29	entregado	28029.06	10.00	tarjeta_debito	5
1589	1952	68	2024-05-19	2024-05-26	entregado	310661.71	0.00	efectivo	8
1590	1577	101	2024-07-05	2024-07-06	cancelado	130258.56	0.00	efectivo	3
1591	734	182	2023-11-14	2023-11-17	entregado	237127.20	10.00	OXXO	4
1592	241	101	2026-04-19	2026-05-03	entregado	27530.96	0.00	OXXO	2
1593	191	167	2026-02-19	2026-02-25	procesando	161180.44	5.00	transferencia	1
1594	1955	49	2024-04-26	2024-05-10	procesando	137401.46	0.00	transferencia	8
1595	47	4	2024-07-04	2024-07-14	enviado	75326.02	0.00	PayPal	7
1596	814	176	2025-01-25	2025-02-08	procesando	242497.42	20.00	tarjeta_debito	4
1597	1414	119	2026-02-10	2026-02-11	entregado	97628.06	10.00	efectivo	1
1598	1601	7	2023-09-01	2023-09-15	pendiente	143450.51	0.00	tarjeta_credito	7
1599	406	64	2025-06-03	2025-06-07	entregado	35205.25	10.00	transferencia	6
1600	1822	137	2023-09-10	2023-09-15	entregado	125338.33	5.00	OXXO	4
1601	1277	167	2025-06-26	2025-06-30	entregado	82266.25	5.00	tarjeta_credito	8
1602	382	37	2023-07-03	2023-07-17	pendiente	194609.83	15.00	OXXO	3
1603	1405	96	2024-07-20	2024-08-01	entregado	84490.77	0.00	tarjeta_credito	4
1604	1271	197	2025-10-20	2025-11-04	enviado	70569.75	0.00	tarjeta_credito	4
1605	1883	80	2023-07-14	2023-07-28	entregado	332238.61	10.00	transferencia	8
1606	1112	144	2025-04-15	2025-04-24	procesando	67364.80	0.00	PayPal	4
1607	298	62	2023-06-18	2023-06-19	entregado	127282.23	5.00	transferencia	5
1608	900	94	2023-07-15	2023-07-20	entregado	127916.96	15.00	efectivo	7
1609	1512	123	2024-12-14	2024-12-16	entregado	86888.29	0.00	tarjeta_credito	3
1610	80	103	2025-03-02	2025-03-04	entregado	121826.50	0.00	tarjeta_debito	8
1611	985	103	2026-03-27	2026-03-29	entregado	135983.61	5.00	tarjeta_credito	2
1612	228	192	2024-12-07	2024-12-12	procesando	155725.96	0.00	tarjeta_debito	2
1613	1448	80	2025-03-30	2025-04-11	entregado	87983.68	0.00	transferencia	7
1614	243	27	2024-09-21	2024-09-28	pendiente	86356.18	15.00	transferencia	2
1615	183	133	2025-07-06	2025-07-13	procesando	873.16	0.00	efectivo	6
1616	696	182	2024-12-06	2024-12-13	devuelto	117067.67	15.00	tarjeta_debito	7
1617	1026	64	2024-04-25	2024-05-04	procesando	75895.14	15.00	tarjeta_debito	8
1618	926	23	2024-12-12	2024-12-25	entregado	133456.96	0.00	OXXO	5
1619	1295	176	2024-09-05	2024-09-10	devuelto	45913.66	10.00	efectivo	7
1620	1614	109	2026-04-14	2026-04-15	entregado	336558.44	0.00	tarjeta_credito	2
1621	1231	106	2025-09-03	2025-09-06	entregado	134329.18	0.00	tarjeta_debito	7
1622	1639	151	2023-10-20	2023-11-04	entregado	103541.97	0.00	tarjeta_credito	8
1623	1524	54	2024-04-03	2024-04-16	enviado	15584.05	5.00	OXXO	1
1624	1930	149	2024-08-15	2024-08-29	procesando	108225.71	0.00	PayPal	4
1625	530	8	2025-12-19	2025-12-26	procesando	47038.77	15.00	tarjeta_credito	2
1626	143	49	2024-02-19	2024-03-03	procesando	191699.16	0.00	tarjeta_credito	4
1627	564	136	2025-01-12	2025-01-21	entregado	65133.90	15.00	transferencia	8
1628	70	4	2024-02-02	2024-02-05	cancelado	4119.83	15.00	efectivo	6
1629	1795	182	2025-09-30	2025-10-05	cancelado	117263.11	5.00	efectivo	5
1630	584	157	2024-04-10	2024-04-17	enviado	23034.91	0.00	tarjeta_credito	8
1631	1726	179	2024-06-17	2024-07-01	entregado	194247.84	0.00	tarjeta_debito	1
1632	1981	4	2025-10-25	2025-11-01	devuelto	67611.54	10.00	OXXO	2
1633	1328	115	2025-04-18	2025-04-23	entregado	33376.35	5.00	efectivo	6
1634	1199	48	2025-02-17	2025-02-23	procesando	72245.93	10.00	OXXO	4
1635	1129	59	2025-07-14	2025-07-21	entregado	49619.21	10.00	PayPal	8
1636	1472	24	2026-03-09	2026-03-10	entregado	217086.70	0.00	PayPal	2
1637	257	175	2024-11-07	2024-11-18	procesando	59503.42	0.00	tarjeta_credito	4
1638	84	70	2024-10-02	2024-10-11	entregado	188412.65	5.00	efectivo	3
1639	1282	181	2025-01-25	2025-01-31	procesando	58266.32	10.00	PayPal	4
1640	1311	55	2023-09-26	2023-09-29	procesando	193157.85	10.00	OXXO	6
1641	1761	104	2023-09-08	2023-09-18	devuelto	370.57	0.00	tarjeta_debito	1
1642	1881	36	2024-02-13	2024-02-28	entregado	43165.77	0.00	transferencia	8
1643	197	22	2024-07-12	2024-07-21	enviado	40238.12	15.00	OXXO	2
1644	1712	135	2023-10-26	2023-10-27	procesando	15265.84	5.00	PayPal	5
1645	150	185	2026-06-07	2026-06-15	procesando	185663.91	0.00	transferencia	2
1646	156	77	2024-03-12	2024-03-17	entregado	87924.53	10.00	tarjeta_credito	2
1647	1194	130	2025-02-03	2025-02-04	procesando	27563.27	0.00	efectivo	3
1648	1499	197	2024-10-01	2024-10-15	pendiente	88708.95	0.00	OXXO	6
1649	1987	182	2025-05-29	2025-06-02	entregado	62219.38	10.00	transferencia	5
1650	1146	173	2023-09-01	2023-09-09	entregado	36773.14	0.00	PayPal	2
1651	1296	38	2024-07-14	2024-07-18	entregado	68839.49	15.00	tarjeta_debito	2
1652	1538	167	2026-04-09	2026-04-18	devuelto	220313.72	10.00	transferencia	8
1653	1171	150	2026-02-08	2026-02-18	entregado	300098.39	0.00	OXXO	1
1654	304	139	2024-01-12	2024-01-18	pendiente	63385.17	10.00	PayPal	4
1655	1698	147	2024-06-02	2024-06-10	entregado	120702.12	0.00	OXXO	3
1656	1997	28	2026-06-09	2026-06-23	entregado	2735.79	5.00	OXXO	8
1657	20	194	2026-04-29	2026-05-07	entregado	141383.97	0.00	PayPal	1
1658	1081	162	2023-07-29	2023-08-11	procesando	179392.22	15.00	OXXO	7
1659	1539	149	2025-03-08	2025-03-11	entregado	13964.97	10.00	OXXO	1
1660	1169	132	2025-02-16	2025-02-21	enviado	81926.77	5.00	OXXO	7
1661	1008	185	2024-09-26	2024-10-05	entregado	361742.55	0.00	OXXO	3
1662	1261	105	2024-06-30	2024-07-01	cancelado	14985.43	10.00	OXXO	5
1663	1664	88	2024-03-25	2024-03-31	entregado	97990.86	0.00	transferencia	6
1664	1387	71	2025-12-10	2025-12-23	enviado	74756.40	0.00	tarjeta_credito	8
1665	1201	70	2023-08-26	2023-09-03	enviado	62429.53	0.00	tarjeta_credito	4
1666	630	86	2025-09-13	2025-09-26	entregado	27867.51	0.00	tarjeta_debito	7
1667	1253	58	2026-02-12	2026-02-16	entregado	96840.22	10.00	OXXO	5
1668	708	44	2024-05-12	2024-05-20	entregado	241751.35	0.00	OXXO	1
1669	946	193	2024-12-30	2025-01-12	procesando	42992.68	10.00	tarjeta_debito	6
1670	178	111	2023-07-23	2023-07-29	entregado	96417.43	0.00	transferencia	7
1671	1526	123	2024-05-19	2024-05-21	entregado	111704.75	10.00	tarjeta_debito	8
1672	1557	163	2026-04-22	2026-04-23	procesando	7656.76	0.00	tarjeta_debito	7
1673	1482	197	2024-02-27	2024-03-08	pendiente	56801.22	0.00	transferencia	7
1674	473	56	2024-12-30	2025-01-02	entregado	42792.37	15.00	OXXO	7
1675	327	198	2023-07-13	2023-07-17	entregado	53210.56	15.00	tarjeta_debito	8
1676	1381	46	2025-05-26	2025-06-01	procesando	112171.06	0.00	tarjeta_credito	4
1677	1659	59	2023-10-20	2023-11-03	procesando	156717.45	5.00	tarjeta_credito	1
1678	1113	178	2024-09-10	2024-09-13	procesando	18623.67	0.00	tarjeta_credito	4
1679	1522	115	2026-05-20	2026-05-25	entregado	179943.00	0.00	tarjeta_debito	2
1680	1295	161	2023-07-24	2023-07-28	enviado	158339.96	0.00	OXXO	2
1681	262	93	2023-09-18	2023-10-03	enviado	11510.65	15.00	efectivo	8
1682	449	113	2025-11-17	2025-11-27	enviado	279412.96	10.00	OXXO	6
1683	1542	176	2025-10-22	2025-10-30	pendiente	16562.53	5.00	transferencia	1
1684	1831	168	2024-04-12	2024-04-17	entregado	78035.58	10.00	efectivo	5
1685	1491	177	2025-08-20	2025-08-22	entregado	63479.80	5.00	PayPal	4
1686	950	159	2025-07-24	2025-07-31	entregado	119016.05	0.00	OXXO	3
1687	1289	116	2025-05-02	2025-05-13	devuelto	177903.49	20.00	transferencia	6
1688	1264	53	2024-12-20	2025-01-01	devuelto	142868.97	5.00	PayPal	4
1689	1302	147	2026-03-26	2026-03-30	enviado	30896.09	5.00	PayPal	8
1690	1872	174	2023-07-17	2023-07-31	entregado	43470.86	0.00	OXXO	6
1691	47	61	2025-07-09	2025-07-11	enviado	131830.69	0.00	PayPal	7
1692	1975	89	2024-05-29	2024-06-11	entregado	131236.05	5.00	tarjeta_credito	3
1693	680	3	2024-03-22	2024-03-29	entregado	141852.16	15.00	OXXO	7
1694	1307	172	2026-03-28	2026-04-04	enviado	239259.55	0.00	efectivo	8
1695	856	121	2025-12-02	2025-12-16	entregado	64458.74	5.00	OXXO	7
1696	506	37	2024-06-08	2024-06-20	enviado	86519.21	15.00	tarjeta_credito	4
1697	1081	86	2025-05-28	2025-06-02	entregado	101424.13	0.00	tarjeta_debito	3
1698	212	84	2024-06-20	2024-06-30	procesando	148252.56	0.00	OXXO	8
1699	605	53	2024-02-13	2024-02-17	enviado	4070.91	0.00	efectivo	5
1700	15	52	2024-06-29	2024-07-05	procesando	5759.56	0.00	efectivo	7
1701	1595	170	2024-05-19	2024-05-23	entregado	386106.51	0.00	transferencia	4
1702	65	14	2025-08-09	2025-08-21	cancelado	21051.82	0.00	tarjeta_debito	8
1703	1926	53	2024-04-24	2024-05-05	entregado	123562.10	5.00	tarjeta_debito	6
1704	1507	100	2023-11-10	2023-11-14	procesando	15684.83	10.00	tarjeta_debito	4
1705	584	130	2023-11-29	2023-12-04	enviado	59872.64	5.00	tarjeta_credito	7
1706	1368	101	2026-06-01	2026-06-14	entregado	14780.53	0.00	PayPal	1
1707	620	141	2023-07-14	2023-07-21	entregado	77135.88	20.00	tarjeta_credito	8
1708	426	191	2025-07-31	2025-08-07	entregado	242905.91	15.00	transferencia	4
1709	1361	121	2023-07-25	2023-07-31	enviado	122706.43	5.00	efectivo	2
1710	992	111	2026-02-12	2026-02-25	cancelado	128293.67	5.00	PayPal	4
1711	1016	25	2024-02-13	2024-02-18	pendiente	88046.17	10.00	OXXO	6
1712	1308	144	2025-11-03	2025-11-04	entregado	109708.60	10.00	tarjeta_debito	5
1713	858	112	2024-10-05	2024-10-10	pendiente	37201.56	10.00	OXXO	4
1714	1106	113	2026-02-15	2026-02-27	procesando	16978.29	15.00	OXXO	6
1715	268	129	2026-04-11	2026-04-22	entregado	61026.27	0.00	tarjeta_credito	4
1716	907	139	2024-09-29	2024-10-11	entregado	32356.29	0.00	PayPal	4
1717	912	71	2025-01-25	2025-02-08	entregado	101310.89	0.00	transferencia	6
1718	1268	55	2023-08-16	2023-08-17	entregado	263747.66	10.00	tarjeta_credito	3
1719	491	12	2023-07-30	2023-08-13	enviado	114172.43	5.00	OXXO	7
1720	575	101	2025-07-08	2025-07-13	pendiente	33849.14	0.00	tarjeta_debito	6
1721	515	136	2024-03-03	2024-03-13	entregado	94419.88	20.00	tarjeta_debito	2
1722	1405	92	2024-04-06	2024-04-07	cancelado	17662.57	5.00	tarjeta_credito	1
1723	1068	140	2026-03-11	2026-03-15	entregado	105013.72	0.00	PayPal	5
1724	782	110	2026-06-10	2026-06-25	entregado	191922.44	10.00	tarjeta_debito	8
1725	825	67	2023-12-21	2023-12-26	entregado	175242.45	10.00	PayPal	2
1726	1346	190	2025-12-26	2026-01-02	entregado	194671.41	0.00	efectivo	1
1727	1546	61	2024-03-04	2024-03-16	entregado	63839.36	0.00	transferencia	2
1728	1308	145	2026-03-13	2026-03-14	procesando	133065.65	0.00	efectivo	4
1729	441	56	2024-05-09	2024-05-12	cancelado	81393.00	0.00	OXXO	7
1730	3	26	2025-03-11	2025-03-20	entregado	171022.54	10.00	tarjeta_credito	3
1731	1201	87	2023-09-29	2023-10-03	procesando	70967.16	0.00	tarjeta_credito	2
1732	378	76	2024-06-17	2024-07-01	entregado	95771.15	20.00	tarjeta_credito	6
1733	1145	15	2024-04-14	2024-04-26	pendiente	78889.52	10.00	PayPal	5
1734	1245	146	2025-10-17	2025-10-21	pendiente	201337.95	5.00	OXXO	6
1735	75	92	2024-07-23	2024-07-25	enviado	24253.39	5.00	OXXO	4
1736	1707	148	2024-02-19	2024-02-28	entregado	216915.04	5.00	OXXO	8
1737	158	124	2026-05-27	2026-06-05	entregado	407370.31	0.00	tarjeta_debito	4
1738	1449	42	2024-05-24	2024-05-25	entregado	92223.49	15.00	tarjeta_credito	7
1739	172	40	2025-03-18	2025-03-22	cancelado	79209.81	0.00	tarjeta_debito	5
1740	1181	91	2025-07-12	2025-07-15	entregado	69044.73	15.00	efectivo	1
1741	1364	14	2025-04-01	2025-04-09	cancelado	45642.65	0.00	transferencia	8
1742	744	134	2024-06-27	2024-07-04	entregado	85644.86	0.00	PayPal	1
1743	796	103	2025-11-06	2025-11-08	procesando	90626.53	15.00	tarjeta_debito	7
1744	1616	190	2025-09-16	2025-09-28	entregado	22949.80	0.00	tarjeta_credito	7
1745	1213	95	2026-01-12	2026-01-19	entregado	67418.80	5.00	tarjeta_debito	2
1746	242	142	2024-01-10	2024-01-11	cancelado	124843.29	0.00	tarjeta_credito	2
1747	1367	187	2025-09-15	2025-09-29	procesando	98023.94	5.00	tarjeta_debito	4
1748	401	16	2025-06-04	2025-06-10	entregado	117600.70	15.00	PayPal	8
1749	1190	185	2025-09-07	2025-09-08	entregado	74635.90	0.00	tarjeta_credito	5
1750	1672	170	2024-07-13	2024-07-23	entregado	137130.57	5.00	PayPal	2
1751	1733	6	2024-04-10	2024-04-21	entregado	152835.37	10.00	PayPal	1
1752	1981	74	2024-06-06	2024-06-07	entregado	55021.65	0.00	tarjeta_debito	1
1753	1726	56	2024-01-29	2024-01-30	enviado	123627.85	0.00	efectivo	2
1754	1929	177	2026-05-15	2026-05-20	entregado	122205.46	10.00	transferencia	1
1755	1795	139	2026-01-08	2026-01-20	enviado	42388.99	15.00	efectivo	1
1756	1648	199	2025-02-13	2025-02-18	entregado	214426.41	0.00	efectivo	6
1757	62	104	2026-05-19	2026-05-29	procesando	41022.71	10.00	efectivo	1
1758	848	34	2023-11-19	2023-11-24	entregado	70352.40	0.00	PayPal	4
1759	1402	159	2024-06-28	2024-07-08	procesando	70700.51	0.00	tarjeta_debito	5
1760	161	79	2025-08-22	2025-09-02	enviado	118824.86	0.00	PayPal	6
1761	931	167	2023-12-17	2024-01-01	entregado	176212.20	0.00	tarjeta_debito	5
1762	931	104	2024-04-03	2024-04-13	entregado	148363.38	5.00	efectivo	4
1763	92	25	2024-04-02	2024-04-16	devuelto	28841.15	0.00	PayPal	7
1764	253	121	2024-10-18	2024-10-29	procesando	189285.07	15.00	efectivo	1
1765	276	176	2024-04-09	2024-04-12	enviado	59531.11	0.00	transferencia	2
1766	248	195	2024-04-03	2024-04-10	entregado	342001.72	10.00	transferencia	7
1767	17	197	2025-05-19	2025-05-24	enviado	55774.68	0.00	transferencia	7
1768	990	167	2026-03-09	2026-03-11	entregado	143776.39	0.00	transferencia	8
1769	1683	176	2024-10-15	2024-10-16	entregado	55827.59	15.00	transferencia	3
1770	423	23	2025-08-13	2025-08-19	entregado	52993.65	0.00	tarjeta_debito	6
1771	311	88	2024-04-03	2024-04-17	entregado	160717.35	5.00	OXXO	5
1772	1230	100	2026-02-03	2026-02-11	entregado	90998.45	0.00	tarjeta_credito	6
1773	1583	39	2026-05-26	2026-06-06	entregado	64089.60	10.00	tarjeta_debito	6
1774	408	197	2025-12-14	2025-12-18	procesando	45390.51	5.00	efectivo	7
1775	35	85	2025-02-26	2025-03-03	procesando	278410.15	0.00	tarjeta_debito	2
1776	14	155	2025-12-19	2026-01-03	entregado	114739.02	15.00	efectivo	5
1777	1821	191	2025-03-05	2025-03-17	entregado	76128.43	10.00	OXXO	2
1778	576	8	2023-09-21	2023-09-30	entregado	175627.74	5.00	tarjeta_debito	8
1779	1794	124	2025-08-06	2025-08-18	cancelado	72855.75	0.00	tarjeta_debito	2
1780	1901	30	2024-01-19	2024-02-03	enviado	80700.18	0.00	tarjeta_debito	8
1781	1276	145	2023-07-19	2023-07-21	enviado	25638.59	5.00	tarjeta_credito	7
1782	309	80	2025-07-13	2025-07-20	entregado	198218.94	0.00	PayPal	7
1783	1661	56	2024-07-31	2024-08-06	enviado	107194.63	0.00	efectivo	6
1784	1776	33	2024-02-08	2024-02-12	procesando	189291.23	0.00	PayPal	3
1785	401	192	2023-09-04	2023-09-18	enviado	28661.97	0.00	efectivo	3
1786	263	164	2024-08-21	2024-08-25	entregado	65387.45	0.00	transferencia	3
1787	1134	7	2024-08-02	2024-08-03	devuelto	121693.73	0.00	efectivo	4
1788	1135	189	2023-06-28	2023-07-01	enviado	87311.37	0.00	tarjeta_credito	5
1789	904	102	2023-10-17	2023-10-24	entregado	100174.52	0.00	tarjeta_credito	3
1790	1107	140	2023-09-01	2023-09-06	entregado	50057.04	5.00	PayPal	8
1791	162	186	2025-09-20	2025-09-21	enviado	89259.40	0.00	tarjeta_credito	4
1792	1468	100	2024-06-04	2024-06-14	entregado	90227.34	0.00	OXXO	3
1793	812	33	2025-11-28	2025-12-09	procesando	7548.89	0.00	efectivo	2
1794	527	68	2025-03-18	2025-03-19	enviado	116042.11	0.00	transferencia	2
1795	569	74	2024-06-13	2024-06-16	enviado	16414.08	15.00	transferencia	5
1796	722	182	2023-11-10	2023-11-15	entregado	160127.79	0.00	tarjeta_credito	8
1797	199	32	2024-05-30	2024-06-03	entregado	110276.44	0.00	efectivo	8
1798	338	160	2024-01-08	2024-01-22	enviado	86656.98	0.00	tarjeta_credito	1
1799	1529	53	2024-09-30	2024-10-04	entregado	101812.41	5.00	transferencia	6
1800	1514	183	2024-06-13	2024-06-27	enviado	228956.15	0.00	tarjeta_credito	2
1801	1716	122	2023-07-29	2023-08-05	entregado	176950.32	10.00	tarjeta_debito	2
1802	751	147	2025-08-01	2025-08-09	enviado	208720.90	0.00	transferencia	4
1803	1055	33	2023-09-10	2023-09-25	entregado	142668.45	15.00	tarjeta_debito	4
1804	241	42	2025-07-04	2025-07-07	entregado	298019.06	5.00	efectivo	1
1805	1904	113	2026-05-14	2026-05-19	entregado	46905.24	5.00	efectivo	4
1806	1634	102	2023-11-06	2023-11-11	entregado	20083.37	10.00	transferencia	5
1807	14	118	2026-05-06	2026-05-10	entregado	34739.51	0.00	efectivo	7
1808	26	1	2023-12-04	2023-12-11	devuelto	163577.63	0.00	PayPal	3
1809	247	47	2025-09-24	2025-09-26	enviado	150303.61	15.00	PayPal	7
1810	1772	138	2025-07-09	2025-07-17	enviado	199775.71	0.00	transferencia	3
1811	874	67	2025-03-27	2025-04-06	entregado	26279.35	15.00	efectivo	6
1812	1319	151	2024-01-11	2024-01-21	entregado	150113.66	10.00	transferencia	7
1813	1352	102	2026-04-06	2026-04-21	entregado	1139.94	0.00	tarjeta_debito	2
1814	373	52	2025-01-11	2025-01-22	pendiente	268005.72	0.00	efectivo	5
1815	1185	144	2025-12-06	2025-12-08	devuelto	77662.29	5.00	transferencia	6
1816	201	40	2024-12-23	2024-12-26	entregado	18531.96	15.00	OXXO	4
1817	958	143	2025-12-13	2025-12-21	procesando	33510.10	0.00	PayPal	4
1818	1617	97	2025-01-11	2025-01-22	pendiente	329945.37	0.00	OXXO	7
1819	1489	87	2024-06-25	2024-07-10	entregado	39727.24	20.00	PayPal	6
1820	1173	67	2025-07-05	2025-07-07	enviado	58994.48	0.00	tarjeta_debito	2
1821	428	196	2024-02-23	2024-02-27	pendiente	8103.13	0.00	PayPal	8
1822	364	126	2024-03-15	2024-03-23	entregado	52903.50	0.00	transferencia	6
1823	1164	54	2024-06-02	2024-06-15	enviado	170985.78	0.00	efectivo	2
1824	995	66	2026-01-13	2026-01-23	entregado	36337.35	10.00	PayPal	1
1825	1966	141	2024-10-10	2024-10-13	entregado	175880.17	0.00	tarjeta_debito	4
1826	411	156	2026-05-16	2026-05-27	cancelado	61834.38	10.00	tarjeta_credito	6
1827	1774	8	2026-04-05	2026-04-07	entregado	87209.24	0.00	tarjeta_credito	6
1828	631	135	2026-06-11	2026-06-16	entregado	121889.98	10.00	transferencia	5
1829	1023	159	2025-07-26	2025-08-08	entregado	126082.08	20.00	PayPal	1
1830	179	1	2023-07-03	2023-07-10	entregado	16550.21	15.00	efectivo	8
1831	1442	156	2026-05-05	2026-05-10	cancelado	6665.74	20.00	OXXO	2
1832	702	124	2025-03-09	2025-03-18	procesando	192177.16	0.00	transferencia	7
1833	946	171	2025-02-23	2025-03-02	entregado	173568.10	20.00	PayPal	7
1834	243	12	2025-06-05	2025-06-18	entregado	164976.84	0.00	efectivo	4
1835	1382	45	2026-02-14	2026-02-20	enviado	194040.23	0.00	PayPal	8
1836	325	69	2024-05-29	2024-06-08	devuelto	302384.95	0.00	OXXO	6
1837	742	175	2023-12-15	2023-12-25	entregado	81044.28	10.00	transferencia	8
1838	15	31	2025-10-18	2025-10-29	entregado	16645.25	5.00	tarjeta_credito	8
1839	1385	128	2025-04-16	2025-04-27	cancelado	185773.72	10.00	transferencia	1
1840	1674	151	2024-01-25	2024-02-03	entregado	171796.21	5.00	OXXO	7
1841	1545	17	2026-04-01	2026-04-16	procesando	33644.73	0.00	PayPal	8
1842	411	89	2023-08-21	2023-08-28	devuelto	154211.59	0.00	PayPal	5
1843	1699	55	2025-05-09	2025-05-23	entregado	177161.45	0.00	transferencia	1
1844	345	98	2025-04-26	2025-04-29	entregado	111400.00	10.00	OXXO	7
1845	1813	196	2024-06-23	2024-07-03	entregado	38245.27	15.00	efectivo	6
1846	1062	114	2024-04-09	2024-04-16	enviado	320537.34	10.00	OXXO	5
1847	1992	114	2026-01-02	2026-01-08	entregado	35656.21	5.00	OXXO	4
1848	564	114	2025-01-10	2025-01-24	entregado	83031.83	0.00	OXXO	3
1849	519	7	2024-05-26	2024-05-30	entregado	132907.61	0.00	OXXO	1
1850	1146	186	2024-11-30	2024-12-11	cancelado	191888.85	5.00	transferencia	6
1851	1800	59	2024-12-29	2025-01-04	cancelado	180835.24	0.00	efectivo	5
1852	1135	9	2023-09-28	2023-10-07	entregado	182758.87	0.00	tarjeta_debito	4
1853	1494	137	2024-05-11	2024-05-26	entregado	147924.38	0.00	OXXO	2
1854	508	105	2024-04-25	2024-04-30	devuelto	154650.42	5.00	OXXO	5
1855	1662	200	2026-04-13	2026-04-21	entregado	55963.96	0.00	efectivo	2
1856	721	1	2024-04-11	2024-04-15	entregado	92755.94	20.00	efectivo	1
1857	644	27	2026-03-10	2026-03-23	procesando	211484.49	0.00	efectivo	4
1858	1781	137	2023-11-29	2023-12-10	enviado	100870.77	0.00	efectivo	7
1859	957	72	2024-01-19	2024-01-24	procesando	192009.16	20.00	transferencia	7
1860	1527	10	2025-01-20	2025-01-24	cancelado	169731.97	20.00	transferencia	4
1861	1684	147	2023-10-14	2023-10-19	entregado	122643.18	5.00	tarjeta_credito	5
1862	1676	18	2026-02-22	2026-03-09	entregado	139945.10	0.00	transferencia	7
1863	92	124	2023-06-15	2023-06-17	procesando	31070.66	5.00	tarjeta_credito	7
1864	613	133	2024-12-21	2024-12-31	pendiente	124381.04	0.00	OXXO	8
1865	415	133	2025-05-05	2025-05-09	cancelado	75302.52	0.00	tarjeta_credito	5
1866	516	56	2024-08-22	2024-08-30	cancelado	122547.08	0.00	OXXO	8
1867	1082	152	2025-04-07	2025-04-21	entregado	157203.09	15.00	efectivo	3
1868	840	9	2025-05-27	2025-06-09	entregado	37290.53	10.00	PayPal	8
1869	685	111	2023-10-22	2023-10-23	entregado	20446.89	5.00	OXXO	2
1870	1929	41	2025-06-03	2025-06-07	pendiente	45096.39	0.00	tarjeta_credito	4
1871	1168	29	2025-09-24	2025-09-28	entregado	132263.00	0.00	PayPal	5
1872	1966	173	2025-11-14	2025-11-26	procesando	325041.20	0.00	tarjeta_debito	8
1873	843	129	2023-12-11	2023-12-12	entregado	139889.37	5.00	tarjeta_credito	8
1874	1186	17	2026-03-12	2026-03-23	cancelado	86770.60	0.00	OXXO	6
1875	244	8	2024-01-18	2024-01-23	entregado	127627.55	0.00	transferencia	4
1876	1560	138	2024-10-02	2024-10-10	enviado	227345.13	0.00	tarjeta_debito	1
1877	467	66	2023-07-18	2023-08-01	procesando	17267.65	0.00	transferencia	6
1878	1352	73	2026-05-28	2026-06-11	entregado	27391.73	0.00	tarjeta_debito	8
1879	379	132	2026-02-13	2026-02-23	entregado	65134.11	0.00	transferencia	4
1880	1622	170	2024-04-04	2024-04-17	devuelto	47214.19	0.00	tarjeta_credito	7
1881	1009	191	2023-07-14	2023-07-20	procesando	7906.42	5.00	efectivo	5
1882	548	11	2024-09-03	2024-09-15	enviado	4070.91	0.00	tarjeta_debito	1
1883	945	161	2024-05-11	2024-05-18	entregado	229419.32	10.00	efectivo	3
1884	867	159	2026-02-21	2026-02-23	procesando	65129.28	0.00	OXXO	1
1885	1842	34	2024-03-10	2024-03-17	entregado	47090.44	0.00	PayPal	3
1886	1865	63	2024-06-08	2024-06-22	devuelto	274094.90	0.00	tarjeta_credito	4
1887	61	113	2025-10-14	2025-10-27	entregado	56759.63	10.00	tarjeta_credito	3
1888	1399	119	2025-04-11	2025-04-26	entregado	215344.31	0.00	OXXO	6
1889	441	24	2024-08-12	2024-08-13	entregado	84093.83	0.00	tarjeta_credito	3
1890	1434	10	2024-04-15	2024-04-30	enviado	211635.79	10.00	tarjeta_credito	5
1891	1083	32	2026-04-06	2026-04-16	entregado	169609.15	20.00	efectivo	5
1892	1087	74	2023-12-06	2023-12-10	pendiente	70967.16	0.00	transferencia	8
1893	1813	53	2023-07-01	2023-07-13	entregado	45309.15	10.00	efectivo	6
1894	485	135	2025-11-09	2025-11-15	cancelado	120205.63	5.00	transferencia	3
1895	1761	174	2025-05-23	2025-06-05	enviado	270500.61	0.00	efectivo	3
1896	1202	91	2025-11-22	2025-12-01	entregado	98211.24	15.00	efectivo	8
1897	1405	108	2023-06-26	2023-07-09	enviado	140102.18	10.00	efectivo	6
1898	1212	11	2025-01-28	2025-01-29	pendiente	166784.13	0.00	transferencia	6
1899	1731	78	2024-12-22	2025-01-03	enviado	9253.20	0.00	OXXO	6
1900	31	182	2024-10-17	2024-10-26	enviado	209932.20	5.00	tarjeta_credito	6
1901	1510	8	2023-08-01	2023-08-11	entregado	282064.33	0.00	transferencia	5
1902	85	61	2024-07-31	2024-08-01	entregado	130900.36	15.00	PayPal	6
1903	710	91	2025-04-07	2025-04-13	cancelado	82651.94	5.00	tarjeta_credito	1
1904	1040	194	2025-09-10	2025-09-21	entregado	378596.03	0.00	efectivo	5
1905	916	197	2023-11-29	2023-12-10	entregado	53944.31	0.00	efectivo	3
1906	758	73	2025-10-14	2025-10-17	entregado	140860.54	0.00	efectivo	4
1907	989	153	2023-10-23	2023-11-02	entregado	59883.04	0.00	OXXO	5
1908	1791	85	2024-05-27	2024-06-06	devuelto	244817.22	5.00	efectivo	7
1909	946	68	2025-11-07	2025-11-14	entregado	107483.44	0.00	PayPal	6
1910	1615	108	2023-09-15	2023-09-17	entregado	17375.94	0.00	tarjeta_debito	6
1911	1847	8	2025-07-01	2025-07-14	entregado	219296.79	0.00	PayPal	1
1912	770	78	2025-10-01	2025-10-14	entregado	116532.65	10.00	tarjeta_debito	8
1913	303	174	2023-09-27	2023-10-04	entregado	119659.13	10.00	efectivo	6
1914	1943	29	2025-04-24	2025-04-29	entregado	83030.02	15.00	OXXO	1
1915	115	87	2024-11-09	2024-11-15	entregado	28485.62	0.00	efectivo	6
1916	729	160	2024-07-23	2024-08-07	cancelado	24878.34	15.00	tarjeta_debito	2
1917	869	143	2025-03-29	2025-04-02	entregado	3196.01	20.00	OXXO	8
1918	1433	196	2024-02-13	2024-02-20	enviado	54882.75	5.00	PayPal	6
1919	1554	2	2024-10-02	2024-10-15	procesando	95201.12	0.00	PayPal	7
1920	1555	184	2026-02-27	2026-03-04	entregado	215010.28	0.00	efectivo	6
1921	1394	121	2024-08-23	2024-09-05	entregado	101790.78	5.00	PayPal	8
1922	1195	60	2025-03-12	2025-03-19	enviado	30609.16	15.00	PayPal	4
1923	1783	18	2024-02-02	2024-02-03	enviado	55311.44	20.00	PayPal	6
1924	1324	174	2026-04-22	2026-04-24	entregado	10188.42	0.00	PayPal	4
1925	1224	21	2025-12-03	2025-12-05	entregado	29598.30	0.00	tarjeta_credito	3
1926	832	73	2026-03-04	2026-03-05	enviado	25260.40	0.00	OXXO	4
1927	1450	56	2024-01-06	2024-01-10	entregado	245187.29	0.00	tarjeta_credito	4
1928	1113	144	2023-12-08	2023-12-17	entregado	55280.75	5.00	tarjeta_credito	4
1929	1082	77	2024-11-08	2024-11-16	enviado	104047.46	10.00	transferencia	8
1930	886	104	2025-01-19	2025-01-31	pendiente	20302.10	15.00	tarjeta_debito	1
1931	1114	60	2024-10-07	2024-10-16	procesando	14061.96	0.00	tarjeta_debito	7
1932	891	75	2023-10-01	2023-10-06	entregado	85306.32	10.00	efectivo	5
1933	1738	8	2024-12-31	2025-01-08	enviado	159242.17	0.00	OXXO	3
1934	1560	127	2024-01-04	2024-01-11	entregado	218191.87	5.00	OXXO	6
1935	1062	24	2023-10-14	2023-10-22	cancelado	38942.44	0.00	PayPal	3
1936	638	100	2023-06-29	2023-07-07	procesando	97703.40	0.00	efectivo	7
1937	1671	157	2025-03-24	2025-04-06	enviado	47624.85	10.00	tarjeta_debito	2
1938	1660	84	2024-08-04	2024-08-17	entregado	219400.13	0.00	tarjeta_debito	4
1939	1260	72	2026-05-22	2026-05-25	enviado	116962.66	10.00	PayPal	1
1940	1735	143	2024-05-04	2024-05-09	procesando	78161.93	5.00	transferencia	7
1941	1368	133	2026-02-01	2026-02-16	entregado	86638.71	20.00	tarjeta_debito	3
1942	1181	38	2025-01-30	2025-02-10	procesando	135350.02	5.00	OXXO	3
1943	546	99	2023-09-11	2023-09-14	entregado	13527.87	0.00	transferencia	4
1944	472	125	2024-12-06	2024-12-07	devuelto	118399.21	5.00	tarjeta_credito	4
1945	1055	106	2023-09-08	2023-09-23	entregado	91231.32	15.00	PayPal	6
1946	1016	129	2025-01-27	2025-01-28	pendiente	22787.20	10.00	efectivo	7
1947	1406	84	2023-12-04	2023-12-15	entregado	57552.24	10.00	efectivo	8
1948	1029	99	2026-06-07	2026-06-08	pendiente	132969.63	0.00	OXXO	3
1949	1878	102	2023-10-05	2023-10-16	entregado	293972.77	5.00	PayPal	5
1950	440	107	2025-03-09	2025-03-12	entregado	40486.19	0.00	tarjeta_credito	5
1951	1971	112	2024-06-14	2024-06-18	pendiente	50691.81	10.00	tarjeta_debito	1
1952	126	75	2025-08-06	2025-08-08	devuelto	128307.43	5.00	transferencia	5
1953	934	184	2025-11-19	2025-12-03	entregado	60280.69	0.00	efectivo	2
1954	1294	148	2025-12-04	2025-12-14	devuelto	6139.98	0.00	OXXO	1
1955	1648	88	2024-02-25	2024-03-02	enviado	161786.85	0.00	efectivo	6
1956	102	140	2025-12-14	2025-12-25	entregado	136736.22	0.00	tarjeta_debito	3
1957	1454	145	2023-08-21	2023-09-04	pendiente	22519.03	15.00	transferencia	4
1958	382	126	2026-03-06	2026-03-19	entregado	225260.19	0.00	PayPal	2
1959	4	103	2026-03-20	2026-04-04	devuelto	40938.75	10.00	PayPal	2
1960	1509	126	2026-03-15	2026-03-16	entregado	78876.74	0.00	tarjeta_credito	5
1961	716	118	2024-10-14	2024-10-24	cancelado	73944.70	0.00	PayPal	1
1962	684	34	2023-10-17	2023-10-18	procesando	54152.73	0.00	PayPal	7
1963	196	29	2024-10-26	2024-10-30	entregado	40188.78	20.00	tarjeta_debito	1
1964	640	2	2023-09-24	2023-10-02	procesando	238119.37	10.00	efectivo	2
1965	453	11	2024-01-17	2024-01-19	entregado	4031.69	10.00	tarjeta_debito	2
1966	823	141	2023-11-21	2023-11-26	entregado	166104.80	15.00	transferencia	2
1967	579	115	2025-02-07	2025-02-21	entregado	67991.80	0.00	tarjeta_credito	3
1968	909	73	2025-01-18	2025-01-31	entregado	59572.04	0.00	transferencia	6
1969	816	12	2025-06-17	2025-06-21	entregado	191460.35	0.00	transferencia	6
1970	696	131	2026-04-27	2026-05-04	procesando	117867.92	0.00	efectivo	6
1971	693	39	2024-01-31	2024-02-08	pendiente	30613.77	15.00	OXXO	4
1972	830	162	2023-10-17	2023-10-29	entregado	51115.32	0.00	efectivo	2
1973	16	2	2024-06-12	2024-06-27	procesando	203212.72	10.00	OXXO	7
1974	1127	125	2026-03-18	2026-03-25	enviado	159693.67	0.00	tarjeta_credito	2
1975	1990	46	2025-12-23	2026-01-04	enviado	115324.31	10.00	transferencia	4
1976	1660	47	2025-02-03	2025-02-09	procesando	298073.81	0.00	tarjeta_debito	4
1977	35	162	2024-05-14	2024-05-19	enviado	96636.62	10.00	OXXO	6
1978	1984	21	2024-02-05	2024-02-11	entregado	86908.11	0.00	transferencia	5
1979	386	38	2025-11-02	2025-11-14	enviado	66389.42	0.00	efectivo	3
1980	811	175	2024-12-16	2024-12-23	procesando	97201.46	10.00	OXXO	6
1981	1514	29	2026-04-22	2026-04-25	procesando	88400.94	0.00	OXXO	2
1982	662	182	2024-09-25	2024-10-04	enviado	35202.46	10.00	tarjeta_credito	1
1983	1243	57	2025-05-18	2025-05-23	entregado	207988.12	0.00	tarjeta_debito	4
1984	854	52	2025-02-09	2025-02-10	entregado	29500.88	10.00	efectivo	5
1985	397	120	2026-02-23	2026-02-24	enviado	148572.78	5.00	efectivo	2
1986	831	198	2024-12-19	2024-12-23	entregado	93889.04	0.00	OXXO	3
1987	197	119	2026-05-21	2026-06-04	devuelto	42844.59	0.00	tarjeta_credito	2
1988	1678	48	2024-07-13	2024-07-25	procesando	51315.36	5.00	PayPal	4
1989	1767	55	2023-10-22	2023-10-24	entregado	152147.33	10.00	PayPal	6
1990	780	136	2025-11-01	2025-11-09	entregado	92178.93	0.00	tarjeta_credito	6
1991	1238	25	2023-09-05	2023-09-17	entregado	300681.23	5.00	PayPal	4
1992	63	196	2026-01-21	2026-01-22	procesando	42045.26	10.00	PayPal	2
1993	1587	97	2025-05-20	2025-05-24	procesando	8308.15	0.00	PayPal	4
1994	1822	97	2024-10-31	2024-11-11	entregado	170229.29	5.00	OXXO	5
1995	1481	77	2026-03-15	2026-03-22	entregado	57584.77	10.00	OXXO	5
1996	1901	91	2025-08-10	2025-08-22	entregado	28413.20	0.00	efectivo	8
1997	44	170	2023-08-28	2023-09-11	pendiente	14592.86	0.00	efectivo	1
1998	1181	67	2024-03-31	2024-04-03	cancelado	109100.48	0.00	OXXO	6
1999	872	38	2025-06-03	2025-06-11	entregado	118794.54	5.00	tarjeta_debito	7
2000	54	195	2025-09-21	2025-10-06	cancelado	147184.02	5.00	OXXO	2
2001	249	144	2023-12-31	2024-01-09	cancelado	35785.16	0.00	tarjeta_credito	1
2002	1242	57	2024-01-01	2024-01-15	entregado	68303.58	5.00	PayPal	5
2003	1730	147	2026-06-04	2026-06-18	enviado	39179.71	5.00	tarjeta_credito	1
2004	1787	51	2025-09-06	2025-09-14	procesando	44676.17	5.00	PayPal	1
2005	706	172	2023-07-05	2023-07-13	entregado	87832.50	0.00	transferencia	1
2006	174	72	2023-11-04	2023-11-07	procesando	100070.82	5.00	tarjeta_credito	2
2007	1154	86	2024-01-19	2024-01-30	procesando	179859.67	10.00	transferencia	5
2008	889	8	2023-09-10	2023-09-18	entregado	258904.08	0.00	PayPal	6
2009	800	179	2025-10-25	2025-11-04	cancelado	2488.51	0.00	efectivo	2
2010	1989	53	2024-05-18	2024-05-25	entregado	237581.10	15.00	PayPal	8
2011	1633	73	2023-06-21	2023-07-04	procesando	165198.06	0.00	tarjeta_credito	1
2012	1016	92	2025-11-07	2025-11-14	entregado	229033.75	0.00	OXXO	7
2013	1309	122	2025-05-20	2025-05-26	enviado	249507.47	5.00	OXXO	2
2014	1004	187	2023-08-29	2023-09-03	enviado	146162.06	15.00	efectivo	8
2015	924	156	2025-02-08	2025-02-14	cancelado	31220.95	5.00	PayPal	6
2016	1341	141	2024-09-21	2024-09-25	enviado	76226.38	0.00	PayPal	8
2017	1540	32	2025-06-13	2025-06-19	entregado	27422.86	0.00	tarjeta_credito	4
2018	127	179	2024-04-24	2024-05-09	entregado	56190.21	5.00	tarjeta_credito	3
2019	782	126	2025-10-25	2025-11-04	entregado	126285.88	0.00	PayPal	4
2020	432	95	2025-02-07	2025-02-18	entregado	33125.06	5.00	tarjeta_debito	8
2021	1141	56	2026-03-22	2026-03-28	enviado	96596.72	5.00	PayPal	8
2022	766	60	2025-02-14	2025-02-20	cancelado	217668.57	0.00	OXXO	3
2023	110	35	2024-11-22	2024-12-05	enviado	68402.74	0.00	transferencia	2
2024	233	48	2025-07-24	2025-07-31	enviado	131772.48	5.00	tarjeta_debito	5
2025	1528	95	2025-10-04	2025-10-12	entregado	121650.35	20.00	tarjeta_debito	3
2026	1186	57	2025-12-24	2026-01-01	enviado	96442.53	5.00	efectivo	1
2027	1625	63	2024-11-21	2024-12-02	procesando	151964.94	10.00	efectivo	1
2028	648	84	2023-09-28	2023-10-10	procesando	87365.68	10.00	PayPal	2
2029	940	77	2025-04-20	2025-04-22	pendiente	71077.46	5.00	tarjeta_debito	5
2030	1313	82	2025-04-15	2025-04-21	entregado	138631.69	15.00	tarjeta_credito	2
2031	1413	85	2023-09-02	2023-09-08	entregado	124840.78	5.00	transferencia	3
2032	103	159	2024-12-02	2024-12-11	entregado	87712.44	10.00	transferencia	6
2033	924	165	2024-06-20	2024-06-27	entregado	11378.45	5.00	tarjeta_debito	4
2034	1181	26	2024-02-29	2024-03-09	entregado	120705.73	10.00	transferencia	1
2035	1652	134	2024-09-04	2024-09-10	entregado	178395.00	5.00	efectivo	4
2036	1586	149	2024-11-30	2024-12-05	cancelado	160882.14	0.00	OXXO	2
2037	33	77	2025-08-17	2025-08-31	entregado	110598.93	10.00	transferencia	5
2038	1275	50	2024-06-27	2024-07-02	cancelado	79073.64	0.00	tarjeta_credito	2
2039	1743	135	2026-01-17	2026-01-26	enviado	23857.08	5.00	transferencia	2
2040	439	40	2025-01-25	2025-01-31	entregado	114480.02	20.00	tarjeta_debito	5
2041	1632	129	2026-01-04	2026-01-06	entregado	182170.94	10.00	tarjeta_credito	4
2042	614	118	2024-05-16	2024-05-23	entregado	25806.51	0.00	transferencia	5
2043	1724	176	2025-07-16	2025-07-23	entregado	166280.80	10.00	efectivo	6
2044	582	107	2025-07-13	2025-07-14	pendiente	45249.20	20.00	tarjeta_debito	6
2045	1453	65	2024-04-05	2024-04-15	procesando	109876.80	0.00	OXXO	4
2046	1167	73	2026-06-03	2026-06-11	cancelado	67003.09	0.00	transferencia	4
2047	1365	76	2025-02-27	2025-03-04	entregado	11852.12	15.00	PayPal	6
2048	1707	67	2023-10-18	2023-10-29	entregado	133509.50	5.00	transferencia	1
2049	1631	64	2023-07-01	2023-07-15	devuelto	20201.77	0.00	PayPal	6
2050	222	101	2025-05-19	2025-05-25	entregado	26312.89	0.00	OXXO	2
2051	1516	46	2026-06-11	2026-06-26	entregado	378036.64	0.00	tarjeta_credito	8
2052	693	103	2026-01-25	2026-02-01	enviado	25158.56	15.00	efectivo	7
2053	519	171	2025-12-18	2025-12-27	procesando	25812.81	15.00	efectivo	2
2054	393	56	2025-05-04	2025-05-11	entregado	16943.07	10.00	tarjeta_credito	3
2055	1061	88	2026-01-25	2026-01-31	pendiente	64946.10	5.00	efectivo	2
2056	900	166	2025-11-21	2025-12-02	entregado	146493.37	0.00	tarjeta_debito	1
2057	1442	85	2025-06-13	2025-06-25	cancelado	233604.80	5.00	tarjeta_debito	2
2058	1668	150	2025-10-17	2025-10-28	procesando	56877.43	5.00	tarjeta_debito	5
2059	1032	29	2024-10-25	2024-10-27	entregado	227390.02	10.00	tarjeta_debito	6
2060	1421	181	2024-03-21	2024-04-05	enviado	97309.76	0.00	tarjeta_credito	5
2061	1751	44	2024-02-18	2024-02-24	entregado	24036.41	15.00	tarjeta_debito	1
2062	222	116	2024-10-01	2024-10-16	entregado	196759.69	0.00	PayPal	5
2063	1438	79	2024-01-01	2024-01-11	devuelto	154353.23	5.00	PayPal	7
2064	826	94	2024-10-11	2024-10-20	entregado	205790.66	5.00	transferencia	3
2065	1925	154	2025-09-29	2025-10-03	procesando	263521.33	0.00	OXXO	6
2066	1945	156	2025-11-15	2025-11-30	entregado	4680.29	20.00	OXXO	2
2067	1862	81	2025-05-16	2025-05-29	entregado	90321.45	0.00	OXXO	1
2068	1828	25	2025-11-22	2025-11-26	entregado	190238.80	0.00	tarjeta_debito	4
2069	210	92	2024-03-09	2024-03-23	cancelado	160644.66	10.00	tarjeta_debito	5
2070	375	140	2025-01-14	2025-01-29	procesando	80370.63	0.00	tarjeta_debito	3
2071	1806	186	2025-01-12	2025-01-19	entregado	255430.88	0.00	tarjeta_credito	4
2072	1599	41	2026-05-22	2026-05-25	entregado	92422.09	15.00	efectivo	3
2073	496	138	2024-01-25	2024-02-02	procesando	88386.63	10.00	transferencia	7
2074	61	80	2025-09-09	2025-09-19	pendiente	88359.45	0.00	OXXO	8
2075	1311	181	2024-01-20	2024-02-01	entregado	79939.17	0.00	tarjeta_credito	8
2076	997	35	2026-01-09	2026-01-10	entregado	99491.29	0.00	efectivo	1
2077	42	62	2025-03-21	2025-04-02	entregado	79182.88	10.00	tarjeta_credito	1
2078	1409	173	2023-09-06	2023-09-21	entregado	28802.92	10.00	tarjeta_debito	6
2079	567	47	2024-01-08	2024-01-14	entregado	237525.40	0.00	OXXO	4
2080	1216	46	2023-09-21	2023-10-05	entregado	11122.59	10.00	OXXO	4
2081	1190	142	2024-08-27	2024-09-08	entregado	176435.29	5.00	tarjeta_credito	3
2082	1629	131	2025-05-17	2025-06-01	entregado	159050.38	0.00	OXXO	3
2083	1592	118	2024-01-20	2024-01-29	entregado	23789.93	15.00	OXXO	1
2084	562	47	2025-02-21	2025-02-27	pendiente	139044.91	0.00	OXXO	4
2085	162	134	2024-05-20	2024-05-30	entregado	122358.08	10.00	OXXO	7
2086	1397	149	2025-05-24	2025-06-04	entregado	251687.48	0.00	tarjeta_debito	5
2087	1449	120	2026-02-15	2026-02-21	entregado	139616.44	0.00	OXXO	1
2088	1016	123	2024-05-05	2024-05-06	procesando	59101.19	5.00	efectivo	5
2089	1349	148	2024-03-15	2024-03-19	procesando	229909.56	0.00	PayPal	7
2090	1443	107	2025-09-28	2025-10-11	entregado	217855.04	5.00	tarjeta_credito	6
2091	1868	149	2024-06-07	2024-06-09	enviado	154077.35	10.00	PayPal	5
2092	1516	92	2024-11-19	2024-12-01	entregado	83020.86	15.00	PayPal	6
2093	690	26	2025-05-06	2025-05-20	cancelado	108619.64	0.00	tarjeta_credito	6
2094	1255	18	2024-06-23	2024-06-28	entregado	25166.29	0.00	OXXO	6
2095	225	192	2025-11-20	2025-11-21	enviado	18833.45	0.00	efectivo	2
2096	1378	59	2024-01-15	2024-01-19	entregado	88061.97	0.00	PayPal	1
2097	1931	86	2026-04-10	2026-04-15	entregado	102240.27	0.00	tarjeta_debito	3
2098	486	67	2025-09-09	2025-09-16	cancelado	136250.16	0.00	PayPal	8
2099	1779	11	2025-05-01	2025-05-16	devuelto	57586.98	5.00	tarjeta_debito	2
2100	287	133	2025-12-29	2026-01-06	entregado	172166.40	10.00	PayPal	4
2101	724	79	2023-12-17	2023-12-29	procesando	147998.21	10.00	tarjeta_debito	2
2102	145	42	2023-12-21	2024-01-02	entregado	102940.10	5.00	tarjeta_debito	8
2103	1826	56	2026-01-18	2026-01-20	entregado	227340.20	10.00	tarjeta_debito	4
2104	216	5	2023-08-15	2023-08-22	entregado	107176.26	0.00	transferencia	6
2105	1601	149	2024-12-27	2025-01-07	cancelado	7946.20	0.00	PayPal	2
2106	1044	5	2025-01-29	2025-02-10	entregado	48553.51	5.00	efectivo	2
2107	1388	10	2026-03-12	2026-03-15	entregado	17332.44	0.00	tarjeta_credito	5
2108	49	140	2025-12-15	2025-12-23	entregado	25878.51	5.00	transferencia	2
2109	870	163	2023-10-22	2023-10-31	entregado	70865.37	10.00	tarjeta_debito	3
2110	1556	17	2024-11-12	2024-11-22	enviado	107600.24	0.00	tarjeta_credito	4
2111	1362	33	2026-04-30	2026-05-05	entregado	168003.11	0.00	transferencia	5
2112	437	186	2025-04-18	2025-04-23	entregado	154238.56	0.00	transferencia	6
2113	136	12	2026-04-30	2026-05-05	cancelado	69967.08	0.00	tarjeta_credito	5
2114	227	52	2025-10-05	2025-10-09	entregado	217261.75	0.00	OXXO	8
2115	1170	78	2025-09-12	2025-09-13	procesando	77244.64	10.00	tarjeta_debito	3
2116	1391	60	2024-06-10	2024-06-17	procesando	1645.58	20.00	transferencia	3
2117	1346	22	2023-09-14	2023-09-21	procesando	161634.25	0.00	PayPal	8
2118	1465	142	2023-11-25	2023-12-03	entregado	116449.56	10.00	efectivo	2
2119	446	129	2023-10-02	2023-10-10	procesando	93810.53	0.00	tarjeta_debito	2
2120	1092	147	2025-03-11	2025-03-21	entregado	52077.96	5.00	tarjeta_debito	1
2121	569	130	2023-10-10	2023-10-14	entregado	278634.00	0.00	PayPal	5
2122	654	88	2023-08-20	2023-08-27	pendiente	4689.87	10.00	tarjeta_credito	8
2123	1697	186	2025-03-11	2025-03-16	entregado	20747.92	5.00	OXXO	1
2124	1022	149	2024-03-09	2024-03-22	entregado	157437.78	5.00	tarjeta_debito	2
2125	713	125	2024-08-27	2024-09-05	entregado	26984.46	0.00	PayPal	2
2126	1572	139	2024-08-14	2024-08-18	procesando	100847.67	10.00	tarjeta_credito	6
2127	1845	72	2024-09-23	2024-10-03	entregado	251960.99	0.00	tarjeta_debito	8
2128	167	173	2024-09-02	2024-09-07	entregado	62489.76	0.00	PayPal	6
2129	1736	108	2023-11-20	2023-11-21	entregado	209426.91	0.00	transferencia	2
2130	1573	91	2025-05-04	2025-05-12	enviado	193445.48	0.00	tarjeta_credito	6
2131	736	175	2024-06-28	2024-07-10	entregado	23505.96	0.00	efectivo	5
2132	579	195	2026-03-30	2026-04-07	procesando	140245.71	15.00	OXXO	7
2133	934	120	2023-08-16	2023-08-30	enviado	101269.26	20.00	PayPal	3
2134	1320	184	2025-09-07	2025-09-20	entregado	146600.81	15.00	OXXO	1
2135	933	200	2025-08-29	2025-09-09	procesando	55299.62	15.00	tarjeta_credito	5
2136	1013	195	2026-01-23	2026-01-25	procesando	61829.38	0.00	tarjeta_credito	8
2137	752	172	2023-09-08	2023-09-17	procesando	353258.15	15.00	efectivo	2
2138	1931	6	2024-09-13	2024-09-22	entregado	51323.22	0.00	PayPal	7
2139	527	70	2025-08-10	2025-08-17	entregado	166714.54	0.00	transferencia	1
2140	1425	67	2024-02-14	2024-02-22	entregado	3595.51	10.00	tarjeta_credito	8
2141	955	200	2026-05-14	2026-05-18	entregado	71082.30	0.00	tarjeta_credito	5
2142	1351	76	2025-03-09	2025-03-22	procesando	163616.69	0.00	tarjeta_debito	5
2143	1721	97	2024-01-27	2024-02-09	enviado	125319.55	20.00	transferencia	5
2144	1231	174	2026-02-09	2026-02-22	entregado	127327.17	10.00	efectivo	4
2145	1052	26	2023-11-04	2023-11-12	enviado	103252.90	15.00	PayPal	3
2146	535	104	2025-07-17	2025-07-22	entregado	249478.86	0.00	PayPal	2
2147	216	175	2025-05-15	2025-05-16	entregado	257541.33	0.00	efectivo	4
2148	279	64	2025-12-22	2026-01-05	entregado	63074.57	0.00	transferencia	6
2149	199	131	2025-09-29	2025-10-02	entregado	95561.78	5.00	transferencia	1
2150	45	63	2024-12-03	2024-12-07	pendiente	90408.51	0.00	tarjeta_debito	3
2151	726	98	2023-10-25	2023-10-30	entregado	86279.78	10.00	OXXO	6
2152	431	98	2025-09-02	2025-09-08	entregado	223107.65	5.00	tarjeta_debito	4
2153	253	19	2024-07-22	2024-07-27	entregado	80835.83	0.00	PayPal	1
2154	1311	36	2026-04-16	2026-04-23	entregado	91029.58	0.00	OXXO	7
2155	1331	150	2025-04-20	2025-04-21	procesando	416116.13	0.00	tarjeta_debito	3
2156	155	173	2024-09-16	2024-09-21	entregado	26128.28	15.00	transferencia	4
2157	1533	194	2024-05-24	2024-06-07	entregado	201587.98	0.00	tarjeta_debito	6
2158	1588	109	2025-10-09	2025-10-11	cancelado	60613.07	0.00	OXXO	6
2159	1369	196	2024-09-12	2024-09-17	procesando	216444.43	0.00	OXXO	2
2160	1094	71	2024-08-06	2024-08-12	entregado	45202.90	10.00	efectivo	3
2161	823	136	2025-09-24	2025-10-06	enviado	188054.68	0.00	PayPal	2
2162	553	157	2024-09-13	2024-09-14	entregado	171394.13	0.00	tarjeta_debito	6
2163	1137	95	2025-02-25	2025-03-11	entregado	128344.21	0.00	tarjeta_debito	6
2164	1794	166	2025-06-25	2025-07-04	enviado	165895.74	0.00	transferencia	6
2165	94	128	2023-08-05	2023-08-07	enviado	60227.44	15.00	OXXO	8
2166	1656	55	2024-06-03	2024-06-08	procesando	57421.60	10.00	tarjeta_debito	6
2167	371	72	2023-10-16	2023-10-24	entregado	109746.08	0.00	efectivo	7
2168	542	151	2025-01-25	2025-01-26	entregado	112007.44	0.00	tarjeta_credito	1
2169	891	3	2024-04-11	2024-04-21	enviado	159909.11	5.00	tarjeta_debito	7
2170	610	140	2024-01-04	2024-01-07	devuelto	99318.09	5.00	efectivo	6
2171	1644	54	2023-08-29	2023-09-06	enviado	37234.00	10.00	PayPal	6
2172	1850	167	2024-10-25	2024-11-05	cancelado	109765.51	0.00	tarjeta_credito	3
2173	249	6	2025-01-07	2025-01-08	entregado	169308.45	15.00	efectivo	6
2174	1498	51	2024-01-02	2024-01-03	entregado	151842.50	0.00	PayPal	4
2175	290	162	2025-01-10	2025-01-18	entregado	35209.98	5.00	transferencia	3
2176	739	172	2025-11-10	2025-11-22	entregado	62406.68	0.00	OXXO	7
2177	1585	15	2025-03-23	2025-03-26	entregado	83156.03	5.00	tarjeta_debito	5
2178	505	173	2023-08-05	2023-08-20	enviado	74095.52	15.00	tarjeta_debito	8
2179	1141	147	2024-06-09	2024-06-12	procesando	325353.76	0.00	tarjeta_credito	8
2180	1212	68	2024-02-14	2024-02-26	entregado	74090.86	15.00	efectivo	6
2181	1457	160	2024-06-16	2024-06-30	entregado	52245.34	5.00	tarjeta_credito	3
2182	919	186	2025-05-12	2025-05-24	entregado	78751.87	10.00	efectivo	3
2183	900	187	2025-11-05	2025-11-14	entregado	114423.47	15.00	OXXO	5
2184	1848	7	2025-07-16	2025-07-20	enviado	69909.28	0.00	OXXO	3
2185	975	100	2025-11-14	2025-11-22	entregado	217496.45	10.00	OXXO	1
2186	1570	171	2024-11-22	2024-11-23	entregado	128548.82	15.00	efectivo	6
2187	204	21	2025-07-12	2025-07-21	entregado	21745.79	5.00	tarjeta_credito	1
2188	718	2	2025-09-06	2025-09-18	cancelado	289391.64	0.00	OXXO	3
2189	78	123	2024-10-22	2024-11-02	enviado	82151.63	5.00	tarjeta_debito	3
2190	906	200	2024-02-02	2024-02-10	entregado	26900.06	0.00	tarjeta_debito	4
2191	652	179	2024-12-16	2024-12-20	pendiente	24723.58	0.00	OXXO	8
2192	397	188	2025-09-12	2025-09-24	entregado	140437.30	20.00	PayPal	7
2193	1577	192	2025-05-24	2025-05-26	cancelado	68644.30	0.00	tarjeta_credito	1
2194	283	98	2026-06-09	2026-06-17	entregado	33482.70	0.00	efectivo	4
2195	1831	161	2025-01-13	2025-01-25	enviado	53169.76	20.00	PayPal	7
2196	1990	88	2025-03-25	2025-04-08	entregado	152572.64	0.00	efectivo	8
2197	510	29	2026-04-19	2026-04-25	entregado	165551.05	5.00	PayPal	4
2198	135	143	2023-11-26	2023-11-30	entregado	8535.71	10.00	efectivo	1
2199	976	160	2025-04-08	2025-04-22	entregado	160520.90	0.00	tarjeta_debito	2
2200	267	157	2023-10-10	2023-10-14	pendiente	51101.00	0.00	tarjeta_credito	5
2201	1060	88	2026-02-26	2026-03-13	devuelto	184867.28	0.00	OXXO	8
2202	1372	96	2026-04-18	2026-04-27	entregado	16991.09	5.00	tarjeta_credito	1
2203	1245	16	2023-10-19	2023-10-22	entregado	3392.20	5.00	OXXO	8
2204	175	41	2025-10-06	2025-10-15	enviado	65884.82	10.00	efectivo	6
2205	369	63	2024-08-18	2024-08-28	entregado	315152.89	0.00	tarjeta_debito	4
2206	155	84	2023-07-21	2023-08-02	entregado	103575.53	0.00	transferencia	6
2207	913	159	2026-04-12	2026-04-16	entregado	6372.93	0.00	PayPal	1
2208	1627	112	2026-06-05	2026-06-20	enviado	46391.07	15.00	transferencia	6
2209	25	44	2024-11-16	2024-11-18	pendiente	51195.62	15.00	tarjeta_credito	8
2210	1052	161	2024-01-27	2024-02-04	enviado	67621.00	5.00	transferencia	6
2211	698	175	2024-07-19	2024-07-20	enviado	19598.86	5.00	tarjeta_credito	5
2212	687	12	2024-10-12	2024-10-22	cancelado	165169.05	0.00	tarjeta_debito	7
2213	845	160	2024-10-23	2024-11-03	entregado	188937.00	0.00	PayPal	7
2214	1957	87	2025-11-10	2025-11-19	pendiente	11855.15	0.00	OXXO	3
2215	81	79	2025-03-06	2025-03-17	enviado	148652.15	10.00	efectivo	1
2216	1397	177	2024-12-28	2025-01-12	entregado	39876.06	0.00	transferencia	5
2217	1357	50	2024-10-14	2024-10-24	cancelado	44205.36	15.00	efectivo	2
2218	872	184	2024-04-29	2024-05-07	entregado	352244.47	0.00	PayPal	7
2219	1155	131	2024-06-04	2024-06-13	entregado	162044.29	0.00	tarjeta_credito	2
2220	112	102	2023-12-30	2024-01-07	enviado	150060.10	20.00	efectivo	2
2221	1033	115	2025-02-13	2025-02-24	enviado	98788.96	5.00	efectivo	4
2222	931	122	2026-02-24	2026-02-26	devuelto	48831.52	0.00	tarjeta_debito	2
2223	884	190	2024-12-14	2024-12-20	procesando	99433.64	5.00	tarjeta_debito	5
2224	506	113	2026-05-13	2026-05-18	entregado	106343.60	0.00	transferencia	4
2225	797	89	2026-01-23	2026-02-05	enviado	124177.24	0.00	transferencia	3
2226	885	179	2025-08-30	2025-09-12	entregado	92860.99	20.00	tarjeta_debito	3
2227	962	54	2024-07-10	2024-07-23	entregado	1294.98	0.00	transferencia	8
2228	379	19	2025-07-30	2025-08-13	entregado	36586.53	0.00	efectivo	8
2229	1352	130	2024-06-27	2024-07-10	enviado	175222.87	0.00	tarjeta_debito	5
2230	372	88	2024-04-07	2024-04-14	entregado	143738.96	5.00	OXXO	1
2231	1793	86	2023-09-10	2023-09-23	enviado	90600.40	0.00	PayPal	1
2232	1430	53	2026-04-09	2026-04-13	pendiente	43427.17	0.00	tarjeta_debito	7
2233	693	168	2025-05-20	2025-05-23	enviado	57224.80	0.00	OXXO	5
2234	1263	174	2023-12-16	2023-12-30	procesando	63151.78	0.00	tarjeta_credito	8
2235	1641	12	2024-01-21	2024-01-22	entregado	237664.51	0.00	transferencia	2
2236	1704	72	2025-02-06	2025-02-10	cancelado	133975.17	0.00	tarjeta_credito	5
2237	1502	152	2025-12-31	2026-01-12	cancelado	173428.91	0.00	efectivo	5
2238	404	100	2023-12-28	2023-12-30	procesando	26260.55	5.00	transferencia	4
2239	1032	180	2023-11-16	2023-11-23	entregado	38150.50	0.00	efectivo	8
2240	1450	126	2024-10-03	2024-10-17	entregado	121171.24	0.00	efectivo	7
2241	879	32	2023-07-05	2023-07-08	entregado	156825.85	5.00	transferencia	5
2242	138	71	2025-06-28	2025-07-06	enviado	87670.66	15.00	OXXO	2
2243	514	28	2023-08-16	2023-08-25	entregado	204860.76	0.00	OXXO	5
2244	1406	147	2025-06-24	2025-06-26	enviado	180374.18	0.00	OXXO	4
2245	1181	150	2023-07-04	2023-07-19	cancelado	126444.77	15.00	tarjeta_credito	6
2246	1154	7	2026-05-13	2026-05-21	procesando	242211.97	0.00	tarjeta_debito	1
2247	593	184	2024-11-29	2024-12-08	entregado	3072.00	10.00	transferencia	8
2248	1892	124	2026-01-17	2026-01-23	cancelado	6265.57	5.00	tarjeta_credito	8
2249	1332	179	2024-04-25	2024-05-02	entregado	2736.69	0.00	PayPal	4
2250	1182	22	2025-11-21	2025-11-28	procesando	101781.81	10.00	efectivo	8
2251	1338	103	2023-09-09	2023-09-24	procesando	24115.24	5.00	transferencia	7
2252	1910	96	2023-10-15	2023-10-27	entregado	106914.55	0.00	efectivo	8
2253	1993	101	2026-03-08	2026-03-17	entregado	97096.20	0.00	OXXO	6
2254	1741	165	2025-08-29	2025-09-08	entregado	102441.35	0.00	efectivo	3
2255	145	126	2024-05-28	2024-05-29	entregado	57814.11	5.00	PayPal	8
2256	1084	35	2023-08-20	2023-08-28	devuelto	17409.10	0.00	efectivo	5
2257	291	43	2026-06-01	2026-06-08	entregado	103632.21	5.00	efectivo	1
2258	849	156	2025-06-28	2025-07-08	cancelado	191994.20	0.00	OXXO	4
2259	1322	135	2024-01-09	2024-01-22	procesando	156016.70	0.00	transferencia	8
2260	287	79	2024-02-13	2024-02-27	devuelto	201833.72	0.00	tarjeta_credito	4
2261	333	23	2025-01-01	2025-01-05	entregado	49065.13	0.00	OXXO	4
2262	1161	62	2025-02-01	2025-02-15	entregado	179336.83	0.00	tarjeta_credito	5
2263	1370	6	2024-03-13	2024-03-19	entregado	135621.02	5.00	efectivo	8
2264	655	96	2025-09-11	2025-09-23	entregado	71404.82	0.00	transferencia	2
2265	704	20	2024-11-22	2024-11-26	entregado	46968.47	0.00	efectivo	6
2266	932	182	2023-07-06	2023-07-10	entregado	36752.05	15.00	PayPal	4
2267	1332	129	2023-11-20	2023-12-02	pendiente	230127.76	5.00	efectivo	6
2268	1985	102	2024-01-25	2024-02-09	enviado	160067.06	20.00	tarjeta_debito	4
2269	1655	139	2024-06-14	2024-06-26	pendiente	121895.37	5.00	OXXO	5
2270	140	119	2023-06-14	2023-06-29	entregado	50742.01	15.00	transferencia	1
2271	1419	32	2025-10-27	2025-11-09	cancelado	143719.84	10.00	tarjeta_debito	5
2272	1763	109	2024-09-22	2024-10-03	entregado	195961.66	10.00	tarjeta_debito	4
2273	806	176	2024-11-07	2024-11-10	entregado	99571.38	15.00	tarjeta_credito	8
2274	1979	152	2023-11-17	2023-11-21	entregado	11004.76	5.00	PayPal	1
2275	186	2	2025-09-16	2025-09-27	devuelto	70764.18	10.00	transferencia	2
2276	1243	195	2026-02-12	2026-02-23	procesando	151926.73	5.00	OXXO	3
2277	1714	3	2025-05-23	2025-06-01	devuelto	153481.65	0.00	tarjeta_credito	3
2278	255	199	2024-05-24	2024-06-04	entregado	37104.74	0.00	efectivo	6
2279	1498	98	2025-06-25	2025-07-09	entregado	46552.21	20.00	efectivo	7
2280	1411	47	2025-08-07	2025-08-08	entregado	88596.88	0.00	transferencia	4
2281	1295	61	2025-04-03	2025-04-14	entregado	67840.12	5.00	efectivo	4
2282	1499	34	2024-04-18	2024-04-21	entregado	24136.40	5.00	tarjeta_credito	5
2283	30	61	2026-02-22	2026-03-05	entregado	69751.60	0.00	PayPal	5
2284	135	173	2024-11-28	2024-12-13	entregado	31669.41	0.00	efectivo	5
2285	389	193	2024-07-02	2024-07-03	entregado	32853.92	0.00	OXXO	4
2286	1511	64	2025-05-30	2025-06-08	entregado	163477.51	5.00	PayPal	8
2287	51	36	2024-12-16	2024-12-21	entregado	116012.94	15.00	tarjeta_debito	2
2288	50	159	2026-05-18	2026-05-26	entregado	119474.56	5.00	tarjeta_debito	4
2289	1388	85	2025-02-02	2025-02-17	entregado	119097.06	15.00	transferencia	4
2290	1003	112	2024-06-15	2024-06-21	entregado	230046.40	0.00	transferencia	3
2291	909	92	2023-10-11	2023-10-15	entregado	35082.84	0.00	tarjeta_credito	5
2292	959	25	2025-06-08	2025-06-23	entregado	5317.75	0.00	efectivo	4
2293	1189	56	2025-09-23	2025-10-03	entregado	89116.09	0.00	tarjeta_credito	3
2294	1970	18	2024-07-03	2024-07-04	pendiente	169206.91	0.00	efectivo	4
2295	1304	64	2026-02-28	2026-03-07	entregado	310445.82	5.00	OXXO	6
2296	1033	47	2024-10-30	2024-11-12	entregado	93070.74	0.00	OXXO	2
2297	1703	34	2026-03-15	2026-03-19	entregado	57378.08	0.00	PayPal	2
2298	304	114	2024-07-02	2024-07-12	entregado	92026.39	5.00	efectivo	6
2299	947	171	2025-12-14	2025-12-19	cancelado	137695.77	0.00	OXXO	2
2300	864	173	2025-05-25	2025-05-28	entregado	83875.46	15.00	transferencia	6
2301	1225	23	2026-03-10	2026-03-11	procesando	113198.57	10.00	tarjeta_debito	7
2302	515	56	2024-03-30	2024-04-04	entregado	150183.23	0.00	tarjeta_debito	7
2303	1205	24	2025-01-10	2025-01-13	entregado	29475.90	10.00	OXXO	1
2304	1294	15	2023-11-05	2023-11-16	entregado	63434.07	15.00	transferencia	7
2305	1471	129	2025-02-07	2025-02-13	entregado	234793.20	5.00	OXXO	8
2306	1888	140	2024-08-26	2024-09-06	entregado	74715.99	0.00	tarjeta_debito	4
2307	1107	193	2024-05-10	2024-05-14	entregado	197078.35	0.00	tarjeta_credito	1
2308	1364	109	2025-04-04	2025-04-15	devuelto	57644.85	0.00	OXXO	7
2309	1322	122	2023-12-11	2023-12-26	entregado	74628.31	0.00	PayPal	7
2310	247	123	2025-07-07	2025-07-16	procesando	16218.63	20.00	OXXO	1
2311	495	75	2024-11-27	2024-12-10	entregado	88510.66	0.00	tarjeta_debito	5
2312	1680	97	2024-06-17	2024-06-28	procesando	39159.54	10.00	transferencia	5
2313	1922	198	2026-01-29	2026-02-04	entregado	204667.12	0.00	tarjeta_debito	6
2314	248	120	2024-09-09	2024-09-17	entregado	30014.00	20.00	tarjeta_credito	6
2315	222	187	2023-08-23	2023-08-30	enviado	76301.25	0.00	OXXO	6
2316	1871	149	2024-02-26	2024-03-03	procesando	102282.15	0.00	OXXO	4
2317	1445	57	2023-12-08	2023-12-20	entregado	58537.28	0.00	transferencia	5
2318	1057	66	2025-08-29	2025-08-31	entregado	119323.60	0.00	tarjeta_debito	6
2319	190	188	2024-12-15	2024-12-21	entregado	129085.43	15.00	OXXO	6
2320	1719	185	2025-05-02	2025-05-10	enviado	64856.55	0.00	transferencia	7
2321	93	70	2026-01-19	2026-01-24	entregado	65578.74	0.00	tarjeta_debito	1
2322	379	159	2023-10-19	2023-10-20	enviado	18419.04	0.00	transferencia	3
2323	367	152	2025-08-23	2025-08-25	entregado	228512.85	10.00	efectivo	3
2324	638	172	2025-05-18	2025-05-28	entregado	238768.80	5.00	efectivo	1
2325	179	184	2024-09-24	2024-10-04	entregado	57700.15	0.00	efectivo	1
2326	944	111	2024-08-08	2024-08-12	enviado	84814.91	15.00	transferencia	4
2327	1351	169	2024-10-17	2024-10-30	entregado	65516.60	0.00	PayPal	1
2328	104	113	2023-08-11	2023-08-14	entregado	146852.25	0.00	transferencia	7
2329	1245	80	2025-03-14	2025-03-21	pendiente	127268.07	10.00	OXXO	5
2330	431	133	2024-02-26	2024-03-06	entregado	24727.95	5.00	efectivo	1
2331	1085	84	2024-07-25	2024-08-04	entregado	114489.51	10.00	transferencia	3
2332	1170	123	2025-05-30	2025-06-06	entregado	54215.68	10.00	tarjeta_debito	4
2333	1654	200	2025-08-23	2025-08-29	entregado	52008.77	10.00	transferencia	4
2334	1295	78	2024-02-17	2024-03-03	enviado	73943.19	10.00	OXXO	3
2335	970	15	2024-12-05	2024-12-13	entregado	109945.08	10.00	OXXO	4
2336	519	164	2025-01-13	2025-01-28	cancelado	158808.19	0.00	transferencia	2
2337	95	91	2025-11-18	2025-12-03	devuelto	248423.02	5.00	OXXO	7
2338	179	140	2026-03-05	2026-03-12	cancelado	20328.28	0.00	PayPal	7
2339	1552	190	2023-07-13	2023-07-25	enviado	33773.52	0.00	PayPal	3
2340	557	65	2025-01-06	2025-01-21	entregado	24327.66	0.00	OXXO	6
2341	171	134	2024-01-19	2024-01-29	procesando	28605.81	0.00	tarjeta_credito	4
2342	1367	77	2024-11-29	2024-11-30	cancelado	152738.64	20.00	tarjeta_debito	4
2343	1780	26	2025-01-20	2025-01-29	entregado	393196.85	0.00	OXXO	4
2344	549	121	2024-02-01	2024-02-11	entregado	173516.79	0.00	tarjeta_debito	8
2345	1978	127	2025-01-20	2025-01-31	devuelto	78995.86	5.00	tarjeta_credito	2
2346	1590	173	2025-07-23	2025-07-26	pendiente	85527.25	0.00	transferencia	4
2347	197	129	2024-05-21	2024-05-24	entregado	110317.92	5.00	tarjeta_debito	2
2348	746	39	2025-03-26	2025-03-28	pendiente	85712.24	0.00	transferencia	4
2349	1391	18	2024-10-23	2024-11-05	entregado	163089.24	5.00	tarjeta_credito	3
2350	994	12	2025-06-01	2025-06-05	entregado	104528.15	5.00	transferencia	8
2351	384	9	2025-10-24	2025-10-27	enviado	52044.29	5.00	tarjeta_debito	2
2352	1359	198	2023-11-20	2023-11-28	enviado	193892.74	0.00	PayPal	1
2353	16	179	2026-05-31	2026-06-12	entregado	261307.29	5.00	OXXO	2
2354	1949	119	2024-05-02	2024-05-16	entregado	122092.07	20.00	tarjeta_debito	3
2355	1924	76	2024-09-17	2024-09-26	entregado	134370.24	20.00	PayPal	8
2356	233	96	2026-01-14	2026-01-20	entregado	26381.36	0.00	transferencia	2
2357	233	120	2026-02-12	2026-02-27	procesando	16828.59	5.00	tarjeta_credito	3
2358	989	37	2023-06-16	2023-06-19	pendiente	14039.28	10.00	tarjeta_credito	1
2359	1277	61	2023-07-13	2023-07-14	cancelado	83859.40	5.00	OXXO	4
2360	580	161	2025-10-21	2025-10-24	cancelado	67472.76	0.00	transferencia	1
2361	52	96	2025-03-29	2025-04-01	entregado	20406.75	0.00	tarjeta_debito	3
2362	1400	189	2024-06-24	2024-06-27	procesando	135087.66	0.00	efectivo	3
2363	1343	11	2025-07-11	2025-07-13	entregado	238124.95	0.00	transferencia	6
2364	1486	75	2025-07-07	2025-07-16	devuelto	184020.38	10.00	tarjeta_debito	7
2365	1012	174	2026-04-18	2026-04-20	procesando	151870.54	0.00	transferencia	2
2366	232	111	2023-10-26	2023-11-08	cancelado	18419.04	5.00	OXXO	3
2367	1952	154	2026-05-28	2026-05-31	entregado	19535.02	0.00	PayPal	7
2368	1792	66	2025-06-30	2025-07-07	entregado	59497.49	10.00	tarjeta_debito	3
2369	84	158	2024-10-07	2024-10-09	entregado	45400.42	10.00	efectivo	4
2370	1313	6	2024-11-09	2024-11-20	entregado	164906.69	10.00	tarjeta_credito	5
2371	1597	20	2026-02-07	2026-02-18	entregado	169069.55	0.00	efectivo	1
2372	1081	67	2023-08-19	2023-08-25	entregado	356008.07	0.00	transferencia	8
2373	128	60	2023-08-30	2023-09-08	entregado	26325.66	0.00	transferencia	1
2374	1503	2	2025-03-03	2025-03-04	procesando	60275.57	0.00	OXXO	5
2375	1702	11	2024-07-16	2024-07-31	enviado	189798.78	0.00	OXXO	1
2376	173	128	2025-07-12	2025-07-20	entregado	28405.63	5.00	transferencia	4
2377	1905	186	2025-09-03	2025-09-12	entregado	150022.79	0.00	OXXO	4
2378	268	3	2024-06-02	2024-06-04	entregado	82343.41	0.00	tarjeta_debito	5
2379	57	110	2025-05-07	2025-05-21	entregado	113637.56	0.00	PayPal	1
2380	746	8	2025-06-10	2025-06-15	entregado	166847.31	0.00	tarjeta_credito	8
2381	1307	183	2024-11-29	2024-12-13	devuelto	13759.43	10.00	OXXO	2
2382	944	13	2024-03-29	2024-04-03	enviado	380863.51	15.00	transferencia	7
2383	1869	131	2024-03-03	2024-03-07	enviado	174862.09	0.00	efectivo	1
2384	918	189	2026-04-21	2026-04-26	enviado	8286.78	5.00	tarjeta_credito	4
2385	1111	169	2023-07-10	2023-07-12	enviado	117376.94	15.00	tarjeta_credito	5
2386	1682	86	2024-02-29	2024-03-08	procesando	74076.33	0.00	transferencia	7
2387	1848	19	2024-07-19	2024-07-22	entregado	141051.15	0.00	tarjeta_credito	2
2388	992	10	2025-08-02	2025-08-15	entregado	149941.44	0.00	efectivo	2
2389	1909	124	2023-10-30	2023-11-12	procesando	136280.34	0.00	tarjeta_debito	4
2390	1137	2	2025-01-12	2025-01-24	devuelto	204411.96	20.00	efectivo	8
2391	1034	42	2023-12-23	2023-12-31	procesando	61392.66	0.00	tarjeta_debito	3
2392	122	159	2024-06-18	2024-06-29	enviado	23560.99	5.00	PayPal	5
2393	1074	145	2023-10-14	2023-10-27	entregado	110065.60	10.00	transferencia	3
2394	940	44	2025-05-18	2025-05-22	enviado	37655.27	0.00	transferencia	1
2395	335	180	2025-01-05	2025-01-06	pendiente	173954.08	5.00	PayPal	7
2396	1364	109	2025-05-07	2025-05-19	enviado	132597.37	5.00	transferencia	5
2397	1094	74	2024-12-13	2024-12-16	procesando	49774.46	0.00	PayPal	4
2398	654	186	2024-03-29	2024-04-11	procesando	178055.08	0.00	tarjeta_debito	2
2399	1133	188	2024-02-10	2024-02-21	entregado	155903.56	0.00	tarjeta_debito	8
2400	510	86	2025-03-06	2025-03-20	entregado	108957.20	0.00	tarjeta_credito	7
2401	1292	41	2026-02-16	2026-03-02	entregado	206352.91	0.00	tarjeta_debito	5
2402	1597	16	2025-10-16	2025-10-21	procesando	160620.90	0.00	efectivo	7
2403	1413	51	2025-01-04	2025-01-19	procesando	284494.68	0.00	transferencia	4
2404	822	44	2023-06-26	2023-07-05	entregado	161942.17	15.00	tarjeta_debito	6
2405	941	9	2024-11-08	2024-11-13	entregado	74614.24	0.00	OXXO	2
2406	1516	168	2024-09-22	2024-09-26	entregado	150179.19	0.00	tarjeta_debito	2
2407	159	27	2023-10-29	2023-11-04	entregado	102148.54	5.00	efectivo	6
2408	980	165	2024-10-28	2024-10-31	procesando	188261.43	0.00	PayPal	5
2409	368	161	2024-10-05	2024-10-12	entregado	158602.55	0.00	efectivo	2
2410	331	160	2025-10-27	2025-10-29	devuelto	49962.89	0.00	transferencia	3
2411	1848	65	2024-04-09	2024-04-14	entregado	82324.13	5.00	PayPal	8
2412	356	65	2023-12-21	2024-01-02	entregado	159344.99	0.00	PayPal	8
2413	768	196	2025-10-12	2025-10-18	entregado	165510.60	0.00	transferencia	6
2414	1658	31	2024-12-24	2024-12-30	devuelto	47009.97	5.00	PayPal	4
2415	1755	72	2023-10-02	2023-10-17	enviado	46859.59	15.00	tarjeta_debito	1
2416	696	120	2025-06-25	2025-06-30	entregado	72439.00	0.00	tarjeta_credito	1
2417	1484	129	2025-12-06	2025-12-09	entregado	66882.02	20.00	tarjeta_debito	8
2418	1096	164	2024-04-16	2024-04-19	entregado	110318.50	10.00	OXXO	2
2419	1887	69	2024-02-11	2024-02-12	entregado	8492.40	10.00	PayPal	7
2420	234	186	2026-04-18	2026-04-25	cancelado	89925.21	5.00	transferencia	4
2421	1536	115	2024-09-16	2024-09-26	entregado	177020.60	10.00	tarjeta_credito	8
2422	1225	180	2026-03-28	2026-04-04	entregado	25319.11	0.00	efectivo	8
2423	172	90	2026-05-24	2026-05-26	entregado	136689.91	0.00	tarjeta_credito	3
2424	1490	49	2025-12-27	2026-01-03	entregado	95089.31	15.00	tarjeta_credito	3
2425	1865	124	2025-07-08	2025-07-17	pendiente	74076.35	5.00	transferencia	4
2426	1309	35	2025-10-23	2025-11-07	entregado	175109.44	5.00	tarjeta_credito	5
2427	1531	180	2024-10-15	2024-10-18	entregado	147732.98	15.00	PayPal	7
2428	1563	98	2023-11-27	2023-12-06	cancelado	239812.72	0.00	tarjeta_credito	2
2429	586	22	2024-11-19	2024-12-03	entregado	88462.43	0.00	tarjeta_credito	8
2430	457	126	2025-06-29	2025-07-03	procesando	247453.74	5.00	transferencia	2
2431	1472	91	2024-05-18	2024-05-21	enviado	18420.66	15.00	efectivo	5
2432	936	83	2023-10-22	2023-11-03	entregado	183537.13	15.00	transferencia	3
2433	1215	59	2026-04-14	2026-04-20	entregado	229750.36	0.00	transferencia	4
2434	799	114	2024-01-04	2024-01-05	entregado	72231.45	10.00	tarjeta_credito	1
2435	756	151	2025-03-21	2025-03-31	entregado	110314.51	5.00	tarjeta_credito	6
2436	10	198	2024-11-14	2024-11-28	cancelado	37203.20	5.00	tarjeta_debito	6
2437	1993	112	2026-04-20	2026-05-04	entregado	178875.29	0.00	PayPal	7
2438	1268	162	2024-04-18	2024-04-25	procesando	95713.75	15.00	transferencia	4
2439	732	79	2023-10-27	2023-11-11	pendiente	27128.62	0.00	transferencia	6
2440	1732	21	2025-06-25	2025-06-27	entregado	12691.75	5.00	tarjeta_debito	7
2441	339	170	2025-09-04	2025-09-11	entregado	90388.70	5.00	tarjeta_credito	1
2442	1795	34	2024-11-20	2024-11-26	enviado	272783.15	0.00	efectivo	4
2443	659	104	2024-05-08	2024-05-12	entregado	13610.57	10.00	OXXO	4
2444	964	198	2023-11-26	2023-12-09	procesando	306251.29	5.00	tarjeta_credito	8
2445	1481	107	2024-05-30	2024-06-12	procesando	302395.88	0.00	tarjeta_debito	8
2446	1793	65	2024-06-19	2024-07-01	pendiente	160325.34	0.00	tarjeta_credito	3
2447	350	85	2024-10-25	2024-11-01	entregado	233314.30	5.00	OXXO	1
2448	169	169	2023-09-08	2023-09-21	entregado	289582.47	0.00	tarjeta_debito	8
2449	1207	193	2025-06-18	2025-06-28	entregado	84673.00	5.00	transferencia	6
2450	1797	42	2025-04-09	2025-04-22	enviado	191753.60	0.00	OXXO	1
2451	292	16	2025-03-10	2025-03-21	enviado	44575.65	0.00	transferencia	1
2452	121	144	2024-12-21	2025-01-03	entregado	27344.18	5.00	tarjeta_credito	3
2453	580	37	2024-02-13	2024-02-23	procesando	28028.24	0.00	efectivo	4
2454	1715	178	2024-07-14	2024-07-16	procesando	98765.94	0.00	PayPal	8
2455	769	181	2025-01-20	2025-01-26	entregado	39397.81	0.00	tarjeta_credito	5
2456	268	186	2024-01-04	2024-01-16	entregado	114006.28	0.00	PayPal	6
2457	289	6	2024-03-19	2024-04-01	entregado	139357.95	0.00	transferencia	2
2458	142	135	2023-08-26	2023-09-04	entregado	206792.63	0.00	PayPal	3
2459	1333	98	2024-06-26	2024-07-06	pendiente	18689.10	0.00	tarjeta_debito	1
2460	588	27	2026-01-27	2026-02-04	entregado	36035.21	15.00	transferencia	1
2461	503	52	2025-02-23	2025-02-24	enviado	137481.57	0.00	efectivo	2
2462	1084	167	2024-10-02	2024-10-06	entregado	82382.68	10.00	transferencia	1
2463	1362	47	2026-05-10	2026-05-21	enviado	89873.98	0.00	tarjeta_debito	8
2464	1865	142	2026-03-05	2026-03-17	entregado	130907.30	15.00	tarjeta_credito	4
2465	1905	107	2023-09-21	2023-10-03	devuelto	176214.67	15.00	transferencia	8
2466	1604	119	2023-11-23	2023-11-27	cancelado	5816.54	0.00	transferencia	7
2467	638	92	2024-06-28	2024-07-03	entregado	156708.95	15.00	tarjeta_debito	5
2468	1843	130	2025-10-28	2025-11-07	entregado	16926.43	15.00	efectivo	4
2469	734	198	2025-10-27	2025-10-29	pendiente	25166.29	0.00	PayPal	4
2470	1176	81	2024-05-12	2024-05-16	entregado	72294.57	0.00	PayPal	3
2471	394	177	2025-01-17	2025-01-21	procesando	222106.69	15.00	tarjeta_debito	6
2472	1391	191	2026-01-19	2026-01-24	devuelto	59635.53	5.00	efectivo	1
2473	952	6	2025-08-22	2025-08-29	entregado	33357.17	0.00	transferencia	1
2474	790	113	2024-11-12	2024-11-24	entregado	47182.95	5.00	tarjeta_credito	5
2475	627	130	2023-10-08	2023-10-15	entregado	39491.08	15.00	transferencia	5
2476	1152	63	2025-01-05	2025-01-16	entregado	2599.00	5.00	PayPal	8
2477	511	14	2025-06-20	2025-06-30	entregado	173931.50	0.00	efectivo	8
2478	1881	44	2024-07-05	2024-07-08	procesando	363426.47	0.00	OXXO	6
2479	1039	159	2025-04-15	2025-04-23	entregado	79368.72	0.00	efectivo	3
2480	1100	68	2023-06-21	2023-07-04	enviado	1474.84	15.00	PayPal	5
2481	1701	155	2024-06-08	2024-06-10	entregado	270927.20	10.00	PayPal	2
2482	1535	181	2024-11-23	2024-11-29	cancelado	28663.85	0.00	efectivo	5
2483	886	65	2024-08-22	2024-08-25	entregado	71433.25	5.00	tarjeta_credito	5
2484	149	95	2025-06-29	2025-07-04	cancelado	121119.63	20.00	OXXO	7
2485	1015	138	2024-05-24	2024-05-30	entregado	81564.65	15.00	tarjeta_credito	8
2486	1561	125	2024-07-02	2024-07-15	entregado	135543.04	15.00	efectivo	7
2487	925	12	2025-03-01	2025-03-08	entregado	25038.05	10.00	efectivo	1
2488	1522	33	2023-08-15	2023-08-27	entregado	212198.48	10.00	efectivo	2
2489	946	124	2026-04-06	2026-04-20	enviado	218411.77	0.00	OXXO	7
2490	88	173	2025-01-19	2025-01-21	entregado	88551.75	0.00	efectivo	1
2491	1529	125	2025-09-23	2025-10-06	procesando	85379.72	0.00	efectivo	6
2492	986	83	2025-06-13	2025-06-21	entregado	70991.83	5.00	OXXO	4
2493	1781	33	2024-03-15	2024-03-23	procesando	91117.32	5.00	tarjeta_credito	6
2494	1393	14	2024-01-27	2024-02-11	pendiente	126542.05	5.00	PayPal	2
2495	712	92	2023-10-27	2023-10-29	procesando	118939.44	0.00	transferencia	7
2496	166	108	2024-02-13	2024-02-22	devuelto	30765.06	15.00	tarjeta_credito	4
2497	862	192	2025-02-07	2025-02-14	entregado	95265.24	5.00	efectivo	6
2498	643	31	2024-02-16	2024-02-18	cancelado	151138.49	0.00	tarjeta_debito	6
2499	851	49	2025-05-24	2025-05-27	entregado	127747.84	0.00	tarjeta_credito	3
2500	765	102	2024-03-06	2024-03-08	enviado	24234.30	0.00	tarjeta_debito	7
2501	1851	146	2023-12-01	2023-12-15	procesando	13329.48	0.00	OXXO	7
2502	1188	125	2024-09-27	2024-10-06	entregado	27800.05	10.00	PayPal	7
2503	1515	51	2025-12-19	2025-12-29	entregado	1571.69	0.00	efectivo	3
2504	1014	161	2026-02-27	2026-03-04	procesando	60680.67	0.00	tarjeta_debito	3
2505	1561	89	2026-01-02	2026-01-09	entregado	4993.53	0.00	tarjeta_credito	3
2506	989	73	2024-03-03	2024-03-13	pendiente	67851.46	10.00	tarjeta_credito	8
2507	800	53	2025-11-02	2025-11-15	enviado	273316.28	5.00	PayPal	7
2508	500	120	2026-05-08	2026-05-22	enviado	115720.65	5.00	tarjeta_debito	7
2509	10	108	2025-08-08	2025-08-11	entregado	116840.98	0.00	efectivo	7
2510	964	53	2024-06-19	2024-06-27	entregado	17706.36	0.00	OXXO	5
2511	341	197	2023-07-11	2023-07-16	cancelado	92267.08	0.00	efectivo	1
2512	1717	182	2026-03-31	2026-04-04	cancelado	780.14	0.00	tarjeta_debito	1
2513	447	193	2025-09-23	2025-09-28	procesando	202924.93	0.00	transferencia	5
2514	1772	178	2024-04-22	2024-04-26	procesando	45435.95	0.00	OXXO	4
2515	1612	88	2024-02-16	2024-02-18	entregado	59368.29	5.00	tarjeta_debito	1
2516	1978	63	2026-06-05	2026-06-16	cancelado	96497.55	15.00	OXXO	6
2517	1036	171	2024-02-17	2024-02-20	procesando	17094.17	5.00	tarjeta_debito	2
2518	1455	27	2025-12-01	2025-12-12	pendiente	195544.80	5.00	tarjeta_credito	8
2519	993	155	2026-04-11	2026-04-24	pendiente	129144.26	5.00	transferencia	7
2520	806	59	2024-03-30	2024-04-10	procesando	89090.29	5.00	transferencia	3
2521	1039	19	2025-01-23	2025-01-26	entregado	48469.54	10.00	PayPal	5
2522	689	3	2025-05-13	2025-05-17	devuelto	55636.07	0.00	tarjeta_credito	3
2523	1368	170	2024-11-19	2024-11-20	cancelado	60895.10	0.00	tarjeta_debito	6
2524	1297	177	2025-05-02	2025-05-13	procesando	191035.78	5.00	tarjeta_debito	5
2525	1515	88	2025-09-26	2025-10-10	procesando	72156.45	20.00	efectivo	7
2526	925	26	2024-07-10	2024-07-11	cancelado	30059.42	10.00	OXXO	4
2527	112	95	2024-03-09	2024-03-18	entregado	90321.45	0.00	tarjeta_credito	3
2528	1436	198	2024-03-18	2024-03-24	entregado	169701.91	10.00	PayPal	5
2529	1630	139	2026-01-15	2026-01-24	entregado	9641.00	10.00	PayPal	4
2530	1040	129	2025-06-30	2025-07-15	entregado	128774.03	10.00	efectivo	2
2531	567	151	2023-10-29	2023-11-06	entregado	126742.11	0.00	tarjeta_credito	4
2532	820	186	2025-12-20	2025-12-27	cancelado	230123.67	0.00	efectivo	3
2533	1041	43	2025-09-10	2025-09-22	pendiente	175458.60	10.00	tarjeta_credito	6
2534	1345	69	2026-04-24	2026-05-09	cancelado	86850.22	0.00	efectivo	5
2535	1189	200	2024-10-12	2024-10-16	procesando	341827.48	10.00	efectivo	6
2536	939	123	2024-02-24	2024-03-09	entregado	24828.73	10.00	tarjeta_debito	7
2537	703	161	2024-07-15	2024-07-16	procesando	42656.87	20.00	tarjeta_credito	2
2538	1429	95	2024-07-02	2024-07-14	entregado	178271.43	0.00	tarjeta_debito	3
2539	1938	54	2024-05-26	2024-06-10	procesando	62543.58	10.00	transferencia	1
2540	1892	30	2024-11-05	2024-11-07	entregado	266179.03	0.00	transferencia	7
2541	218	144	2024-08-10	2024-08-21	entregado	30372.03	0.00	PayPal	8
2542	1096	11	2023-12-27	2023-12-30	entregado	101706.74	0.00	tarjeta_debito	4
2543	1128	141	2025-11-18	2025-11-20	entregado	27422.43	10.00	PayPal	7
2544	812	123	2024-01-16	2024-01-20	entregado	59472.02	15.00	tarjeta_debito	8
2545	458	76	2025-01-15	2025-01-24	entregado	102557.15	15.00	efectivo	7
2546	990	1	2023-11-12	2023-11-23	entregado	46020.38	5.00	tarjeta_credito	6
2547	831	169	2024-08-13	2024-08-21	cancelado	5525.98	10.00	tarjeta_debito	7
2548	1002	123	2026-04-03	2026-04-09	entregado	36968.23	10.00	tarjeta_debito	4
2549	156	101	2025-01-13	2025-01-25	enviado	56423.85	5.00	OXXO	6
2550	555	109	2023-06-17	2023-06-25	procesando	210899.44	0.00	OXXO	1
2551	1547	91	2023-07-18	2023-07-27	entregado	177031.43	0.00	tarjeta_debito	6
2552	435	25	2025-09-05	2025-09-15	cancelado	104840.86	0.00	transferencia	3
2553	648	70	2023-09-01	2023-09-14	enviado	65467.72	0.00	tarjeta_credito	6
2554	1057	14	2024-09-23	2024-09-24	cancelado	107990.45	10.00	transferencia	2
2555	1704	81	2023-10-29	2023-11-11	procesando	62781.80	0.00	tarjeta_credito	1
2556	1979	9	2023-12-01	2023-12-05	enviado	74070.00	15.00	efectivo	7
2557	904	195	2025-02-22	2025-03-05	entregado	85383.57	0.00	tarjeta_debito	7
2558	1543	147	2025-02-21	2025-03-07	enviado	50541.12	20.00	PayPal	5
2559	215	54	2025-11-04	2025-11-14	enviado	146722.12	15.00	transferencia	8
2560	139	135	2025-03-20	2025-03-23	entregado	66939.67	20.00	efectivo	5
2561	258	170	2025-01-09	2025-01-20	procesando	37316.00	0.00	OXXO	2
2562	213	23	2026-03-18	2026-03-22	procesando	190305.26	5.00	OXXO	1
2563	1184	76	2025-07-06	2025-07-17	enviado	155314.71	0.00	tarjeta_debito	6
2564	1157	115	2026-03-29	2026-04-10	procesando	104838.46	10.00	tarjeta_debito	4
2565	1143	139	2023-12-08	2023-12-19	entregado	117191.75	0.00	transferencia	1
2566	1296	100	2025-07-08	2025-07-22	procesando	305643.99	5.00	efectivo	2
2567	1832	52	2024-09-15	2024-09-16	enviado	98110.40	5.00	transferencia	4
2568	1094	119	2024-11-01	2024-11-06	procesando	122879.08	5.00	tarjeta_credito	2
2569	1046	51	2024-02-28	2024-03-03	entregado	206441.80	10.00	OXXO	4
2570	1298	160	2023-12-08	2023-12-20	entregado	40499.98	0.00	transferencia	4
2571	1045	43	2026-06-02	2026-06-10	entregado	5600.18	15.00	PayPal	2
2572	1129	84	2025-10-14	2025-10-18	entregado	275972.09	15.00	tarjeta_credito	8
2573	1044	107	2026-02-16	2026-02-22	entregado	2879.78	0.00	transferencia	8
2574	147	152	2025-09-05	2025-09-17	procesando	96619.93	10.00	PayPal	3
2575	1564	9	2025-03-02	2025-03-03	pendiente	29320.08	5.00	transferencia	6
2576	1647	113	2024-12-06	2024-12-07	entregado	21367.88	5.00	tarjeta_debito	4
2577	1392	4	2025-04-09	2025-04-16	entregado	107701.67	0.00	PayPal	8
2578	227	153	2025-06-29	2025-07-04	procesando	172176.30	0.00	tarjeta_debito	7
2579	663	88	2023-11-01	2023-11-03	entregado	64379.23	0.00	PayPal	7
2580	977	67	2024-05-28	2024-05-30	procesando	182382.72	0.00	tarjeta_debito	8
2581	730	196	2025-06-13	2025-06-19	entregado	273582.33	0.00	efectivo	3
2582	1754	83	2025-08-30	2025-09-11	entregado	36527.44	10.00	PayPal	1
2583	1449	29	2023-07-11	2023-07-17	pendiente	121072.64	10.00	tarjeta_credito	2
2584	645	189	2024-01-07	2024-01-15	pendiente	234831.76	10.00	PayPal	6
2585	153	82	2023-11-13	2023-11-20	entregado	61394.98	0.00	tarjeta_credito	6
2586	124	170	2024-02-15	2024-02-28	cancelado	161468.88	20.00	tarjeta_credito	4
2587	1033	189	2025-04-08	2025-04-10	cancelado	33791.25	0.00	transferencia	6
2588	1439	16	2025-06-13	2025-06-26	entregado	71960.40	5.00	transferencia	1
2589	510	161	2024-10-07	2024-10-19	procesando	30520.40	0.00	tarjeta_debito	4
2590	1750	53	2025-08-07	2025-08-11	entregado	210282.53	20.00	efectivo	3
2591	572	197	2024-08-23	2024-08-31	entregado	128233.26	0.00	efectivo	8
2592	1748	136	2025-09-11	2025-09-18	entregado	24139.83	5.00	OXXO	4
2593	1647	43	2024-12-07	2024-12-18	procesando	136568.11	15.00	transferencia	2
2594	774	29	2023-07-02	2023-07-14	procesando	110601.58	10.00	OXXO	7
2595	1188	119	2025-01-14	2025-01-22	entregado	197484.32	10.00	tarjeta_debito	8
2596	51	54	2024-07-06	2024-07-17	devuelto	172714.10	0.00	transferencia	3
2597	847	135	2025-11-27	2025-12-07	devuelto	103301.03	0.00	tarjeta_credito	3
2598	367	186	2024-11-14	2024-11-16	procesando	72531.68	10.00	tarjeta_debito	4
2599	286	131	2026-06-10	2026-06-24	pendiente	51380.75	20.00	transferencia	3
2600	714	62	2025-01-14	2025-01-28	procesando	19606.75	15.00	efectivo	5
2601	700	95	2024-11-19	2024-11-21	cancelado	133390.97	5.00	efectivo	4
2602	176	67	2026-06-04	2026-06-05	pendiente	104276.24	0.00	tarjeta_debito	1
2603	416	41	2023-08-12	2023-08-15	entregado	184752.05	0.00	OXXO	5
2604	1784	157	2026-05-24	2026-05-29	devuelto	12221.60	5.00	PayPal	7
2605	738	114	2025-11-18	2025-11-25	cancelado	90738.44	5.00	OXXO	7
2606	1340	36	2025-12-04	2025-12-08	entregado	176690.04	10.00	efectivo	1
2607	1075	107	2025-06-23	2025-07-07	enviado	278227.60	15.00	efectivo	7
2608	599	161	2025-04-07	2025-04-12	entregado	9094.22	0.00	OXXO	3
2609	432	6	2025-06-28	2025-07-12	entregado	29577.88	0.00	PayPal	5
2610	810	120	2025-03-31	2025-04-07	entregado	137773.15	0.00	tarjeta_debito	1
2611	1745	142	2024-10-18	2024-10-25	entregado	69696.75	0.00	OXXO	7
2612	1982	39	2023-07-25	2023-08-07	entregado	159425.41	15.00	OXXO	7
2613	639	156	2026-03-03	2026-03-12	cancelado	89152.02	0.00	OXXO	8
2614	577	147	2025-12-28	2026-01-08	entregado	144383.10	10.00	tarjeta_debito	5
2615	1748	167	2025-03-13	2025-03-27	devuelto	245826.03	0.00	tarjeta_credito	1
2616	1461	177	2025-11-23	2025-11-30	entregado	96615.58	10.00	transferencia	3
2617	1540	37	2023-07-04	2023-07-09	entregado	94302.03	0.00	tarjeta_credito	5
2618	1537	1	2023-06-15	2023-06-26	entregado	281448.93	5.00	transferencia	3
2619	334	148	2024-06-21	2024-06-23	procesando	198606.20	0.00	tarjeta_credito	5
2620	1080	110	2025-12-30	2025-12-31	entregado	116687.06	20.00	transferencia	1
2621	1516	169	2026-02-08	2026-02-11	cancelado	257123.22	15.00	efectivo	7
2622	1211	5	2025-11-11	2025-11-19	entregado	45381.16	5.00	tarjeta_debito	2
2623	1862	185	2024-04-25	2024-05-10	cancelado	90555.55	15.00	efectivo	2
2624	1976	7	2024-02-10	2024-02-17	enviado	102999.38	5.00	efectivo	6
2625	964	57	2025-08-13	2025-08-28	entregado	161912.79	0.00	tarjeta_debito	5
2626	314	55	2023-07-03	2023-07-13	entregado	142548.30	0.00	efectivo	1
2627	944	20	2026-01-24	2026-02-04	pendiente	252035.40	5.00	tarjeta_debito	6
2628	50	44	2025-01-28	2025-02-08	procesando	87234.47	20.00	OXXO	1
2629	1722	109	2024-01-05	2024-01-13	entregado	123636.26	5.00	tarjeta_debito	4
2630	1346	51	2025-10-05	2025-10-13	procesando	133238.84	0.00	PayPal	6
2631	731	66	2026-01-27	2026-01-30	enviado	50219.49	10.00	PayPal	3
2632	600	193	2025-06-12	2025-06-15	entregado	95542.07	10.00	PayPal	2
2633	731	168	2025-06-06	2025-06-07	enviado	116860.46	15.00	OXXO	6
2634	285	29	2023-12-22	2024-01-05	entregado	241979.87	0.00	tarjeta_debito	7
2635	1244	111	2025-07-06	2025-07-12	devuelto	100187.73	15.00	tarjeta_credito	8
2636	1509	59	2025-09-06	2025-09-11	procesando	242556.07	5.00	tarjeta_debito	5
2637	489	14	2025-01-22	2025-02-05	devuelto	101132.39	10.00	efectivo	1
2638	1520	194	2025-07-02	2025-07-10	entregado	28612.40	0.00	tarjeta_debito	4
2639	1150	59	2023-08-11	2023-08-16	entregado	15787.28	10.00	OXXO	4
2640	987	165	2024-03-29	2024-04-04	entregado	136485.27	5.00	PayPal	5
2641	317	188	2024-06-12	2024-06-24	enviado	351503.58	0.00	tarjeta_credito	7
2642	1312	66	2025-11-27	2025-12-02	enviado	182371.72	5.00	tarjeta_debito	1
2643	1056	82	2026-05-01	2026-05-07	devuelto	121181.63	10.00	efectivo	8
2644	1354	28	2024-07-26	2024-08-05	entregado	39397.76	0.00	PayPal	3
2645	1867	55	2023-10-30	2023-11-07	entregado	134423.93	0.00	tarjeta_credito	8
2646	519	74	2025-01-01	2025-01-09	enviado	152204.16	0.00	tarjeta_credito	2
2647	966	32	2023-09-23	2023-09-28	cancelado	121396.55	0.00	tarjeta_debito	5
2648	731	101	2023-06-26	2023-07-07	pendiente	184718.04	5.00	PayPal	7
2649	675	173	2023-09-19	2023-10-02	entregado	8358.65	0.00	efectivo	7
2650	830	97	2026-06-01	2026-06-09	entregado	50655.73	0.00	OXXO	1
2651	1572	75	2023-10-23	2023-10-28	entregado	133678.64	0.00	tarjeta_credito	1
2652	396	112	2023-07-19	2023-07-29	entregado	72733.15	5.00	efectivo	3
2653	1619	137	2024-11-11	2024-11-12	entregado	4374.29	5.00	efectivo	2
2654	824	5	2025-09-04	2025-09-11	enviado	78053.74	10.00	transferencia	8
2655	765	34	2024-01-12	2024-01-19	enviado	28373.23	15.00	tarjeta_credito	4
2656	1365	190	2025-11-21	2025-11-28	entregado	5366.68	0.00	tarjeta_credito	8
2657	646	39	2024-12-23	2025-01-06	enviado	42051.48	0.00	efectivo	4
2658	999	99	2024-12-10	2024-12-13	enviado	967.11	15.00	PayPal	4
2659	1549	157	2025-03-18	2025-03-19	entregado	230423.33	5.00	efectivo	4
2660	1228	94	2025-09-07	2025-09-19	procesando	647.42	10.00	tarjeta_credito	6
2661	386	47	2023-10-27	2023-11-11	entregado	117876.99	10.00	tarjeta_credito	2
2662	173	66	2023-09-14	2023-09-28	procesando	154294.44	0.00	efectivo	5
2663	1490	126	2025-04-24	2025-05-05	cancelado	110594.40	0.00	transferencia	1
2664	565	195	2026-03-22	2026-04-01	devuelto	134302.09	0.00	tarjeta_credito	5
2665	747	100	2024-07-23	2024-08-02	entregado	773.73	0.00	PayPal	7
2666	193	200	2026-04-08	2026-04-19	entregado	34629.45	5.00	tarjeta_credito	6
2667	963	53	2024-03-11	2024-03-20	pendiente	41928.74	10.00	tarjeta_credito	1
2668	1063	191	2026-05-01	2026-05-06	cancelado	202225.95	10.00	transferencia	6
2669	880	160	2024-11-19	2024-12-04	entregado	451851.69	0.00	OXXO	3
2670	1649	27	2023-08-17	2023-08-28	procesando	204098.38	0.00	transferencia	2
2671	1388	185	2024-01-24	2024-02-08	enviado	83027.28	0.00	efectivo	8
2672	371	60	2024-02-22	2024-02-26	entregado	78840.92	0.00	tarjeta_credito	5
2673	1102	85	2023-12-24	2024-01-02	pendiente	79402.44	0.00	tarjeta_credito	3
2674	789	84	2023-10-08	2023-10-20	entregado	10289.32	10.00	PayPal	3
2675	1723	198	2025-10-14	2025-10-17	cancelado	54313.97	10.00	PayPal	6
2676	1868	167	2025-07-09	2025-07-14	enviado	210599.00	5.00	tarjeta_credito	7
2677	53	164	2023-06-22	2023-06-27	entregado	35645.44	5.00	OXXO	6
2678	1794	95	2025-05-12	2025-05-20	procesando	18005.39	0.00	efectivo	4
2679	934	107	2025-04-21	2025-04-23	enviado	23594.99	0.00	transferencia	8
2680	45	127	2025-10-02	2025-10-09	procesando	105928.86	10.00	efectivo	2
2681	555	192	2024-09-24	2024-09-25	entregado	71779.19	10.00	efectivo	1
2682	1607	114	2024-05-16	2024-05-23	entregado	63151.00	0.00	tarjeta_credito	1
2683	1489	109	2024-09-10	2024-09-23	entregado	241.17	10.00	PayPal	8
2684	326	150	2024-02-21	2024-03-01	procesando	238283.68	0.00	PayPal	6
2685	1535	79	2025-07-31	2025-08-08	pendiente	152013.94	10.00	efectivo	8
2686	1180	190	2025-08-10	2025-08-25	cancelado	115542.89	0.00	OXXO	8
2687	1413	50	2024-02-21	2024-02-28	enviado	15080.52	15.00	efectivo	8
2688	1501	94	2023-08-05	2023-08-20	cancelado	90813.19	10.00	OXXO	4
2689	1956	171	2023-09-24	2023-10-09	entregado	63769.57	0.00	OXXO	6
2690	385	151	2025-08-23	2025-08-29	enviado	120203.82	5.00	transferencia	8
2691	942	31	2024-08-17	2024-08-21	procesando	132911.47	0.00	OXXO	2
2692	974	75	2025-03-09	2025-03-21	entregado	64805.81	0.00	tarjeta_debito	6
2693	773	16	2026-03-08	2026-03-13	entregado	70497.81	15.00	transferencia	7
2694	1735	127	2023-11-02	2023-11-08	entregado	66802.05	10.00	tarjeta_credito	8
2695	227	40	2023-12-07	2023-12-17	devuelto	151049.50	10.00	transferencia	2
2696	900	111	2025-04-01	2025-04-13	devuelto	162976.39	0.00	efectivo	3
2697	1427	118	2025-07-24	2025-08-03	procesando	10633.17	15.00	OXXO	5
2698	432	132	2025-11-17	2025-11-25	pendiente	104331.91	0.00	transferencia	3
2699	1911	43	2023-12-27	2023-12-28	entregado	185721.25	0.00	tarjeta_debito	2
2700	812	164	2025-02-21	2025-03-03	entregado	47083.54	5.00	transferencia	5
2701	1815	124	2025-09-26	2025-10-02	entregado	30034.76	10.00	transferencia	8
2702	1826	132	2025-07-24	2025-08-04	entregado	111574.25	0.00	PayPal	1
2703	801	178	2025-11-03	2025-11-09	procesando	34969.71	10.00	tarjeta_credito	3
2704	805	17	2025-02-10	2025-02-15	entregado	132647.91	5.00	transferencia	4
2705	192	35	2025-07-30	2025-08-12	procesando	131178.61	0.00	OXXO	7
2706	787	113	2024-01-02	2024-01-09	devuelto	150672.15	0.00	tarjeta_credito	6
2707	480	189	2025-06-10	2025-06-15	entregado	3152.94	20.00	tarjeta_credito	7
2708	1158	72	2025-03-15	2025-03-21	entregado	182412.20	0.00	PayPal	7
2709	1871	19	2023-10-30	2023-11-08	procesando	143186.18	0.00	tarjeta_credito	4
2710	1999	133	2026-04-07	2026-04-13	entregado	17063.67	0.00	tarjeta_debito	7
2711	1589	114	2024-04-14	2024-04-19	entregado	73231.52	10.00	tarjeta_debito	7
2712	226	81	2025-10-10	2025-10-11	entregado	238679.18	20.00	efectivo	6
2713	1020	3	2024-05-27	2024-05-30	enviado	140164.45	0.00	PayPal	7
2714	1089	127	2024-12-12	2024-12-17	entregado	12549.30	10.00	efectivo	7
2715	1344	45	2024-08-29	2024-09-07	entregado	90025.81	0.00	transferencia	4
2716	643	111	2026-04-21	2026-04-22	entregado	89824.56	0.00	OXXO	6
2717	129	94	2025-12-15	2025-12-23	cancelado	72348.75	20.00	transferencia	6
2718	155	150	2025-04-26	2025-05-04	cancelado	131876.94	0.00	efectivo	4
2719	138	45	2023-11-24	2023-12-07	entregado	67253.56	10.00	efectivo	6
2720	1086	166	2026-05-02	2026-05-13	entregado	25363.19	20.00	transferencia	3
2721	230	51	2024-12-08	2024-12-15	procesando	11199.15	0.00	OXXO	7
2722	158	82	2025-08-11	2025-08-23	cancelado	90855.85	0.00	efectivo	4
2723	310	37	2025-09-23	2025-10-07	procesando	65631.36	0.00	transferencia	1
2724	1519	174	2023-08-02	2023-08-04	devuelto	190174.11	0.00	efectivo	2
2725	344	150	2023-12-18	2023-12-20	enviado	22690.58	5.00	tarjeta_credito	5
2726	505	115	2024-10-01	2024-10-10	procesando	140368.12	15.00	OXXO	2
2727	1658	35	2024-03-11	2024-03-20	entregado	251894.17	10.00	PayPal	4
2728	17	187	2026-05-13	2026-05-22	cancelado	83043.00	0.00	PayPal	1
2729	676	168	2023-08-06	2023-08-07	enviado	279691.17	0.00	tarjeta_debito	4
2730	579	183	2026-04-21	2026-04-27	devuelto	42477.73	5.00	OXXO	2
2731	1424	185	2026-03-05	2026-03-11	entregado	177258.68	15.00	tarjeta_debito	6
2732	1961	165	2023-07-16	2023-07-28	cancelado	39036.93	0.00	PayPal	1
2733	1300	48	2025-11-07	2025-11-20	entregado	111082.03	0.00	transferencia	7
2734	1165	78	2024-02-06	2024-02-07	pendiente	114423.17	20.00	tarjeta_credito	3
2735	1869	75	2024-01-13	2024-01-21	cancelado	139833.96	10.00	tarjeta_debito	2
2736	306	181	2024-07-01	2024-07-11	enviado	266040.16	0.00	tarjeta_debito	1
2737	937	69	2023-08-04	2023-08-18	enviado	17384.45	10.00	PayPal	6
2738	1227	20	2025-06-24	2025-07-01	entregado	67002.30	5.00	tarjeta_credito	4
2739	459	21	2024-12-27	2025-01-08	entregado	77942.27	0.00	OXXO	6
2740	1015	184	2025-10-09	2025-10-22	entregado	43778.58	0.00	PayPal	2
2741	433	6	2024-11-04	2024-11-14	enviado	132367.81	10.00	efectivo	4
2742	1899	129	2024-03-22	2024-03-27	enviado	116611.80	0.00	efectivo	1
2743	1083	99	2025-08-20	2025-09-04	procesando	281963.65	15.00	efectivo	4
2744	1627	34	2025-09-24	2025-10-08	entregado	196371.86	0.00	tarjeta_debito	5
2745	1830	187	2023-09-14	2023-09-21	entregado	578.14	15.00	transferencia	2
2746	1829	56	2024-05-27	2024-06-10	cancelado	23211.50	10.00	transferencia	5
2747	657	140	2024-03-21	2024-03-23	enviado	58384.83	0.00	efectivo	4
2748	1181	63	2024-09-10	2024-09-25	devuelto	120760.04	5.00	efectivo	5
2749	1298	72	2025-08-27	2025-09-07	enviado	23566.27	5.00	efectivo	2
2750	1208	45	2026-05-11	2026-05-18	enviado	50070.72	0.00	PayPal	4
2751	365	95	2024-02-13	2024-02-26	entregado	2158.30	0.00	OXXO	3
2752	285	62	2024-02-14	2024-02-23	entregado	116714.25	10.00	transferencia	6
2753	473	66	2025-10-03	2025-10-12	entregado	180951.31	10.00	OXXO	6
2754	1977	87	2023-10-22	2023-11-05	enviado	15220.71	10.00	tarjeta_credito	3
2755	1854	35	2023-07-25	2023-07-26	entregado	161494.24	0.00	tarjeta_credito	1
2756	862	34	2024-10-13	2024-10-19	cancelado	243532.74	0.00	OXXO	7
2757	1353	195	2024-11-02	2024-11-07	entregado	122357.30	10.00	OXXO	4
2758	569	25	2024-11-11	2024-11-23	entregado	177279.76	0.00	OXXO	4
2759	382	62	2025-10-01	2025-10-15	enviado	5199.73	10.00	OXXO	7
2760	1980	120	2026-03-01	2026-03-16	entregado	121105.09	5.00	OXXO	5
2761	964	124	2025-09-06	2025-09-19	entregado	51247.12	15.00	tarjeta_credito	1
2762	605	1	2025-02-25	2025-03-06	entregado	76822.08	10.00	PayPal	3
2763	808	5	2025-12-20	2025-12-31	enviado	32604.86	0.00	transferencia	6
2764	1320	57	2025-05-22	2025-06-05	pendiente	28369.90	15.00	tarjeta_debito	3
2765	665	55	2025-03-06	2025-03-16	entregado	136334.75	0.00	efectivo	8
2766	977	116	2025-06-05	2025-06-13	entregado	140007.84	0.00	OXXO	6
2767	99	43	2025-11-05	2025-11-16	cancelado	30896.09	5.00	efectivo	3
2768	191	26	2024-11-11	2024-11-20	entregado	241898.06	20.00	tarjeta_debito	7
2769	389	136	2025-02-25	2025-03-07	cancelado	1984.75	10.00	PayPal	8
2770	1111	130	2024-10-10	2024-10-13	cancelado	47140.94	0.00	OXXO	5
2771	947	85	2025-01-22	2025-01-28	procesando	58399.60	10.00	efectivo	8
2772	1542	122	2026-02-17	2026-03-04	entregado	211216.86	10.00	OXXO	4
2773	1398	151	2025-06-13	2025-06-22	entregado	96060.68	0.00	OXXO	1
2774	308	82	2024-09-14	2024-09-21	entregado	58244.98	0.00	OXXO	8
2775	1213	75	2024-02-20	2024-03-03	devuelto	173211.26	5.00	PayPal	2
2776	1065	195	2023-07-19	2023-08-01	entregado	150058.15	10.00	OXXO	2
2777	1789	58	2024-08-14	2024-08-24	procesando	131511.33	10.00	efectivo	3
2778	1443	17	2025-10-19	2025-10-31	enviado	119186.02	10.00	tarjeta_debito	4
2779	1952	162	2024-07-31	2024-08-11	entregado	15381.14	5.00	transferencia	4
2780	1013	125	2024-01-28	2024-01-31	entregado	89259.40	0.00	PayPal	7
2781	1810	91	2024-10-21	2024-11-03	devuelto	57850.96	15.00	transferencia	8
2782	1168	22	2023-10-05	2023-10-14	enviado	25747.20	0.00	tarjeta_debito	1
2783	91	141	2025-10-02	2025-10-03	procesando	49754.43	0.00	efectivo	3
2784	1034	105	2024-02-10	2024-02-20	entregado	33714.06	0.00	tarjeta_credito	6
2785	1001	83	2024-07-15	2024-07-17	entregado	97451.52	5.00	tarjeta_credito	7
2786	912	26	2026-05-14	2026-05-25	enviado	23298.72	0.00	efectivo	6
2787	1055	178	2023-09-25	2023-10-10	entregado	157296.39	0.00	tarjeta_debito	8
2788	1757	173	2024-10-19	2024-11-03	devuelto	172597.97	5.00	transferencia	7
2789	716	181	2025-09-21	2025-10-01	entregado	185532.18	5.00	tarjeta_credito	6
2790	236	117	2025-09-30	2025-10-10	entregado	280006.56	10.00	tarjeta_credito	3
2791	1337	56	2025-01-03	2025-01-07	procesando	58917.17	0.00	tarjeta_debito	7
2792	949	96	2023-12-08	2023-12-19	entregado	139103.46	0.00	efectivo	3
2793	795	197	2024-07-26	2024-08-04	cancelado	35147.32	0.00	tarjeta_debito	2
2794	19	77	2023-12-28	2024-01-07	entregado	23443.96	0.00	transferencia	2
2795	1290	176	2025-06-03	2025-06-17	enviado	121101.62	20.00	transferencia	2
2796	1926	170	2026-03-31	2026-04-08	cancelado	125838.07	20.00	transferencia	7
2797	1238	196	2023-08-28	2023-09-11	procesando	123281.31	0.00	OXXO	2
2798	941	31	2025-06-28	2025-07-03	procesando	134902.90	0.00	transferencia	4
2799	1603	189	2026-02-28	2026-03-04	entregado	16068.33	10.00	transferencia	6
2800	1465	37	2024-05-30	2024-06-05	enviado	307746.47	10.00	transferencia	8
2801	424	82	2026-05-21	2026-05-29	devuelto	185473.04	10.00	OXXO	1
2802	1355	128	2025-06-16	2025-06-25	procesando	38518.80	5.00	efectivo	8
2803	1723	99	2024-12-10	2024-12-22	entregado	72486.19	5.00	tarjeta_credito	3
2804	1393	97	2025-12-13	2025-12-18	enviado	70985.65	5.00	PayPal	4
2805	1345	104	2025-02-12	2025-02-14	procesando	111681.82	0.00	transferencia	6
2806	808	179	2024-10-09	2024-10-14	entregado	6720.46	15.00	tarjeta_credito	6
2807	131	162	2024-07-22	2024-07-29	pendiente	90119.28	0.00	tarjeta_credito	1
2808	1336	101	2025-04-26	2025-05-03	entregado	132613.56	15.00	tarjeta_credito	6
2809	1391	20	2024-04-06	2024-04-11	entregado	18418.07	5.00	OXXO	1
2810	1785	77	2023-08-20	2023-08-22	entregado	39244.16	10.00	efectivo	4
2811	1790	177	2023-10-10	2023-10-22	enviado	27234.89	5.00	tarjeta_debito	7
2812	748	41	2023-09-27	2023-10-12	enviado	187912.06	0.00	PayPal	6
2813	1190	192	2024-03-30	2024-04-07	entregado	206306.86	5.00	efectivo	6
2814	611	133	2026-03-28	2026-04-05	entregado	72625.93	0.00	PayPal	7
2815	1248	196	2025-11-27	2025-12-03	entregado	112813.69	5.00	transferencia	1
2816	102	169	2025-09-24	2025-10-04	entregado	87218.03	10.00	tarjeta_credito	4
2817	264	101	2023-08-03	2023-08-13	entregado	263243.40	10.00	transferencia	1
2818	321	17	2025-01-16	2025-01-23	procesando	302571.59	10.00	efectivo	2
2819	737	128	2023-09-28	2023-09-30	procesando	96284.14	10.00	tarjeta_credito	5
2820	354	180	2024-05-06	2024-05-08	procesando	58564.28	0.00	transferencia	2
2821	969	112	2024-05-26	2024-06-01	enviado	74218.17	0.00	tarjeta_debito	6
2822	741	34	2024-08-19	2024-08-28	entregado	73205.35	0.00	transferencia	4
2823	12	171	2025-08-06	2025-08-19	entregado	62716.89	10.00	OXXO	3
2824	1246	58	2025-02-14	2025-02-20	devuelto	212413.25	5.00	transferencia	8
2825	213	96	2025-05-10	2025-05-16	cancelado	34201.37	5.00	transferencia	5
2826	993	41	2024-02-22	2024-03-02	procesando	78936.68	15.00	transferencia	5
2827	845	71	2024-06-04	2024-06-10	entregado	51110.11	5.00	PayPal	4
2828	211	195	2026-05-22	2026-06-06	devuelto	14440.73	20.00	efectivo	1
2829	1078	140	2026-03-03	2026-03-18	enviado	27037.61	0.00	OXXO	5
2830	1677	90	2026-04-20	2026-05-02	procesando	10635.50	5.00	OXXO	1
2831	656	136	2026-05-21	2026-05-23	entregado	189841.59	15.00	PayPal	7
2832	997	153	2023-09-08	2023-09-21	devuelto	12982.40	0.00	transferencia	2
2833	1205	55	2023-12-10	2023-12-19	cancelado	31327.63	10.00	transferencia	7
2834	398	99	2024-10-14	2024-10-21	procesando	148551.58	0.00	tarjeta_debito	4
2835	616	114	2023-12-18	2023-12-23	procesando	194368.67	0.00	tarjeta_debito	4
2836	1952	123	2025-08-13	2025-08-16	procesando	76901.81	15.00	transferencia	3
2837	1029	30	2026-01-10	2026-01-16	entregado	18189.66	0.00	efectivo	4
2838	1126	164	2023-08-25	2023-08-29	entregado	152095.13	0.00	efectivo	3
2839	237	154	2024-10-26	2024-10-27	entregado	183506.56	5.00	efectivo	8
2840	268	193	2024-02-09	2024-02-10	enviado	126517.59	15.00	OXXO	7
2841	336	153	2026-01-07	2026-01-12	entregado	50364.89	5.00	transferencia	4
2842	2000	105	2024-04-29	2024-04-30	enviado	92699.44	10.00	efectivo	2
2843	1243	143	2025-12-03	2025-12-11	procesando	43368.16	0.00	OXXO	4
2844	797	112	2024-05-25	2024-05-29	enviado	159492.47	5.00	PayPal	6
2845	1074	116	2024-10-06	2024-10-15	procesando	115828.65	5.00	efectivo	6
2846	928	30	2025-01-26	2025-01-28	procesando	78072.66	5.00	efectivo	5
2847	541	186	2024-04-03	2024-04-05	pendiente	140043.07	0.00	PayPal	6
2848	371	87	2023-10-05	2023-10-10	entregado	47204.14	0.00	tarjeta_debito	8
2849	1312	41	2025-12-31	2026-01-03	entregado	64553.62	0.00	transferencia	8
2850	757	99	2026-01-14	2026-01-27	cancelado	143253.77	5.00	PayPal	8
2851	681	96	2023-09-06	2023-09-16	cancelado	202252.33	5.00	tarjeta_debito	3
2852	1497	48	2026-03-21	2026-04-01	procesando	97536.65	15.00	efectivo	1
2853	655	74	2024-06-23	2024-07-05	entregado	88897.45	0.00	efectivo	6
2854	583	9	2024-08-20	2024-09-01	enviado	105722.06	5.00	efectivo	5
2855	1896	48	2024-10-25	2024-11-01	entregado	157682.45	5.00	transferencia	2
2856	276	49	2025-02-17	2025-02-21	pendiente	144957.79	15.00	transferencia	6
2857	485	52	2024-05-11	2024-05-26	procesando	59710.35	15.00	efectivo	8
2858	643	150	2026-05-01	2026-05-11	entregado	61782.23	10.00	PayPal	3
2859	1496	181	2025-10-09	2025-10-19	entregado	47827.32	0.00	transferencia	8
2860	1565	162	2024-08-14	2024-08-25	entregado	270938.55	5.00	PayPal	3
2861	1594	180	2023-10-10	2023-10-14	entregado	109999.45	15.00	tarjeta_debito	1
2862	1205	121	2023-11-21	2023-11-25	enviado	23077.13	10.00	OXXO	4
2863	1777	112	2024-04-14	2024-04-21	entregado	40766.27	0.00	PayPal	8
2864	1031	84	2024-07-25	2024-07-26	procesando	23542.90	10.00	OXXO	5
2865	569	94	2026-03-09	2026-03-17	procesando	114674.65	5.00	tarjeta_debito	1
2866	1406	21	2026-05-07	2026-05-22	entregado	44640.21	0.00	tarjeta_debito	3
2867	829	92	2025-08-13	2025-08-21	enviado	53175.93	0.00	transferencia	4
2868	33	86	2024-09-26	2024-10-07	entregado	29737.02	0.00	transferencia	2
2869	139	118	2023-12-19	2023-12-25	entregado	258205.79	5.00	OXXO	8
2870	338	72	2024-09-03	2024-09-12	entregado	24391.22	15.00	PayPal	8
2871	1374	9	2023-08-10	2023-08-21	enviado	182867.88	0.00	efectivo	6
2872	1567	52	2026-06-07	2026-06-13	entregado	142047.92	0.00	PayPal	8
2873	291	112	2023-07-09	2023-07-13	cancelado	76115.29	15.00	tarjeta_credito	8
2874	1518	179	2026-04-23	2026-04-29	entregado	14719.88	0.00	tarjeta_credito	7
2875	1242	107	2023-12-06	2023-12-09	entregado	97107.82	0.00	tarjeta_credito	6
2876	795	141	2025-01-31	2025-02-09	entregado	187514.58	0.00	tarjeta_debito	8
2877	1772	134	2024-07-28	2024-08-01	entregado	59264.84	15.00	PayPal	3
2878	229	74	2025-06-27	2025-07-02	entregado	42145.56	0.00	transferencia	4
2879	6	110	2025-05-14	2025-05-24	entregado	41325.69	20.00	efectivo	4
2880	69	105	2024-12-24	2025-01-04	pendiente	115785.41	0.00	transferencia	2
2881	868	114	2025-07-15	2025-07-19	enviado	53225.37	0.00	OXXO	7
2882	95	103	2023-10-13	2023-10-21	entregado	184972.52	15.00	PayPal	6
2883	920	63	2024-08-11	2024-08-16	entregado	26604.95	0.00	OXXO	8
2884	986	169	2025-09-17	2025-09-23	devuelto	125046.89	0.00	tarjeta_debito	6
2885	1410	192	2023-06-16	2023-06-27	enviado	103586.78	5.00	tarjeta_credito	1
2886	1287	139	2024-08-25	2024-09-07	entregado	131739.96	0.00	tarjeta_debito	6
2887	993	129	2024-10-22	2024-11-04	entregado	136291.90	0.00	tarjeta_debito	1
2888	1079	6	2025-08-02	2025-08-07	pendiente	320550.64	0.00	efectivo	2
2889	758	16	2023-10-29	2023-11-10	pendiente	94563.25	10.00	PayPal	4
2890	240	104	2024-04-26	2024-04-27	enviado	16152.80	0.00	OXXO	2
2891	177	88	2024-05-21	2024-06-01	entregado	131529.79	0.00	tarjeta_debito	5
2892	35	181	2024-11-24	2024-12-02	procesando	84792.45	0.00	tarjeta_credito	1
2893	1786	80	2024-07-24	2024-08-02	entregado	26415.05	15.00	PayPal	3
2894	267	161	2023-10-07	2023-10-08	entregado	104281.42	15.00	PayPal	1
2895	1899	167	2024-04-15	2024-04-20	enviado	11583.96	0.00	tarjeta_debito	6
2896	896	167	2024-06-28	2024-07-10	procesando	25359.99	15.00	PayPal	1
2897	1885	174	2025-03-07	2025-03-20	procesando	76103.55	0.00	tarjeta_debito	7
2898	600	125	2025-08-29	2025-09-12	entregado	127922.35	0.00	PayPal	2
2899	993	10	2023-07-04	2023-07-16	entregado	12126.44	0.00	efectivo	3
2900	534	70	2024-02-29	2024-03-07	procesando	20811.75	5.00	tarjeta_credito	1
2901	1495	9	2024-12-26	2025-01-01	entregado	66381.05	15.00	OXXO	1
2902	560	180	2024-02-08	2024-02-16	enviado	47074.61	10.00	tarjeta_credito	5
2903	21	176	2024-05-01	2024-05-03	procesando	66533.03	0.00	PayPal	8
2904	432	19	2023-08-27	2023-09-10	entregado	149513.31	5.00	tarjeta_credito	7
2905	1986	105	2023-06-15	2023-06-30	enviado	15999.09	0.00	tarjeta_credito	4
2906	1758	161	2024-10-17	2024-10-24	enviado	47815.95	5.00	PayPal	2
2907	748	14	2025-11-16	2025-11-23	entregado	90701.99	0.00	transferencia	7
2908	315	95	2023-12-25	2023-12-29	entregado	29059.62	15.00	tarjeta_debito	7
2909	222	33	2023-12-21	2023-12-28	enviado	7051.79	0.00	tarjeta_debito	3
2910	1612	194	2024-06-15	2024-06-30	entregado	97285.65	10.00	PayPal	5
2911	1001	72	2024-05-27	2024-05-28	enviado	26739.63	5.00	OXXO	8
2912	246	120	2025-02-22	2025-03-05	entregado	244327.68	10.00	transferencia	2
2913	1911	109	2026-03-28	2026-04-12	entregado	21884.96	0.00	tarjeta_credito	5
2914	1709	198	2025-01-10	2025-01-18	entregado	61804.87	0.00	tarjeta_credito	5
2915	538	197	2025-11-09	2025-11-15	entregado	23111.28	0.00	efectivo	3
2916	1228	107	2024-11-03	2024-11-15	devuelto	136573.92	0.00	OXXO	2
2917	1711	57	2023-11-06	2023-11-15	entregado	243300.05	5.00	transferencia	7
2918	277	6	2025-05-20	2025-06-02	enviado	204973.38	0.00	tarjeta_debito	7
2919	1907	84	2025-07-09	2025-07-14	pendiente	17912.01	10.00	OXXO	7
2920	5	181	2023-09-20	2023-09-25	procesando	25685.73	0.00	transferencia	5
2921	1731	196	2024-12-05	2024-12-06	procesando	93491.80	0.00	tarjeta_credito	4
2922	722	49	2024-11-10	2024-11-13	entregado	102612.08	0.00	tarjeta_credito	4
2923	294	111	2025-08-03	2025-08-17	entregado	134937.89	5.00	tarjeta_credito	6
2924	706	19	2026-05-24	2026-06-03	procesando	269594.03	0.00	tarjeta_debito	6
2925	1583	37	2023-09-30	2023-10-06	entregado	152743.31	0.00	PayPal	1
2926	1046	71	2023-07-01	2023-07-16	entregado	361951.84	0.00	tarjeta_debito	8
2927	148	39	2024-04-01	2024-04-05	entregado	222868.30	0.00	OXXO	3
2928	1345	159	2025-04-04	2025-04-12	enviado	164417.62	0.00	tarjeta_debito	3
2929	833	121	2025-07-22	2025-07-30	entregado	15787.28	0.00	transferencia	3
2930	920	115	2024-01-14	2024-01-22	entregado	71851.72	15.00	efectivo	2
2931	1190	163	2024-10-20	2024-11-02	entregado	16658.05	20.00	OXXO	8
2932	1542	76	2025-08-06	2025-08-16	entregado	74552.52	5.00	tarjeta_debito	2
2933	413	107	2023-09-14	2023-09-20	enviado	147406.80	0.00	OXXO	7
2934	838	130	2024-12-25	2025-01-06	cancelado	62739.27	20.00	tarjeta_credito	6
2935	471	104	2024-01-28	2024-02-12	entregado	164131.71	5.00	tarjeta_debito	1
2936	392	20	2024-03-21	2024-03-23	pendiente	156033.69	10.00	tarjeta_debito	2
2937	991	116	2026-05-12	2026-05-18	entregado	192082.72	0.00	tarjeta_debito	4
2938	388	52	2025-11-15	2025-11-26	entregado	117321.90	20.00	OXXO	2
2939	1049	5	2025-11-08	2025-11-15	entregado	72274.38	5.00	tarjeta_credito	3
2940	512	109	2025-09-08	2025-09-17	entregado	194576.89	0.00	PayPal	4
2941	1026	136	2024-05-24	2024-05-28	entregado	205204.97	0.00	OXXO	4
2942	1154	124	2025-11-30	2025-12-06	entregado	309867.04	0.00	tarjeta_credito	6
2943	1188	22	2026-04-28	2026-05-09	entregado	146492.53	0.00	PayPal	7
2944	1733	47	2025-02-14	2025-02-26	entregado	120370.78	0.00	transferencia	1
2945	1947	37	2024-02-22	2024-03-08	devuelto	198464.20	0.00	tarjeta_debito	5
2946	1768	127	2025-09-15	2025-09-18	pendiente	13529.52	20.00	tarjeta_credito	3
2947	1780	110	2025-11-20	2025-12-03	procesando	184547.73	0.00	transferencia	3
2948	134	16	2023-06-23	2023-06-28	entregado	330638.25	0.00	transferencia	8
2949	1891	167	2026-05-06	2026-05-13	entregado	90905.54	5.00	PayPal	2
2950	77	145	2023-10-07	2023-10-18	entregado	197299.37	15.00	transferencia	7
2951	857	96	2026-03-02	2026-03-11	entregado	94754.75	5.00	transferencia	3
2952	233	75	2026-03-18	2026-03-26	devuelto	18623.67	0.00	tarjeta_debito	1
2953	1077	176	2023-11-26	2023-11-28	pendiente	120131.55	10.00	PayPal	1
2954	400	159	2026-05-22	2026-06-01	pendiente	348449.18	0.00	tarjeta_credito	6
2955	1732	190	2024-04-01	2024-04-04	entregado	60965.86	0.00	tarjeta_credito	3
2956	1336	73	2023-09-07	2023-09-12	enviado	212081.98	0.00	OXXO	8
2957	1278	134	2023-06-13	2023-06-27	enviado	124916.78	0.00	tarjeta_debito	3
2958	946	59	2023-06-16	2023-06-18	pendiente	92237.31	15.00	tarjeta_debito	4
2959	355	35	2023-11-26	2023-12-07	procesando	70660.74	20.00	efectivo	5
2960	77	29	2024-10-12	2024-10-22	procesando	24381.60	5.00	PayPal	5
2961	1003	198	2024-05-19	2024-05-24	entregado	116316.12	0.00	PayPal	7
2962	1613	80	2024-06-02	2024-06-12	entregado	219687.16	5.00	tarjeta_credito	8
2963	1668	162	2025-06-21	2025-07-03	devuelto	41520.19	10.00	tarjeta_debito	7
2964	842	154	2023-07-06	2023-07-10	entregado	160340.56	0.00	OXXO	6
2965	1328	5	2024-11-15	2024-11-29	pendiente	127270.30	5.00	PayPal	8
2966	740	10	2026-05-15	2026-05-29	procesando	205332.44	10.00	tarjeta_credito	1
2967	1499	49	2025-10-18	2025-10-26	procesando	63761.26	0.00	tarjeta_credito	4
2968	1569	93	2023-08-22	2023-08-23	entregado	3266.66	0.00	tarjeta_credito	6
2969	1379	108	2024-02-01	2024-02-06	entregado	176625.14	0.00	efectivo	7
2970	64	24	2025-04-28	2025-05-13	pendiente	49962.36	0.00	tarjeta_credito	7
2971	341	45	2024-04-18	2024-04-19	procesando	335740.69	0.00	transferencia	5
2972	268	195	2024-04-11	2024-04-18	cancelado	70568.12	0.00	tarjeta_credito	7
2973	194	75	2026-02-24	2026-03-11	enviado	54257.24	0.00	tarjeta_credito	1
2974	131	122	2025-12-18	2025-12-30	entregado	77961.22	5.00	PayPal	5
2975	649	120	2025-01-15	2025-01-16	entregado	259570.36	0.00	OXXO	6
2976	60	142	2026-01-12	2026-01-22	pendiente	34891.72	0.00	efectivo	7
2977	1580	113	2025-02-20	2025-03-03	entregado	13022.99	10.00	tarjeta_debito	6
2978	1225	95	2025-12-15	2025-12-23	procesando	20654.82	0.00	tarjeta_debito	5
2979	225	62	2026-04-15	2026-04-18	procesando	101381.60	10.00	PayPal	7
2980	981	26	2026-02-20	2026-02-27	entregado	47054.49	10.00	tarjeta_credito	3
2981	604	149	2025-07-03	2025-07-07	entregado	161801.15	0.00	transferencia	5
2982	167	171	2024-10-03	2024-10-13	entregado	50173.91	0.00	transferencia	6
2983	393	39	2025-09-21	2025-10-03	entregado	74007.76	5.00	PayPal	8
2984	1422	174	2024-06-29	2024-07-02	entregado	142080.90	0.00	PayPal	8
2985	1934	134	2023-07-04	2023-07-14	cancelado	107266.13	0.00	OXXO	4
2986	203	123	2025-11-07	2025-11-13	cancelado	108463.25	0.00	tarjeta_credito	5
2987	333	186	2024-12-20	2024-12-22	entregado	45655.31	10.00	PayPal	5
2988	747	79	2024-02-10	2024-02-18	entregado	6606.40	15.00	tarjeta_debito	8
2989	153	190	2023-10-23	2023-11-07	cancelado	31019.68	10.00	tarjeta_credito	1
2990	1398	105	2024-03-10	2024-03-20	entregado	22115.10	15.00	efectivo	1
2991	1112	91	2023-10-11	2023-10-23	cancelado	113574.84	0.00	tarjeta_credito	2
2992	1331	24	2023-09-06	2023-09-13	pendiente	32032.20	0.00	tarjeta_credito	7
2993	214	53	2026-03-28	2026-03-30	entregado	153790.37	0.00	tarjeta_debito	4
2994	1756	24	2023-07-08	2023-07-19	cancelado	295512.69	0.00	tarjeta_debito	1
2995	1921	63	2024-08-29	2024-09-06	enviado	45175.53	0.00	transferencia	5
2996	26	8	2026-02-01	2026-02-11	entregado	82619.28	10.00	OXXO	6
2997	596	34	2024-03-17	2024-03-29	entregado	8275.11	15.00	transferencia	3
2998	1745	75	2026-01-09	2026-01-11	entregado	84403.89	0.00	efectivo	3
2999	621	170	2026-01-20	2026-02-03	entregado	81539.38	15.00	transferencia	6
3000	1798	75	2024-03-23	2024-03-30	entregado	29391.18	15.00	PayPal	3
3001	260	59	2026-02-04	2026-02-15	entregado	135278.01	20.00	efectivo	3
3002	1521	19	2025-12-31	2026-01-07	pendiente	168334.50	0.00	tarjeta_credito	4
3003	1062	153	2024-06-29	2024-07-01	enviado	93696.98	0.00	tarjeta_debito	4
3004	572	177	2024-01-28	2024-02-04	entregado	34346.24	0.00	transferencia	5
3005	870	66	2024-08-15	2024-08-19	procesando	123932.83	0.00	transferencia	5
3006	1189	81	2026-05-23	2026-05-30	entregado	355783.05	0.00	efectivo	2
3007	197	177	2025-04-01	2025-04-09	devuelto	173387.78	15.00	tarjeta_credito	4
3008	1315	173	2024-10-24	2024-11-04	entregado	112658.27	15.00	tarjeta_debito	2
3009	1551	176	2026-05-18	2026-05-26	enviado	8743.77	10.00	tarjeta_credito	8
3010	1097	110	2024-08-23	2024-08-31	procesando	87423.87	0.00	PayPal	4
3011	29	71	2025-11-05	2025-11-17	procesando	290196.18	5.00	efectivo	5
3012	1001	79	2023-08-26	2023-08-30	entregado	56197.84	10.00	efectivo	8
3013	510	111	2023-10-07	2023-10-08	entregado	76562.14	0.00	efectivo	3
3014	1713	93	2025-02-02	2025-02-04	procesando	149731.49	10.00	transferencia	6
3015	100	66	2026-06-03	2026-06-16	enviado	11516.10	0.00	tarjeta_credito	2
3016	1062	84	2024-03-19	2024-03-28	enviado	18436.35	0.00	OXXO	1
3017	1511	159	2024-06-07	2024-06-10	enviado	132617.52	0.00	OXXO	6
3018	67	154	2024-06-24	2024-07-02	pendiente	157284.63	0.00	tarjeta_credito	5
3019	916	187	2025-08-02	2025-08-09	entregado	220952.49	0.00	tarjeta_debito	3
3020	590	20	2024-01-21	2024-02-01	entregado	78554.86	5.00	efectivo	1
3021	1664	177	2024-04-22	2024-04-25	procesando	170761.16	5.00	PayPal	1
3022	1046	137	2026-02-21	2026-02-28	enviado	188933.42	0.00	tarjeta_credito	3
3023	1967	171	2025-10-13	2025-10-21	pendiente	245714.06	0.00	tarjeta_debito	3
3024	1595	42	2025-04-08	2025-04-12	devuelto	195080.86	0.00	transferencia	8
3025	1021	36	2024-07-02	2024-07-03	cancelado	95426.04	10.00	tarjeta_debito	6
3026	1932	194	2024-01-15	2024-01-17	entregado	207962.76	5.00	OXXO	2
3027	1962	67	2025-12-05	2025-12-09	entregado	21346.52	0.00	OXXO	8
3028	387	37	2025-04-25	2025-05-01	procesando	115778.37	0.00	transferencia	5
3029	369	26	2024-09-16	2024-09-28	entregado	242803.94	5.00	tarjeta_debito	1
3030	900	153	2025-02-08	2025-02-23	entregado	165169.05	0.00	OXXO	8
3031	135	159	2024-10-31	2024-11-03	entregado	176181.12	20.00	OXXO	6
3032	1161	35	2024-08-05	2024-08-09	devuelto	6993.70	15.00	tarjeta_credito	6
3033	736	177	2023-09-09	2023-09-17	enviado	40540.19	20.00	PayPal	4
3034	810	76	2025-06-03	2025-06-11	entregado	57824.07	5.00	transferencia	3
3035	456	134	2025-11-20	2025-11-27	devuelto	49465.04	10.00	tarjeta_credito	3
3036	1194	39	2025-12-19	2025-12-23	entregado	16141.98	0.00	OXXO	2
3037	491	168	2025-04-13	2025-04-14	entregado	41520.19	0.00	tarjeta_debito	6
3038	1937	196	2026-03-13	2026-03-16	cancelado	110711.95	0.00	PayPal	5
3039	1956	135	2024-10-29	2024-11-10	procesando	113329.05	0.00	tarjeta_debito	3
3040	1686	187	2025-09-26	2025-09-29	entregado	15892.40	0.00	tarjeta_credito	8
3041	1609	64	2023-07-05	2023-07-18	entregado	111300.77	10.00	transferencia	1
3042	1928	197	2024-09-26	2024-09-30	enviado	102138.26	10.00	tarjeta_debito	8
3043	25	135	2024-06-18	2024-06-27	cancelado	143430.60	20.00	tarjeta_debito	8
3044	1266	44	2025-10-01	2025-10-05	pendiente	277247.18	0.00	OXXO	3
3045	288	97	2026-02-21	2026-03-02	entregado	68110.54	20.00	PayPal	4
3046	915	18	2024-05-10	2024-05-12	enviado	199063.55	0.00	transferencia	5
3047	553	183	2025-01-23	2025-02-01	entregado	86080.49	0.00	efectivo	8
3048	1819	190	2025-02-23	2025-03-04	entregado	107207.51	0.00	tarjeta_debito	8
3049	126	172	2025-01-15	2025-01-25	entregado	170678.83	0.00	efectivo	6
3050	632	8	2023-12-24	2024-01-07	entregado	38341.92	20.00	tarjeta_credito	6
3051	1872	60	2024-06-12	2024-06-18	procesando	43240.74	5.00	tarjeta_debito	4
3052	1879	68	2025-11-16	2025-11-27	entregado	163708.30	5.00	OXXO	3
3053	1157	167	2025-02-21	2025-03-02	devuelto	81210.90	0.00	tarjeta_debito	5
3054	1008	124	2025-07-07	2025-07-13	enviado	89437.14	10.00	tarjeta_debito	8
3055	144	96	2024-01-21	2024-02-03	entregado	362334.62	0.00	tarjeta_debito	4
3056	1523	9	2023-12-11	2023-12-24	entregado	83470.45	0.00	OXXO	8
3057	125	166	2024-03-11	2024-03-15	procesando	115918.63	0.00	tarjeta_credito	2
3058	1472	111	2025-12-02	2025-12-04	devuelto	46295.03	5.00	efectivo	4
3059	53	153	2025-01-26	2025-02-03	entregado	25375.71	0.00	tarjeta_debito	5
3060	1404	15	2025-02-25	2025-03-05	entregado	193513.79	0.00	transferencia	1
3061	1586	56	2023-09-21	2023-10-01	enviado	36855.59	0.00	transferencia	2
3062	1661	138	2025-09-04	2025-09-19	entregado	64653.08	0.00	efectivo	3
3063	93	123	2025-08-21	2025-09-03	entregado	73205.35	0.00	efectivo	8
3064	1995	178	2024-10-08	2024-10-11	entregado	288274.65	5.00	transferencia	4
3065	302	93	2024-08-23	2024-08-24	procesando	20158.74	15.00	tarjeta_debito	1
3066	687	184	2025-03-20	2025-03-27	cancelado	8759.40	15.00	PayPal	2
3067	265	7	2023-12-02	2023-12-05	pendiente	186813.27	10.00	tarjeta_credito	6
3068	977	141	2026-04-26	2026-05-10	entregado	193455.91	5.00	OXXO	6
3069	23	138	2025-11-21	2025-12-01	enviado	121934.02	10.00	transferencia	5
3070	569	83	2024-01-02	2024-01-08	devuelto	43023.22	0.00	OXXO	2
3071	1689	187	2023-12-09	2023-12-14	entregado	73324.41	0.00	efectivo	5
3072	114	163	2024-06-01	2024-06-16	entregado	203861.42	15.00	efectivo	6
3073	860	124	2024-11-14	2024-11-15	enviado	3071.12	0.00	tarjeta_credito	7
3074	1323	128	2024-09-02	2024-09-12	procesando	281074.39	5.00	tarjeta_credito	1
3075	147	58	2024-12-31	2025-01-14	enviado	104375.85	0.00	tarjeta_credito	6
3076	1511	162	2026-02-25	2026-03-04	enviado	51944.59	0.00	tarjeta_credito	5
3077	1605	70	2024-01-06	2024-01-12	entregado	76150.16	0.00	tarjeta_credito	1
3078	83	76	2026-03-27	2026-03-28	entregado	114024.35	0.00	efectivo	5
3079	1277	119	2024-04-14	2024-04-23	procesando	223059.25	0.00	PayPal	8
3080	719	44	2024-06-02	2024-06-09	entregado	50394.45	20.00	PayPal	3
3081	1761	73	2024-03-22	2024-03-29	entregado	224963.00	0.00	tarjeta_credito	2
3082	1979	50	2023-06-21	2023-06-22	procesando	67047.91	5.00	OXXO	2
3083	183	130	2025-10-25	2025-10-28	procesando	62206.24	0.00	transferencia	6
3084	363	175	2024-05-09	2024-05-10	enviado	86842.75	0.00	PayPal	6
3085	1233	6	2024-09-18	2024-09-22	entregado	45860.15	15.00	transferencia	2
3086	1590	128	2025-01-02	2025-01-04	enviado	78651.20	5.00	transferencia	8
3087	1755	197	2024-04-09	2024-04-24	entregado	90995.41	10.00	tarjeta_credito	1
3088	1415	59	2025-07-26	2025-08-07	entregado	276863.26	5.00	transferencia	8
3089	119	42	2024-05-31	2024-06-05	devuelto	371645.54	0.00	PayPal	5
3090	1886	75	2024-11-19	2024-11-26	enviado	126596.23	0.00	OXXO	3
3091	515	175	2024-09-18	2024-09-20	pendiente	96260.59	5.00	tarjeta_debito	2
3092	1776	23	2025-02-01	2025-02-15	entregado	99592.11	0.00	OXXO	5
3093	1572	127	2025-07-25	2025-08-07	enviado	88924.47	10.00	efectivo	2
3094	1470	69	2024-10-06	2024-10-15	pendiente	48292.34	5.00	efectivo	1
3095	1821	2	2024-09-16	2024-09-23	entregado	193148.75	10.00	PayPal	5
3096	1838	104	2025-02-16	2025-03-03	devuelto	165825.84	5.00	OXXO	5
3097	1148	190	2023-08-16	2023-08-24	enviado	386344.10	5.00	transferencia	4
3098	980	102	2023-10-08	2023-10-15	cancelado	18696.53	15.00	transferencia	4
3099	928	136	2026-03-11	2026-03-17	entregado	236923.63	15.00	efectivo	2
3100	1153	26	2023-11-24	2023-11-26	entregado	125167.80	10.00	PayPal	8
3101	628	114	2024-01-02	2024-01-15	entregado	11409.82	0.00	transferencia	1
3102	1418	157	2025-12-26	2026-01-05	entregado	105383.24	0.00	efectivo	3
3103	780	65	2025-09-26	2025-10-02	enviado	391034.12	5.00	tarjeta_debito	2
3104	919	112	2023-08-30	2023-09-13	pendiente	25410.35	0.00	efectivo	7
3105	1541	115	2024-08-28	2024-09-07	entregado	76410.57	5.00	OXXO	7
3106	1503	55	2024-02-11	2024-02-19	entregado	80112.25	0.00	efectivo	8
3107	978	124	2025-10-27	2025-11-01	entregado	175071.74	10.00	transferencia	1
3108	277	94	2026-05-05	2026-05-17	entregado	118013.10	0.00	efectivo	5
3109	1266	73	2026-03-30	2026-04-10	cancelado	181482.93	5.00	PayPal	6
3110	939	83	2025-09-14	2025-09-20	entregado	211454.02	5.00	transferencia	5
3111	1946	69	2024-12-07	2024-12-13	entregado	61800.22	0.00	OXXO	8
3112	800	193	2024-02-23	2024-02-27	entregado	41951.66	0.00	efectivo	3
3113	7	182	2024-07-28	2024-07-29	devuelto	92057.34	15.00	tarjeta_debito	1
3114	1405	116	2025-07-18	2025-07-26	pendiente	223340.68	0.00	PayPal	3
3115	973	100	2024-08-11	2024-08-22	enviado	77299.94	5.00	tarjeta_credito	5
3116	1724	41	2024-01-20	2024-02-03	entregado	104635.12	0.00	transferencia	1
3117	1614	163	2025-05-24	2025-06-06	entregado	376645.27	5.00	efectivo	5
3118	1108	45	2024-11-04	2024-11-08	procesando	138601.85	0.00	transferencia	7
3119	1643	27	2024-01-08	2024-01-14	entregado	11004.33	0.00	transferencia	5
3120	286	72	2023-09-10	2023-09-12	entregado	96623.19	0.00	tarjeta_credito	2
3121	798	50	2024-01-16	2024-01-26	entregado	123032.11	15.00	OXXO	8
3122	1645	45	2024-07-09	2024-07-19	entregado	213089.45	0.00	transferencia	2
3123	715	110	2023-10-10	2023-10-19	entregado	214161.83	5.00	tarjeta_debito	4
3124	110	123	2026-03-09	2026-03-10	enviado	219388.93	0.00	OXXO	5
3125	1690	189	2026-05-05	2026-05-08	entregado	66340.98	10.00	efectivo	4
3126	365	111	2025-06-17	2025-06-30	procesando	158257.59	5.00	tarjeta_credito	1
3127	185	179	2024-04-26	2024-05-07	enviado	88667.06	0.00	PayPal	2
3128	242	166	2025-06-19	2025-06-29	cancelado	83602.53	0.00	efectivo	1
3129	507	18	2025-11-04	2025-11-13	entregado	111341.61	0.00	PayPal	2
3130	539	112	2024-06-10	2024-06-20	entregado	52854.10	20.00	OXXO	3
3131	57	49	2025-02-24	2025-03-06	cancelado	8108.92	10.00	tarjeta_credito	6
3132	1235	99	2024-01-08	2024-01-19	entregado	169179.25	5.00	tarjeta_debito	4
3133	1176	75	2025-05-21	2025-05-30	procesando	78093.54	10.00	efectivo	5
3134	1816	41	2023-06-22	2023-07-01	entregado	8802.38	0.00	OXXO	8
3135	495	79	2024-08-16	2024-08-17	procesando	79799.34	0.00	OXXO	3
3136	1791	115	2023-10-13	2023-10-26	entregado	35150.13	10.00	transferencia	4
3137	1668	20	2024-03-12	2024-03-15	entregado	119400.09	15.00	efectivo	6
3138	406	41	2024-01-24	2024-02-01	enviado	149042.79	0.00	OXXO	5
3139	1384	199	2023-07-31	2023-08-04	procesando	26982.18	0.00	PayPal	8
3140	1562	182	2023-09-17	2023-09-27	pendiente	104630.25	10.00	OXXO	5
3141	1763	153	2025-12-31	2026-01-13	entregado	17910.37	5.00	transferencia	8
3142	340	130	2023-09-17	2023-09-25	entregado	105523.28	10.00	transferencia	2
3143	107	76	2026-05-06	2026-05-14	entregado	147558.87	15.00	tarjeta_debito	7
3144	1774	159	2024-04-22	2024-04-28	entregado	140611.30	10.00	tarjeta_credito	6
3145	996	57	2026-01-10	2026-01-21	enviado	27950.60	0.00	efectivo	1
3146	541	20	2026-05-26	2026-06-03	cancelado	141383.61	5.00	tarjeta_debito	5
3147	511	177	2025-01-19	2025-01-27	entregado	352805.09	15.00	transferencia	6
3148	897	136	2025-11-19	2025-11-24	enviado	138271.69	0.00	efectivo	6
3149	62	21	2025-04-08	2025-04-14	entregado	236451.02	0.00	tarjeta_credito	1
3150	1807	30	2024-08-18	2024-08-27	entregado	66475.56	0.00	tarjeta_debito	2
3151	1665	57	2023-10-08	2023-10-09	procesando	108201.47	10.00	OXXO	2
3152	1361	178	2023-11-10	2023-11-15	enviado	94658.00	0.00	transferencia	6
3153	850	8	2023-08-23	2023-08-27	entregado	119809.85	15.00	OXXO	8
3154	437	117	2025-04-01	2025-04-05	cancelado	176081.51	0.00	OXXO	1
3155	171	2	2025-11-23	2025-12-04	pendiente	112072.33	0.00	tarjeta_debito	7
3156	321	20	2025-07-23	2025-08-07	cancelado	110793.51	15.00	OXXO	5
3157	32	1	2024-02-11	2024-02-13	entregado	159870.86	0.00	efectivo	7
3158	1898	104	2026-02-23	2026-02-26	pendiente	25326.01	0.00	tarjeta_credito	5
3159	512	88	2026-03-19	2026-04-02	entregado	79070.52	0.00	tarjeta_credito	1
3160	1611	9	2024-09-29	2024-10-05	entregado	100357.97	15.00	OXXO	4
3161	1890	18	2025-10-24	2025-11-03	pendiente	22279.99	5.00	OXXO	7
3162	120	39	2023-09-29	2023-10-06	enviado	37247.34	0.00	OXXO	5
3163	1632	194	2023-09-03	2023-09-11	enviado	73558.70	0.00	efectivo	5
3164	1870	129	2024-07-31	2024-08-07	entregado	154780.32	0.00	tarjeta_credito	5
3165	347	46	2024-09-15	2024-09-22	cancelado	46032.26	10.00	transferencia	5
3166	1358	192	2023-08-22	2023-08-29	procesando	11614.80	10.00	transferencia	6
3167	1747	67	2025-11-07	2025-11-19	enviado	211953.53	0.00	transferencia	2
3168	1625	30	2024-10-05	2024-10-14	enviado	361061.89	10.00	transferencia	1
3169	756	143	2026-04-29	2026-05-01	enviado	16854.70	5.00	efectivo	6
3170	1865	126	2026-03-17	2026-03-26	entregado	26069.06	0.00	PayPal	7
3171	1742	84	2026-03-08	2026-03-13	entregado	125677.30	0.00	efectivo	5
3172	1530	36	2024-12-25	2025-01-07	entregado	53857.78	0.00	OXXO	1
3173	1086	138	2026-02-07	2026-02-19	entregado	30869.24	0.00	efectivo	2
3174	466	113	2023-07-29	2023-08-09	entregado	95882.35	10.00	tarjeta_debito	7
3175	1045	65	2023-12-15	2023-12-16	entregado	335178.63	0.00	transferencia	2
3176	604	39	2026-05-31	2026-06-08	devuelto	204127.16	5.00	tarjeta_credito	8
3177	1339	3	2026-03-13	2026-03-20	enviado	25960.06	15.00	tarjeta_debito	7
3178	738	148	2023-10-18	2023-10-21	procesando	65077.95	0.00	OXXO	8
3179	802	106	2025-11-09	2025-11-20	entregado	151680.03	0.00	transferencia	2
3180	661	10	2026-04-13	2026-04-26	entregado	142473.70	0.00	OXXO	8
3181	713	194	2025-10-27	2025-11-08	procesando	16043.92	15.00	tarjeta_credito	8
3182	1869	122	2025-01-15	2025-01-18	enviado	260493.33	20.00	efectivo	8
3183	895	27	2023-06-23	2023-07-04	entregado	33434.60	0.00	tarjeta_credito	7
3184	877	125	2025-09-16	2025-09-28	entregado	17657.51	10.00	tarjeta_debito	4
3185	614	151	2025-10-14	2025-10-19	entregado	190308.40	20.00	PayPal	3
3186	227	93	2025-07-22	2025-07-30	devuelto	5261.30	10.00	PayPal	8
3187	1096	57	2025-05-06	2025-05-13	devuelto	28661.97	0.00	efectivo	1
3188	1834	135	2025-11-14	2025-11-17	procesando	263535.22	0.00	PayPal	5
3189	1656	74	2023-11-02	2023-11-13	cancelado	70180.77	0.00	OXXO	1
3190	186	46	2025-07-08	2025-07-14	procesando	118066.28	10.00	tarjeta_credito	4
3191	850	25	2026-05-13	2026-05-27	enviado	31244.88	0.00	efectivo	8
3192	1688	169	2026-03-25	2026-04-07	entregado	55476.78	0.00	OXXO	3
3193	1470	13	2024-03-18	2024-03-30	entregado	231033.73	0.00	efectivo	6
3194	1268	91	2025-11-07	2025-11-13	entregado	102626.12	0.00	transferencia	2
3195	893	181	2024-02-16	2024-02-19	devuelto	78066.43	0.00	efectivo	7
3196	1892	192	2025-05-13	2025-05-20	cancelado	163808.17	0.00	efectivo	4
3197	1765	97	2023-07-26	2023-08-03	entregado	47827.32	0.00	tarjeta_credito	3
3198	365	84	2024-11-23	2024-11-29	entregado	237930.28	5.00	tarjeta_credito	7
3199	1259	69	2026-05-05	2026-05-15	entregado	150293.72	10.00	transferencia	4
3200	1685	167	2023-08-27	2023-09-11	entregado	32983.29	10.00	tarjeta_debito	5
3201	1827	31	2026-02-17	2026-02-18	enviado	140324.88	0.00	efectivo	5
3202	1056	74	2025-02-03	2025-02-17	procesando	110216.39	10.00	PayPal	4
3203	1956	7	2026-05-31	2026-06-05	entregado	70896.69	0.00	efectivo	7
3204	3	182	2023-06-15	2023-06-25	procesando	60491.44	20.00	transferencia	1
3205	787	71	2025-01-26	2025-02-03	entregado	21810.87	10.00	efectivo	5
3206	958	157	2026-02-27	2026-03-10	cancelado	102580.55	0.00	PayPal	4
3207	119	68	2023-10-23	2023-10-24	entregado	209839.90	5.00	PayPal	1
3208	328	117	2024-01-22	2024-01-27	entregado	22999.19	20.00	tarjeta_credito	1
3209	657	162	2026-03-01	2026-03-16	cancelado	18458.76	15.00	PayPal	6
3210	1876	126	2024-08-08	2024-08-13	entregado	31539.34	15.00	PayPal	1
3211	1110	73	2025-06-08	2025-06-16	entregado	236696.33	0.00	PayPal	3
3212	1027	84	2026-06-06	2026-06-14	entregado	282021.66	0.00	tarjeta_debito	1
3213	759	178	2025-08-29	2025-09-07	entregado	1021.50	0.00	efectivo	1
3214	240	49	2024-08-06	2024-08-09	entregado	151330.82	0.00	transferencia	8
3215	1378	195	2024-07-04	2024-07-05	procesando	154940.58	0.00	PayPal	2
3216	1797	136	2024-12-11	2024-12-13	enviado	53953.12	0.00	tarjeta_credito	5
3217	209	33	2026-04-27	2026-05-09	pendiente	214749.63	0.00	efectivo	1
3218	563	189	2024-05-07	2024-05-09	entregado	78680.79	5.00	tarjeta_debito	4
3219	1643	198	2025-07-31	2025-08-08	entregado	82812.64	5.00	transferencia	5
3220	918	58	2023-07-31	2023-08-08	cancelado	59047.74	0.00	PayPal	3
3221	1382	95	2025-06-12	2025-06-26	entregado	186374.16	0.00	tarjeta_credito	6
3222	846	51	2024-02-20	2024-03-04	entregado	110594.65	0.00	efectivo	2
3223	417	123	2025-04-17	2025-04-27	cancelado	47994.76	5.00	tarjeta_debito	6
3224	1097	18	2025-03-14	2025-03-29	entregado	28098.99	5.00	tarjeta_debito	7
3225	610	54	2024-01-18	2024-01-24	procesando	83104.40	0.00	OXXO	5
3226	1846	190	2024-09-04	2024-09-16	devuelto	93050.71	20.00	efectivo	6
3227	1951	108	2025-10-14	2025-10-20	entregado	55804.80	5.00	efectivo	2
3228	1877	76	2024-04-21	2024-05-03	entregado	19200.18	5.00	tarjeta_credito	8
3229	1265	141	2023-10-05	2023-10-20	entregado	780.14	0.00	OXXO	1
3230	264	51	2026-05-26	2026-05-31	entregado	166782.56	10.00	tarjeta_debito	4
3231	1417	133	2023-07-02	2023-07-13	procesando	85036.38	0.00	PayPal	7
3232	9	197	2025-08-18	2025-08-24	entregado	77300.78	10.00	OXXO	3
3233	1016	5	2024-12-29	2024-12-30	entregado	71638.05	0.00	PayPal	7
3234	1903	98	2024-01-15	2024-01-24	entregado	263799.95	0.00	transferencia	3
3235	797	11	2025-07-18	2025-07-26	entregado	56556.25	10.00	PayPal	7
3236	1951	110	2025-04-23	2025-04-30	enviado	125024.82	0.00	transferencia	4
3237	1086	15	2023-07-01	2023-07-04	entregado	47731.84	15.00	tarjeta_credito	8
3238	61	24	2025-06-29	2025-07-04	entregado	155037.55	0.00	OXXO	8
3239	742	26	2023-07-05	2023-07-17	pendiente	55328.79	0.00	tarjeta_credito	7
3240	1720	49	2024-03-07	2024-03-15	enviado	13205.71	20.00	tarjeta_debito	2
3241	1801	109	2024-04-09	2024-04-10	entregado	17101.48	10.00	transferencia	2
3242	1793	41	2023-09-19	2023-09-29	entregado	29221.50	10.00	tarjeta_debito	6
3243	352	140	2024-12-13	2024-12-20	entregado	11395.71	15.00	transferencia	2
3244	1388	116	2025-09-10	2025-09-13	enviado	158915.04	0.00	PayPal	8
3245	1239	114	2026-05-25	2026-05-29	entregado	54643.41	5.00	PayPal	4
3246	542	144	2026-06-03	2026-06-13	enviado	41784.23	15.00	OXXO	5
3247	528	136	2023-11-21	2023-11-30	enviado	69630.95	15.00	efectivo	4
3248	395	66	2024-02-10	2024-02-25	procesando	210729.33	5.00	OXXO	8
3249	1876	189	2025-09-07	2025-09-14	entregado	4148.60	0.00	tarjeta_credito	1
3250	865	181	2024-01-28	2024-02-09	procesando	31796.19	0.00	efectivo	8
3251	1302	176	2024-09-28	2024-10-02	enviado	128754.90	5.00	OXXO	1
3252	1725	180	2025-04-04	2025-04-12	enviado	176761.78	15.00	OXXO	6
3253	1446	62	2023-12-26	2023-12-28	entregado	78405.86	10.00	PayPal	8
3254	48	74	2025-12-29	2026-01-04	procesando	15809.85	0.00	PayPal	2
3255	482	162	2023-12-24	2023-12-28	procesando	171736.76	0.00	tarjeta_debito	2
3256	1722	123	2024-07-19	2024-07-26	devuelto	198246.33	0.00	PayPal	5
3257	1978	185	2025-01-11	2025-01-15	entregado	108223.75	0.00	PayPal	3
3258	921	58	2026-03-24	2026-03-30	enviado	171974.29	5.00	transferencia	7
3259	277	9	2023-06-26	2023-07-01	cancelado	223060.09	15.00	transferencia	5
3260	1465	103	2025-01-09	2025-01-24	entregado	57025.97	0.00	transferencia	8
3261	603	105	2024-04-12	2024-04-15	entregado	98455.82	5.00	transferencia	6
3262	1726	110	2024-07-09	2024-07-20	entregado	200210.17	15.00	OXXO	5
3263	307	68	2024-07-27	2024-08-05	procesando	52053.46	0.00	tarjeta_debito	3
3264	1173	156	2026-02-19	2026-02-27	entregado	12279.97	20.00	transferencia	8
3265	1262	70	2026-03-14	2026-03-21	procesando	78952.60	0.00	efectivo	2
3266	467	133	2025-07-11	2025-07-19	procesando	33342.11	15.00	PayPal	7
3267	1375	138	2023-07-01	2023-07-05	devuelto	134285.29	5.00	tarjeta_debito	7
3268	283	40	2024-06-08	2024-06-19	pendiente	113791.29	0.00	PayPal	7
3269	383	145	2024-02-18	2024-03-04	entregado	16264.22	0.00	tarjeta_debito	6
3270	823	96	2023-08-28	2023-09-02	enviado	313240.60	0.00	efectivo	4
3271	1005	167	2025-12-31	2026-01-12	entregado	63677.86	10.00	tarjeta_debito	7
3272	299	124	2025-02-22	2025-03-05	entregado	148277.41	5.00	tarjeta_credito	1
3273	1495	20	2025-08-11	2025-08-25	entregado	1239.96	15.00	transferencia	1
3274	1200	112	2026-01-08	2026-01-13	enviado	26101.10	0.00	tarjeta_credito	1
3275	97	153	2025-11-06	2025-11-13	entregado	135519.48	10.00	PayPal	6
3276	633	87	2024-09-13	2024-09-28	procesando	141147.26	0.00	tarjeta_credito	8
3277	1813	133	2024-12-08	2024-12-22	entregado	91725.34	5.00	transferencia	5
3278	1766	195	2025-07-26	2025-08-08	cancelado	3807.71	15.00	efectivo	3
3279	1683	183	2025-09-17	2025-09-23	procesando	151682.54	5.00	PayPal	8
3280	1406	51	2026-02-16	2026-02-24	procesando	200750.77	0.00	tarjeta_credito	7
3281	813	96	2024-03-15	2024-03-25	pendiente	163441.46	0.00	transferencia	1
3282	1285	137	2024-03-06	2024-03-19	pendiente	18522.72	15.00	transferencia	2
3283	438	172	2025-01-10	2025-01-11	enviado	144064.90	0.00	tarjeta_credito	7
3284	553	46	2025-08-13	2025-08-21	devuelto	22803.83	15.00	efectivo	4
3285	636	148	2024-09-22	2024-10-05	procesando	19845.28	0.00	transferencia	6
3286	125	82	2025-05-13	2025-05-18	entregado	230910.70	0.00	efectivo	2
3287	168	106	2026-05-12	2026-05-15	enviado	82698.66	10.00	efectivo	4
3288	1469	141	2023-08-26	2023-09-01	entregado	102220.23	5.00	PayPal	8
3289	1891	82	2025-05-24	2025-05-25	entregado	48690.19	0.00	efectivo	6
3290	336	136	2025-07-09	2025-07-22	entregado	50397.59	10.00	tarjeta_credito	7
3291	1892	71	2025-02-23	2025-02-24	pendiente	95483.37	0.00	tarjeta_debito	8
3292	938	181	2024-11-17	2024-11-22	enviado	295561.10	0.00	tarjeta_debito	3
3293	1215	180	2024-09-16	2024-09-22	procesando	42689.24	5.00	transferencia	5
3294	1799	182	2026-02-21	2026-02-26	devuelto	34498.13	15.00	transferencia	3
3295	537	163	2024-03-28	2024-04-09	entregado	16507.14	5.00	tarjeta_debito	4
3296	1355	199	2024-10-14	2024-10-16	enviado	130476.88	0.00	transferencia	2
3297	45	9	2023-12-19	2023-12-28	entregado	32412.52	20.00	PayPal	3
3298	1186	146	2025-01-20	2025-01-22	entregado	41491.11	0.00	tarjeta_credito	3
3299	1030	33	2024-01-26	2024-02-01	enviado	1399.00	20.00	transferencia	1
3300	1982	197	2025-06-08	2025-06-13	enviado	108311.91	0.00	efectivo	6
3301	962	145	2025-12-12	2025-12-18	procesando	101719.53	10.00	OXXO	5
3302	469	68	2024-06-23	2024-07-08	entregado	8628.34	20.00	OXXO	3
3303	1579	58	2024-11-01	2024-11-05	pendiente	67774.02	0.00	OXXO	8
3304	1417	7	2023-07-25	2023-08-07	entregado	160312.06	15.00	tarjeta_debito	2
3305	1926	188	2025-02-06	2025-02-16	entregado	131959.97	5.00	tarjeta_debito	6
3306	1911	116	2024-12-07	2024-12-21	entregado	134145.71	0.00	transferencia	4
3307	1416	187	2025-10-02	2025-10-05	enviado	68276.94	0.00	tarjeta_credito	2
3308	374	101	2024-09-18	2024-09-29	entregado	82644.11	20.00	PayPal	2
3309	655	66	2024-12-21	2025-01-03	entregado	195000.23	5.00	PayPal	4
3310	1572	119	2023-11-21	2023-11-22	entregado	33300.54	0.00	tarjeta_credito	8
3311	52	160	2024-05-13	2024-05-24	procesando	46109.60	5.00	tarjeta_debito	7
3312	1370	56	2025-05-28	2025-06-05	entregado	4921.47	15.00	OXXO	4
3313	267	110	2024-07-26	2024-08-03	entregado	63261.55	20.00	transferencia	1
3314	523	190	2023-09-10	2023-09-11	entregado	260377.94	5.00	OXXO	4
3315	904	155	2023-07-18	2023-07-26	entregado	76715.26	0.00	OXXO	4
3316	1271	151	2024-01-03	2024-01-17	cancelado	235444.97	0.00	tarjeta_credito	5
3317	742	71	2024-12-10	2024-12-12	cancelado	47085.80	10.00	PayPal	4
3318	1039	93	2023-11-28	2023-12-10	pendiente	29885.32	0.00	tarjeta_debito	7
3319	1656	38	2026-05-06	2026-05-08	entregado	183572.12	15.00	tarjeta_credito	6
3320	1236	186	2024-09-07	2024-09-10	entregado	110500.92	0.00	PayPal	8
3321	1962	26	2024-06-02	2024-06-13	entregado	62688.37	0.00	tarjeta_debito	2
3322	1999	166	2023-12-11	2023-12-21	pendiente	12528.66	0.00	OXXO	4
3323	1314	77	2023-09-02	2023-09-08	pendiente	233744.97	15.00	PayPal	7
3324	1535	25	2023-11-03	2023-11-10	entregado	176139.06	0.00	tarjeta_credito	1
3325	1643	6	2026-03-15	2026-03-18	entregado	153831.69	0.00	OXXO	6
3326	1819	134	2023-11-04	2023-11-05	procesando	36391.38	0.00	OXXO	3
3327	1930	84	2025-03-03	2025-03-12	pendiente	96013.33	0.00	OXXO	7
3328	396	25	2026-06-06	2026-06-12	pendiente	86084.97	15.00	transferencia	4
3329	350	187	2023-10-28	2023-11-08	enviado	93343.72	10.00	tarjeta_debito	8
3330	588	173	2024-04-14	2024-04-27	entregado	129506.65	0.00	PayPal	8
3331	650	50	2025-12-12	2025-12-14	procesando	318951.60	0.00	OXXO	5
3332	1556	53	2023-09-08	2023-09-11	cancelado	31259.75	0.00	efectivo	8
3333	1235	50	2025-11-25	2025-11-30	cancelado	368169.07	0.00	OXXO	5
3334	1658	30	2024-05-03	2024-05-14	entregado	21144.94	20.00	PayPal	7
3335	361	163	2024-12-20	2024-12-31	entregado	31761.99	0.00	PayPal	3
3336	1571	127	2023-12-10	2023-12-21	entregado	95388.56	0.00	tarjeta_debito	7
3337	1082	85	2026-05-31	2026-06-11	entregado	40037.50	0.00	tarjeta_credito	3
3338	716	23	2025-10-12	2025-10-25	entregado	61613.72	0.00	OXXO	7
3339	928	34	2026-05-04	2026-05-12	entregado	282041.40	0.00	efectivo	6
3340	849	110	2026-01-04	2026-01-14	entregado	331977.18	0.00	transferencia	7
3341	1631	3	2025-12-05	2025-12-17	entregado	245009.34	10.00	tarjeta_debito	5
3342	4	197	2025-12-27	2025-12-28	devuelto	35578.96	0.00	efectivo	6
3343	929	97	2024-09-27	2024-10-05	entregado	23462.15	10.00	transferencia	6
3344	1528	118	2025-05-13	2025-05-25	entregado	81651.63	5.00	transferencia	5
3345	172	196	2026-02-11	2026-02-17	entregado	36024.74	5.00	PayPal	1
3346	1623	193	2025-08-04	2025-08-08	entregado	172433.10	5.00	efectivo	7
3347	1559	180	2025-05-27	2025-05-29	entregado	189789.86	0.00	tarjeta_credito	7
3348	1716	26	2024-05-04	2024-05-18	entregado	44436.55	10.00	transferencia	4
3349	1713	4	2024-08-21	2024-08-25	procesando	45524.60	15.00	tarjeta_debito	1
3350	1948	126	2023-06-26	2023-06-28	enviado	21226.95	10.00	tarjeta_debito	4
3351	128	148	2024-04-29	2024-05-01	entregado	75400.28	0.00	tarjeta_credito	1
3352	885	102	2025-10-05	2025-10-12	enviado	117103.97	0.00	transferencia	1
3353	680	148	2026-02-11	2026-02-16	entregado	74126.28	0.00	PayPal	8
3354	908	156	2024-01-11	2024-01-22	entregado	26208.35	5.00	efectivo	7
3355	908	9	2024-04-09	2024-04-20	entregado	280690.65	0.00	PayPal	7
3356	1695	18	2025-08-11	2025-08-14	enviado	91751.41	15.00	tarjeta_debito	1
3357	1051	172	2023-09-12	2023-09-21	enviado	72116.26	10.00	transferencia	3
3358	525	200	2025-03-25	2025-04-02	entregado	94906.67	0.00	PayPal	7
3359	1102	176	2024-01-11	2024-01-14	entregado	126255.55	0.00	PayPal	3
3360	1923	179	2025-02-17	2025-02-18	cancelado	210994.81	15.00	PayPal	8
3361	133	84	2024-12-31	2025-01-08	cancelado	69478.81	5.00	efectivo	1
3362	237	50	2025-03-26	2025-04-02	entregado	54029.52	0.00	OXXO	2
3363	135	84	2024-04-20	2024-04-28	procesando	2904.01	5.00	tarjeta_credito	5
3364	37	138	2025-07-20	2025-08-04	enviado	122222.06	15.00	transferencia	5
3365	1922	156	2025-10-11	2025-10-22	entregado	1111.70	0.00	efectivo	1
3366	1164	72	2025-07-03	2025-07-14	cancelado	86639.01	0.00	tarjeta_credito	6
3367	1857	146	2024-02-26	2024-03-08	entregado	243635.04	20.00	tarjeta_credito	4
3368	242	168	2026-02-03	2026-02-09	entregado	90217.06	10.00	OXXO	4
3369	781	149	2026-04-25	2026-04-26	entregado	41645.48	0.00	tarjeta_credito	5
3370	886	188	2024-09-24	2024-09-29	enviado	158162.61	0.00	efectivo	2
3371	673	26	2025-03-12	2025-03-22	entregado	176271.04	0.00	PayPal	2
3372	1773	181	2026-01-14	2026-01-24	devuelto	32522.20	0.00	PayPal	1
3373	44	160	2023-08-21	2023-09-04	devuelto	112710.92	20.00	tarjeta_credito	7
3374	1694	134	2026-01-14	2026-01-29	devuelto	24378.53	0.00	tarjeta_credito	7
3375	1836	164	2024-01-20	2024-02-03	procesando	150856.14	0.00	transferencia	8
3376	1403	39	2024-11-19	2024-11-22	devuelto	3056.85	0.00	transferencia	1
3377	1141	8	2024-07-10	2024-07-22	enviado	6482.50	20.00	PayPal	3
3378	574	174	2026-05-19	2026-05-24	enviado	58993.08	0.00	OXXO	6
3379	1438	124	2025-06-15	2025-06-20	devuelto	38237.45	0.00	tarjeta_credito	4
3380	172	94	2026-01-30	2026-02-11	procesando	160066.76	15.00	tarjeta_credito	8
3381	712	151	2024-01-02	2024-01-05	procesando	112857.33	5.00	PayPal	5
3382	1298	120	2024-02-04	2024-02-09	enviado	30869.24	0.00	efectivo	6
3383	1770	130	2025-04-04	2025-04-07	devuelto	127491.16	0.00	PayPal	1
3384	170	3	2025-09-05	2025-09-19	cancelado	39251.85	0.00	tarjeta_debito	5
3385	1910	160	2025-09-10	2025-09-13	entregado	159698.16	10.00	OXXO	8
3386	113	137	2024-08-10	2024-08-20	entregado	59512.69	5.00	transferencia	3
3387	481	158	2024-06-03	2024-06-15	entregado	28472.79	0.00	efectivo	5
3388	1103	47	2025-12-06	2025-12-10	enviado	82934.53	0.00	tarjeta_credito	6
3389	1328	87	2023-10-08	2023-10-15	enviado	200932.13	10.00	OXXO	6
3390	1782	27	2025-04-06	2025-04-16	enviado	57984.14	15.00	efectivo	4
3391	322	53	2023-10-22	2023-10-28	entregado	141451.71	10.00	PayPal	8
3392	497	31	2023-11-07	2023-11-13	pendiente	70300.78	10.00	tarjeta_debito	4
3393	302	72	2025-02-16	2025-02-21	procesando	118045.63	0.00	tarjeta_debito	6
3394	1634	190	2023-09-27	2023-10-10	enviado	6940.40	0.00	transferencia	3
3395	1130	2	2023-09-10	2023-09-14	pendiente	99544.78	0.00	tarjeta_credito	7
3396	1453	67	2024-08-13	2024-08-26	entregado	120568.01	5.00	efectivo	3
3397	1256	75	2026-03-18	2026-03-26	cancelado	200650.87	5.00	PayPal	7
3398	384	94	2024-06-30	2024-07-09	entregado	72115.90	0.00	tarjeta_debito	8
3399	48	197	2024-01-17	2024-02-01	procesando	80815.59	5.00	efectivo	8
3400	1483	56	2024-04-23	2024-04-24	enviado	95539.28	0.00	PayPal	3
3401	1693	174	2025-09-06	2025-09-13	entregado	153478.47	0.00	OXXO	2
3402	1991	105	2023-11-12	2023-11-18	cancelado	186276.63	0.00	efectivo	4
3403	1742	35	2023-12-04	2023-12-16	entregado	48773.58	10.00	efectivo	2
3404	1699	74	2023-12-16	2023-12-24	pendiente	227907.02	10.00	OXXO	7
3405	434	189	2023-09-17	2023-09-19	entregado	229883.15	0.00	PayPal	8
3406	17	135	2026-04-09	2026-04-23	cancelado	133441.34	20.00	efectivo	4
3407	1037	48	2026-01-08	2026-01-21	entregado	81730.67	0.00	tarjeta_debito	7
3408	1641	85	2023-11-27	2023-12-09	procesando	151289.30	10.00	OXXO	8
3409	1623	195	2024-04-06	2024-04-11	cancelado	140375.85	0.00	tarjeta_debito	6
3410	1899	99	2025-07-30	2025-08-02	entregado	225476.85	5.00	OXXO	4
3411	1608	72	2024-02-27	2024-03-12	entregado	110415.18	0.00	tarjeta_debito	7
3412	250	54	2023-07-17	2023-07-18	entregado	170573.67	5.00	transferencia	1
3413	1876	187	2024-01-08	2024-01-18	enviado	97636.29	5.00	PayPal	5
3414	697	20	2026-03-28	2026-04-04	procesando	92557.17	5.00	PayPal	3
3415	1263	37	2026-01-18	2026-01-25	entregado	89594.51	5.00	OXXO	7
3416	31	79	2025-05-28	2025-06-05	enviado	54883.01	10.00	tarjeta_credito	1
3417	503	108	2025-05-17	2025-05-28	entregado	162275.98	0.00	efectivo	7
3418	1870	46	2024-09-02	2024-09-13	entregado	324510.01	5.00	PayPal	5
3419	151	36	2025-03-30	2025-04-05	entregado	31582.54	5.00	PayPal	1
3420	1388	141	2023-07-24	2023-08-06	procesando	10187.28	15.00	tarjeta_credito	2
3421	188	1	2023-11-12	2023-11-14	entregado	73862.27	10.00	tarjeta_debito	7
3422	53	63	2024-02-15	2024-02-24	entregado	161874.10	5.00	PayPal	5
3423	535	198	2024-12-01	2024-12-05	cancelado	168065.49	0.00	tarjeta_credito	4
3424	356	111	2023-09-03	2023-09-11	cancelado	158192.33	0.00	PayPal	4
3425	1589	19	2026-01-07	2026-01-18	pendiente	168289.70	0.00	efectivo	4
3426	1050	77	2025-02-04	2025-02-05	procesando	46696.72	20.00	PayPal	8
3427	675	198	2024-05-03	2024-05-12	procesando	156298.75	0.00	tarjeta_credito	2
3428	1139	195	2026-04-05	2026-04-07	cancelado	281961.78	10.00	transferencia	5
3429	948	43	2025-12-06	2025-12-18	devuelto	25126.90	15.00	tarjeta_credito	2
3430	327	99	2024-06-11	2024-06-21	procesando	186430.99	0.00	tarjeta_credito	4
3431	118	34	2025-04-02	2025-04-04	entregado	72203.64	0.00	tarjeta_credito	8
3432	1611	193	2026-05-08	2026-05-13	entregado	9693.72	0.00	tarjeta_debito	8
3433	1754	81	2023-06-30	2023-07-09	enviado	114703.70	15.00	PayPal	6
3434	1252	43	2026-04-23	2026-04-30	entregado	96092.74	15.00	tarjeta_credito	7
3435	705	34	2023-11-26	2023-11-29	cancelado	130441.03	0.00	PayPal	2
3436	20	148	2024-07-07	2024-07-11	entregado	278344.37	0.00	tarjeta_credito	8
3437	1233	169	2025-06-06	2025-06-19	entregado	38038.24	0.00	OXXO	3
3438	320	50	2026-05-06	2026-05-08	entregado	11519.12	0.00	tarjeta_credito	3
3439	62	145	2025-12-07	2025-12-21	enviado	15768.64	0.00	efectivo	7
3440	1262	100	2025-12-25	2026-01-08	procesando	45659.30	10.00	tarjeta_credito	8
3441	1015	37	2023-09-10	2023-09-13	entregado	97571.58	10.00	efectivo	1
3442	1426	183	2026-05-28	2026-06-04	procesando	46063.94	15.00	OXXO	6
3443	469	62	2025-04-14	2025-04-20	entregado	14680.21	20.00	OXXO	3
3444	863	34	2024-08-14	2024-08-16	entregado	21252.31	10.00	PayPal	5
3445	774	31	2023-09-22	2023-09-26	entregado	108251.59	15.00	OXXO	2
3446	1660	187	2024-07-19	2024-07-21	entregado	132969.75	5.00	tarjeta_credito	7
3447	908	52	2026-02-19	2026-03-05	cancelado	129057.71	5.00	tarjeta_debito	5
3448	1998	1	2023-10-07	2023-10-12	entregado	99460.44	10.00	efectivo	7
3449	850	87	2025-02-07	2025-02-11	enviado	42913.54	0.00	transferencia	4
3450	1354	133	2024-05-31	2024-06-08	entregado	100040.48	0.00	tarjeta_credito	6
3451	1790	130	2026-05-03	2026-05-15	entregado	1618.56	10.00	efectivo	2
3452	803	37	2024-04-30	2024-05-08	entregado	188320.30	0.00	efectivo	7
3453	1064	62	2025-10-06	2025-10-11	entregado	114749.00	0.00	tarjeta_credito	4
3454	1183	66	2024-05-14	2024-05-28	cancelado	33961.62	5.00	OXXO	5
3455	796	191	2024-10-31	2024-11-11	entregado	27128.62	0.00	tarjeta_credito	1
3456	288	55	2025-06-30	2025-07-01	entregado	9484.12	20.00	tarjeta_credito	1
3457	832	191	2026-05-10	2026-05-24	enviado	127251.46	15.00	efectivo	1
3458	935	88	2025-10-09	2025-10-24	devuelto	95793.45	5.00	tarjeta_debito	7
3459	1669	119	2023-10-16	2023-10-27	entregado	27369.68	0.00	transferencia	2
3460	1814	101	2025-07-20	2025-07-31	entregado	114059.46	5.00	PayPal	5
3461	402	188	2024-01-10	2024-01-16	entregado	27762.68	15.00	OXXO	8
3462	1607	43	2026-05-22	2026-05-25	pendiente	132685.91	0.00	PayPal	8
3463	165	8	2025-03-03	2025-03-10	procesando	40152.43	0.00	efectivo	8
3464	772	193	2024-10-15	2024-10-17	entregado	155199.84	10.00	OXXO	8
3465	236	176	2023-12-28	2024-01-02	entregado	206317.28	0.00	efectivo	6
3466	1189	95	2024-06-14	2024-06-15	devuelto	95306.72	20.00	tarjeta_credito	3
3467	1287	159	2026-05-05	2026-05-12	procesando	118032.14	0.00	transferencia	4
3468	1995	81	2024-01-24	2024-02-08	pendiente	147562.56	0.00	transferencia	3
3469	1216	66	2025-04-21	2025-04-28	enviado	69162.41	0.00	PayPal	1
3470	1159	134	2025-07-20	2025-07-25	entregado	45435.95	5.00	tarjeta_credito	5
3471	1454	111	2024-10-11	2024-10-19	entregado	39743.68	10.00	transferencia	1
3472	901	76	2025-10-24	2025-11-01	entregado	147334.90	0.00	tarjeta_debito	3
3473	744	44	2024-07-24	2024-07-30	pendiente	51210.04	0.00	OXXO	2
3474	386	66	2025-12-02	2025-12-10	entregado	93635.86	20.00	PayPal	1
3475	1859	148	2024-07-02	2024-07-07	pendiente	30236.54	0.00	efectivo	1
3476	198	100	2025-01-21	2025-01-29	enviado	169469.18	0.00	PayPal	5
3477	1136	43	2025-10-22	2025-10-30	entregado	8473.85	0.00	PayPal	7
3478	1267	162	2025-11-12	2025-11-13	procesando	212753.35	20.00	PayPal	3
3479	1642	150	2024-01-27	2024-02-07	procesando	187534.96	0.00	tarjeta_credito	3
3480	1664	16	2024-04-19	2024-04-24	entregado	294838.08	10.00	transferencia	7
3481	532	119	2024-06-13	2024-06-20	entregado	120084.06	15.00	PayPal	5
3482	1888	91	2026-02-13	2026-02-25	procesando	53220.43	5.00	efectivo	4
3483	1627	147	2025-07-29	2025-08-04	entregado	119309.43	0.00	PayPal	3
3484	1054	111	2025-10-09	2025-10-10	entregado	45736.85	0.00	efectivo	2
3485	514	62	2023-06-25	2023-07-06	cancelado	53092.51	0.00	efectivo	3
3486	23	64	2025-05-27	2025-06-11	procesando	36063.84	10.00	transferencia	6
3487	1706	145	2025-10-13	2025-10-22	procesando	59650.62	0.00	PayPal	1
3488	1596	90	2025-05-27	2025-06-05	cancelado	60808.66	10.00	tarjeta_credito	6
3489	399	4	2024-01-07	2024-01-15	entregado	130681.70	0.00	OXXO	4
3490	1663	14	2025-03-04	2025-03-13	pendiente	23585.50	0.00	tarjeta_credito	7
3491	1306	122	2023-11-04	2023-11-17	entregado	95980.80	0.00	OXXO	2
3492	1192	166	2025-10-03	2025-10-15	entregado	102925.22	0.00	transferencia	2
3493	1186	118	2026-04-01	2026-04-11	entregado	87219.65	0.00	efectivo	6
3494	1918	181	2024-11-20	2024-11-21	cancelado	108727.12	5.00	tarjeta_credito	5
3495	507	131	2023-11-23	2023-12-06	entregado	150791.78	0.00	OXXO	5
3496	504	30	2024-08-30	2024-09-11	cancelado	33300.96	0.00	transferencia	6
3497	1228	119	2025-07-12	2025-07-22	entregado	188495.83	10.00	tarjeta_debito	3
3498	1467	122	2025-03-21	2025-03-24	devuelto	50232.14	15.00	transferencia	1
3499	391	174	2026-01-01	2026-01-11	procesando	42122.04	0.00	transferencia	7
3500	1567	83	2025-10-31	2025-11-15	pendiente	143916.75	0.00	tarjeta_debito	5
3501	392	6	2023-12-06	2023-12-13	enviado	257691.95	15.00	tarjeta_debito	8
3502	788	178	2025-12-18	2025-12-29	enviado	5789.96	0.00	efectivo	2
3503	1195	27	2023-10-21	2023-11-03	entregado	50345.53	5.00	tarjeta_debito	4
3504	877	192	2025-02-04	2025-02-12	entregado	15065.20	5.00	transferencia	4
3505	1094	12	2026-01-25	2026-01-29	devuelto	168516.57	5.00	efectivo	4
3506	589	20	2025-05-22	2025-05-28	cancelado	5205.30	0.00	tarjeta_credito	7
3507	1536	144	2025-08-23	2025-08-30	entregado	76563.49	0.00	efectivo	8
3508	782	44	2026-04-21	2026-04-29	entregado	72379.99	0.00	transferencia	4
3509	1502	89	2024-09-10	2024-09-12	entregado	37871.17	20.00	efectivo	7
3510	1784	79	2023-11-29	2023-12-14	pendiente	309782.18	0.00	OXXO	2
3511	1595	102	2023-07-29	2023-08-07	entregado	91443.00	0.00	transferencia	4
3512	970	164	2026-05-04	2026-05-05	enviado	28994.48	5.00	PayPal	5
3513	458	141	2025-05-09	2025-05-10	entregado	81210.01	5.00	efectivo	8
3514	1039	189	2025-11-10	2025-11-17	entregado	100296.72	0.00	PayPal	1
3515	1823	174	2024-12-17	2025-01-01	entregado	122997.59	5.00	tarjeta_credito	3
3516	577	73	2024-03-10	2024-03-23	procesando	18939.67	5.00	tarjeta_debito	7
3517	135	120	2025-04-17	2025-04-22	procesando	39431.82	0.00	PayPal	8
3518	446	196	2024-01-05	2024-01-19	entregado	74534.15	0.00	tarjeta_debito	2
3519	1058	22	2025-05-18	2025-05-26	pendiente	227716.27	10.00	PayPal	4
3520	1066	191	2026-05-28	2026-06-02	entregado	35796.34	5.00	tarjeta_credito	4
3521	568	146	2025-10-25	2025-11-05	entregado	116533.44	0.00	transferencia	5
3522	1190	48	2023-10-08	2023-10-12	enviado	46444.30	20.00	PayPal	2
3523	417	60	2023-10-13	2023-10-24	entregado	14497.24	5.00	OXXO	8
3524	1659	179	2025-11-12	2025-11-21	entregado	113044.65	0.00	tarjeta_debito	3
3525	748	177	2023-08-15	2023-08-24	entregado	52550.44	15.00	tarjeta_credito	4
3526	815	125	2026-02-02	2026-02-09	entregado	194762.94	0.00	PayPal	5
3527	149	186	2023-10-16	2023-10-29	enviado	66456.97	0.00	tarjeta_debito	8
3528	635	154	2026-05-13	2026-05-21	entregado	16693.18	15.00	OXXO	5
3529	1087	131	2026-01-17	2026-01-18	entregado	170813.94	0.00	PayPal	2
3530	855	124	2026-01-10	2026-01-13	enviado	114174.66	5.00	transferencia	4
3531	1233	166	2024-08-07	2024-08-22	enviado	134939.95	0.00	tarjeta_credito	3
3532	1978	48	2023-12-07	2023-12-18	devuelto	15959.84	0.00	transferencia	6
3533	512	152	2024-09-01	2024-09-05	cancelado	195487.17	0.00	PayPal	3
3534	498	199	2025-06-19	2025-06-20	entregado	53284.14	5.00	PayPal	7
3535	204	174	2025-12-18	2025-12-24	entregado	152844.30	15.00	tarjeta_debito	4
3536	107	178	2024-04-06	2024-04-14	enviado	17274.15	0.00	PayPal	5
3537	790	126	2026-03-27	2026-03-29	entregado	19777.90	20.00	tarjeta_debito	1
3538	523	76	2023-12-28	2023-12-30	devuelto	22223.12	15.00	tarjeta_debito	1
3539	1151	52	2024-02-03	2024-02-06	entregado	116153.30	0.00	PayPal	6
3540	825	48	2025-03-30	2025-04-13	entregado	155753.30	5.00	PayPal	7
3541	1439	18	2023-10-03	2023-10-18	entregado	42710.71	10.00	transferencia	8
3542	1985	105	2026-04-21	2026-05-03	entregado	225656.74	10.00	PayPal	6
3543	1312	17	2025-02-05	2025-02-12	enviado	2036.02	15.00	tarjeta_credito	7
3544	737	198	2023-10-14	2023-10-19	entregado	90753.57	0.00	PayPal	5
3545	1320	57	2024-02-12	2024-02-19	pendiente	55026.15	0.00	tarjeta_debito	8
3546	1519	96	2024-02-10	2024-02-23	entregado	35310.48	15.00	efectivo	6
3547	454	88	2023-09-29	2023-10-07	entregado	381067.07	0.00	PayPal	6
3548	1153	36	2024-11-22	2024-11-28	enviado	132404.08	0.00	PayPal	4
3549	901	75	2024-09-10	2024-09-19	cancelado	95782.05	15.00	tarjeta_debito	7
3550	77	73	2025-09-17	2025-09-22	entregado	18958.63	0.00	efectivo	7
3551	1017	164	2026-02-04	2026-02-07	entregado	89090.29	0.00	PayPal	3
3552	1266	86	2026-01-16	2026-01-31	entregado	128928.48	0.00	tarjeta_credito	4
3553	898	185	2024-02-21	2024-02-25	procesando	254146.05	5.00	tarjeta_credito	4
3554	1709	131	2026-04-09	2026-04-14	entregado	157194.75	0.00	OXXO	3
3555	896	157	2026-05-23	2026-06-01	procesando	31784.80	0.00	tarjeta_credito	1
3556	1074	106	2025-11-15	2025-11-25	cancelado	51757.03	0.00	tarjeta_credito	8
3557	1737	186	2023-08-18	2023-08-22	enviado	124177.57	0.00	tarjeta_credito	4
3558	262	160	2024-09-27	2024-09-28	entregado	229219.95	0.00	efectivo	5
3559	372	92	2026-03-16	2026-03-18	pendiente	45020.25	0.00	transferencia	6
3560	748	82	2023-10-13	2023-10-18	enviado	91177.77	0.00	tarjeta_debito	2
3561	1992	3	2023-09-01	2023-09-12	procesando	52056.34	0.00	efectivo	7
3562	122	87	2024-09-05	2024-09-13	entregado	9162.63	10.00	efectivo	2
3563	105	147	2024-03-05	2024-03-06	procesando	68968.34	10.00	transferencia	2
3564	836	173	2026-01-26	2026-02-06	entregado	12208.20	20.00	transferencia	7
3565	832	6	2025-07-10	2025-07-15	entregado	133796.15	0.00	PayPal	8
3566	1439	152	2025-12-06	2025-12-15	entregado	251821.98	0.00	OXXO	7
3567	1776	159	2023-11-30	2023-12-06	entregado	153865.77	10.00	efectivo	5
3568	806	5	2024-04-15	2024-04-24	entregado	149949.53	10.00	tarjeta_debito	7
3569	44	96	2025-05-09	2025-05-13	cancelado	212524.10	5.00	OXXO	5
3570	1246	181	2024-01-02	2024-01-12	entregado	157493.32	10.00	PayPal	2
3571	1053	120	2024-08-25	2024-09-03	enviado	206061.64	0.00	efectivo	1
3572	396	108	2025-03-12	2025-03-17	enviado	70694.28	0.00	tarjeta_credito	3
3573	1643	191	2024-04-03	2024-04-05	pendiente	91978.20	15.00	transferencia	1
3574	1774	43	2025-07-23	2025-08-03	procesando	95561.78	5.00	tarjeta_credito	5
3575	603	56	2026-01-19	2026-01-30	entregado	61509.12	10.00	efectivo	6
3576	677	113	2026-04-10	2026-04-25	entregado	23492.06	0.00	transferencia	7
3577	1601	194	2023-09-22	2023-09-25	pendiente	6207.18	0.00	OXXO	4
3578	1928	108	2024-06-28	2024-07-06	cancelado	171407.26	20.00	transferencia	2
3579	1326	175	2024-05-14	2024-05-16	devuelto	237904.79	0.00	tarjeta_credito	4
3580	818	125	2023-11-22	2023-11-30	devuelto	66804.24	20.00	PayPal	6
3581	1648	149	2025-04-24	2025-05-06	entregado	29525.90	20.00	efectivo	7
3582	982	56	2023-10-27	2023-10-29	enviado	67908.82	0.00	efectivo	8
3583	1194	31	2025-09-14	2025-09-15	cancelado	263866.24	0.00	efectivo	1
3584	1890	42	2024-11-20	2024-12-05	entregado	369344.88	5.00	OXXO	3
3585	773	151	2023-12-09	2023-12-16	enviado	100409.65	20.00	tarjeta_debito	7
3586	793	125	2024-12-06	2024-12-19	enviado	46623.70	0.00	PayPal	7
3587	1234	3	2023-07-14	2023-07-27	entregado	41933.52	0.00	PayPal	2
3588	1955	77	2025-10-04	2025-10-13	procesando	26923.17	0.00	tarjeta_credito	5
3589	1250	14	2024-11-12	2024-11-25	entregado	25249.73	0.00	tarjeta_debito	8
3590	110	116	2025-09-02	2025-09-08	entregado	212186.26	0.00	tarjeta_debito	8
3591	1149	106	2026-02-01	2026-02-02	enviado	86350.05	0.00	OXXO	3
3592	1126	122	2024-11-21	2024-12-06	entregado	132878.85	0.00	tarjeta_credito	4
3593	1252	32	2025-01-10	2025-01-17	procesando	47338.96	0.00	PayPal	3
3594	1145	8	2025-03-01	2025-03-07	entregado	49733.04	15.00	PayPal	2
3595	1385	5	2024-05-10	2024-05-19	entregado	62126.99	0.00	OXXO	8
3596	734	8	2025-11-06	2025-11-10	enviado	90667.61	5.00	tarjeta_debito	3
3597	661	101	2023-11-29	2023-12-13	enviado	109597.56	20.00	transferencia	5
3598	1584	174	2024-03-26	2024-04-09	entregado	53064.95	10.00	transferencia	8
3599	138	133	2024-03-08	2024-03-11	entregado	223313.18	10.00	OXXO	7
3600	144	104	2025-02-20	2025-03-05	entregado	115629.72	5.00	tarjeta_debito	2
3601	496	3	2025-05-02	2025-05-05	procesando	188422.11	0.00	efectivo	7
3602	621	7	2025-01-10	2025-01-17	entregado	15719.72	10.00	efectivo	8
3603	927	8	2024-09-09	2024-09-13	entregado	124206.44	0.00	tarjeta_debito	5
3604	1978	145	2024-07-22	2024-07-27	entregado	62842.49	0.00	transferencia	7
3605	349	13	2026-04-08	2026-04-22	entregado	103767.72	0.00	PayPal	4
3606	1837	66	2023-08-07	2023-08-10	enviado	138319.80	15.00	OXXO	3
3607	1686	5	2024-06-14	2024-06-18	cancelado	71870.46	0.00	efectivo	6
3608	818	135	2024-01-20	2024-01-30	entregado	116048.61	0.00	tarjeta_credito	3
3609	1796	56	2025-05-22	2025-05-24	procesando	76279.02	0.00	efectivo	1
3610	1945	70	2025-10-03	2025-10-18	entregado	9968.25	0.00	PayPal	5
3611	1424	38	2023-11-08	2023-11-15	enviado	105139.95	20.00	tarjeta_credito	3
3612	984	115	2025-05-03	2025-05-16	entregado	364403.12	0.00	efectivo	7
3613	1923	158	2024-09-13	2024-09-28	entregado	201535.31	0.00	efectivo	5
3614	1632	83	2023-12-08	2023-12-15	devuelto	41193.86	0.00	OXXO	3
3615	1811	148	2024-05-27	2024-05-28	procesando	51840.64	0.00	tarjeta_credito	4
3616	160	137	2024-09-21	2024-09-23	enviado	2115.23	15.00	transferencia	4
3617	1369	47	2024-02-27	2024-03-04	cancelado	206840.52	0.00	OXXO	7
3618	757	180	2024-05-31	2024-06-05	entregado	112710.92	0.00	OXXO	1
3619	452	195	2024-11-14	2024-11-26	devuelto	261076.35	0.00	tarjeta_debito	7
3620	534	78	2026-02-25	2026-02-27	cancelado	67547.51	15.00	PayPal	3
3621	1445	131	2025-10-20	2025-11-04	entregado	103514.56	0.00	efectivo	4
3622	696	164	2024-12-22	2025-01-05	entregado	277323.68	5.00	transferencia	3
3623	1699	137	2024-01-28	2024-02-10	procesando	144977.97	0.00	OXXO	2
3624	1712	195	2025-01-19	2025-02-01	devuelto	279470.33	5.00	OXXO	8
3625	1629	86	2026-01-13	2026-01-17	procesando	127374.49	0.00	tarjeta_credito	8
3626	1378	70	2025-12-13	2025-12-22	cancelado	23845.81	0.00	efectivo	3
3627	1372	67	2026-02-25	2026-03-10	entregado	106449.19	15.00	efectivo	7
3628	1460	90	2026-01-03	2026-01-06	entregado	81114.21	5.00	OXXO	7
3629	223	25	2024-06-27	2024-07-10	enviado	251209.48	0.00	transferencia	3
3630	673	62	2026-06-09	2026-06-13	entregado	242481.05	5.00	transferencia	5
3631	467	196	2025-01-15	2025-01-20	pendiente	9274.66	10.00	PayPal	1
3632	1409	83	2025-01-07	2025-01-18	entregado	31288.24	5.00	tarjeta_debito	4
3633	221	148	2024-06-15	2024-06-30	pendiente	95760.49	20.00	PayPal	8
3634	498	4	2024-07-11	2024-07-22	entregado	112381.13	0.00	tarjeta_credito	4
3635	1555	70	2025-04-09	2025-04-12	procesando	110642.55	0.00	transferencia	3
3636	52	85	2024-05-26	2024-06-08	procesando	42942.75	10.00	OXXO	7
3637	1678	38	2023-08-12	2023-08-17	enviado	200301.59	0.00	efectivo	8
3638	1119	178	2025-03-19	2025-04-02	devuelto	159395.55	0.00	tarjeta_debito	5
3639	426	19	2026-04-12	2026-04-22	procesando	92334.10	0.00	PayPal	6
3640	1561	114	2023-12-24	2024-01-02	pendiente	281839.39	10.00	PayPal	1
3641	1391	145	2024-07-15	2024-07-23	entregado	93235.96	15.00	PayPal	4
3642	1237	115	2023-07-16	2023-07-20	entregado	43630.23	15.00	PayPal	7
3643	1667	93	2023-07-07	2023-07-12	entregado	85189.07	10.00	OXXO	1
3644	1706	116	2024-10-21	2024-10-27	cancelado	84956.06	0.00	efectivo	7
3645	1312	120	2026-06-04	2026-06-19	entregado	93445.50	0.00	tarjeta_credito	8
3646	731	134	2023-11-29	2023-12-13	entregado	34339.89	10.00	PayPal	1
3647	1361	34	2026-04-02	2026-04-10	entregado	73814.76	20.00	tarjeta_debito	1
3648	517	103	2026-03-07	2026-03-22	entregado	63823.17	0.00	PayPal	1
3649	1296	103	2024-12-27	2025-01-11	enviado	26658.96	0.00	transferencia	4
3650	1258	43	2026-03-19	2026-03-22	entregado	2801.38	10.00	efectivo	1
3651	1397	123	2025-02-14	2025-02-25	entregado	70711.21	0.00	PayPal	1
3652	248	18	2025-06-06	2025-06-07	procesando	124779.00	10.00	transferencia	3
3653	1251	175	2026-01-15	2026-01-27	entregado	96326.39	10.00	efectivo	3
3654	1830	111	2025-12-24	2026-01-04	procesando	299813.87	0.00	OXXO	7
3655	563	124	2026-01-27	2026-01-28	entregado	73960.06	5.00	efectivo	3
3656	908	88	2024-02-02	2024-02-08	entregado	65479.23	10.00	tarjeta_credito	4
3657	218	176	2025-05-13	2025-05-14	procesando	24015.17	0.00	transferencia	2
3658	1302	135	2025-03-15	2025-03-18	entregado	266467.25	0.00	PayPal	1
3659	122	127	2024-10-15	2024-10-17	cancelado	130258.56	0.00	transferencia	5
3660	432	10	2024-04-29	2024-04-30	cancelado	131267.15	0.00	OXXO	4
3661	198	102	2023-09-10	2023-09-13	entregado	234304.58	15.00	efectivo	7
3662	1714	190	2025-01-11	2025-01-16	entregado	375467.17	0.00	tarjeta_credito	7
3663	126	111	2023-11-24	2023-12-05	entregado	22215.89	15.00	PayPal	3
3664	149	66	2025-10-04	2025-10-13	entregado	26588.74	0.00	tarjeta_debito	1
3665	1032	170	2025-01-01	2025-01-09	enviado	172302.77	15.00	PayPal	1
3666	1488	27	2025-11-29	2025-12-07	entregado	4113.94	0.00	transferencia	5
3667	953	164	2024-01-16	2024-01-28	entregado	1970.59	5.00	transferencia	6
3668	922	152	2026-04-29	2026-05-14	entregado	87160.28	10.00	transferencia	8
3669	1784	187	2024-08-25	2024-09-05	enviado	121100.62	10.00	efectivo	8
3670	1909	155	2025-12-23	2026-01-06	devuelto	46839.16	10.00	PayPal	4
3671	1521	124	2023-06-24	2023-06-29	enviado	33861.32	15.00	efectivo	3
3672	445	198	2026-03-15	2026-03-24	entregado	123841.81	0.00	tarjeta_debito	4
3673	542	55	2026-04-22	2026-04-27	enviado	65970.29	5.00	tarjeta_credito	8
3674	1739	9	2026-06-07	2026-06-08	entregado	17386.26	20.00	transferencia	6
3675	692	68	2023-12-10	2023-12-16	entregado	83228.33	10.00	PayPal	7
3676	1649	75	2025-12-10	2025-12-17	entregado	31244.88	0.00	tarjeta_credito	2
3677	965	37	2025-04-23	2025-04-24	entregado	311624.20	10.00	PayPal	3
3678	184	122	2025-06-18	2025-06-25	devuelto	22271.76	5.00	tarjeta_credito	1
3679	1604	192	2024-12-30	2025-01-08	pendiente	150292.53	10.00	OXXO	1
3680	1097	177	2023-07-22	2023-08-03	entregado	101666.34	5.00	tarjeta_credito	3
3681	1581	95	2023-08-18	2023-08-19	entregado	12854.24	10.00	tarjeta_debito	1
3682	815	82	2023-11-03	2023-11-18	entregado	271634.97	0.00	tarjeta_debito	8
3683	220	180	2024-03-05	2024-03-14	entregado	103788.16	5.00	tarjeta_credito	8
3684	852	110	2025-02-19	2025-03-06	entregado	43353.10	0.00	tarjeta_debito	7
3685	992	52	2023-11-30	2023-12-02	entregado	144214.74	0.00	tarjeta_credito	7
3686	1094	106	2023-06-30	2023-07-11	entregado	67135.98	0.00	OXXO	5
3687	207	75	2023-10-17	2023-11-01	entregado	12601.17	15.00	efectivo	7
3688	1125	146	2024-07-24	2024-07-28	enviado	170491.96	0.00	tarjeta_debito	6
3689	354	82	2023-11-14	2023-11-22	pendiente	115138.86	5.00	PayPal	8
3690	1470	124	2025-03-16	2025-03-27	cancelado	87008.88	0.00	transferencia	7
3691	70	58	2025-07-17	2025-07-28	procesando	160105.13	5.00	OXXO	1
3692	205	68	2026-05-08	2026-05-23	enviado	60073.26	10.00	tarjeta_credito	8
3693	1631	166	2026-01-05	2026-01-11	enviado	217688.77	10.00	PayPal	7
3694	1492	171	2025-03-13	2025-03-16	entregado	185077.09	5.00	transferencia	8
3695	310	87	2024-02-05	2024-02-07	procesando	44640.70	0.00	OXXO	6
3696	1407	176	2025-02-26	2025-03-02	cancelado	34655.15	5.00	efectivo	2
3697	806	33	2026-05-07	2026-05-14	entregado	218763.49	10.00	PayPal	2
3698	658	185	2024-02-26	2024-03-04	entregado	9641.00	10.00	tarjeta_debito	1
3699	1988	148	2026-02-13	2026-02-19	pendiente	24232.21	5.00	tarjeta_debito	5
3700	1907	52	2024-11-27	2024-12-11	enviado	137452.80	0.00	efectivo	7
3701	1081	16	2023-07-08	2023-07-16	entregado	49524.48	5.00	tarjeta_debito	5
3702	998	38	2024-10-16	2024-10-31	procesando	22372.81	0.00	transferencia	8
3703	794	37	2025-11-30	2025-12-13	enviado	6594.87	10.00	tarjeta_debito	1
3704	1265	105	2024-11-03	2024-11-11	entregado	136144.36	5.00	tarjeta_debito	3
3705	801	136	2025-02-13	2025-02-25	entregado	4961.32	0.00	PayPal	3
3706	1196	86	2025-11-10	2025-11-17	procesando	83955.47	5.00	PayPal	1
3707	1140	80	2024-06-28	2024-07-03	enviado	74041.14	0.00	tarjeta_debito	8
3708	977	53	2025-03-11	2025-03-13	cancelado	162006.28	0.00	PayPal	2
3709	268	172	2023-11-02	2023-11-09	devuelto	172912.42	0.00	tarjeta_credito	5
3710	1634	27	2023-12-19	2024-01-02	procesando	69868.52	0.00	transferencia	7
3711	699	184	2025-06-04	2025-06-18	procesando	100873.66	0.00	PayPal	7
3712	1057	85	2025-10-19	2025-10-26	enviado	36823.61	0.00	efectivo	2
3713	945	27	2025-01-21	2025-01-27	procesando	173825.17	0.00	PayPal	5
3714	672	67	2023-11-24	2023-11-25	procesando	39361.76	10.00	tarjeta_credito	1
3715	726	113	2024-12-26	2025-01-06	entregado	87431.65	5.00	tarjeta_credito	8
3716	852	108	2024-09-10	2024-09-19	entregado	86552.71	0.00	tarjeta_debito	4
3717	244	46	2023-11-20	2023-11-27	entregado	181175.97	5.00	tarjeta_debito	4
3718	718	156	2024-11-02	2024-11-11	entregado	18604.34	15.00	tarjeta_debito	5
3719	743	33	2024-11-01	2024-11-15	devuelto	48831.52	10.00	PayPal	2
3720	793	4	2025-05-20	2025-06-04	entregado	7630.10	0.00	tarjeta_credito	8
3721	869	180	2024-06-19	2024-06-24	entregado	228879.61	10.00	tarjeta_credito	2
3722	1321	197	2025-10-31	2025-11-01	procesando	265265.16	0.00	transferencia	4
3723	1164	165	2025-12-31	2026-01-11	entregado	89439.04	5.00	OXXO	4
3724	1927	81	2023-07-13	2023-07-18	entregado	83302.24	20.00	OXXO	1
3725	1381	26	2025-09-09	2025-09-17	entregado	91751.29	0.00	transferencia	8
3726	1429	27	2024-08-22	2024-08-29	enviado	125748.02	20.00	tarjeta_debito	1
3727	1707	152	2025-11-27	2025-12-08	entregado	158365.08	0.00	PayPal	5
3728	29	135	2026-06-07	2026-06-18	entregado	14294.87	10.00	PayPal	3
3729	342	145	2026-03-12	2026-03-26	entregado	154107.66	10.00	PayPal	7
3730	668	143	2024-10-14	2024-10-15	entregado	165845.67	5.00	transferencia	7
3731	516	83	2025-09-25	2025-10-09	entregado	79351.04	0.00	transferencia	3
3732	1075	4	2025-07-01	2025-07-05	enviado	36766.72	0.00	transferencia	3
3733	848	12	2026-05-15	2026-05-24	entregado	69941.48	5.00	tarjeta_credito	2
3734	1768	135	2023-07-30	2023-07-31	entregado	91671.88	0.00	tarjeta_credito	6
3735	1901	50	2023-11-20	2023-11-29	entregado	48614.86	20.00	PayPal	8
3736	1290	42	2025-07-30	2025-07-31	pendiente	75517.29	20.00	tarjeta_credito	8
3737	145	16	2026-02-03	2026-02-18	procesando	131659.59	5.00	tarjeta_debito	3
3738	420	182	2023-10-28	2023-11-04	pendiente	46938.53	0.00	tarjeta_credito	6
3739	552	18	2024-06-28	2024-07-12	devuelto	82547.62	0.00	PayPal	1
3740	913	1	2025-09-25	2025-10-03	procesando	146849.74	5.00	tarjeta_debito	5
3741	1739	40	2024-02-25	2024-02-29	entregado	121307.75	10.00	tarjeta_debito	5
3742	1196	43	2024-04-03	2024-04-07	enviado	139125.96	10.00	OXXO	8
3743	1321	168	2024-12-07	2024-12-17	entregado	61613.72	5.00	tarjeta_credito	3
3744	1580	199	2025-02-26	2025-03-02	entregado	140323.90	10.00	PayPal	6
3745	933	39	2023-07-22	2023-08-02	entregado	26427.60	0.00	tarjeta_debito	2
3746	1818	112	2025-12-26	2026-01-06	enviado	17409.10	0.00	PayPal	8
3747	749	54	2026-05-05	2026-05-17	enviado	16688.18	5.00	tarjeta_credito	5
3748	1474	150	2026-02-15	2026-02-28	cancelado	94277.84	15.00	PayPal	5
3749	133	110	2023-10-27	2023-11-06	entregado	109294.20	5.00	OXXO	1
3750	384	119	2023-08-06	2023-08-16	procesando	26492.97	5.00	efectivo	6
3751	1743	68	2025-12-28	2026-01-10	entregado	57728.66	20.00	tarjeta_credito	8
3752	1283	42	2023-07-26	2023-07-31	entregado	182783.01	5.00	PayPal	8
3753	554	151	2024-12-31	2025-01-01	cancelado	46275.74	5.00	tarjeta_debito	7
3754	377	142	2023-07-19	2023-07-26	entregado	128980.65	5.00	tarjeta_credito	8
3755	1346	48	2026-04-29	2026-05-13	entregado	98048.90	5.00	tarjeta_credito	6
3756	936	6	2025-12-29	2026-01-08	pendiente	193996.27	0.00	tarjeta_debito	6
3757	915	83	2025-08-15	2025-08-26	pendiente	240668.85	0.00	efectivo	6
3758	1789	163	2024-01-30	2024-02-08	entregado	120891.40	5.00	efectivo	7
3759	1676	154	2026-05-15	2026-05-16	entregado	178891.74	5.00	PayPal	2
3760	262	200	2025-04-05	2025-04-12	cancelado	65073.55	0.00	tarjeta_debito	5
3761	1272	166	2024-11-04	2024-11-17	entregado	40193.52	0.00	tarjeta_debito	6
3762	238	147	2026-03-22	2026-03-29	pendiente	5758.05	0.00	tarjeta_debito	5
3763	1423	69	2024-01-23	2024-01-24	enviado	38447.62	0.00	transferencia	8
3764	1839	41	2024-10-31	2024-11-09	entregado	971.14	0.00	transferencia	4
3765	1952	14	2023-06-19	2023-06-23	entregado	56177.52	0.00	PayPal	1
3766	1935	159	2025-11-30	2025-12-14	procesando	288322.10	0.00	OXXO	7
3767	512	69	2023-11-12	2023-11-17	enviado	7838.16	5.00	PayPal	1
3768	1680	68	2025-09-09	2025-09-10	procesando	1018.29	0.00	tarjeta_credito	6
3769	1600	145	2023-10-09	2023-10-24	entregado	128553.62	0.00	transferencia	3
3770	1907	129	2023-10-02	2023-10-09	entregado	215683.13	0.00	OXXO	6
3771	711	36	2024-08-01	2024-08-10	entregado	48191.71	0.00	transferencia	6
3772	51	186	2024-01-21	2024-02-03	entregado	6686.92	20.00	PayPal	8
3773	1076	43	2024-03-13	2024-03-18	cancelado	211545.40	5.00	tarjeta_credito	4
3774	93	14	2026-02-21	2026-02-24	entregado	41054.52	0.00	OXXO	5
3775	698	64	2025-02-08	2025-02-13	entregado	248307.45	5.00	tarjeta_debito	5
3776	1302	161	2023-08-05	2023-08-10	entregado	48617.81	0.00	tarjeta_credito	5
3777	762	10	2024-08-07	2024-08-18	procesando	86864.76	0.00	tarjeta_debito	8
3778	83	110	2024-07-26	2024-08-06	entregado	40476.69	0.00	tarjeta_credito	7
3779	1328	31	2025-05-02	2025-05-11	enviado	60052.31	15.00	efectivo	6
3780	668	145	2024-11-16	2024-11-19	entregado	70394.50	5.00	tarjeta_credito	4
3781	505	166	2025-08-05	2025-08-10	entregado	139123.59	5.00	transferencia	8
3782	1473	23	2025-12-28	2026-01-06	entregado	42556.38	0.00	OXXO	7
3783	905	179	2023-11-11	2023-11-16	pendiente	290001.20	0.00	tarjeta_credito	5
3784	1118	160	2026-06-06	2026-06-20	enviado	70908.65	0.00	tarjeta_debito	8
3785	204	67	2025-03-11	2025-03-22	entregado	84892.78	10.00	transferencia	5
3786	1238	53	2024-09-23	2024-10-06	entregado	53596.29	5.00	PayPal	4
3787	1465	130	2024-02-07	2024-02-09	entregado	171917.51	10.00	OXXO	8
3788	1649	118	2024-04-18	2024-04-23	devuelto	183443.78	0.00	OXXO	1
3789	1106	75	2025-05-20	2025-05-22	procesando	96722.29	0.00	efectivo	3
3790	1487	18	2023-12-09	2023-12-23	enviado	49781.32	0.00	tarjeta_credito	6
3791	397	170	2026-01-30	2026-02-02	devuelto	13342.16	0.00	efectivo	8
3792	613	16	2025-08-29	2025-09-13	enviado	65966.58	10.00	efectivo	6
3793	1273	95	2023-12-20	2023-12-27	enviado	348918.67	0.00	tarjeta_credito	3
3794	852	133	2025-12-08	2025-12-12	entregado	45401.78	5.00	transferencia	4
3795	224	134	2025-02-01	2025-02-07	enviado	144343.08	0.00	tarjeta_debito	4
3796	1567	191	2024-12-23	2024-12-29	enviado	98055.38	0.00	tarjeta_debito	6
3797	1420	133	2026-02-17	2026-03-01	entregado	138371.30	0.00	transferencia	2
3798	1879	27	2024-04-18	2024-04-21	cancelado	156456.13	0.00	tarjeta_debito	6
3799	211	73	2025-09-27	2025-10-06	cancelado	111410.58	0.00	transferencia	1
3800	316	53	2025-11-19	2025-11-27	entregado	184099.97	15.00	tarjeta_credito	3
3801	1075	191	2026-01-10	2026-01-11	devuelto	88579.41	0.00	OXXO	8
3802	795	60	2024-10-12	2024-10-17	entregado	140903.80	0.00	transferencia	1
3803	372	167	2024-05-04	2024-05-08	entregado	136863.61	0.00	efectivo	2
3804	1455	104	2025-06-09	2025-06-19	cancelado	92874.49	5.00	transferencia	1
3805	1663	44	2024-08-03	2024-08-06	entregado	121917.48	10.00	tarjeta_credito	5
3806	1389	164	2025-03-02	2025-03-08	cancelado	88607.21	0.00	tarjeta_debito	4
3807	1370	98	2023-08-07	2023-08-13	entregado	32591.60	10.00	OXXO	5
3808	1098	94	2025-06-29	2025-07-06	entregado	263075.26	15.00	tarjeta_debito	4
3809	684	74	2023-10-22	2023-10-25	cancelado	131385.08	0.00	efectivo	6
3810	1645	61	2026-03-10	2026-03-23	entregado	44159.64	0.00	tarjeta_credito	4
3811	1256	5	2026-06-03	2026-06-08	entregado	136346.15	5.00	PayPal	3
3812	970	94	2025-07-08	2025-07-12	entregado	111391.30	5.00	tarjeta_credito	6
3813	858	144	2025-03-07	2025-03-11	entregado	106947.02	20.00	transferencia	4
3814	1043	95	2026-02-02	2026-02-11	procesando	5972.80	5.00	tarjeta_debito	8
3815	609	136	2024-04-05	2024-04-15	enviado	42124.51	0.00	efectivo	6
3816	1001	183	2025-04-10	2025-04-24	cancelado	102058.87	0.00	PayPal	1
3817	944	160	2025-09-27	2025-10-04	enviado	123964.74	0.00	OXXO	5
3818	21	78	2025-01-12	2025-01-20	pendiente	31221.02	0.00	tarjeta_credito	8
3819	1654	81	2026-05-11	2026-05-17	entregado	106366.50	10.00	efectivo	6
3820	1057	153	2026-03-24	2026-04-04	entregado	315576.89	5.00	transferencia	8
3821	1773	192	2025-09-12	2025-09-15	entregado	79825.80	0.00	tarjeta_credito	5
3822	492	5	2026-02-06	2026-02-13	entregado	116797.14	0.00	tarjeta_credito	1
3823	1693	110	2023-10-24	2023-11-07	cancelado	260327.89	10.00	tarjeta_debito	7
3824	1555	62	2024-07-15	2024-07-25	entregado	35294.30	5.00	tarjeta_credito	5
3825	1472	38	2026-03-02	2026-03-16	entregado	138395.20	0.00	tarjeta_debito	3
3826	443	41	2024-02-20	2024-03-02	cancelado	76091.91	20.00	tarjeta_credito	5
3827	5	184	2025-09-15	2025-09-26	entregado	106968.80	0.00	tarjeta_debito	3
3828	536	189	2025-07-27	2025-07-30	entregado	397595.87	0.00	tarjeta_debito	3
3829	1586	180	2026-02-17	2026-02-18	entregado	110242.02	0.00	transferencia	3
3830	1116	169	2025-07-17	2025-07-22	procesando	174978.99	0.00	OXXO	8
3831	1162	25	2025-02-19	2025-02-25	entregado	127932.03	0.00	efectivo	7
3832	239	163	2023-09-23	2023-09-30	entregado	18148.40	0.00	OXXO	5
3833	836	189	2023-09-16	2023-09-29	entregado	51483.23	0.00	PayPal	8
3834	939	149	2024-05-29	2024-06-02	entregado	37334.73	15.00	tarjeta_credito	4
3835	1	165	2023-11-02	2023-11-03	enviado	91272.64	0.00	tarjeta_debito	7
3836	113	33	2023-09-22	2023-09-26	pendiente	54361.80	10.00	efectivo	7
3837	963	186	2025-07-11	2025-07-18	entregado	10798.82	10.00	tarjeta_debito	7
3838	384	151	2025-08-17	2025-08-22	entregado	166584.82	5.00	PayPal	8
3839	1450	116	2023-11-23	2023-11-27	enviado	155270.93	10.00	OXXO	5
3840	398	129	2025-07-27	2025-07-29	entregado	90555.05	0.00	tarjeta_debito	3
3841	382	42	2023-06-22	2023-07-06	entregado	93028.45	5.00	tarjeta_credito	4
3842	1025	84	2025-06-15	2025-06-27	entregado	57721.03	0.00	tarjeta_credito	7
3843	297	125	2026-04-16	2026-04-29	enviado	82385.95	10.00	tarjeta_credito	2
3844	570	77	2026-01-10	2026-01-13	entregado	6283.64	15.00	tarjeta_debito	3
3845	516	95	2024-04-08	2024-04-16	procesando	101707.19	5.00	OXXO	4
3846	1179	181	2025-03-04	2025-03-19	cancelado	16186.52	5.00	tarjeta_credito	5
3847	850	41	2025-05-20	2025-05-24	enviado	34437.71	0.00	tarjeta_credito	6
3848	1891	51	2024-07-11	2024-07-20	cancelado	48837.48	10.00	tarjeta_debito	4
3849	1466	134	2023-12-09	2023-12-18	enviado	138517.19	5.00	PayPal	2
3850	1498	157	2026-04-28	2026-05-04	entregado	31716.22	0.00	OXXO	5
3851	697	144	2023-09-28	2023-10-04	enviado	69783.45	0.00	OXXO	3
3852	708	123	2025-09-20	2025-09-24	entregado	75212.24	5.00	tarjeta_debito	1
3853	12	124	2026-06-02	2026-06-11	entregado	146585.07	15.00	PayPal	7
3854	1235	78	2023-08-16	2023-08-30	entregado	108760.02	5.00	efectivo	8
3855	1473	162	2024-06-25	2024-06-28	procesando	171698.65	0.00	PayPal	4
3856	1516	94	2024-04-23	2024-05-07	entregado	135346.21	5.00	transferencia	3
3857	1362	36	2023-11-16	2023-11-30	pendiente	62554.12	15.00	tarjeta_credito	3
3858	682	34	2024-05-17	2024-05-30	cancelado	187965.65	5.00	efectivo	2
3859	1631	29	2026-02-04	2026-02-19	procesando	104958.27	0.00	OXXO	7
3860	365	168	2024-09-28	2024-09-30	entregado	279986.02	5.00	transferencia	7
3861	1836	166	2023-08-07	2023-08-08	procesando	16216.06	15.00	efectivo	1
3862	1514	81	2024-03-10	2024-03-15	entregado	78940.22	0.00	transferencia	5
3863	350	74	2024-08-15	2024-08-28	entregado	60995.04	10.00	tarjeta_credito	7
3864	656	70	2025-03-08	2025-03-11	devuelto	151187.01	5.00	efectivo	4
3865	612	16	2025-04-12	2025-04-20	entregado	66895.94	0.00	OXXO	5
3866	390	31	2026-03-15	2026-03-25	entregado	118787.05	5.00	transferencia	4
3867	1333	8	2024-05-25	2024-05-29	procesando	119566.92	15.00	OXXO	3
3868	335	94	2025-07-12	2025-07-24	cancelado	17405.01	0.00	PayPal	8
3869	577	113	2023-11-05	2023-11-06	entregado	164502.12	5.00	OXXO	7
3870	595	73	2025-07-12	2025-07-21	entregado	151403.93	15.00	tarjeta_debito	1
3871	956	169	2026-04-11	2026-04-19	enviado	120388.64	10.00	OXXO	2
3872	1502	10	2025-10-31	2025-11-03	entregado	188100.03	10.00	efectivo	1
3873	762	101	2024-10-11	2024-10-14	entregado	183821.26	10.00	transferencia	5
3874	1468	151	2026-05-02	2026-05-03	entregado	138058.05	5.00	tarjeta_credito	1
3875	900	44	2025-05-14	2025-05-26	entregado	130715.79	10.00	efectivo	3
3876	64	73	2025-04-12	2025-04-13	procesando	404039.98	0.00	tarjeta_credito	5
3877	176	34	2026-01-12	2026-01-13	entregado	103616.00	5.00	efectivo	4
3878	154	8	2024-06-29	2024-07-05	procesando	58223.42	0.00	efectivo	8
3879	1126	82	2026-03-24	2026-03-31	entregado	154958.67	10.00	transferencia	6
3880	1327	30	2024-12-11	2024-12-13	entregado	31130.11	0.00	tarjeta_credito	6
3881	826	6	2024-06-22	2024-06-24	entregado	206741.33	0.00	transferencia	8
3882	106	176	2025-07-27	2025-07-29	entregado	180794.17	0.00	transferencia	2
3883	215	86	2025-10-04	2025-10-06	entregado	168610.93	10.00	tarjeta_debito	8
3884	1733	25	2025-01-03	2025-01-07	procesando	58209.86	5.00	efectivo	2
3885	74	101	2025-11-08	2025-11-19	cancelado	47584.24	20.00	tarjeta_credito	5
3886	1954	179	2023-08-25	2023-08-28	pendiente	8253.50	0.00	tarjeta_credito	1
3887	1018	52	2023-08-24	2023-09-08	entregado	152841.31	0.00	transferencia	3
3888	660	188	2026-04-07	2026-04-16	enviado	283635.45	0.00	OXXO	3
3889	616	6	2023-07-18	2023-07-25	procesando	133962.31	0.00	PayPal	7
3890	1381	152	2025-09-22	2025-09-28	procesando	56215.70	0.00	tarjeta_debito	7
3891	80	26	2026-05-12	2026-05-27	pendiente	74547.27	10.00	PayPal	4
3892	1602	20	2025-11-22	2025-12-05	procesando	829.50	0.00	tarjeta_credito	1
3893	1662	153	2023-08-12	2023-08-14	entregado	28893.76	10.00	PayPal	8
3894	1929	182	2025-10-28	2025-11-10	enviado	241666.19	5.00	OXXO	3
3895	1058	134	2023-12-08	2023-12-22	pendiente	14103.58	10.00	efectivo	5
3896	1276	39	2024-06-13	2024-06-18	enviado	32542.65	0.00	efectivo	1
3897	305	104	2024-01-20	2024-01-25	enviado	209137.51	0.00	PayPal	7
3898	1281	153	2024-03-27	2024-04-10	entregado	161103.79	0.00	tarjeta_credito	2
3899	77	86	2026-01-19	2026-02-01	entregado	204887.09	5.00	tarjeta_debito	8
3900	304	70	2025-05-20	2025-05-21	procesando	5082.07	0.00	transferencia	4
3901	1359	99	2023-11-22	2023-11-30	enviado	50325.04	0.00	tarjeta_credito	3
3902	515	14	2023-08-16	2023-08-26	procesando	38778.84	5.00	tarjeta_credito	4
3903	392	191	2025-11-25	2025-12-01	entregado	156749.03	0.00	PayPal	3
3904	1376	64	2024-01-08	2024-01-15	entregado	106439.75	10.00	OXXO	3
3905	34	22	2023-12-11	2023-12-25	devuelto	23066.77	0.00	efectivo	2
3906	1392	36	2024-04-21	2024-05-02	cancelado	96928.84	0.00	OXXO	7
3907	1948	151	2024-01-27	2024-02-09	entregado	48157.05	0.00	tarjeta_credito	5
3908	4	173	2025-02-06	2025-02-16	entregado	326127.95	5.00	OXXO	8
3909	801	124	2025-03-25	2025-04-07	entregado	291900.94	10.00	transferencia	4
3910	1819	53	2025-03-21	2025-04-04	enviado	78485.49	5.00	efectivo	1
3911	802	101	2024-03-05	2024-03-16	devuelto	40236.54	0.00	OXXO	6
3912	726	6	2023-06-30	2023-07-11	entregado	27344.18	0.00	tarjeta_credito	1
3913	1124	56	2026-03-15	2026-03-22	enviado	121059.66	0.00	tarjeta_credito	1
3914	720	95	2024-01-11	2024-01-26	entregado	48119.65	10.00	PayPal	5
3915	1587	18	2025-09-25	2025-09-30	entregado	161078.43	0.00	tarjeta_credito	6
3916	27	179	2025-06-08	2025-06-18	enviado	27756.54	20.00	PayPal	1
3917	902	103	2025-12-05	2025-12-15	entregado	168123.60	5.00	tarjeta_credito	5
3918	1252	138	2025-04-06	2025-04-13	entregado	3828.38	0.00	tarjeta_credito	4
3919	275	24	2023-12-03	2023-12-11	entregado	176720.76	10.00	OXXO	2
3920	1995	31	2023-10-06	2023-10-13	entregado	150932.08	0.00	OXXO	1
3921	572	49	2023-09-04	2023-09-10	enviado	150821.09	0.00	tarjeta_credito	6
3922	1677	115	2024-06-16	2024-06-27	pendiente	91552.31	15.00	tarjeta_debito	6
3923	108	184	2025-01-20	2025-02-03	enviado	120697.72	0.00	tarjeta_debito	1
3924	437	109	2023-08-31	2023-09-05	enviado	67246.22	0.00	efectivo	7
3925	967	95	2025-04-21	2025-05-04	procesando	25799.53	15.00	efectivo	4
3926	530	170	2023-09-04	2023-09-09	entregado	18425.07	15.00	transferencia	1
3927	1062	27	2025-06-27	2025-06-28	entregado	77435.85	0.00	OXXO	1
3928	425	127	2025-12-11	2025-12-25	entregado	63664.64	0.00	OXXO	3
3929	1643	2	2023-08-17	2023-08-20	cancelado	252727.08	0.00	tarjeta_credito	7
3930	20	153	2026-04-22	2026-05-02	entregado	119766.08	0.00	PayPal	6
3931	234	103	2024-03-17	2024-03-19	enviado	103303.98	0.00	transferencia	5
3932	640	69	2026-03-05	2026-03-10	entregado	59060.84	5.00	OXXO	7
3933	1470	20	2024-01-04	2024-01-15	entregado	86977.07	5.00	transferencia	8
3934	271	111	2025-11-09	2025-11-10	entregado	37316.00	10.00	tarjeta_credito	3
3935	1484	98	2026-05-03	2026-05-15	cancelado	7443.55	5.00	efectivo	7
3936	729	185	2024-08-02	2024-08-12	entregado	191980.30	0.00	PayPal	6
3937	785	139	2023-08-08	2023-08-21	entregado	6910.02	0.00	PayPal	4
3938	1741	50	2023-12-03	2023-12-08	entregado	177648.56	15.00	tarjeta_credito	1
3939	361	60	2024-10-17	2024-10-26	entregado	31070.66	0.00	OXXO	5
3940	622	66	2025-03-10	2025-03-22	procesando	89641.03	0.00	OXXO	8
3941	1852	60	2024-04-29	2024-05-12	enviado	28123.92	0.00	tarjeta_credito	6
3942	898	87	2025-03-12	2025-03-25	procesando	65261.47	5.00	transferencia	7
3943	1544	56	2025-11-09	2025-11-18	procesando	60735.65	5.00	tarjeta_debito	1
3944	27	41	2024-11-04	2024-11-19	enviado	10639.19	5.00	PayPal	6
3945	322	52	2024-10-15	2024-10-22	procesando	381392.24	5.00	efectivo	2
3946	1617	41	2025-10-26	2025-11-08	cancelado	206948.22	0.00	OXXO	1
3947	1681	134	2024-02-25	2024-02-26	entregado	128308.05	0.00	transferencia	6
3948	1036	160	2023-12-12	2023-12-21	procesando	66135.21	10.00	tarjeta_debito	6
3949	1736	108	2024-06-03	2024-06-12	entregado	51130.65	5.00	PayPal	6
3950	514	180	2026-03-18	2026-03-29	procesando	10779.59	10.00	OXXO	6
3951	37	177	2025-02-20	2025-03-07	enviado	132539.01	0.00	PayPal	4
3952	1529	65	2024-04-30	2024-05-07	enviado	139111.29	0.00	tarjeta_credito	5
3953	603	156	2023-06-20	2023-06-27	devuelto	17332.44	0.00	OXXO	7
3954	1626	85	2025-03-07	2025-03-10	procesando	39046.77	10.00	tarjeta_debito	2
3955	706	170	2025-04-25	2025-04-26	entregado	47774.24	0.00	PayPal	2
3956	1266	11	2024-10-23	2024-11-04	enviado	82378.70	0.00	transferencia	1
3957	156	92	2026-02-04	2026-02-13	procesando	77613.31	5.00	tarjeta_debito	4
3958	1905	71	2024-08-28	2024-08-30	entregado	173700.14	5.00	PayPal	5
3959	711	70	2025-12-15	2025-12-24	entregado	127713.69	10.00	PayPal	2
3960	624	167	2023-09-09	2023-09-22	pendiente	79818.66	0.00	efectivo	1
3961	938	79	2025-03-13	2025-03-22	cancelado	213002.81	0.00	tarjeta_debito	6
3962	1692	173	2026-02-10	2026-02-21	procesando	20337.46	0.00	PayPal	7
3963	916	115	2024-07-30	2024-08-05	entregado	79288.39	10.00	tarjeta_debito	6
3964	992	164	2024-04-17	2024-04-29	entregado	211116.48	0.00	transferencia	4
3965	445	100	2026-01-23	2026-01-28	entregado	154160.81	0.00	efectivo	2
3966	730	196	2025-12-03	2025-12-17	entregado	59998.55	0.00	PayPal	6
3967	895	107	2026-01-31	2026-02-11	entregado	68020.37	15.00	OXXO	3
3968	1968	180	2024-12-17	2024-12-28	entregado	37981.32	0.00	efectivo	2
3969	909	136	2025-07-15	2025-07-27	entregado	80807.08	0.00	transferencia	8
3970	416	16	2024-04-10	2024-04-12	entregado	62147.98	15.00	tarjeta_credito	2
3971	1009	172	2025-01-05	2025-01-18	entregado	142767.50	0.00	tarjeta_credito	1
3972	126	187	2025-07-29	2025-08-04	entregado	100591.32	5.00	tarjeta_debito	6
3973	1899	154	2024-01-20	2024-02-03	entregado	74269.37	5.00	OXXO	8
3974	979	123	2024-04-19	2024-04-25	entregado	160822.49	0.00	efectivo	8
3975	1561	32	2024-11-09	2024-11-15	entregado	206846.73	0.00	efectivo	1
3976	1597	33	2023-06-19	2023-06-30	procesando	71971.23	0.00	efectivo	7
3977	1975	88	2025-06-06	2025-06-16	entregado	44216.16	5.00	transferencia	6
3978	796	46	2023-11-24	2023-11-30	procesando	57224.80	0.00	efectivo	1
3979	480	200	2024-09-25	2024-10-05	enviado	9426.51	5.00	PayPal	4
3980	1240	115	2024-06-02	2024-06-12	entregado	171911.61	0.00	OXXO	5
3981	1287	44	2025-06-05	2025-06-16	entregado	101573.06	5.00	transferencia	1
3982	680	66	2024-12-26	2025-01-03	cancelado	145331.63	0.00	OXXO	4
3983	1250	170	2026-05-20	2026-05-22	pendiente	168119.28	10.00	transferencia	7
3984	1583	177	2025-07-10	2025-07-24	entregado	86432.73	0.00	tarjeta_debito	6
3985	1853	186	2025-08-15	2025-08-29	cancelado	42050.97	0.00	efectivo	4
3986	556	167	2024-12-13	2024-12-17	entregado	17807.42	10.00	PayPal	8
3987	1841	184	2025-02-05	2025-02-14	entregado	120949.52	0.00	tarjeta_debito	5
3988	125	40	2024-12-27	2025-01-10	pendiente	115196.11	10.00	efectivo	7
3989	1056	135	2024-04-14	2024-04-26	procesando	133190.46	5.00	OXXO	1
3990	1105	183	2023-11-30	2023-12-07	entregado	38336.42	15.00	efectivo	3
3991	999	43	2024-09-20	2024-09-28	cancelado	41335.07	0.00	efectivo	8
3992	1127	117	2025-05-11	2025-05-19	procesando	212754.18	5.00	efectivo	7
3993	252	104	2025-07-25	2025-07-27	procesando	7141.48	0.00	transferencia	2
3994	481	190	2023-06-27	2023-07-09	entregado	107851.23	0.00	tarjeta_credito	4
3995	1856	20	2025-10-14	2025-10-21	entregado	74278.61	15.00	OXXO	2
3996	869	44	2024-09-13	2024-09-25	procesando	40029.30	0.00	OXXO	7
3997	983	101	2025-06-24	2025-07-09	procesando	94818.37	5.00	tarjeta_debito	5
3998	952	146	2025-06-05	2025-06-08	entregado	86737.67	0.00	PayPal	7
3999	902	11	2023-11-21	2023-11-23	entregado	115174.55	0.00	OXXO	5
4000	1063	171	2024-06-06	2024-06-14	enviado	56970.37	0.00	PayPal	6
\.


--
-- TOC entry 5095 (class 0 OID 25117)
-- Dependencies: 225
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (producto_id, nombre, marca, modelo, categoria_id, precio_compra, precio_venta, stock, stock_minimo, activo) FROM stdin;
1	Apple Neo Plus	Apple	Neo Plus	1	12624.88	15858.11	41	14	t
2	OnePlus Ultra Pro	OnePlus	Ultra Pro	1	19815.81	24015.17	146	18	t
3	Xiaomi Edge 2022	Xiaomi	Edge 2022	1	22660.56	26253.43	110	7	t
4	Google Ultra S	Google	Ultra S	1	7633.61	8942.68	214	17	t
5	Sony Pro Max S	Sony	Pro Max S	1	18005.83	23066.77	0	14	t
6	Google Plus 2023	Google	Plus 2023	1	13158.59	17267.65	488	19	t
7	Apple Neo 2022	Apple	Neo 2022	1	15946.42	25378.21	129	3	t
8	Samsung SE 2023	Samsung	SE 2023	1	19321.81	28612.40	170	7	f
9	OnePlus Plus 97	OnePlus	Plus 97	1	24523.36	33482.70	93	7	t
10	Sony Pro Max S	Sony	Pro Max S	1	1238.59	1535.56	21	13	t
11	Google Edge 2022	Google	Edge 2022	1	18869.28	23322.36	182	4	t
12	OnePlus Lite Pro	OnePlus	Lite Pro	1	11008.24	14641.07	225	15	t
13	Xiaomi Edge 98	Xiaomi	Edge 98	1	9278.57	13999.33	136	5	t
14	Samsung Neo 2024	Samsung	Neo 2024	1	13705.04	17741.79	40	13	t
15	OPPO Edge Plus	OPPO	Edge Plus	1	4291.12	5791.98	228	4	t
16	OnePlus Neo 2022	OnePlus	Neo 2022	1	2014.77	2894.98	186	19	t
17	Xiaomi Pro Max 28	Xiaomi	Pro Max 28	1	1014.75	1197.66	398	14	t
18	Apple Plus 96	Apple	Plus 96	1	23728.26	31259.75	390	5	t
19	OnePlus Neo X	OnePlus	Neo X	1	6352.85	7630.10	376	8	t
20	Google Ultra X	Google	Ultra X	1	17645.34	21995.92	313	12	t
21	Sony Standard 2024	Sony	Standard 2024	1	21342.73	28885.66	460	17	t
22	OnePlus SE X	OnePlus	SE X	1	22299.59	34187.79	364	8	t
23	Motorola Ultra 2024	Motorola	Ultra 2024	1	6032.89	8278.99	184	20	t
24	Sony Plus 2023	Sony	Plus 2023	1	1783.84	2371.03	367	18	t
25	Google Ultra Pro	Google	Ultra Pro	1	16112.11	21791.44	348	19	t
26	Xiaomi Plus 2022	Xiaomi	Plus 2022	1	20810.06	28783.35	155	8	t
27	Acer Pavilion X	Acer	Pavilion X	2	5028.10	7946.20	140	7	t
28	LG Air 2024	LG	Air 2024	2	14856.44	20966.76	87	13	t
29	Apple Pro 2022	Apple	Pro 2022	2	23721.39	35509.97	135	9	t
30	MSI Pro X	MSI	Pro X	2	16101.40	20705.47	125	15	t
31	Dell Pro 30	Dell	Pro 30	2	10478.20	14239.86	174	7	t
32	Acer ThinkPad 2024	Acer	ThinkPad 2024	2	19052.53	26325.66	54	13	t
33	Dell Pavilion S	Dell	Pavilion S	2	3650.81	4281.57	484	15	t
34	MSI Inspiron Pro	MSI	Inspiron Pro	2	23353.73	34435.26	97	8	t
35	LG Swift X	LG	Swift X	2	12509.65	14893.01	201	19	t
36	Lenovo Inspiron Pro	Lenovo	Inspiron Pro	2	1359.15	1735.10	305	18	t
37	Apple Air 2024	Apple	Air 2024	2	22079.02	32619.07	391	15	t
38	MSI Pro S	MSI	Pro S	2	9158.72	11721.98	197	19	t
39	LG Pavilion 2023	LG	Pavilion 2023	2	3347.29	3995.01	191	13	t
40	Acer Elite Plus	Acer	Elite Plus	2	12576.94	14719.88	70	13	t
41	LG Swift 2024	LG	Swift 2024	2	8299.95	11834.74	83	15	t
42	ASUS ThinkPad 74	ASUS	ThinkPad 74	2	17762.18	22822.73	417	3	t
43	Dell VivoBook X	Dell	VivoBook X	2	19949.36	29453.15	352	3	t
44	ASUS Inspiron 16	ASUS	Inspiron 16	2	4387.22	6287.16	317	15	t
45	Lenovo Pro 2023	Lenovo	Pro 2023	2	4890.99	6595.34	214	7	t
46	Lenovo VivoBook 74	Lenovo	VivoBook 74	2	21839.52	32347.10	31	7	t
47	LG ThinkPad 94	LG	ThinkPad 94	2	13208.11	17054.16	88	17	t
48	Acer ThinkPad X	Acer	ThinkPad X	2	15310.40	18931.60	126	11	t
49	Lenovo Fire 36	Lenovo	Fire 36	3	8028.46	10492.89	478	11	t
50	Huawei MatePad Plus	Huawei	MatePad Plus	3	20486.68	32360.23	411	7	t
51	Lenovo Tab 54	Lenovo	Tab 54	3	16450.91	24451.03	109	9	t
52	Lenovo MatePad X	Lenovo	MatePad X	3	3561.23	5082.07	300	10	t
53	Microsoft MatePad S	Microsoft	MatePad S	3	1454.40	1943.06	367	18	t
54	Samsung Tab 2024	Samsung	Tab 2024	3	10261.65	16118.63	449	18	t
55	Samsung Fire X	Samsung	Fire X	3	16200.56	25249.73	45	10	t
56	Microsoft Tab Plus	Microsoft	Tab Plus	3	22073.79	27131.00	470	4	t
57	Amazon Surface X	Amazon	Surface X	3	21937.07	25319.11	290	6	t
58	Lenovo Fire 68	Lenovo	Fire 68	3	22248.11	26928.89	258	17	t
59	Apple Fire 30	Apple	Fire 30	3	16259.89	23956.82	7	13	t
60	Huawei Pad Plus	Huawei	Pad Plus	3	20700.70	28605.81	44	15	t
61	Samsung Pad Pro	Samsung	Pad Pro	3	23405.26	26987.99	196	10	t
62	Lenovo Fire 2022	Lenovo	Fire 2022	3	6649.60	8722.93	120	4	t
63	Amazon Fire Plus	Amazon	Fire Plus	3	17198.93	26923.17	454	12	t
64	Microsoft Fire S	Microsoft	Fire S	3	5595.35	6770.97	78	17	t
65	Huawei Fire 63	Huawei	Fire 63	3	18970.16	28661.97	422	9	t
66	Microsoft MatePad 20	Microsoft	MatePad 20	3	13275.10	17427.59	469	6	t
67	Huawei MatePad 2024	Huawei	MatePad 2024	3	4238.75	6504.44	226	6	t
68	Microsoft MatePad 2023	Microsoft	MatePad 2023	3	22487.40	30368.50	28	17	t
69	Amazon Surface 2022	Amazon	Surface 2022	3	14036.11	20390.90	157	3	t
70	Apple Pad 2023	Apple	Pad 2023	3	1275.45	1664.51	32	20	t
71	Sharp OLED Plus	Sharp	OLED Plus	4	4622.54	5597.63	328	16	t
72	Philips Nanocell Plus	Philips	Nanocell Plus	4	2144.21	3396.14	447	20	t
73	Panasonic OLED Plus	Panasonic	OLED Plus	4	13291.74	19639.03	114	3	t
74	Hisense Nanocell Plus	Hisense	Nanocell Plus	4	13368.55	20327.04	126	17	t
75	Hisense QLED 2022	Hisense	QLED 2022	4	20265.53	27128.62	392	3	t
76	LG OLED 2022	LG	OLED 2022	4	11244.06	16330.99	446	4	t
77	Samsung Nanocell S	Samsung	Nanocell S	4	13563.03	20201.77	397	4	t
78	Hisense QLED Pro	Hisense	QLED Pro	4	14500.25	21716.19	419	13	t
79	Sony C2 S	Sony	C2 S	4	10426.97	13282.08	285	8	t
80	Philips Bravia 2022	Philips	Bravia 2022	4	24311.41	38259.20	343	15	t
81	Panasonic C2 Plus	Panasonic	C2 Plus	4	3858.06	5090.35	386	20	t
82	TCL Crystal UHD 28	TCL	Crystal UHD 28	4	22881.32	32104.18	495	16	t
83	Sony Nanocell X	Sony	Nanocell X	4	5202.92	7497.50	472	17	t
84	LG Bravia 2022	LG	Bravia 2022	4	6821.27	9912.34	308	4	t
85	TCL G2 S	TCL	G2 S	4	12062.95	18592.18	170	12	t
86	Samsung QLED 2023	Samsung	QLED 2023	4	18709.95	27867.51	468	10	t
87	TCL Nanocell Pro	TCL	Nanocell Pro	4	19421.52	25661.61	273	14	t
88	Beats Flip 22	Beats	Flip 22	5	19076.48	24686.97	104	14	t
89	Sony AirPods 2024	Sony	AirPods 2024	5	553.06	773.73	299	16	t
90	Sennheiser Charge Plus	Sennheiser	Charge Plus	5	14309.27	18037.96	281	13	t
91	Beats Galaxy Buds 92	Beats	Galaxy Buds 92	5	11601.60	17167.44	180	8	t
92	Beats QuietComfort 2022	Beats	QuietComfort 2022	5	13170.02	20118.27	38	4	t
93	Jabra QuietComfort S	Jabra	QuietComfort S	5	1839.00	2239.83	111	19	t
94	Sony AirPods 91	Sony	AirPods 91	5	16533.22	19130.25	272	20	t
95	Sony AirPods X	Sony	AirPods X	5	575.99	873.16	345	16	t
96	JBL WH-1000 2024	JBL	WH-1000 2024	5	6138.08	8770.71	129	14	t
97	Jabra WH-1000 Plus	Jabra	WH-1000 Plus	5	11556.09	14554.24	356	10	t
98	Bose Galaxy Buds 2022	Bose	Galaxy Buds 2022	5	2473.49	3266.66	282	18	t
99	Sony Galaxy Buds 2023	Sony	Galaxy Buds 2023	5	12571.48	16911.90	401	13	t
100	Bose AirPods S	Bose	AirPods S	5	5403.71	8325.24	454	18	t
101	Bose Galaxy Buds 2022	Bose	Galaxy Buds 2022	5	4606.96	7061.05	8	9	t
102	Jabra WH-1000 2024	Jabra	WH-1000 2024	5	14164.36	19901.11	434	15	t
103	Samsung Flip 2023	Samsung	Flip 2023	5	12594.70	20005.99	27	6	t
104	Bose Charge Plus	Bose	Charge Plus	5	24227.68	31420.14	324	11	t
105	Beats Flip Pro	Beats	Flip Pro	5	13892.99	18324.05	95	15	t
106	Apple QuietComfort 2023	Apple	QuietComfort 2023	5	6809.10	8994.82	401	7	t
107	Samsung Charge 2023	Samsung	Charge 2023	5	279.10	359.68	184	11	t
108	Bose QuietComfort 65	Bose	QuietComfort 65	5	13991.08	19316.06	52	3	t
109	Bose AirPods Pro	Bose	AirPods Pro	5	21613.40	24975.44	211	15	t
110	Sennheiser AirPods 2024	Sennheiser	AirPods 2024	5	17180.10	21067.54	137	12	t
111	JBL WH-1000 Plus	JBL	WH-1000 Plus	5	7007.65	9004.05	400	5	t
112	Sennheiser Galaxy Buds 90	Sennheiser	Galaxy Buds 90	5	14906.09	18453.69	54	7	t
113	Jabra Charge Plus	Jabra	Charge Plus	5	20131.30	26136.34	171	16	t
114	Nintendo Switch S	Nintendo	Switch S	6	12053.39	14824.91	203	13	t
115	Logitech OLED S	Logitech	OLED S	6	8248.27	10525.91	402	15	t
116	SteelSeries Xbox Series 2024	SteelSeries	Xbox Series 2024	6	17090.56	23884.82	487	17	t
117	Microsoft OLED 2023	Microsoft	OLED 2023	6	20501.29	30916.88	209	18	t
118	Nintendo Xbox Series 2024	Nintendo	Xbox Series 2024	6	17923.62	26976.56	37	17	t
119	Razer Pro Controller Plus	Razer	Pro Controller Plus	6	13659.58	20568.93	184	20	t
120	Sony PS5 Pro	Sony	PS5 Pro	6	4283.51	6107.02	288	15	t
121	Nintendo OLED 2022	Nintendo	OLED 2022	6	2600.37	3250.20	382	19	t
122	Logitech Pro Controller 38	Logitech	Pro Controller 38	6	9446.87	12832.42	347	19	t
123	Sony OLED X	Sony	OLED X	6	10486.99	16598.57	59	7	t
124	Nintendo OLED 36	Nintendo	OLED 36	6	8805.26	10512.87	369	17	t
125	Nintendo PS5 2022	Nintendo	PS5 2022	6	21252.12	30636.77	346	8	t
126	Logitech Xbox Series 2024	Logitech	Xbox Series 2024	6	13864.97	18009.84	218	17	t
127	Razer Xbox Series Plus	Razer	Xbox Series Plus	6	9980.22	14788.94	452	9	t
128	Razer OLED S	Razer	OLED S	6	5263.74	7835.32	414	5	t
129	SteelSeries Xbox Series Pro	SteelSeries	Xbox Series Pro	6	5047.30	6063.22	343	18	t
130	Logitech Switch Plus	Logitech	Switch Plus	6	15341.01	21694.52	178	14	t
131	SteelSeries Xbox Series X	SteelSeries	Xbox Series X	6	22979.26	32528.88	344	7	t
132	Microsoft Switch 2024	Microsoft	Switch 2024	6	9426.66	11440.30	198	16	t
133	Fujifilm Alpha 2024	Fujifilm	Alpha 2024	7	13939.58	19101.95	71	8	t
134	Fujifilm HERO Pro	Fujifilm	HERO Pro	7	23803.27	32564.64	99	15	t
135	Panasonic Lumix Plus	Panasonic	Lumix Plus	7	17164.71	22949.80	430	17	t
136	Canon HERO S	Canon	HERO S	7	7408.43	9436.00	275	12	t
137	Fujifilm HERO 2023	Fujifilm	HERO 2023	7	14381.94	18272.97	278	14	t
138	Canon Lumix S	Canon	Lumix S	7	24745.93	29598.30	424	10	t
139	Canon X-T Pro	Canon	X-T Pro	7	21575.66	25656.53	443	6	t
140	Nikon Alpha Pro	Nikon	Alpha Pro	7	21547.06	30696.33	219	8	t
141	Nikon Alpha Pro	Nikon	Alpha Pro	7	13377.18	18976.68	86	13	t
142	Sony Z-Series X	Sony	Z-Series X	7	23817.07	32902.97	460	6	t
143	Fujifilm EOS 2024	Fujifilm	EOS 2024	7	17580.45	21267.26	74	13	t
144	GoPro X-T 2024	GoPro	X-T 2024	7	14499.02	18427.13	212	15	t
145	GoPro EOS X	GoPro	EOS X	7	17413.38	26900.06	232	18	t
146	Canon Lumix 21	Canon	Lumix 21	7	15925.79	23311.85	435	5	t
147	Fujifilm Alpha S	Fujifilm	Alpha S	7	12443.67	16118.15	145	13	t
148	Nikon HERO Pro	Nikon	HERO Pro	7	22369.74	33398.34	23	6	t
149	Fujifilm EOS 2024	Fujifilm	EOS 2024	7	11115.96	12786.74	490	16	t
150	GoPro Alpha X	GoPro	Alpha X	7	4100.59	6436.80	140	5	t
151	Sony EOS 2024	Sony	EOS 2024	7	1436.91	2056.97	371	10	t
152	Canon Lumix 2022	Canon	Lumix 2022	7	5453.52	6462.82	303	10	t
153	Fujifilm EOS Pro	Fujifilm	EOS Pro	7	20455.16	32619.22	216	7	t
154	Nikon X-T 2023	Nikon	X-T 2023	7	2714.56	3570.74	153	7	t
155	Nikon Lumix 2024	Nikon	Lumix 2024	7	1850.03	2596.48	312	8	t
156	GoPro Alpha 2024	GoPro	Alpha 2024	7	23009.37	32839.76	226	9	t
157	Canon Alpha Plus	Canon	Alpha Plus	7	8885.66	11935.44	405	7	t
158	GoPro EOS X	GoPro	EOS X	7	19507.40	28494.74	434	12	t
159	Panasonic HERO Plus	Panasonic	HERO Plus	7	7494.22	8802.38	459	10	t
160	Samsung Charge 2023	Samsung	Charge 2023	8	13277.92	21111.41	184	13	t
161	Xiaomi Charge 2024	Xiaomi	Charge 2024	8	19103.74	30174.43	394	5	f
162	Apple Watch S	Apple	Watch S	8	1139.70	1341.67	404	15	t
163	Huawei Band Plus	Huawei	Band Plus	8	17589.99	20880.95	274	20	t
164	Garmin Watch 2023	Garmin	Watch 2023	8	12855.92	15959.84	413	7	t
165	Fitbit Band 2023	Fitbit	Band 2023	8	7857.71	10583.30	488	10	t
166	Apple Charge 24	Apple	Charge 24	8	15365.58	18050.91	341	8	t
167	Huawei Galaxy Watch 2022	Huawei	Galaxy Watch 2022	8	4221.24	6664.74	267	19	t
168	Huawei Vivoactive Pro	Huawei	Vivoactive Pro	8	3304.23	4961.32	137	6	t
169	Apple Vivoactive X	Apple	Vivoactive X	8	13167.78	16701.06	499	5	t
170	Xiaomi Vivoactive 17	Xiaomi	Vivoactive 17	8	21505.09	26345.81	80	11	t
171	Xiaomi Watch 2022	Xiaomi	Watch 2022	8	1244.34	1914.19	125	4	t
172	Fitbit Galaxy Watch 2022	Fitbit	Galaxy Watch 2022	8	13888.69	21684.08	379	16	t
173	Samsung Charge X	Samsung	Charge X	8	20676.03	29095.13	61	19	t
174	Apple Galaxy Watch 2022	Apple	Galaxy Watch 2022	8	23858.87	28177.73	238	12	t
175	Garmin Vivoactive 21	Garmin	Vivoactive 21	8	348.03	431.66	288	12	t
176	Samsung Charge 57	Samsung	Charge 57	8	24945.01	37396.28	375	20	t
177	Samsung Galaxy Watch Plus	Samsung	Galaxy Watch Plus	8	744.17	1037.15	325	3	t
178	Nest Kasa 2023	Nest	Kasa 2023	9	5249.08	8358.65	214	18	t
179	Google Smart Hub 2023	Google	Smart Hub 2023	9	1240.92	1556.32	432	19	t
180	Philips Kasa 2023	Philips	Kasa 2023	9	12709.88	18260.88	201	5	t
181	Amazon Kasa 2024	Amazon	Kasa 2024	9	6033.78	7647.49	161	15	t
182	Nest Hue 50	Nest	Hue 50	9	6908.10	8176.49	103	7	t
183	Ring Echo 2023	Ring	Echo 2023	9	4234.72	5758.05	208	6	t
184	Google Kasa 49	Google	Kasa 49	9	6735.45	8109.22	80	12	t
185	Nest Ring S	Nest	Ring S	9	20922.73	27147.39	46	10	t
186	TP-Link Ring X	TP-Link	Ring X	9	6615.14	10556.47	15	15	t
187	Ring Smart Hub S	Ring	Smart Hub S	9	2503.92	2994.33	406	7	t
188	Amazon Nest S	Amazon	Nest S	9	20618.28	27164.75	322	5	t
189	Philips Echo 2023	Philips	Echo 2023	9	5064.10	7295.82	414	7	t
190	Philips Echo 15	Philips	Echo 15	9	1408.35	2205.28	221	15	t
191	TP-Link Smart Hub 2024	TP-Link	Smart Hub 2024	9	8945.49	13943.67	140	11	t
192	Google Echo S	Google	Echo S	9	16234.87	22314.85	451	20	t
193	Logitech DataTraveler Plus	Logitech	DataTraveler Plus	10	5106.53	7905.39	269	10	t
194	SanDisk PowerCore Pro	SanDisk	PowerCore Pro	10	12070.16	18125.11	176	19	t
195	Logitech USB-C Pro	Logitech	USB-C Pro	10	14988.34	17434.24	415	11	t
196	Kingston Extreme S	Kingston	Extreme S	10	24353.40	29103.79	336	10	t
197	Ugreen PowerCore Plus	Ugreen	PowerCore Plus	10	8966.90	13698.28	432	8	t
198	SanDisk MX Keys Pro	SanDisk	MX Keys Pro	10	22862.40	26581.95	358	14	t
199	SanDisk USB-C S	SanDisk	USB-C S	10	20941.92	31720.32	496	18	t
200	Belkin DataTraveler 2023	Belkin	DataTraveler 2023	10	1545.77	2196.15	10	19	t
201	Logitech Extreme 2024	Logitech	Extreme 2024	10	8617.86	10598.73	410	13	t
202	Belkin Extreme 2023	Belkin	Extreme 2023	10	21185.05	32567.80	491	5	t
203	Ugreen DataTraveler 2023	Ugreen	DataTraveler 2023	10	8513.54	11026.49	499	8	t
204	Kingston DataTraveler Pro	Kingston	DataTraveler Pro	10	4478.94	7103.30	355	14	t
205	SanDisk USB-C X	SanDisk	USB-C X	10	18389.78	23585.50	90	3	t
206	SanDisk DataTraveler 2022	SanDisk	DataTraveler 2022	10	4674.73	6045.35	414	10	t
207	Anker DataTraveler Pro	Anker	DataTraveler Pro	10	18671.78	23472.26	163	8	t
208	Anker MX Keys 2022	Anker	MX Keys 2022	10	6740.53	8508.53	34	14	t
209	Anker PowerCore Plus	Anker	PowerCore Plus	10	11039.77	14780.53	85	16	t
210	Epson WorkForce 2023	Epson	WorkForce 2023	11	20745.85	31221.02	295	10	t
211	HP OfficeJet 2022	HP	OfficeJet 2022	11	8070.12	12736.65	37	13	t
212	Brother PIXMA 2023	Brother	PIXMA 2023	11	8548.07	13620.27	457	18	t
213	Brother PIXMA Plus	Brother	PIXMA Plus	11	4054.03	4846.86	105	9	t
214	Xerox WorkForce X	Xerox	WorkForce X	11	7540.41	8996.93	201	20	t
215	Canon OfficeJet 2022	Canon	OfficeJet 2022	11	10776.01	13820.74	338	18	t
216	HP PIXMA X	HP	PIXMA X	11	24429.88	33300.54	59	12	t
217	Brother Brother HL X	Brother	Brother HL X	11	2414.75	3368.23	94	14	t
218	Epson PIXMA 2022	Epson	PIXMA 2022	11	6692.90	9097.50	115	11	t
219	Canon OfficeJet Pro	Canon	OfficeJet Pro	11	20233.28	27037.61	387	10	t
220	Brother WorkForce 63	Brother	WorkForce 63	11	14381.95	18064.29	153	5	t
221	HP WorkForce 2024	HP	WorkForce 2024	11	3139.00	4679.42	88	8	t
222	Canon PIXMA Plus	Canon	PIXMA Plus	11	2097.46	3056.85	103	7	t
223	Epson EcoTank 2023	Epson	EcoTank 2023	11	9794.26	13014.71	166	11	t
224	HP WorkForce Plus	HP	WorkForce Plus	11	2946.09	3586.39	290	6	t
225	Xerox OfficeJet Pro	Xerox	OfficeJet Pro	11	21965.66	27871.38	335	18	t
226	Brother OfficeJet X	Brother	OfficeJet X	11	10163.90	14516.18	348	15	f
227	Epson PIXMA 16	Epson	PIXMA 16	11	23032.75	35785.16	10	13	t
228	Epson EcoTank 45	Epson	EcoTank 45	11	21477.13	31317.59	497	10	t
229	Brother EcoTank Plus	Brother	EcoTank Plus	11	15183.73	18071.36	226	9	t
230	Brother Brother HL Pro	Brother	Brother HL Pro	11	20552.28	28400.61	81	5	t
231	Xerox Brother HL 2022	Xerox	Brother HL 2022	11	4467.37	6896.87	102	4	t
232	Brother OfficeJet S	Brother	OfficeJet S	11	6958.34	10580.70	258	15	t
233	HP OfficeJet Pro	HP	OfficeJet Pro	11	12296.35	16609.25	491	18	t
234	Epson EcoTank X	Epson	EcoTank X	11	18761.68	27391.73	145	3	t
235	Canon WorkForce S	Canon	WorkForce S	11	16237.39	23624.80	137	16	t
236	HP Brother HL 2024	HP	Brother HL 2024	11	15088.38	17409.10	129	12	t
237	Seagate SSD Pro 54	Seagate	SSD Pro 54	12	6412.17	8720.64	346	19	t
238	Seagate RTX 4080 2022	Seagate	RTX 4080 2022	12	12861.12	18623.67	431	14	t
239	Western Digital RTX 4080 X	Western Digital	RTX 4080 X	12	17157.67	23450.80	172	11	t
240	ASUS DDR5 X	ASUS	DDR5 X	12	4830.75	6679.87	123	4	t
241	ASUS RTX 4080 Pro	ASUS	RTX 4080 Pro	12	17066.78	25166.29	335	18	t
242	Kingston SSD Pro Plus	Kingston	SSD Pro Plus	12	18457.79	26069.06	292	9	t
243	Corsair Ryzen 7 97	Corsair	Ryzen 7 97	12	22677.18	32934.99	259	12	t
244	ASUS Vengeance 2024	ASUS	Vengeance 2024	12	7450.53	10146.51	379	11	t
245	Western Digital Ryzen 7 Pro	Western Digital	Ryzen 7 Pro	12	16412.70	20516.11	114	12	t
246	Kingston DDR5 X	Kingston	DDR5 X	12	11674.45	14044.38	27	5	t
247	AMD RTX 4080 Plus	AMD	RTX 4080 Plus	12	13316.49	17789.48	445	7	t
248	AMD DDR5 62	AMD	DDR5 62	12	3709.12	5704.91	92	5	t
249	Corsair Ryzen 7 2022	Corsair	Ryzen 7 2022	12	267.13	340.08	389	8	t
250	AMD SSD Pro 2024	AMD	SSD Pro 2024	12	15419.82	22128.51	206	16	t
251	Seagate Core i7 S	Seagate	Core i7 S	12	18306.88	28879.67	456	13	t
252	Western Digital Ryzen 7 2022	Western Digital	Ryzen 7 2022	12	15723.17	19842.18	355	14	t
253	Intel SSD Pro X	Intel	SSD Pro X	12	4300.45	6539.82	152	12	t
254	Western Digital RTX 4080 Pro	Western Digital	RTX 4080 Pro	12	10926.58	15942.44	68	13	t
255	Seagate DDR5 2024	Seagate	DDR5 2024	12	23709.90	37063.14	206	3	t
256	Corsair Ryzen 7 2022	Corsair	Ryzen 7 2022	12	14803.87	18150.18	187	4	t
257	Corsair DDR5 2022	Corsair	DDR5 2022	12	14909.01	17467.13	55	3	f
258	Intel SSD Pro Plus	Intel	SSD Pro Plus	12	3221.34	4070.91	359	7	t
259	Corsair Vengeance X	Corsair	Vengeance X	12	10608.66	12682.03	266	11	t
260	Ubiquiti Archer 2023	Ubiquiti	Archer 2023	13	7175.26	10785.43	254	9	t
261	Netgear DIR-X Pro	Netgear	DIR-X Pro	13	17630.40	22618.18	20	20	t
262	Cisco DGS-1000 S	Cisco	DGS-1000 S	13	218.04	316.65	464	6	t
263	Ubiquiti Nighthawk 2023	Ubiquiti	Nighthawk 2023	13	18130.56	21676.55	131	10	t
264	Netgear UniFi 2022	Netgear	UniFi 2022	13	2630.25	3231.57	20	12	t
265	Netgear DGS-1000 2023	Netgear	DGS-1000 2023	13	21303.46	33033.81	4	7	t
266	Cisco UniFi 55	Cisco	UniFi 55	13	23883.97	30350.30	375	5	t
267	Netgear Nighthawk Plus	Netgear	Nighthawk Plus	13	10096.22	13684.84	427	15	t
268	Ubiquiti DGS-1000 2024	Ubiquiti	DGS-1000 2024	13	2959.46	4330.51	30	8	t
269	D-Link DGS-1000 82	D-Link	DGS-1000 82	13	4654.32	6147.83	183	3	t
270	Cisco DGS-1000 2023	Cisco	DGS-1000 2023	13	22206.71	29941.52	32	11	t
271	TP-Link DIR-X S	TP-Link	DIR-X S	13	24450.70	35488.48	173	19	t
272	D-Link Archer S	D-Link	Archer S	13	12125.95	17566.50	328	15	t
273	D-Link DIR-X 2022	D-Link	DIR-X 2022	13	16138.46	19698.88	434	18	t
274	Cisco Archer Pro	Cisco	Archer Pro	13	6136.16	9735.42	25	19	t
275	Ubiquiti DGS-1000 2023	Ubiquiti	DGS-1000 2023	13	11558.50	17459.90	229	5	t
276	Ubiquiti UniFi 25	Ubiquiti	UniFi 25	13	18669.19	21618.85	206	16	f
277	D-Link Archer X	D-Link	Archer X	13	22269.26	31244.88	335	17	t
278	Netgear Archer 38	Netgear	Archer 38	13	8399.52	12560.12	307	18	t
279	Duracell Back-UPS S	Duracell	Back-UPS S	14	204.59	267.97	324	12	t
280	Energizer Back-UPS 2024	Energizer	Back-UPS 2024	14	12386.69	18825.63	380	16	t
281	Eaton PowerBank 2023	Eaton	PowerBank 2023	14	23265.87	30869.24	234	9	t
282	APC UPS 1500 2023	APC	UPS 1500 2023	14	19337.81	26158.78	337	19	t
283	Duracell Back-UPS 2022	Duracell	Back-UPS 2022	14	13897.67	18689.10	299	18	t
284	Anker PowerBank 2023	Anker	PowerBank 2023	14	9777.03	13885.78	451	13	t
285	Duracell UPS 1500 S	Duracell	UPS 1500 S	14	6948.86	11004.33	496	12	t
286	Anker PowerBank X	Anker	PowerBank X	14	21100.40	29466.98	160	20	t
287	Anker PowerBank X	Anker	PowerBank X	14	17212.29	26929.25	67	8	t
288	Energizer Back-UPS 55	Energizer	Back-UPS 55	14	14632.74	23034.91	363	16	t
289	Eaton Pro Charger 2022	Eaton	Pro Charger 2022	14	13139.84	15260.25	74	4	t
290	Anker Pro Charger X	Anker	Pro Charger X	14	17132.25	20830.98	31	12	t
291	Eaton Back-UPS 55	Eaton	Back-UPS 55	14	2696.63	4154.47	378	20	t
292	Eaton UPS 1500 X	Eaton	UPS 1500 X	14	17369.46	20342.09	195	15	t
293	Energizer Back-UPS X	Energizer	Back-UPS X	14	5196.72	8008.05	440	17	t
294	Energizer PowerBank X	Energizer	PowerBank X	14	11303.05	18000.72	38	8	t
295	Eaton Back-UPS 2022	Eaton	Back-UPS 2022	14	10798.42	15122.86	66	8	t
296	Energizer Back-UPS 52	Energizer	Back-UPS 52	14	17785.78	21692.65	78	13	t
297	Eaton Pro Charger Pro	Eaton	Pro Charger Pro	14	1961.09	2879.78	269	10	t
298	Eaton Back-UPS 2024	Eaton	Back-UPS 2024	14	10485.89	14592.86	47	14	t
299	Anker Pro Charger Pro	Anker	Pro Charger Pro	14	7445.32	11746.03	316	19	t
300	Eaton Back-UPS Pro	Eaton	Back-UPS Pro	14	11224.83	17477.32	314	10	t
301	Energizer UPS 1500 Plus	Energizer	UPS 1500 Plus	14	6526.28	9631.41	12	19	t
302	Energizer UPS 1500 2022	Energizer	UPS 1500 2022	14	7516.38	10847.55	164	19	t
303	APC PowerBank 2022	APC	PowerBank 2022	14	15729.29	19580.63	322	9	t
304	Duracell Back-UPS Plus	Duracell	Back-UPS Plus	14	16217.04	25507.59	382	7	f
305	Microsoft Office 365 2022	Microsoft	Office 365 2022	15	4573.11	5777.48	36	10	t
306	Kaspersky AutoCAD Plus	Kaspersky	AutoCAD Plus	15	10910.67	12630.20	344	6	t
307	Autodesk Office 365 2022	Autodesk	Office 365 2022	15	17566.92	20775.79	475	19	t
308	Norton Office 365 46	Norton	Office 365 46	15	9628.13	14634.32	15	18	t
309	Adobe Acrobat X	Adobe	Acrobat X	15	24009.34	29167.36	346	14	t
310	Microsoft Acrobat 2022	Microsoft	Acrobat 2022	15	274.99	390.07	275	20	t
311	Norton Acrobat S	Norton	Acrobat S	15	10404.46	14989.38	262	7	t
312	Adobe AntiVirus 2023	Adobe	AntiVirus 2023	15	4656.75	7030.98	436	4	t
313	Autodesk AutoCAD 2023	Autodesk	AutoCAD 2023	15	7372.72	8702.12	50	9	t
314	Kaspersky AntiVirus 2024	Kaspersky	AntiVirus 2024	15	16831.69	21132.86	145	5	t
315	Norton AutoCAD Pro	Norton	AutoCAD Pro	15	15466.11	19913.45	299	7	t
316	Norton AntiVirus 2024	Norton	AntiVirus 2024	15	270.07	340.50	113	16	t
317	Norton Acrobat Pro	Norton	Acrobat Pro	15	21965.46	29835.28	183	12	t
318	Microsoft Acrobat 2023	Microsoft	Acrobat 2023	15	21068.56	32370.18	71	20	t
319	Microsoft Office 365 2022	Microsoft	Office 365 2022	15	20344.16	28695.55	393	9	t
320	Autodesk AntiVirus 79	Autodesk	AntiVirus 79	15	16399.62	19956.45	200	10	t
321	Autodesk AntiVirus 27	Autodesk	AntiVirus 27	15	12602.91	15006.91	186	19	f
322	Adobe Acrobat 2024	Adobe	Acrobat 2024	15	11238.58	13830.37	485	7	t
323	Kaspersky AntiVirus S	Kaspersky	AntiVirus S	15	19072.59	23922.51	135	14	t
324	Adobe AntiVirus 59	Adobe	AntiVirus 59	15	22959.86	35511.98	20	13	t
325	Autodesk AntiVirus 2024	Autodesk	AntiVirus 2024	15	9509.99	12556.36	300	5	t
326	Kaspersky Acrobat Plus	Kaspersky	Acrobat Plus	15	8919.52	13740.29	249	18	t
327	Microsoft Acrobat 2024	Microsoft	Acrobat 2024	15	5865.27	8103.13	143	9	t
328	Adobe AntiVirus 2023	Adobe	AntiVirus 2023	15	16578.57	22158.52	169	6	t
329	Kaspersky AutoCAD 2024	Kaspersky	AutoCAD 2024	15	16234.39	21671.36	124	4	t
\.


--
-- TOC entry 5091 (class 0 OID 25066)
-- Dependencies: 221
-- Data for Name: regiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regiones (region_id, nombre, pais) FROM stdin;
1	Norte	México
2	Sur	México
3	Este	México
4	Oeste	México
5	Centro	México
6	Noreste	México
7	Noroeste	México
8	Sureste	México
\.


--
-- TOC entry 4918 (class 2606 OID 25116)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (categoria_id);


--
-- TOC entry 4906 (class 2606 OID 24807)
-- Name: ciudades ciudades_nombre_estado_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_nombre_estado_key UNIQUE (nombre, estado_id);


--
-- TOC entry 4908 (class 2606 OID 24805)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 4922 (class 2606 OID 25142)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 4924 (class 2606 OID 25140)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id);


--
-- TOC entry 4912 (class 2606 OID 25081)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (departamento_id);


--
-- TOC entry 4928 (class 2606 OID 25181)
-- Name: detalle_pedidos detalle_pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT detalle_pedidos_pkey PRIMARY KEY (detalle_id);


--
-- TOC entry 4914 (class 2606 OID 25096)
-- Name: empleados empleados_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_email_key UNIQUE (email);


--
-- TOC entry 4916 (class 2606 OID 25094)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (empleado_id);


--
-- TOC entry 4902 (class 2606 OID 24630)
-- Name: estados estados_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_nombre_key UNIQUE (nombre);


--
-- TOC entry 4904 (class 2606 OID 24628)
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 25156)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 4920 (class 2606 OID 25126)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (producto_id);


--
-- TOC entry 4910 (class 2606 OID 25074)
-- Name: regiones regiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_pkey PRIMARY KEY (region_id);


--
-- TOC entry 4929 (class 2606 OID 24808)
-- Name: ciudades ciudades_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados(id);


--
-- TOC entry 4935 (class 2606 OID 25143)
-- Name: clientes clientes_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(region_id);


--
-- TOC entry 4931 (class 2606 OID 25082)
-- Name: departamentos departamentos_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(region_id);


--
-- TOC entry 4940 (class 2606 OID 25182)
-- Name: detalle_pedidos detalle_pedidos_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT detalle_pedidos_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(pedido_id);


--
-- TOC entry 4941 (class 2606 OID 25187)
-- Name: detalle_pedidos detalle_pedidos_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT detalle_pedidos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- TOC entry 4932 (class 2606 OID 25097)
-- Name: empleados empleados_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id);


--
-- TOC entry 4933 (class 2606 OID 25102)
-- Name: empleados empleados_jefe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_jefe_id_fkey FOREIGN KEY (jefe_id) REFERENCES public.empleados(empleado_id);


--
-- TOC entry 4930 (class 2606 OID 25202)
-- Name: ciudades fk_ciudades_estados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT fk_ciudades_estados FOREIGN KEY (estado_id) REFERENCES public.estados(id);


--
-- TOC entry 4936 (class 2606 OID 25197)
-- Name: clientes fk_clientes_ciudades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_clientes_ciudades FOREIGN KEY (ciudad_id) REFERENCES public.ciudades(id);


--
-- TOC entry 4937 (class 2606 OID 25157)
-- Name: pedidos pedidos_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(cliente_id);


--
-- TOC entry 4938 (class 2606 OID 25162)
-- Name: pedidos pedidos_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES public.empleados(empleado_id);


--
-- TOC entry 4939 (class 2606 OID 25167)
-- Name: pedidos pedidos_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(region_id);


--
-- TOC entry 4934 (class 2606 OID 25127)
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(categoria_id);


-- Completed on 2026-10-30 20:30:38

--
-- PostgreSQL database dump complete
--

\unrestrict vJjFbabBE35wmcys8zsaQ9sYHv1lmpGjV9jV0W3wBCUgU7LFNpdE9duEx4aMqnm

