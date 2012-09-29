--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype with data translated to Spanish.
-- Implementers can change this file to load their initial catalog.
--

-----------------------------------------------------------------------------------------------------------------------------------
-- CATEGORY DATA TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store navigation in Spanish
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE) VALUES (1001,'Inicio','Inicio','es');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE) VALUES (1002,'Salsas Picantes','Salsas','es');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE) VALUES (1003,'Mercanc&iacute;a','Mercanc&iacute;a','es');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE) VALUES (1004,'Descuento','Descuento','es');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE) VALUES (1005,'Iniciando con Salsas?','Nuevo a la Salsa?','es');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE) VALUES (1006,'FAQ','FAQ','es');

-- Custom store SKU cross reference with translations
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2001, 1001, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2002, 1002, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2003, 1003, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2004, 1004, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2005, 1005, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2006, 1006, 'es');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product options in Spanish
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION (TRANSLATION_ID,LABEL,LOCALE_CODE) VALUES (1001,'Color de Camisa','es');
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION (TRANSLATION_ID,LABEL,LOCALE_CODE) VALUES (1002,'Tama&ntilde;o de Camisa','es');

-- Custom store product options cross reference with translations
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION_XREF (PRODUCT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 1001, 'es');
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION_XREF (PRODUCT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 1002, 'es');

-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTION VALUES TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product option values in Spanish
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1001,'Negro','es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1002,'Rojo','es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1003,'Plateado','es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1011,'CH','es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1012,'M','es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1013,'G','es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE,LOCALE_CODE) VALUES (1014,'XG','es');

