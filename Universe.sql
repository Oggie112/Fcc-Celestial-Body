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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text,
    type character varying(30),
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visible_with_eye boolean,
    type text,
    constellation_id integer NOT NULL
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
    diameter_in_km integer,
    year_discovered integer,
    planet_id integer
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
    has_moon boolean,
    rotation_in_days numeric(5,2),
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_brightness numeric(3,2),
    distance_in_lightyears numeric(5,2),
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', 'Water-bearer', 'Zodiac', 1);
INSERT INTO public.constellation VALUES (2, 'Aries', 'Ram', 'Zodiac', 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', 'Herdsmen', 'Seasonal', 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', 'Sea Goat', 'Zodiac', 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', 'Centaur', 'Circumpolar', 5);
INSERT INTO public.constellation VALUES (6, 'Cetus', 'Sea Monster', 'Seasonal', 9);
INSERT INTO public.constellation VALUES (7, 'Coma Berinices', 'Berinices hair', 'Seasonal', 6);
INSERT INTO public.constellation VALUES (8, 'Leo', 'Lion', 'Zodiac', 7);
INSERT INTO public.constellation VALUES (9, 'Ophiuchus', 'Serpent Bearer', 'Seasonal', 12);
INSERT INTO public.constellation VALUES (10, 'Pegasus', 'Pegasus', 'Seasonal', 10);
INSERT INTO public.constellation VALUES (11, 'Sagittarius', 'Archer', 'Zodiac', 11);
INSERT INTO public.constellation VALUES (12, 'Taurus', 'Bull', 'Zodiac', 8);
INSERT INTO public.constellation VALUES (13, 'Virgo', 'Maiden', 'Zodiac', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', false, 'Spiral', 5);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', true, 'Elliptical', 5);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', false, 'Spiral', 7);
INSERT INTO public.galaxy VALUES (4, 'Coma Pinwheel Galaxy', false, 'Spiral', 7);
INSERT INTO public.galaxy VALUES (5, 'Malin 1', false, 'Spiral', 7);
INSERT INTO public.galaxy VALUES (6, 'Mice Galaxies', false, 'Spirals', 7);
INSERT INTO public.galaxy VALUES (7, 'Needle Galaxy', false, 'Spiral', 7);
INSERT INTO public.galaxy VALUES (8, 'Butterfly Galaxy', false, 'Spiral', 13);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', false, 'Spiral', 13);
INSERT INTO public.galaxy VALUES (10, 'Little Sombrero Galaxy', false, 'Spiral', 10);
INSERT INTO public.galaxy VALUES (11, 'Milky Way', true, 'Barred Spiral', 11);
INSERT INTO public.galaxy VALUES (12, 'Wolf-Lundmark-Melotte', false, 'Barred Irregular', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 3476, NULL, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 23, 1877, 4);
INSERT INTO public.moon VALUES (4, 'Delmos', 13, 1877, 4);
INSERT INTO public.moon VALUES (12, 'Pan', 20, 1985, 6);
INSERT INTO public.moon VALUES (13, 'Atlas', 40, 1980, 6);
INSERT INTO public.moon VALUES (14, 'Prometheus', 80, 1980, 6);
INSERT INTO public.moon VALUES (15, 'Pandora', 100, 1980, 6);
INSERT INTO public.moon VALUES (16, 'Janus', 190, 1966, 6);
INSERT INTO public.moon VALUES (17, 'Epimetheus', 120, 1980, 6);
INSERT INTO public.moon VALUES (18, 'Mimas', 394, 1789, 6);
INSERT INTO public.moon VALUES (19, 'Enceladus', 502, 1789, 6);
INSERT INTO public.moon VALUES (20, 'Tethys', 1048, 1684, 6);
INSERT INTO public.moon VALUES (21, 'Dione', 1120, 1684, 6);
INSERT INTO public.moon VALUES (22, 'Rhea', 1530, 1672, 6);
INSERT INTO public.moon VALUES (23, 'Titan', 5150, 1655, 6);
INSERT INTO public.moon VALUES (24, 'Hyperion', 270, 1848, 6);
INSERT INTO public.moon VALUES (25, 'Lapetus', 1435, 1671, 6);
INSERT INTO public.moon VALUES (26, 'Phoebe', 220, 1898, 6);
INSERT INTO public.moon VALUES (27, 'Puck', 170, 1985, 7);
INSERT INTO public.moon VALUES (28, 'Miranda', 485, 1948, 7);
INSERT INTO public.moon VALUES (29, 'Ariel', 1160, 1851, 7);
INSERT INTO public.moon VALUES (30, 'Umbriel', 1190, 1851, 7);
INSERT INTO public.moon VALUES (31, 'Titania', 1610, 1787, 7);
INSERT INTO public.moon VALUES (32, 'Oberon', 1550, 1787, 7);
INSERT INTO public.moon VALUES (33, 'Despina', 150, 1989, 7);
INSERT INTO public.moon VALUES (34, 'Galatea', 150, 1989, 7);
INSERT INTO public.moon VALUES (35, 'Larissa', 400, 1989, 8);
INSERT INTO public.moon VALUES (36, 'Triton', 2720, 1846, 8);
INSERT INTO public.moon VALUES (37, 'Nereid', 340, 1949, 8);
INSERT INTO public.moon VALUES (38, 'Charon', 1200, 1978, 11);
INSERT INTO public.moon VALUES (39, 'Styx', 20, 2012, 11);
INSERT INTO public.moon VALUES (40, 'Nix', 46, 2005, 11);
INSERT INTO public.moon VALUES (41, 'Kerberos', 28, 2011, 11);
INSERT INTO public.moon VALUES (42, 'Hydra', 61, 2005, 11);
INSERT INTO public.moon VALUES (43, 'Dysnomea', 684, 2005, 16);
INSERT INTO public.moon VALUES (44, 'Mk2', 160, 2016, 14);
INSERT INTO public.moon VALUES (45, 'Hi iaka', 400, 2005, 12);
INSERT INTO public.moon VALUES (46, 'Namaka', 200, 2005, 12);
INSERT INTO public.moon VALUES (5, 'Amalthea', 200, 1892, 5);
INSERT INTO public.moon VALUES (6, 'Thebe', 90, 1979, 5);
INSERT INTO public.moon VALUES (7, 'Io', 3630, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Europa', 3138, 1610, 5);
INSERT INTO public.moon VALUES (9, 'Ganymede', 5262, 1610, 5);
INSERT INTO public.moon VALUES (10, 'Callisto', 4800, 1610, 5);
INSERT INTO public.moon VALUES (11, 'Himalta', 170, 1904, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 58.65, 13);
INSERT INTO public.planet VALUES (2, 'Venus', false, 243.02, 7);
INSERT INTO public.planet VALUES (9, 'Ceres', false, 0.38, 7);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1.00, 5);
INSERT INTO public.planet VALUES (4, 'Mars', true, 1.03, 8);
INSERT INTO public.planet VALUES (17, 'Sedna', false, 0.43, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 0.41, 9);
INSERT INTO public.planet VALUES (16, 'Eris', true, 14.56, 9);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 0.44, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 0.72, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 0.67, 1);
INSERT INTO public.planet VALUES (15, 'Gonggong', true, 0.93, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', true, NULL, 11);
INSERT INTO public.planet VALUES (11, 'Pluto', true, 6.39, 11);
INSERT INTO public.planet VALUES (12, 'Haumea', true, 0.16, 3);
INSERT INTO public.planet VALUES (13, 'Quaoar', true, 0.37, 12);
INSERT INTO public.planet VALUES (14, 'Makemake', true, 0.95, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', 2.90, 612.00, 11);
INSERT INTO public.star VALUES (2, 'Hamal', 2.01, 66.00, 11);
INSERT INTO public.star VALUES (3, 'Arcturus', 0.05, 37.00, 11);
INSERT INTO public.star VALUES (4, 'Deneb Algedi', 2.85, 39.00, 11);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 0.01, 4.36, 11);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', 4.26, 30.00, 11);
INSERT INTO public.star VALUES (7, 'Regulus', 1.36, 77.00, 11);
INSERT INTO public.star VALUES (8, 'Aldebaran', 0.85, 65.23, 11);
INSERT INTO public.star VALUES (9, 'Diphda', 2.04, 96.22, 11);
INSERT INTO public.star VALUES (10, 'Enif', 2.40, 688.20, 11);
INSERT INTO public.star VALUES (11, 'Kaus Australis', 1.85, 143.20, 11);
INSERT INTO public.star VALUES (12, 'Rasalhague', 2.08, 48.60, 11);
INSERT INTO public.star VALUES (13, 'Spica', 1.04, 260.90, 11);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 47, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

