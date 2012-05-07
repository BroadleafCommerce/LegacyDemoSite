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

-- ----Structured Content Data for Demo Ads BEGIN
-- Structured Content
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (100, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Havalatta Banner Ad', FALSE, FALSE, 5, 'en', 1);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (101, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '40% off Mugs', FALSE, FALSE, 5, 'en', 2);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (102, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'French Roast 20% off', FALSE, FALSE, 6, 'en', 2);

-- Structured Content Field
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (1, CURRENT_TIMESTAMP, 'imageUrl', 1, 100, '/img/promos/mainPromo_554x291.gif');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (2, CURRENT_TIMESTAMP, 'targetUrl', 1, 100, '/store/category?productId=1')
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (3, CURRENT_TIMESTAMP, 'imageUrl', 1, 101, '/img/promos/sidePromo_264x122.gif');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (4, CURRENT_TIMESTAMP, 'targetUrl', 1, 101, '/store/category')
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (5, CURRENT_TIMESTAMP, 'imageUrl', 1, 102, '/img/promos/sidePromo_264x122.gif');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (6, CURRENT_TIMESTAMP, 'targetUrl', 1, 102, '/store/category2');

-- Structured Content Field Map
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (100, 1, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (100, 2, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (101, 3, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (101, 4, 'targetUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (102, 5, 'imageUrl');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (102, 6, 'targetUrl');
-- ----Structured Content Data for Demo Ads COMPLETE

-- Structured Content for Messages Begin
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (120, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Message', FALSE, FALSE, 5, 'en', 3);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (122, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Message', FALSE, FALSE, 5, 'en', 3);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (124, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Message', FALSE, FALSE, 5, 'en', 3);
INSERT INTO BLC_SC (SC_ID, ARCHIVED_FLAG, CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CONTENT_NAME, DELETED_FLAG, OFFLINE_FLAG, PRIORITY, LOCALE_CODE, SC_TYPE_ID) VALUES (126, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Home Page Message', FALSE, FALSE, 5, 'en', 3);

-- Structured Content Field
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (121, CURRENT_TIMESTAMP, 'messageText', 1, 120, 'EVERYDAY MESSAGE');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (120, 121, 'messageText');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (123, CURRENT_TIMESTAMP, 'messageText', 1, 122, 'MONDAY MESSAGE');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (122, 123, 'messageText');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (125, CURRENT_TIMESTAMP, 'messageText', 1, 124, 'TUESDAY MESSAGE');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (124, 125, 'messageText');
INSERT INTO BLC_SC_FLD (SC_FLD_ID, DATE_CREATED, FLD_KEY, CREATED_BY, SC_ID, VALUE) VALUES (127, CURRENT_TIMESTAMP, 'messageText', 1, 126, 'WELCOME BACK!');
INSERT INTO BLC_SC_FLD_MAP (SC_ID, SC_FLD_ID, MAP_KEY) VALUES (126, 127, 'messageText');
-- Structured Content for Messages End

-- Structured Content Rule Field
INSERT INTO BLC_SC_RULE (SC_RULE_ID, MATCH_RULE) VALUES (1, 'time.dayOfWeek.toString()=="2"');
INSERT INTO BLC_SC_RULE (SC_RULE_ID, MATCH_RULE) VALUES (2, 'time.dayOfWeek.toString()=="3"');
INSERT INTO BLC_SC_RULE (SC_RULE_ID, MATCH_RULE) VALUES (3, 'customer.registered==true');
-- Structured Content Rule Field Map
INSERT INTO BLC_SC_RULE_MAP(BLC_SC_SC_ID, SC_RULE_ID, MAP_KEY) VALUES (122, 1, 'TIME');
INSERT INTO BLC_SC_RULE_MAP(BLC_SC_SC_ID, SC_RULE_ID, MAP_KEY) VALUES (124, 2, 'TIME');
INSERT INTO BLC_SC_RULE_MAP(BLC_SC_SC_ID, SC_RULE_ID, MAP_KEY) VALUES (126, 3, 'CUSTOMER');