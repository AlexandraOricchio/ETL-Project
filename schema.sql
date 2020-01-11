--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

-- Started on 2020-01-11 12:52:23

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 17368)
-- Name: franchise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.franchise (
    index bigint,
    franchise_id text,
    team_id text,
    team_name_fran text NOT NULL,
    fran_first_year text,
    fran_last_year text
);


ALTER TABLE public.franchise OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17359)
-- Name: parks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parks (
    index bigint,
    bp_name text,
    bp_capacity text,
    bp_location text,
    bp_surface text,
    team_name_bp text NOT NULL,
    bp_opened text,
    bp_dst_cf text,
    bp_type text,
    bp_roof_type text
);


ALTER TABLE public.parks OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 17414)
-- Name: reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reference (
    index bigint,
    team_name_fran text,
    team_name_bp text,
    location_team_abbrv text,
    id bigint NOT NULL
);


ALTER TABLE public.reference OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17404)
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    index bigint,
    "Gm#" text,
    game_date text,
    team text,
    "At" text,
    opp text,
    "win/loss" text,
    runs_scored text,
    runs_allowed text,
    innings text,
    win_loss_rec text,
    rank text,
    games_back text,
    win text,
    loss text,
    game_time text,
    "day/night" text,
    attendance text,
    streak text,
    game_year text,
    location_team_abbrv text,
    id bigint NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- TOC entry 2703 (class 2606 OID 17376)
-- Name: franchise franchise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.franchise
    ADD CONSTRAINT franchise_pkey PRIMARY KEY (team_name_fran);


--
-- TOC entry 2701 (class 2606 OID 17367)
-- Name: parks parks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parks
    ADD CONSTRAINT parks_pkey PRIMARY KEY (team_name_bp);


--
-- TOC entry 2710 (class 2606 OID 17422)
-- Name: reference reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 17412)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 17374)
-- Name: ix_franchise_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_franchise_index ON public.franchise USING btree (index);


--
-- TOC entry 2699 (class 1259 OID 17365)
-- Name: ix_parks_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_parks_index ON public.parks USING btree (index);


--
-- TOC entry 2708 (class 1259 OID 17420)
-- Name: ix_reference_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_reference_index ON public.reference USING btree (index);


--
-- TOC entry 2705 (class 1259 OID 17410)
-- Name: ix_schedule_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_schedule_index ON public.schedule USING btree (index);


-- Completed on 2020-01-11 12:52:25

--
-- PostgreSQL database dump complete
--

