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
-- Name: exoplanet_candidate; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet_candidate (
    exoplanet_candidate_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovery_method character varying(50),
    discovery_year integer,
    stellar_classification character varying(10),
    distance_in_light_years numeric(15,2),
    estimated_mass numeric(20,2),
    estimated_radius numeric(10,2),
    orbital_period numeric(25,2),
    has_transit_signature boolean,
    star_id integer
);


ALTER TABLE public.exoplanet_candidate OWNER TO freecodecamp;

--
-- Name: exoplanet_candidate_exoplanet_candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_candidate_exoplanet_candidate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_candidate_exoplanet_candidate_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_candidate_exoplanet_candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_candidate_exoplanet_candidate_id_seq OWNED BY public.exoplanet_candidate.exoplanet_candidate_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    distance_in_mpc numeric(15,2),
    has_active_star_formation boolean
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
    orbital_period numeric(25,2),
    has_atmosphere boolean,
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
    name character varying(100) NOT NULL,
    description text,
    orbital_period numeric(25,2),
    has_ring boolean,
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
    name character varying(100) NOT NULL,
    description text,
    temperature_in_k integer,
    luminosity numeric(25,2),
    is_variable boolean,
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
-- Name: exoplanet_candidate exoplanet_candidate_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet_candidate ALTER COLUMN exoplanet_candidate_id SET DEFAULT nextval('public.exoplanet_candidate_exoplanet_candidate_id_seq'::regclass);


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
-- Data for Name: exoplanet_candidate; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet_candidate VALUES (1, 'Kepler-186f', 'Transit', 2011, 'M', 0.11, 1.40, 136.00, 313.90, true, 1);
INSERT INTO public.exoplanet_candidate VALUES (2, 'TRAPPIST-1e', 'Transit', 2017, 'M', 0.04, 0.85, 4.05, 13.60, false, 2);
INSERT INTO public.exoplanet_candidate VALUES (3, 'GJ 273b', 'Radial Velocity', 2004, 'M', 0.02, 1.50, 12.47, 0.00, false, 4);
INSERT INTO public.exoplanet_candidate VALUES (4, 'Proxima Centauri b', 'Radial Velocity', 2016, 'M', 0.12, 1.10, 11.18, 0.00, false, 3);
INSERT INTO public.exoplanet_candidate VALUES (5, 'LHS 1140b', 'Radial Velocity', 2017, 'M', 0.42, 1.60, 4.40, 0.00, false, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 0.03, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Nearest large spiral galaxy to the Milky Way.', 2.50, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'A wide-brimmed hat-shaped galaxy.', 30.00, false);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 'A ring galaxy with a distorted appearance.', 500.00, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A face-on spiral galaxy with prominent dust lanes.', 31.00, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'An elliptical galaxy, the closest to the Milky Way.', 1.63, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s only natural satellite, with a cratered surface.', 27.30, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger of Mars'' two moons, with an irregular shape.', 7.80, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller of Mars'' two moons, with a potato-like shape.', 30.30, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active moon in the Solar System, with a sulfurous surface.', 1.77, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter with a suspected subsurface ocean.', 3.55, false, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, with a water-ice crust.', 7.15, false, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second-largest moon of Jupiter, with an icy surface and internal ocean.', 16.69, false, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon, with a thick atmosphere and lakes of liquid hydrocarbons.', 15.90, true, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn with a water-ice plume erupting from its surface.', 1.37, false, 5);
INSERT INTO public.moon VALUES (10, 'Rhea', 'The second-largest moon of Saturn, with a ring system and a cratered surface.', 4.50, false, 5);
INSERT INTO public.moon VALUES (11, 'Miranda', 'An irregularly shaped moon of Uranus with a chaotic rotation.', 1.40, false, 6);
INSERT INTO public.moon VALUES (12, 'Ariel', 'The brightest moon of Uranus, with a reflective icy surface.', 2.50, false, 6);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'A dark moon of Uranus with a cratered surface and evidence of past geologic activity.', 4.10, false, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus, with a surface of water ice and rock.', 8.70, false, 6);
INSERT INTO public.moon VALUES (15, 'Oberon', 'The second-largest moon of Uranus, with a dark surface and a ring system.', 13.20, false, 6);
INSERT INTO public.moon VALUES (16, 'Triton', 'Neptune''s largest moon, with a geologically active surface and a nitrogen atmosphere.', 5.80, true, 7);
INSERT INTO public.moon VALUES (17, 'Proteus', 'An irregularly shaped moon of Neptune with a dark surface.', 1.10, false, 7);
INSERT INTO public.moon VALUES (18, 'Nereid', 'An irregularly shaped moon of Neptune with a retrograde orbit.', 35.90, false, 7);
INSERT INTO public.moon VALUES (19, 'Naiad', 'An inner moon of Neptune discovered by Voyager 2.', 0.20, false, 7);
INSERT INTO public.moon VALUES (20, 'Thalassa', 'An inner moon of Neptune discovered by Voyager 2.', 0.20, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun, our home planet.', 365.25, false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, the red planet.', 687.00, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The second planet from the Sun, a hot and dense planet.', 224.70, false, 1);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri b', 'A rocky exoplanet orbiting Proxima Centauri.', 11.18, false, 3);
INSERT INTO public.planet VALUES (5, '51 Pegasi b', 'The first discovered hot Jupiter exoplanet.', 4.20, false, 4);
INSERT INTO public.planet VALUES (6, 'Gliese 581 g', 'An exoplanet in the habitable zone of its star.', 37.00, false, 5);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 'An exoplanet in the habitable zone of its star.', 136.00, false, 2);
INSERT INTO public.planet VALUES (8, 'Gliese 667C f', 'A super-Earth exoplanet potentially in the habitable zone.', 39.00, false, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'An exoplanet potentially in the habitable zone of its star.', 384.00, false, 6);
INSERT INTO public.planet VALUES (10, 'HD 189733b', 'A hot Jupiter exoplanet with an atmosphere of vaporized elements.', 2.20, false, 6);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 'An ultra-hot Jupiter exoplanet with a very short orbital period.', 1.09, false, 6);
INSERT INTO public.planet VALUES (12, 'GJ 1214b', 'A super-Earth exoplanet with a potentially rocky surface.', 38.00, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Our Sun, a yellow dwarf star.', 5500, 1.00, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Sun-like star in the Alpha Centauri system.', 5790, 1.50, false, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red dwarf star in the Alpha Centauri system.', 3042, 0.00, false, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supergiant star in the Orion constellation.', 13000, 85000.00, true, 3);
INSERT INTO public.star VALUES (5, 'Canopus', 'A white supergiant star in the Canis Major constellation.', 7400, 15000.00, false, 4);
INSERT INTO public.star VALUES (6, 'M51-ULS-1', 'A black hole candidate in the Whirlpool Galaxy.', 0, 0.00, true, 5);


--
-- Name: exoplanet_candidate_exoplanet_candidate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_candidate_exoplanet_candidate_id_seq', 5, true);


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
-- Name: exoplanet_candidate exoplanet_candidate_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet_candidate
    ADD CONSTRAINT exoplanet_candidate_name_key UNIQUE (name);


--
-- Name: exoplanet_candidate exoplanet_candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet_candidate
    ADD CONSTRAINT exoplanet_candidate_pkey PRIMARY KEY (exoplanet_candidate_id);


--
-- Name: exoplanet_candidate exoplanet_candidate_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet_candidate
    ADD CONSTRAINT exoplanet_candidate_star_id_key UNIQUE (star_id);


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
-- Name: exoplanet_candidate exoplanet_candidate_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet_candidate
    ADD CONSTRAINT exoplanet_candidate_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

