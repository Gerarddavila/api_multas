-- INGRESOS A datos_vehiculo

INSERT INTO db_api_multas.datos_vehiculo
(no_multa, no_placa, no_tarjeta_cir, tipo_vehiculo, marca, color)
VALUES
(2580, 'P-321WCD', '123456789', 'PICKUP', 'TOYOTA', 'ROJO'),
(2581, 'P-123WAF', '987456123', 'SEDAN', 'TOYOTA', 'AZUL'),
(2582,'P-66CBDC','8104858','CAMIONETA','HONDA','NEGRO'),
(2583,'U-50F106','1306712','BUS URBANO','MERCEDEZ BENZ','BLANCO'),
(2584,'C-11F126','7627623','CAMIONETA','MERCEDEZ BENZ','AMARILLO'),
(2585,'P-36B87E','3866455','PICKUP','TOYOTA','ROJO'),
(2586,'P-723FD1','5516474','SEDAN','VOLVO','NEGRO'),
(2587,'C-5612E2','5966011','CAMIONETA','MERCEDEZ BENZ','ROJO'),
(2588,'C-2F697B','6334992','CAMIONETA','MERCEDEZ BENZ','NARANJA'),
(2589,'A-64BDD3','9471742','SEDAN','MITSUBISHI','BLANCO'),
(2590,'A-3509D0','9246158','SEDAN','MAZDA','ROJO');


-- CONSULTA A datos_vehiculo

SELECT id, no_multa, no_placa, no_tarjeta_cir, tipo_vehiculo, marca, color
FROM apimult_as.datos_vehiculo;

SELECT id, no_multa, no_placa, no_tarjeta_cir, tipo_vehiculo, marca, color
FROM db_api_multas.datos_vehiculo;
