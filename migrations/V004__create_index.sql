-- составной индекс по дате и статусу для ускорения фильтрации
CREATE INDEX orders_status_idx ON public.orders (status,date_created);

-- индекс по order_id для ускорения join
CREATE INDEX order_product_order_id_idx ON public.order_product (order_id);