-- Custom store product option values cross reference with translations
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 1001, 'es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 1002, 'es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 1003, 'es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (11, 1011, 'es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (12, 1012, 'es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (13, 1013, 'es');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (14, 1014, 'es');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT SKU TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store SKUs in Spanish
-- -- Hot Sauces translations
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1001,'Sudden Death Sauce','Salsa de la Muerte S&uacute;bita ','Como mis amigos salseros saben, nunca soy f&aacute;cil de satisfacer. Por lo tanto, naci&oacute; la creaci&oacute;n de la Muerte S&uacute;bita. Cuando este listo para saborear al m&aacute;s all&aacute; ... Muerte s&uacute;bita entregar&aacute;!','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1002,'Sweet Death Sauce','Salsa de la Muerte Dulce','El perfecto acompa&ntilde;ante para el pollo, el pescado, hamburguesas o pizza. Una gran mezcla de habanero, mango, fruta de la pasi&oacute;n y mucho m&aacute;s hacen de esta salsa de la Muerte una delicia tropical incre&iacute;ble.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1003,'Hoppin'' Hot Sauce','Salsa de la Muerte Saltante','Picante, maduro pimienta que se mezcla junto con el ajo, la cebolla, pasta de tomate y una pizca de az&uacute;car de ca&ntilde;a para hacer de esto una salsa suave. Maravilloso en huevos, aves de corral, carne de cerdo o pescado, esta salsa se ​​mezcla para hacer los adobos y sopas ricas.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1004,'Day of the Dead Chipotle Hot Sauce','Salsa del D&iacute;a de los Muertos de Chipotle','Cuando cualquier pimienta se seca y se fuma, se refiere como un Chipotle. Por lo general, con una apariencia arrugada, caf&eacute; oscuro, el Chipotle ofrece un sabor ahumado y dulce que se utiliza generalmente para agregar un sabor asado a las salsas, guisos y adobos.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1005,'Day of the Dead Habanero Hot Sauce','Salsa del D&iacute;a de los Muertos de Habanero','Si quieres picante, este es el Chile a elegir. Originario del Caribe, Yucat&aacute;n y la Costa norte de Am&eacute;rica del Sur, el habanero se presenta en una variedad de colores que van desde el verde claro a un rojo brillante. El calor, sabor y aroma &uacute;nicos del Habanero ha convertido el chile en el favorito de los amantes del picante.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1006,'Day of the Dead Scotch Bonnet Hot Sauce','Salsa del D&iacute;a de los Muertos de Bonnet Escoc&eacute;s','Parecido al Habanero, el Bonnet Escoc&eacute;s tiene una punta profundamente invertidas en comparaci&oacute;n con el extremo puntiagudo del Habanero. Van en colores de verde a amarillo-naranja, el Bonnet Escoc&eacute;s es un alimento b&aacute;sico en West Indies, en Barbados y salsas estilo pimienta.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1007,'Green Ghost','Fantasma Verde','Hecho con Naga Jolokia Bhut, el chile m&aacute;s picante del mundo.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1008,'Blazin'' Saddle XXX Hot Habanero Pepper Sauce','Salsa de Habanero de la Silla Ardiente','Esta salsa caliente recibe su nombre por la gente que aprecian una salsa picante. Lo que vas a encontrar aquí es un sabor picante realmente original, no una acritud abrumador que se encuentra en las salsas de chile Tabasco ordinarios - a pesar de la pimienta usado en este producto ha sido probado en 285.000 unidades Scoville. Por lo tanto, ensillar a dar un paseo para recordar. Para asegurarnos de que usted trajo s&oacute;lo la mejor salsa de pimiento habanero, nos fuimos a las faldas de las monta&ntilde;as mayas en Belice, Am&eacute;rica Central. Este producto se prepara totalmente a mano utilizando s&oacute;lo las verduras frescas y solo ingredientes naturales.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1009,'Armageddon The Hot Sauce To End All','Fin del Mundo Salsa','Todo el infierno se ha desatado, fuego y azufre. Est&aacute; listo para el fin?','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1010,'Dr. Chilemeister''s Insane Hot Sauce','Salsa Loca del Dr. Chilemeister','Aquí est&aacute; la receta para aquellos que disfrutan de picante intolerable. Esta salsa macabra y mortal del Dr. Chilemeister se debe utilizar con precauci&oacute;n. El dolor puede llegar a ser adictivo!','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1011,'Bull Snort Cowboy Cayenne Pepper Hot Sauce','Salsa Picante del Vaquero','Espolvorear con platos de carne, pescado y verduras. Use como aditivo en la salsa de barbacoa o cualquier alimento que necesita un sabor picante. Comience con unas gotas y aumente hasta llegar al sabor deseado.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1012,'Cafe Louisiane Sweet Cajun Blackening Sauce','Salsa Dulce de Cajun de Lousiane','Una de las salsas m&aacute;s inusuales que vendemos. La original era un viejo estilo salsa caj&uacute;n y esto versi&oacute;n actualizada ennegrecimiento. Es dulce, pero se obtiene un gran sabor de canela y clavo de olor con un tiro agradable de piacnte de Cayena. Use en todos los alimentos para dar ese toque caj&uacute;n.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1013,'Bull Snort Smokin'' Toncils Hot Sauce','Salsa Mata-Gargantas de Bull Snort','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Si usted es un fan de hacer la salsa de barbacoa a partir de cero, como yo, puede utilizar la Salsa de Snortin Bull como aditivo. Habaneros ardientes y los pimientos de cayena dan a la garganta un sabor y calor al rojo vivo.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1014,'Cool Cayenne Pepper Hot Sauce','Salsa de Cayene Fresco','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1015,'Roasted Garlic Hot Sauce','Salsa de Ajo Tostado','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1016,'Insanity Sauce','Salsa de Locura','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1017,'Insanity Sauce','Salsa de Locura','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1018,'Hurtin'' Jalepeno Hot Sauce','Salsa de Jalape&ntilde;o Ardiente','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1019,'Roasted Red Pepper & Chipotle Hot Sauce','Salsa de Pimienta Roja y Chipotle','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es');
-- -- Merchandise translations
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1100,'Hawt Like a Habanero Shirt (Men''s)','Camisa de Habanero Hawt (Hombres)','Colecci&oacute;n de Hombres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1200,'Hawt Like a Habanero Shirt (Women''s)','Camisa de Habanero Hawt (Mujeres)','Colecci&oacute;n de Mujeres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1300,'Heat Clinic Hand-Drawn (Men''s)','Heat Clinic dibujado a mano (Hombres)','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1400,'Heat Clinic Hand-Drawn (Women''s)','Heat Clinic dibujado a mano (Mujeres)','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1500,'Heat Clinic Mascot (Men''s)','Mascota de Heat Clinic (Hombres)','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!','es');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1600,'Heat Clinic Mascot (Women''s)','Mascota de Heat Clinic (Mujeres)','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!','es');


-- Custom store SKU cross reference with translations
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 1001, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 1002, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 1003, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (4, 1004, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (5, 1005, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (6, 1006, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (7, 1007, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (8, 1008, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (9, 1009, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (10, 1010, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (11, 1011, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (12, 1012, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (13, 1013, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (14, 1014, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (15, 1015, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (16, 1016, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (17, 1017, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (18, 1018, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (19, 1019, 'es');
-- -- Merchandise cross reference
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (100, 1100, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (200, 1200, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (300, 1300, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (400, 1400, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (500, 1500, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (600, 1600, 'es');

-----------------------------------------------------------------------------------------------------------------------------------
-- FULFILLMENT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product options in Spanish
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION (TRANSLATION_ID,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1001,'Primera Clase', '2 - 7 D&iacute;as', 'es');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION (TRANSLATION_ID,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1002,'Ejecutiva', '2 - 5 D&iacute;as', 'es');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION (TRANSLATION_ID,NAME,LONG_DESCRIPTION,LOCALE_CODE) VALUES (1003,'Express', '1 - 2 D&iacute;as', 'es');

-- Custom store product options cross reference with translations
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION_XREF (FULFILLMENT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 1001, 'es');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION_XREF (FULFILLMENT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 1002, 'es');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION_XREF (FULFILLMENT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 1003, 'es');