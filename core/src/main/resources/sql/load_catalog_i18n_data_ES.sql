-----------------------------------------------------------------------------------------------------------------------------------
-- SPANISH TRANSLATION DATA
-- Translates the catalog and content for the demo application to spanish.
-- Uses translation ids ranging from -1 to -199
-----------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------
-- CATEGORY DATA TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Category names
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-1, 2001, 'es', 'Category', 'name', 'Inicio');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-2, 2002, 'es', 'Category', 'name', 'Salsas');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-3, 2003, 'es', 'Category', 'name', 'Marketing');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-4, 2004, 'es', 'Category', 'name', 'Ofertas');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-5, 2005, 'es', 'Category', 'name', 'Tarjetas de Regalo');

--  Category descriptions
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-11, 2001, 'es', 'Category', 'description', 'Inicio');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-12, 2002, 'es', 'Category', 'description', 'Salsas Picantes');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-13, 2003, 'es', 'Category', 'description', 'Marketing');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-14, 2004, 'es', 'Category', 'description', 'Ofertas');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-15, 2005, 'es', 'Category', 'description', 'Tarjetas de Regalo');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-31, 1, 'es', 'ProdOption', 'label', 'Colores de Camisa');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-32, 2, 'es', 'ProdOption', 'label', 'Tamaños de Camisa');

-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTION VALUES TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-41, 1, 'es', 'ProdOptionVal', 'attributeValue', 'Negro');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-42, 2, 'es', 'ProdOptionVal', 'attributeValue', 'Rojo');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-43, 3, 'es', 'ProdOptionVal', 'attributeValue', 'Plateado');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-44, 11, 'es', 'ProdOptionVal', 'attributeValue', 'CH');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-45, 12, 'es', 'ProdOptionVal', 'attributeValue', 'M');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-46, 13, 'es', 'ProdOptionVal', 'attributeValue', 'G');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-47, 14, 'es', 'ProdOptionVal', 'attributeValue', 'XG');



