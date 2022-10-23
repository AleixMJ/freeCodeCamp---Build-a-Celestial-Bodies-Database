--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    distance_from_earth_lightyears integer NOT NULL,
    description text,
    type character varying(40)
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
    name character varying(40) NOT NULL,
    distance_from_earth numeric NOT NULL,
    gravity_ms2 numeric,
    description text,
    planet_id integer,
    has_life boolean
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
-- Name: object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth integer NOT NULL
);


ALTER TABLE public.object OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_object_id_seq OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.object_object_id_seq OWNED BY public.object.object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric NOT NULL,
    gravity_ms2 numeric,
    description text,
    star_id integer,
    has_life boolean
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
    name character varying(40) NOT NULL,
    distance_from_earth_lightyears numeric NOT NULL,
    galaxy_id integer,
    number_planets integer
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
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.object_object_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 25881, 'The Milky Way is a huge collection of stars, dust and gas. Its called a spiral galaxy because if you could view it from the top or bottom, it would look like a spinning pinwheel. The Sun is located on one of the spiral arms, about 25,000 light-years away from the center of the galaxy.', 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now', 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Condor', 212000000, 'The largest known spiral galaxy, it has a diameter of over 665,300 light years', 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Hoag''s Object', 612800000, 'An unusual ring galaxy in the constellation of Serpens Caput. The galaxy has approximately eight billion stars, and is roughtly 100,000 light years across', 'ring');
INSERT INTO public.galaxy VALUES (5, 'Whirpool', 23160000, 'The graceful, winding arms of the majestic spiral galaxy appear like a grand spiral staircase sweeping through space. They are actually long lanes of stars and gas laces with dust. Such striking arms are a hallmark of so-called grand-design spiral galaxies', 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 11420000, 'Messier 82 is a Starburst galaxy approximately 12 million light-years away in the constellation Ursa Major. A member of the M81 Group, it is about five times more luminous than the Milky Way and has a center one hunderd times more luminous', 'starburst');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.0000000396, 1.62, 'Fifth largest satellite in the Solar Syste', 2, false);
INSERT INTO public.moon VALUES (2, 'Europa', 0.0000664, 1.315, 'The smallest of the four Galilean moons orbiting Jupiter', 4, false);
INSERT INTO public.moon VALUES (3, 'Ganymede', 0.0000628, 1.428, 'Largest moon in the Solar System', 4, false);
INSERT INTO public.moon VALUES (4, 'Io', 0.0000628, 1.796, 'The innermost and third largest of the Jupiter moons', 4, false);
INSERT INTO public.moon VALUES (5, 'Callisto', 0.0000628, 1.236, 'Second largest of the Jupiter moons', 4, false);
INSERT INTO public.moon VALUES (6, 'Titan', 0.0001505, 1.352, 'Largest moon of Saturn and the second largest in the Solar System', 3, false);
INSERT INTO public.moon VALUES (7, 'Enceladus', 0.0001505, 0.113, 'Covered by fresh, clean ice, making it one of the most reflective bodies of the Solar System', 3, false);
INSERT INTO public.moon VALUES (8, 'Iapetus', 0.0001505, 0.223, 'Third Largest moon of Saturn', 3, false);
INSERT INTO public.moon VALUES (9, 'Mimas', 0.0001505, 0.064, 'Smallest astronomical body to be kown with a rounderd shape', 3, false);
INSERT INTO public.moon VALUES (10, 'Triton', 0.0004974, 0.779, 'Largest natural satellite of Neptune', 8, false);
INSERT INTO public.moon VALUES (11, 'Phobos', 0.000038, 0.0057, 'Innermost and large of the two moons of Mars', 5, false);
INSERT INTO public.moon VALUES (12, 'Hyperion', 0.0001505, 0.02, 'It is distinguished by its irregular shape, its chaotic rotation and sponge-like appearance', 3, false);
INSERT INTO public.moon VALUES (13, 'Titania', 0.00030279, 0.367, 'Largest moon of Uranus', 9, false);
INSERT INTO public.moon VALUES (14, 'Nereid', 0.00004974, 0.071, 'Third largest moon of Neptune', 8, false);
INSERT INTO public.moon VALUES (15, 'Oberon', 0.00030279, 0.354, 'Outermost major moon of the planet Uranus', 9, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 0.00030279, 0.2, ' ', 9, false);
INSERT INTO public.moon VALUES (17, 'Rhea', 0.0001505, 0.264, 'Second largest moon of Saturn', 3, false);
INSERT INTO public.moon VALUES (18, 'Pan', 0.0001505, NULL, 'Innermost moon of Saturn. A small walnut-shaped moon', 3, false);
INSERT INTO public.moon VALUES (19, 'Daphnis', 0.0001505, NULL, 'About 8 Kilometers in diameter and orbits the planet in the Keeler Gap within the A ring ', 3, false);
INSERT INTO public.moon VALUES (20, 'Elara', 0.00006219, 0.031, 'A prograde irregular satellite of Jupiter ', 4, false);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.object VALUES (1, 'Eagle nebula', 7000);
INSERT INTO public.object VALUES (2, 'Omega Nebula', 5500);
INSERT INTO public.object VALUES (3, 'Trifid Nebula', 5200);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-452b', 1402, 18.63, 'Located in the consstellation of Cygnus.', 4, false);
INSERT INTO public.planet VALUES (2, 'Earth', 0, 9.807, 'Where humans live', 1, true);
INSERT INTO public.planet VALUES (3, 'Saturn', 0.0001505, 10.44, '6th planet from Solar system', 1, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 0.00006219, 24.79, 'Largest planet in the solar system', 1, false);
INSERT INTO public.planet VALUES (5, 'Mars', 0.000038, 3.721, '4th planet in the solar system', 1, true);
INSERT INTO public.planet VALUES (6, 'Mercury', 0.000020552, 3.7, 'Smallest planet in the Solar System', 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 0.0004974, 11.15, 'farthest known solar plant', 1, false);
INSERT INTO public.planet VALUES (9, 'Uranus', 0.00030279, 8.87, '7th planet from the Sun', 1, false);
INSERT INTO public.planet VALUES (7, 'Venus', 0.000011397, 8.87, 'Eart''s sister planet', 1, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 580, 11.47, 'First discovered planet similar to Earth in an habitable zone', 7, false);
INSERT INTO public.planet VALUES (11, 'Kepler-186b', 582, NULL, 'The inermost planet of its system and not suitable for life', 7, false);
INSERT INTO public.planet VALUES (12, 'Kepler-186c', 579, NULL, 'A super Earth exoplanet that orbits an M-type star', 7, false);
INSERT INTO public.planet VALUES (13, 'Kepler-186d', 579, NULL, 'A super Earth exoplanet that orbits an M-type star. Its mass is 2.54 Earths.', 7, false);
INSERT INTO public.planet VALUES (14, 'Kepler-186e', 579, NULL, 'A super Earth exoplanet that orbits an M-type star. Its mass is 2.15 Earths.', 7, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.00001574, 1, 8);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 642.5, 1, 0);
INSERT INTO public.star VALUES (3, 'Vega', 25.05, 1, 1);
INSERT INTO public.star VALUES (4, 'Kepler-452', 1402, 1, 1);
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 96.87, 2, 0);
INSERT INTO public.star VALUES (6, 'Beta Andromedae', 199, 2, 0);
INSERT INTO public.star VALUES (7, 'Kepler-186', 582, 1, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.object_object_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: object object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (object_id);


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
