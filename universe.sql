--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    speed_km_per_s numeric(10,2),
    distance_from_earth integer NOT NULL,
    is_visible boolean NOT NULL,
    has_tail boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth integer NOT NULL,
    has_life boolean NOT NULL,
    is_visible boolean NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    star_id integer NOT NULL,
    planet_type character varying(50),
    distance_from_earth integer,
    has_life boolean NOT NULL,
    is_habitable boolean NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    age_in_millions_of_years numeric(10,2),
    is_main_sequence boolean NOT NULL,
    has_life boolean NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Famous short-period comet visible from Earth every 75 years.', 1, 70.56, 3000000, true, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the brightest comets of the 20th century.', 1, 44.00, 1500000, true, true);
INSERT INTO public.comet VALUES (3, 'Encke', 'A short-period comet with an orbit of 3.3 years.', 1, 69.50, 500000, false, true);
INSERT INTO public.comet VALUES (4, 'Hyakutake', 'Passed very close to Earth in 1996.', 1, 60.25, 200000, true, true);
INSERT INTO public.comet VALUES (5, 'Lovejoy', 'Bright comet discovered in 2011 by Terry Lovejoy.', 1, 55.75, 1000000, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System.', 'Spiral', 13600.50, 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way.', 'Spiral', 10000.00, 2537000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy in the Local Group.', 'Spiral', 12000.75, 3000000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its distinct spiral structure.', 'Spiral', 9000.25, 23000000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a bright nucleus and large central bulge.', 'Elliptical', 11000.10, 29000000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'A galaxy with a dark band of absorbing dust.', 'Spiral', 7000.00, 17000000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only natural satellite.', 3, 1737, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger of Mars’ two moons.', 4, 11, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller of Mars’ two moons.', 4, 6, false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 'Ice-covered moon with subsurface ocean.', 3, 1560, true, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the Solar System.', 3, 2634, true, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Heavily cratered moon.', 3, 2410, true, true);
INSERT INTO public.moon VALUES (7, 'Io', 'Volcanically active moon.', 3, 1821, true, true);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn moon with thick atmosphere.', 2, 2575, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon with geysers.', 2, 252, true, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Small moon resembling the Death Star.', 2, 198, true, false);
INSERT INTO public.moon VALUES (11, 'Triton', 'Retrograde moon of Neptune.', 1, 1353, true, true);
INSERT INTO public.moon VALUES (12, 'Charon', 'Pluto’s largest moon.', 1, 606, true, false);
INSERT INTO public.moon VALUES (13, 'Proxima Moon 1', 'Orbiting Proxima b.', 5, 1200, true, false);
INSERT INTO public.moon VALUES (14, 'Sirius Moon 1', 'Orbiting Sirius b.', 6, 1500, true, false);
INSERT INTO public.moon VALUES (15, 'Alpha Moon 1', 'Orbiting Alpha I.', 7, 1300, true, false);
INSERT INTO public.moon VALUES (16, 'Alpha Moon 2', 'Orbiting Alpha II.', 8, 900, true, false);
INSERT INTO public.moon VALUES (17, 'Beta Moon 1', 'Orbiting Beta I.', 9, 1000, true, false);
INSERT INTO public.moon VALUES (18, 'Beta Moon 2', 'Orbiting Beta II.', 10, 850, true, false);
INSERT INTO public.moon VALUES (19, 'Eta Moon 1', 'Orbiting Eta I.', 11, 500, true, false);
INSERT INTO public.moon VALUES (20, 'Eta Moon 2', 'Orbiting Eta II.', 12, 400, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet, closest to the Sun.', 1, 'Rocky', 92000000, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Thick atmosphere and extreme heat.', 1, 'Rocky', 41000000, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Only known planet with life.', 1, 'Rocky', 0, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet, potential for microbial life.', 1, 'Rocky', 78300000, false, true);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Exoplanet orbiting Proxima Centauri.', 2, 'Terrestrial', 40100000, false, true);
INSERT INTO public.planet VALUES (6, 'Sirius b', 'White dwarf companion planet.', 3, 'Dwarf', 8600000, false, false);
INSERT INTO public.planet VALUES (7, 'Alpha I', 'Planet orbiting Alpha Andromedae.', 4, 'Gas Giant', 23000000, false, false);
INSERT INTO public.planet VALUES (8, 'Alpha II', 'Second planet in the Alpha system.', 4, 'Gas Giant', 23100000, false, false);
INSERT INTO public.planet VALUES (9, 'Beta I', 'Planet in the Beta Trianguli system.', 5, 'Gas Giant', 30000000, false, false);
INSERT INTO public.planet VALUES (10, 'Beta II', 'Second planet in the Beta Trianguli system.', 5, 'Gas Giant', 30100000, false, false);
INSERT INTO public.planet VALUES (11, 'Eta I', 'Massive planet orbiting Eta Carinae.', 6, 'Gas Giant', 75000000, false, false);
INSERT INTO public.planet VALUES (12, 'Eta II', 'Companion planet to Eta I.', 6, 'Gas Giant', 76000000, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', 1, 5778, 4600.00, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest known star to the Sun.', 1, 3042, 4500.00, true, false);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky.', 1, 9940, 250.00, true, false);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 'Bright star system in the Andromeda constellation.', 2, 13800, 100.00, true, false);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 'Binary star in the Triangulum constellation.', 3, 9500, 200.00, true, false);
INSERT INTO public.star VALUES (6, 'Eta Carinae', 'Massive, unstable star system.', 4, 15000, 3.00, false, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

