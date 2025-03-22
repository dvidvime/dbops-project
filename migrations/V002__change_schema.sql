-- Добавить в таблицу product поле price и сделать id первичным ключом

ALTER TABLE public.product ADD price double precision NULL;
ALTER TABLE public.product ADD CONSTRAINT product_pkey PRIMARY KEY (id);  

-- Добавить в таблицу orders поле date_created и сделать id первичным ключом

ALTER TABLE public.orders ADD date_created date NULL;
ALTER TABLE public.orders ADD CONSTRAINT orders_pkey PRIMARY KEY (id);  

-- Добавить в таблицу order_product внешние ключи

ALTER TABLE public.order_product ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(id);  
ALTER TABLE public.order_product ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(id);  

-- удаление неиспользуемых таблиц

DROP TABLE public.product_info;
DROP TABLE public.orders_date;