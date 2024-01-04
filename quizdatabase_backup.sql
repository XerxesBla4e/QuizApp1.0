--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;


ALTER SCHEMA pgagent OWNER TO postgres;

--
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: pgagent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;


--
-- Name: EXTENSION pgagent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    difficulty_level character varying,
    category character varying,
    question_title character varying,
    option1 character varying,
    option2 character varying,
    option3 character varying,
    option4 character varying,
    right_answer character varying
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: question_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_seq OWNER TO postgres;

--
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    quiz_title character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_questions (
    quiz_id integer NOT NULL,
    questions_id integer NOT NULL
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- Name: quiz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_seq OWNER TO postgres;

--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Data for Name: pga_jobagent; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobagent (jagpid, jaglogintime, jagstation) FROM stdin;
9892	2024-01-04 11:11:47.250954+03	KingXerxes
\.


--
-- Data for Name: pga_jobclass; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobclass (jclid, jclname) FROM stdin;
\.


--
-- Data for Name: pga_job; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_job (jobid, jobjclid, jobname, jobdesc, jobhostagent, jobenabled, jobcreated, jobchanged, jobagentid, jobnextrun, joblastrun) FROM stdin;
\.


--
-- Data for Name: pga_schedule; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_schedule (jscid, jscjobid, jscname, jscdesc, jscenabled, jscstart, jscend, jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths) FROM stdin;
\.


--
-- Data for Name: pga_exception; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_exception (jexid, jexscid, jexdate, jextime) FROM stdin;
\.


--
-- Data for Name: pga_joblog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_joblog (jlgid, jlgjobid, jlgstatus, jlgstart, jlgduration) FROM stdin;
\.


--
-- Data for Name: pga_jobstep; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobstep (jstid, jstjobid, jstname, jstdesc, jstenabled, jstkind, jstcode, jstconnstr, jstdbname, jstonerror, jscnextrun) FROM stdin;
\.


--
-- Data for Name: pga_jobsteplog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobsteplog (jslid, jsljlgid, jsljstid, jslstatus, jslresult, jslstart, jslduration, jsloutput) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, difficulty_level, category, question_title, option1, option2, option3, option4, right_answer) FROM stdin;
15	Hard	Math	What is the square roor of 16?	4	8	12	16	4
14	Medium	English	Who Wrote the novel "Moby Dick"?	Herman Melville	Mark Twain	Charles Dickens	Leo Tolstoy	Herman Melville
1	Easy	Java	Maximum Byte For Java?	100	127	255	999	127
16	Easy	English	What is the name of the largest planet in the solar system?	Jupiter	Saturn	Uranus	Neptune	Jupiter
\.


--
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz (id, quiz_title) FROM stdin;
1	MathQuiz
2	ScienceQuiz
52	EnglishQuiz
\.


--
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_questions (quiz_id, questions_id) FROM stdin;
1	15
2	16
52	16
52	14
\.


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 16, true);


--
-- Name: question_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_seq', 1, true);


--
-- Name: quiz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_seq', 101, true);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (quiz_id, questions_id);


--
-- Name: quiz_questions quiz_questions_questions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_questions_id_fkey FOREIGN KEY (questions_id) REFERENCES public.question(id);


--
-- Name: quiz_questions quiz_questions_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- PostgreSQL database dump complete
--