-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT SKU TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-51, 1, 'es', 'Sku', 'name', 'Salsa de la Muerte Súbita');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-52, 1, 'es', 'Sku', 'longDescription', 'Como mis amigos salseros saben, no me conformo fácilmente. Por eso creé la Muerte Súbita. Cuando esté listo para saborear el más allá ... ¡la Muerte Súbita cumplirá su cometido!');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-53, 2, 'es', 'Sku', 'name', 'Salsa de la Muerte Dulce');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-54, 2, 'es', 'Sku', 'longDescription', 'El perfecto acompañamiento para pollo, pescado, hamburguesas o pizza. Una gran mezcla de habanero, mango, fruta de la pasión y mucho más, hace de esta Salsa de la Muerte una increíble delicia tropical.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-55, 3, 'es', 'Sku', 'name', 'Salsa de la Muerte Saltante');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-56, 3, 'es', 'Sku', 'longDescription', 'Pimienta picante y maduro mezclada con ajo, cebolla, pasta de tomate y una pizca de azúcar de caña, para lograr una salsa suave. Maravillosa con huevos, carnes blancas o cerdo, esta salsa se usa para hacer los adobos y ricas sopas.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-57, 4, 'es', 'Sku', 'name', 'Salsa del Día de los Muertos de Chipotle');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-58, 4, 'es', 'Sku', 'longDescription', 'Cuando una pimienta se seca y ahúma, se la denomina Chipotle. Generalmente de una apariencia arrugada tipo café oscuro, el Chipotle ofrece un sabor ahumado y dulce que se utiliza para agregarles un sabor asado a las salsas, guisos y adobos.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-59, 5, 'es', 'Sku', 'name', 'Salsa del Día de los Muertos de Habanero');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-60, 5, 'es', 'Sku', 'longDescription', 'Si quiere picante, este es el Chile a elegir. Originario del Caribe, Yucatán y la costa norte de América del Sur, el habanero viene en una variedad de colores que va del verde claro al rojo brillante. La intensidad, sabor y aroma únicos del Habanero ha convertido este chile en el favorito de los amantes de lo picante.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-61, 6, 'es', 'Sku', 'name', 'Salsa del Día de los Muertos de Bonnet Escocés');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-62, 6, 'es', 'Sku', 'longDescription', 'Parecido al Habanero, el Bonnet Escocés tiene una punta profundamente invertida en comparación con el extremo puntiagudo del Habanero. Viene en colores que van del el verde al amarillo-anaranjado; el Bonnet Escocés es casi el pan de cada día en en West Indies y Barbados.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-63, 7, 'es', 'Sku', 'name', 'Fantasma Verde');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-64, 7, 'es', 'Sku', 'longDescription', 'Hecho con Naga Jolokia Bhut, el chile más picante del mundo.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-65, 8, 'es', 'Sku', 'name', 'Salsa de Habanero de la Silla Ardiente');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-66, 8, 'es', 'Sku', 'longDescription', 'Esta intensa salsa fue bautizada así por los conocedores de salsas picantes. Lo que va a encontrar aquí, es un sabor picante realmente original, no la típica acritud abrumadora que normalmente se encuentra en las salsas de chile Tabasco ordinarias ( y eso, a pesar de que la pimienta usada en este producto ha sido probado en más de 285.000 unidades Scoville). Por lo tanto, agárrese para dar un paseo para recordar. Para asegurarnos de brindarle sólo la mejor salsa de pimiento habanero, nos fuimos a las laderas de las montañas mayas en Belice, América Central. Este producto se prepara totalmente a mano utilizando sólo verduras frescas e ingredientes naturales.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-67, 9, 'es', 'Sku', 'name', 'Salsa del Fin del Mundo');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-68, 9, 'es', 'Sku', 'longDescription', '¡El infierno se ha desatado, fuego y azufre. ¿Está listo para el fin?');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-69, 10, 'es', 'Sku', 'name', 'Salsa Loca del Dr. Chilemeister');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-70, 10, 'es', 'Sku', 'longDescription', 'Aquí está la receta para los que disfrutan de un picante insoportable. La salsa macabra y mortal del Dr. Chilemeister debe usarse con precaución. ¡El dolor puede llegar a ser adictivo!');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-71, 11, 'es', 'Sku', 'name', 'Salsa Picante del Vaquero');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-72, 11, 'es', 'Sku', 'longDescription', 'Espolvoree platos de carne, pescado y verduras. Use como aditivo en salsas para barbacoa, o cualquier alimento que necesite un sabor picante. Comience con unas gotas, y aumente hasta llegar al sabor deseado.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-73, 12, 'es', 'Sku', 'name', 'Salsa Dulce Cajún de Luisiana');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-74, 12, 'es', 'Sku', 'longDescription', 'Una de nuestras salsas más inusuales. La original era una salsa al viejo estilo cajun y, esto versión actualizada fue deliberadamente ennegrecida. Es dulce, pero produce un gran sabor a canela y clavo de olor, con una  pizca agradable de picante de Cayena. Use con cualquier alimento, para darle ese toque cajún.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-75, 13, 'es', 'Sku', 'name', 'Salsa Mata-Gargantas de Bull Snort');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-76, 13, 'es', 'Sku', 'longDescription', '¡Todo es más grande en Texas, incluso lo picante Salsa de Snortin Bull! Si usted es fanático de preparar su salsa para barbacoa a partir de cero, como yo, puede utilizar la Salsa de Snortin Bull como aditivo. Habaneros ardientes y pimientos de cayena dan a la Garganta un sabor e intensidad al rojo vivo.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-77, 14, 'es', 'Sku', 'name', 'Salsa de Cayena Fresca');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-78, 14, 'es', 'Sku', 'longDescription', 'Esta salsa debe su gran sabor a los pimientos añejos y al vinagre de caña. Mejorará el sabor de cualquier comida.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-79, 15, 'es', 'Sku', 'name', 'Salsa de Ajo Tostado');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-80, 15, 'es', 'Sku', 'longDescription', 'Esta salsa debe su gran sabor a los pimientos añejos y el vinagre de caña. Mejorará el sabor de cualquier comida.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-81, 16, 'es', 'Sku', 'name', 'Salsa de la Locura');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-82, 16, 'es', 'Sku', 'longDescription', 'Esta salsa debe su gran sabor a los pimientos añejos y el vinagre de caña. Mejorará el sabor de cualquier comida.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-83, 17, 'es', 'Sku', 'name', 'Salsa de la Locura');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-84, 17, 'es', 'Sku', 'longDescription', 'Esta salsa debe su gran sabor a los pimientos añejos y el vinagre de caña. Mejorará el sabor de cualquier comida.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-85, 18, 'es', 'Sku', 'name', 'Salsa del Jalapeño Ardiente');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-86, 18, 'es', 'Sku', 'longDescription', 'Esta salsa debe su gran sabor a los pimientos añejos y el vinagre de caña. Mejorará el sabor de cualquier comida.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-87, 19, 'es', 'Sku', 'name', 'Salsa de Pimienta Roja y Chipotle');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-88, 19, 'es', 'Sku', 'longDescription', 'Esta salsa debe su gran sabor a los pimientos añejos y el vinagre de caña. Mejorará el sabor de cualquier comida.');

INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-89, 100, 'es', 'Sku', 'name', 'Camisa de Habanero Hawt (Varones)');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-90, 100, 'es', 'Sku', 'longDescription', 'Colección para Hombres Habanero estándar de manga corta serigrafiadas, camiseta de algodón suave en ajuste normal.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-91, 200, 'es', 'Sku', 'name', 'Camisa de Habanero Hawt (Mujeres)');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-92, 200, 'es', 'Sku', 'longDescription', 'Colección para Mujeres Habanero estándar de manga corta serigrafiadas, camiseta de algodón suave en ajuste normal.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-93, 300, 'es', 'Sku', 'name', 'Heat Clinic dibujada a mano (Varones)');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-94, 300, 'es', 'Sku', 'longDescription', 'Esta camiseta tiene el logo dibujado a mano para hombres, y se ofrece con ajuste normal, en tres colores diferentes.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-95, 400, 'es', 'Sku', 'name', 'Heat Clinic dibujado a mano (Mujeres)');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-96, 400, 'es', 'Sku', 'longDescription', 'Esta camiseta tiene el logo dibujado a mano para hombres, y se ofrece con ajuste normal, en tres colores diferentes.');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-97, 500, 'es', 'Sku', 'name', 'Mascota de Heat Clinic (Varones)');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-98, 500, 'es', 'Sku', 'longDescription', '¿No es linda nuestra mascota? Compre su propia camiseta hoy!');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-99, 600, 'es', 'Sku', 'name', 'Mascota de Heat Clinic (Mujeres)');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-100, 600, 'es', 'Sku', 'longDescription', '¿No es linda, nuestra mascota? ¡Compre su propia camiseta hoy!');

-----------------------------------------------------------------------------------------------------------------------------------
-- SEARCH FACET TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-180, 1, 'es', 'SearchFacet', 'label', 'Marca');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-181, 2, 'es', 'SearchFacet', 'label', 'Rango de Calor');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-182, 3, 'es', 'SearchFacet', 'label', 'Precio');

-----------------------------------------------------------------------------------------------------------------------------------
-- FULFILLMENT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-191, 1, 'es', 'FulfillmentOption', 'name', 'Estándar');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-192, 1, 'es', 'FulfillmentOption', 'longDescription', '5 - 7 Días');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-193, 2, 'es', 'FulfillmentOption', 'name', 'Ejecutivo');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-194, 2, 'es', 'FulfillmentOption', 'longDescription', '3 - 5 Días');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-195, 3, 'es', 'FulfillmentOption', 'name', 'Express');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-196, 3, 'es', 'FulfillmentOption', 'longDescription', '1 - 2 Días');

-----------------------------------------------------------------------------------------------------------------------------------
-- MENU ITEM TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME, TRANSLATED_VALUE) VALUES (-197, 5, 'aes', 'MenuItem', 'label', '¿Primera ves con las Salsas?');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME, TRANSLATED_VALUE) VALUES (-198, 6, 'es', 'MenuItem', 'label', 'Preguntas frecuentes');
