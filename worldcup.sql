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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (428, 'France Croatia');
INSERT INTO public.teams VALUES (429, 'Belgium England');
INSERT INTO public.teams VALUES (430, 'Croatia England');
INSERT INTO public.teams VALUES (431, 'France Belgium');
INSERT INTO public.teams VALUES (432, 'Croatia Russia');
INSERT INTO public.teams VALUES (433, 'England Sweden');
INSERT INTO public.teams VALUES (434, 'Belgium Brazil');
INSERT INTO public.teams VALUES (435, 'France Uruguay');
INSERT INTO public.teams VALUES (436, 'England Colombia');
INSERT INTO public.teams VALUES (437, 'Sweden Switzerland');
INSERT INTO public.teams VALUES (438, 'Belgium Japan');
INSERT INTO public.teams VALUES (439, 'Brazil Mexico');
INSERT INTO public.teams VALUES (440, 'Croatia Denmark');
INSERT INTO public.teams VALUES (441, 'Russia Spain');
INSERT INTO public.teams VALUES (442, 'Uruguay Portugal');
INSERT INTO public.teams VALUES (364, 'France');
INSERT INTO public.teams VALUES (365, 'Belgium');
INSERT INTO public.teams VALUES (366, 'Croatia');
INSERT INTO public.teams VALUES (443, 'France Argentina');
INSERT INTO public.teams VALUES (444, 'Germany Argentina');
INSERT INTO public.teams VALUES (369, 'England');
INSERT INTO public.teams VALUES (445, 'Netherlands Brazil');
INSERT INTO public.teams VALUES (446, 'Argentina Netherlands');
INSERT INTO public.teams VALUES (447, 'Germany Brazil');
INSERT INTO public.teams VALUES (373, 'Sweden');
INSERT INTO public.teams VALUES (448, 'Netherlands Costa Rica');
INSERT INTO public.teams VALUES (375, 'Brazil');
INSERT INTO public.teams VALUES (449, 'Argentina Belgium');
INSERT INTO public.teams VALUES (377, 'Russia');
INSERT INTO public.teams VALUES (378, 'Uruguay');
INSERT INTO public.teams VALUES (450, 'Brazil Colombia');
INSERT INTO public.teams VALUES (380, 'Germany');
INSERT INTO public.teams VALUES (381, 'Netherlands');
INSERT INTO public.teams VALUES (382, 'Argentina');
INSERT INTO public.teams VALUES (451, 'Germany France');
INSERT INTO public.teams VALUES (452, 'Brazil Chile');
INSERT INTO public.teams VALUES (453, 'Colombia Uruguay');
INSERT INTO public.teams VALUES (454, 'France Nigeria');
INSERT INTO public.teams VALUES (455, 'Germany Algeria');
INSERT INTO public.teams VALUES (456, 'Netherlands Mexico');
INSERT INTO public.teams VALUES (389, 'Colombia');
INSERT INTO public.teams VALUES (457, 'Costa Rica Greece');
INSERT INTO public.teams VALUES (458, 'Argentina Switzerland');
INSERT INTO public.teams VALUES (459, 'Belgium United States');
INSERT INTO public.teams VALUES (393, 'Costa Rica');
INSERT INTO public.teams VALUES (461, '');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 523, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

