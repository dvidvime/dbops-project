-- Очистка

DROP TABLE IF EXISTS public.order_product;
DROP TABLE IF EXISTS public.orders;
DROP TABLE IF EXISTS public.orders_date;
DROP TABLE IF EXISTS public.product;
DROP TABLE IF EXISTS public.product_info;

-- Создание структуры

CREATE TABLE public.order_product (
    quantity integer NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);

CREATE TABLE public.orders (
    id bigint NOT NULL,
    status character varying(255)
);

CREATE TABLE public.orders_date (
    order_id bigint NOT NULL,
    status character varying(255),
    date_created date DEFAULT CURRENT_DATE
);

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    picture_url character varying(255)
);

CREATE TABLE public.product_info (
    product_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price double precision
);