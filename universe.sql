--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(20) NOT NULL,
    distance_from_earth_mlk numeric(5,3),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    discovers character varying(30),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_types_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    has_life boolean,
    moons_num integer NOT NULL,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planettypes_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planettypes_info (
    planettypes_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planettypes_info OWNER TO freecodecamp;

--
-- Name: planettypes_info_planettypes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planettypes_info_planettypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planettypes_info_planettypes_id_seq OWNER TO freecodecamp;

--
-- Name: planettypes_info_planettypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planettypes_info_planettypes_id_seq OWNED BY public.planettypes_info.planettypes_info_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_types character varying(10) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth_mlk numeric(5,3),
    descripton text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planettypes_info planettypes_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettypes_info ALTER COLUMN planettypes_info_id SET DEFAULT nextval('public.planettypes_info_planettypes_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'spirial', 0.000, 'milky way description');
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'spirial', 2.500, 'andromeda description');
INSERT INTO public.galaxy VALUES (3, 'sculptor dwarf', 'elliptical', 0.026, 'sculptor dwarf description');
INSERT INTO public.galaxy VALUES (4, 'maffei 1', 'elliptical', 11.000, 'maffei 1 description');
INSERT INTO public.galaxy VALUES (5, 'magellanic clouds', 'irregular', 0.360, 'magellanic clouds description');
INSERT INTO public.galaxy VALUES (6, 'bear claw', 'spirial', 22.000, 'bear claw description');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', 1, 'jj', 'd_m1');
INSERT INTO public.moon VALUES (2, 'm2', 2, 'kk', 'd_m2');
INSERT INTO public.moon VALUES (3, 'm3', 3, 'll', 'd_m3');
INSERT INTO public.moon VALUES (4, 'm4', 4, 'jj', 'd_m4');
INSERT INTO public.moon VALUES (5, 'm5', 5, 'jj', 'd_m5');
INSERT INTO public.moon VALUES (6, 'm6', 6, 'hh', 'd_m6');
INSERT INTO public.moon VALUES (7, 'm7', 7, 'hh', 'd_m7');
INSERT INTO public.moon VALUES (8, 'm8', 8, 'gg', 'd_m8');
INSERT INTO public.moon VALUES (9, 'm9', 9, 'oo', 'd_m9');
INSERT INTO public.moon VALUES (10, 'm10', 10, 'gg', 'd_m10');
INSERT INTO public.moon VALUES (11, 'm11', 11, 'gg', 'd_m11');
INSERT INTO public.moon VALUES (12, 'm12', 12, 'tt', 'd_m12');
INSERT INTO public.moon VALUES (13, 'm13', 1, 'tt', 'd_m13');
INSERT INTO public.moon VALUES (14, 'm14', 2, 'yy', 'd_m14');
INSERT INTO public.moon VALUES (15, 'm15', 3, 'yy', 'd_m15');
INSERT INTO public.moon VALUES (16, 'm16', 4, 'yy', 'd_m16');
INSERT INTO public.moon VALUES (17, 'm17', 5, 'ff', 'd_m17');
INSERT INTO public.moon VALUES (18, 'm18', 6, 'ff', 'd_m18');
INSERT INTO public.moon VALUES (19, 'm19', 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'm20', 6, 'kk', 'd_m20');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'p1', 1, 12, true, true, 3, 'd_p1', 1);
INSERT INTO public.planet VALUES (2, 'p2', 2, 15, false, false, 3, 'd_p2', 1);
INSERT INTO public.planet VALUES (3, 'p3', 3, 0, false, true, 2, 'd_p3', 3);
INSERT INTO public.planet VALUES (4, 'p4', 1, 2, false, true, 2, 'd_p4', 3);
INSERT INTO public.planet VALUES (5, 'p5', 3, 15, false, true, 5, 'd_p5', 5);
INSERT INTO public.planet VALUES (6, 'p6', 2, 15, false, false, 6, 'd_p6', 6);
INSERT INTO public.planet VALUES (7, 'p7', 2, 0, false, false, 0, 'd_p7', 7);
INSERT INTO public.planet VALUES (8, 'p8', 3, 1, false, false, 0, 'd_p8', 8);
INSERT INTO public.planet VALUES (9, 'p9', 2, 1, false, false, 0, NULL, 2);
INSERT INTO public.planet VALUES (10, 'p10', 3, 1, false, false, 3, NULL, 9);
INSERT INTO public.planet VALUES (11, 'p11', 3, 1, false, false, 3, 'd_p11', 5);
INSERT INTO public.planet VALUES (12, 'p12', 3, 10, false, false, 0, 'd_p12', 5);


--
-- Data for Name: planettypes_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planettypes_info VALUES (1, 'rocky', 'd_pt_1');
INSERT INTO public.planettypes_info VALUES (2, 'terrestrial worlds', 'd_pt_2');
INSERT INTO public.planettypes_info VALUES (3, 'gas giants', 'd_pt_3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_mw_1', 'o', 1, 0.000, 'd_star_mv_1');
INSERT INTO public.star VALUES (2, 'star_mw_2', 'b', 1, 0.015, 'd_star_mv_2');
INSERT INTO public.star VALUES (3, 'star_sd_1', 'g', 3, 0.026, 'd_star_sd_1');
INSERT INTO public.star VALUES (4, 'star_sd_2', 'f', 3, 11.000, 'd_star_sd_2');
INSERT INTO public.star VALUES (5, 'star_a_1', 'g', 2, 0.660, 'd_star_a_1');
INSERT INTO public.star VALUES (6, 'star_m1_1', 'k', 4, 0.360, NULL);
INSERT INTO public.star VALUES (7, 'star_mc_1', 'm', 5, 8.000, 'd_star_mc_1');
INSERT INTO public.star VALUES (8, 'star_mw_3', 'o', 1, 0.010, 'd_star_mw_3');
INSERT INTO public.star VALUES (9, 'star_bc_1', 'b', 6, 0.010, 'd_star_bc_1');
INSERT INTO public.star VALUES (10, 'star_bc_2', 'b', 6, 0.060, 'd_star_bc_2');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planettypes_info_planettypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planettypes_info_planettypes_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: star constraintname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constraintname UNIQUE (star_id);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planettypes_info planettypes_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettypes_info
    ADD CONSTRAINT planettypes_id_unique UNIQUE (planettypes_info_id);


--
-- Name: planettypes_info planettypes_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettypes_info
    ADD CONSTRAINT planettypes_info_pkey PRIMARY KEY (planettypes_info_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

