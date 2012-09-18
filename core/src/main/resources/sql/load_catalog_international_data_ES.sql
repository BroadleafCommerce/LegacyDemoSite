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
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE,CATEGORY_ID) VALUES (2001,'Inicio','Inicio','es',2001);
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE,CATEGORY_ID) VALUES (2002,'Salsas Picantes','Salsas','es',2002);
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE,CATEGORY_ID) VALUES (2003,'Mercanc&iacute;a','Mercanc&iacute;a','es',2003);
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE,CATEGORY_ID) VALUES (2004,'Descuento','Descuento','es',2004);
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE,CATEGORY_ID) VALUES (2005,'Iniciando con Salsas?','Nuevo a la Salsa?','es',2005);
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LOCALE_CODE,CATEGORY_ID) VALUES (2006,'FAQ','FAQ','es',2006);

-- Custom store SKU cross reference with translations
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2001, 2001, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2002, 2002, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2003, 2003, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2004, 2004, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2005, 2005, 'es');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2006, 2006, 'es');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product options in Spanish
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION (TRANSLATION_ID,LABEL,LOCALE_CODE,PRODUCT_OPTION_ID) VALUES (1,'Color de Camisa','es',1);
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION (TRANSLATION_ID,LABEL,LOCALE_CODE,PRODUCT_OPTION_ID) VALUES (2,'Tama&ntilde;o de Camisa','es',2);

