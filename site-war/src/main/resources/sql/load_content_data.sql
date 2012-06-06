--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence-mycompany.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file loads some sample content pages and structured content data.
--

-----------------------------------------------------------------------------------------------------------------------------------
-- SAMPLE PAGE DATA - would typically be entered via the admin
-----------------------------------------------------------------------------------------------------------------------------------

-- This creates an empty FAQ Page (you can go to localhost/{contextPath}/faq to see this page.
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL, DELETED_FLAG, ARCHIVED_FLAG) VALUES (2, 'FAQ', 1, '/faq', FALSE, FALSE);

-- Create an about-us page with "test-content" as the body of the page.
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL, DELETED_FLAG, ARCHIVED_FLAG) VALUES (1, 'About Us', 1, '/about_us', FALSE, FALSE);

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, PAGE_ID, VALUE) VALUES (1, 'body', 1, 'test content');
INSERT INTO BLC_PAGE_FLD_MAP(MAP_KEY, PAGE_FLD_ID, PAGE_ID) VALUES ('body', 1, 1);

-- Create an about-us page with "prueba de contenido" as the body of the page.
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL, ARCHIVED_FLAG, DELETED_FLAG) VALUES (10, 'Prueba de Contenido', 2, '/about_us', FALSE, FALSE);

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, PAGE_ID, VALUE) VALUES (10, 'body', 10, 'prueba de contenido');
INSERT INTO BLC_PAGE_FLD_MAP(MAP_KEY, PAGE_FLD_ID, PAGE_ID) VALUES ('body', 10, 10);

-----------------------------------------------------------------------------------------------------------------------------------
-- SAMPLE STRUCTURED CONTENT DATA  - would typically be entered via the admin
-----------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------
-- HOME PAGE BANNER
---------------------------------------------------
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (100, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Buy One Get One - Twice the Burn', FALSE, FALSE, 5, 'en', 1);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (1, CURRENT_TIMESTAMP, 'imageUrl', 1, 100, '/img/banners/buy-one-get-one-home-banner.jpg');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (2, CURRENT_TIMESTAMP, 'targetUrl', 1, 100, '/hot_sauces');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (100, 1, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (100, 2, 'targetUrl');


---------------------------------------------------
-- HOME PAGE SNIPIT
---------------------------------------------------
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (110, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Snippet - Aficionado', FALSE, FALSE, 5, 'en', 2);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (3, CURRENT_TIMESTAMP, 'htmlContent', 1, 110, '<h2>HOT SAUCE AFICIONADO?</h2> Click here to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (110, 3, 'htmlContent');

---------------------------------------------------
-- HOME PAGE FEATURED PRODUCTS MESSAGE
---------------------------------------------------
-- Content Item
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (130, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Featured Products Title', FALSE, FALSE, 5, 'en', 3);

-- Fields
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (4, CURRENT_TIMESTAMP, 'messageText', 1, 130, 'The Heat Clinic''s Top Selling Sauces');

-- Field XREF
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (130, 4, 'messageText');

