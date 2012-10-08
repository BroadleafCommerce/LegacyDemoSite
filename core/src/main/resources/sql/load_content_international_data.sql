--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file loads some sample content pages and structured content data.
--

-----------------------------------------------------------------------------------------------------------------------------------
-- SAMPLE PAGE DATA - would typically be entered via the admin
-----------------------------------------------------------------------------------------------------------------------------------

-- Create structured content for locale="es"
-- -- Create an about-us page with "prueba de contenido" as the body of the page.
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL, ARCHIVED_FLAG, DELETED_FLAG) VALUES (10, 'Prueba de Contenido', 2, '/about_us', FALSE, FALSE);

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, PAGE_ID, VALUE) VALUES (10, 'body', 10, 'prueba de contenido');
INSERT INTO BLC_PAGE_FLD_MAP(MAP_KEY, PAGE_FLD_ID, PAGE_ID) VALUES ('body', 10, 10);
INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, PAGE_ID, VALUE) VALUES (11, 'title', 10, 'Espa&ntilde;ol G&eacute;nerico');
INSERT INTO BLC_PAGE_FLD_MAP(MAP_KEY, PAGE_FLD_ID, PAGE_ID) VALUES ('title',  11,10);

-- -- Create a FAQ for loclale="es"
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL, DELETED_FLAG, ARCHIVED_FLAG) VALUES (11, 'FAQ', 2, '/faq', FALSE, FALSE);

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, PAGE_ID, VALUE) VALUES (12, 'body', 11, '<h2 style="text-align:center;">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2><h4 style="text-align:center;">Haga <a href="http://www.broadleafcommerce.com/features/content">click aqu&iacute;</a> para mas informaci&oacute;n.</h4>');
INSERT INTO BLC_PAGE_FLD_MAP(MAP_KEY, PAGE_FLD_ID, PAGE_ID) VALUES ('body', 12, 11);

-- -- Create a New To Hot Sauce for loclale="es"
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL, DELETED_FLAG, ARCHIVED_FLAG) VALUES (13, 'New to Hot Sauce', 2, '/new-to-hot-sauce', FALSE, FALSE);

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, PAGE_ID, VALUE) VALUES (13, 'body', 13, '<h2 style="text-align:center;">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2>');
INSERT INTO BLC_PAGE_FLD_MAP(MAP_KEY, PAGE_FLD_ID, PAGE_ID) VALUES ('body', 13, 13);


-----------------------------------------------------------------------------------------------------------------------------------
-- SAMPLE STRUCTURED CONTENT DATA  - would typically be entered via the admin
-----------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------
-- HOME PAGE BANNER
---------------------------------------------------
-- Content Item
-- -- Spanish Banner (locale = "es")
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (151, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Promocion - 20% de descuento en todas las camisas', FALSE, FALSE, 1, 'es', 1);

-- Fields
-- -- Spanish Banner (locale = "es")
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (51, CURRENT_TIMESTAMP, 'imageUrl', 1, 151, '/img/banners/promocion-camisas.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (52, CURRENT_TIMESTAMP, 'targetUrl', 1, 151, '/merchandise');

-- Field XREF
-- -- Spanish Banner (locale = "es")
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (151, 51, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (151, 52, 'targetUrl');


-- Content Item
-- -- Spanish Banner (locale = "fr")
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (152, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Promocion - 20% de descuento en todas las camisas', FALSE, FALSE, 1, 'fr', 1);

-- Fields
-- -- Spanish Banner (locale = "fr")
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (53, CURRENT_TIMESTAMP, 'imageUrl', 1, 152, '/img/banners/shirts-speciale.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (54, CURRENT_TIMESTAMP, 'targetUrl', 1, 152, '/merchandise');

-- Field XREF
-- -- Spanish Banner (locale = "fr")
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (152, 53, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (152, 54, 'targetUrl');


---------------------------------------------------
-- HOME PAGE SNIPIT
---------------------------------------------------
-- -- Create a Home Page Snippet for loclale="es"
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (153, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Snippet (es) - Aficionado', FALSE, FALSE, 5, 'es', 2);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (55, CURRENT_TIMESTAMP, 'htmlContent', 1, 153, '<h2>AFICIONADO DE SALSAS PICANTES?</h2> Haga click para unirse a nuerto programa de Cuidades Intensivos de Heat Clinic. El lugar para conseguir las mejores ofertas.');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (153, 55, 'htmlContent');


-- -- Create a Home Page Snippet for loclale="fr"
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (154, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Snippet (es) - Aficionado', FALSE, FALSE, 5, 'fr', 2);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (56, CURRENT_TIMESTAMP, 'htmlContent', 1, 154, '<h2>AFICIONADO SAUCE PIQUANTE?</h2> Cliquez ici pour vous joindre &agrave; notre clinique de chaleur du Programme de soins fr&eacute;quents. L&#39;endroit pour obtenir toutes les offres sur le traitement des br&ucirc;lures.');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (154, 56, 'htmlContent');

---------------------------------------------------
-- HOME PAGE FEATURED PRODUCTS MESSAGE
---------------------------------------------------
-- -- Create a Home Page Snippet for loclale="es"
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (155, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Featured Products Title', FALSE, FALSE, 5, 'es', 3);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (57, CURRENT_TIMESTAMP, 'messageText', 1, 155, 'Las Salsas M&aacute;s vendidas de Heat Clinic');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (155, 57, 'messageText');


-- -- Create a Home Page Snippet for loclale="fr"
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (156, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Featured Products Title', FALSE, FALSE, 5, 'fr', 3);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (58, CURRENT_TIMESTAMP, 'messageText', 1, 156, 'La Clinique Heat Sauces Meilleures Ventes');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (156, 58, 'messageText');



---------------------------------------------------
-- RIGHT HAND SIDE - AD
---------------------------------------------------
-- Content Item

-- Fields

-- Field XREF