-- Custom store SKU cross reference with translations
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION_XREF (PRODUCT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 1, 'es');
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION_XREF (PRODUCT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2, 'es');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT SKU TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store SKUs in Spanish
-- -- Hot Sauces translations
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (1,'Sudden Death Sauce','Salsa de la Muerte S&uacute;bita ','Como mis amigos salseros saben, nunca soy f&aacute;cil de satisfacer. Por lo tanto, naci&oacute; la creaci&oacute;n de la Muerte S&uacute;bita. Cuando este listo para saborear al m&aacute;s all&aacute; ... Muerte s&uacute;bita entregar&aacute;!','es',1);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (2,'Sweet Death Sauce','Salsa de la Muerte Dulce','El perfecto acompa&ntilde;ante para el pollo, el pescado, hamburguesas o pizza. Una gran mezcla de habanero, mango, fruta de la pasi&oacute;n y mucho m&aacute;s hacen de esta salsa de la Muerte una delicia tropical incre&iacute;ble.','es',2);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (3,'Hoppin'' Hot Sauce','Salsa de la Muerte Saltante','Picante, maduro pimienta que se mezcla junto con el ajo, la cebolla, pasta de tomate y una pizca de az&uacute;car de ca&ntilde;a para hacer de esto una salsa suave. Maravilloso en huevos, aves de corral, carne de cerdo o pescado, esta salsa se ​​mezcla para hacer los adobos y sopas ricas.','es',3);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (4,'Day of the Dead Chipotle Hot Sauce','Salsa del D&iacute;a de los Muertos de Chipotle','Cuando cualquier pimienta se seca y se fuma, se refiere como un Chipotle. Por lo general, con una apariencia arrugada, caf&eacute; oscuro, el Chipotle ofrece un sabor ahumado y dulce que se utiliza generalmente para agregar un sabor asado a las salsas, guisos y adobos.','es',4);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (5,'Day of the Dead Habanero Hot Sauce','Salsa del D&iacute;a de los Muertos de Habanero','Si quieres picante, este es el Chile a elegir. Originario del Caribe, Yucat&aacute;n y la Costa norte de Am&eacute;rica del Sur, el habanero se presenta en una variedad de colores que van desde el verde claro a un rojo brillante. El calor, sabor y aroma &uacute;nicos del Habanero ha convertido el chile en el favorito de los amantes del picante.','es',5);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (6,'Day of the Dead Scotch Bonnet Hot Sauce','Salsa del D&iacute;a de los Muertos de Bonnet Escoc&eacute;s','Parecido al Habanero, el Bonnet Escoc&eacute;s tiene una punta profundamente invertidas en comparaci&oacute;n con el extremo puntiagudo del Habanero. Van en colores de verde a amarillo-naranja, el Bonnet Escoc&eacute;s es un alimento b&aacute;sico en West Indies, en Barbados y salsas estilo pimienta.','es',6);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (7,'Green Ghost','Fantasma Verde','Hecho con Naga Jolokia Bhut, el chile m&aacute;s picante del mundo.','es',7);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (8,'Blazin'' Saddle XXX Hot Habanero Pepper Sauce','Salsa de Habanero de la Silla Ardiente','Esta salsa caliente recibe su nombre por la gente que aprecian una salsa picante. Lo que vas a encontrar aquí es un sabor picante realmente original, no una acritud abrumador que se encuentra en las salsas de chile Tabasco ordinarios - a pesar de la pimienta usado en este producto ha sido probado en 285.000 unidades Scoville. Por lo tanto, ensillar a dar un paseo para recordar. Para asegurarnos de que usted trajo s&oacute;lo la mejor salsa de pimiento habanero, nos fuimos a las faldas de las monta&ntilde;as mayas en Belice, Am&eacute;rica Central. Este producto se prepara totalmente a mano utilizando s&oacute;lo las verduras frescas y solo ingredientes naturales.','es',8);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (9,'Armageddon The Hot Sauce To End All','Fin del Mundo Salsa','Todo el infierno se ha desatado, fuego y azufre. Est&aacute; listo para el fin?','es',9);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (10,'Dr. Chilemeister''s Insane Hot Sauce','Salsa Loca del Dr. Chilemeister','Aquí est&aacute; la receta para aquellos que disfrutan de picante intolerable. Esta salsa macabra y mortal del Dr. Chilemeister se debe utilizar con precauci&oacute;n. El dolor puede llegar a ser adictivo!','es',10);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (11,'Bull Snort Cowboy Cayenne Pepper Hot Sauce','Salsa Picante del Vaquero','Espolvorear con platos de carne, pescado y verduras. Use como aditivo en la salsa de barbacoa o cualquier alimento que necesita un sabor picante. Comience con unas gotas y aumente hasta llegar al sabor deseado.','es',11);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (12,'Cafe Louisiane Sweet Cajun Blackening Sauce','Salsa Dulce de Cajun de Lousiane','Una de las salsas m&aacute;s inusuales que vendemos. La original era un viejo estilo salsa caj&uacute;n y esto versi&oacute;n actualizada ennegrecimiento. Es dulce, pero se obtiene un gran sabor de canela y clavo de olor con un tiro agradable de piacnte de Cayena. Use en todos los alimentos para dar ese toque caj&uacute;n.','es',12);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (13,'Bull Snort Smokin'' Toncils Hot Sauce','Salsa Mata-Gargantas de Bull Snort','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Si usted es un fan de hacer la salsa de barbacoa a partir de cero, como yo, puede utilizar la Salsa de Snortin Bull como aditivo. Habaneros ardientes y los pimientos de cayena dan a la garganta un sabor y calor al rojo vivo.','es',13);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (14,'Cool Cayenne Pepper Hot Sauce','Salsa de Cayene Fresco','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es',14);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (15,'Roasted Garlic Hot Sauce','Salsa de Ajo Tostado','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es',15);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (16,'Insanity Sauce','Salsa de Locura','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es',16);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (17,'Insanity Sauce','Salsa de Locura','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es',17);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (18,'Hurtin'' Jalepeno Hot Sauce','Salsa de Jalape&ntilde;o Ardiente','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es',18);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (19,'Roasted Red Pepper & Chipotle Hot Sauce','Salsa de Pimienta Roja y Chipotle','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.','es',19);
-- -- Merchandise translations
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (100,'Hawt Like a Habanero Shirt (Men''s)','Camisa de Habanero Hawt (Hombres)','Colecci&oacute;n de Hombres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.','es',100);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (200,'Hawt Like a Habanero Shirt (Women''s)','Camisa de Habanero Hawt (Mujeres)','Colecci&oacute;n de Mujeres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.','es',200);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (300,'Heat Clinic Hand-Drawn (Men''s)','Heat Clinic dibujado a mano (Hombres)','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.','es',300);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (400,'Heat Clinic Hand-Drawn (Women''s)','Heat Clinic dibujado a mano (Mujeres)','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.','es',400);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (500,'Heat Clinic Mascot (Men''s)','Mascota de Heat Clinic (Hombres)','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!','es',500);
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION,LOCALE_CODE,SKU_ID) VALUES (600,'Heat Clinic Mascot (Women''s)','Mascota de Heat Clinic (Mujeres)','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!','es',600);


-- Custom store SKU cross reference with translations
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 1, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 3, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (4, 4, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (5, 5, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (6, 6, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (7, 7, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (8, 8, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (9, 9, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (10, 10, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (11, 11, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (12, 12, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (13, 13, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (14, 14, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (15, 15, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (16, 16, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (17, 17, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (18, 18, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (19, 19, 'es');
-- -- Merchandise cross reference
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (100, 100, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (200, 200, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (300, 300, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (400, 400, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (500, 500, 'es');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (600, 600, 'es');