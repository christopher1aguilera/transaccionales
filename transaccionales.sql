CREATE DATABASE transaccionales;
\c transaccionales
\i transaccionales/unidad2.sql


CREATE DATABASE transaccionales;
psql -U postgres transaccionales < unidad2.sql

SELECT * FROM public.cliente;
SELECT * FROM public.compra;
SELECT * FROM public.detalle_compra;
SELECT * FROM public.producto;

BEGIN TRANSACTION;
INSERT INTO public.compra (id, cliente_id, fecha) values (33, 1, '25-11-2020');
INSERT INTO public.detalle_compra (id, producto_id, compra_id, cantidad) values (43, 9, 33, 5);
UPDATE public.producto SET stock = stock - 5 WHERE id = 9;
COMMIT;
SELECT * FROM public.producto;

BEGIN TRANSACTION;
INSERT INTO public.compra (id, cliente_id, fecha) values (33, 2, '25-11-2020');
INSERT INTO public.detalle_compra (id, producto_id, compra_id, cantidad) values (43, 1, 33, 3);
UPDATE public.producto SET stock = stock - 3 WHERE id = 1;

INSERT INTO public.compra (id, cliente_id, fecha) values (34, 2, '25-11-2020');
INSERT INTO public.detalle_compra (id, producto_id, compra_id, cantidad) values (44, 2, 34, 3);
UPDATE public.producto SET stock = stock - 3 WHERE id = 2;

INSERT INTO public.compra (id, cliente_id, fecha) values (35, 2, '25-11-2020');
INSERT INTO public.detalle_compra (id, producto_id, compra_id, cantidad) values (45, 8, 35, 3);
UPDATE public.producto SET stock = stock - 3 WHERE id = 8;
COMMIT;
SELECT * FROM public.producto;

\set AUTOCOMMIT off
INSERT INTO public.cliente (id, nombre, email) values (11, 'christopher', 'christopher.aguilera.mad@gmail.com');
SELECT * FROM public.cliente;
ROLLBACK;
SELECT * FROM public.cliente;
\set AUTOCOMMIT on