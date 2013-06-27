--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading international data the pricelist data in multiple currencies.  Implementers can exclude this file
-- to load their own international data.
--

--
-- Load currencies:  Your site will need currencies defined in order to use price lists.
-- i18n standard abbreviations should be used.
--
INSERT INTO BLC_CURRENCY(CURRENCY_CODE, FRIENDLY_NAME, DEFAULT_FLAG) VALUES('GBP', 'GB Pound', FALSE);
INSERT INTO BLC_CURRENCY(CURRENCY_CODE, FRIENDLY_NAME, DEFAULT_FLAG) VALUES('MXN', 'Mexican Peso', FALSE);
INSERT INTO BLC_CURRENCY(CURRENCY_CODE, FRIENDLY_NAME, DEFAULT_FLAG) VALUES('EUR', 'EURO Dollar', FALSE);



--
-- Load Locales:  Your site must have at least one Locale with DEFAULT_FLAG set to TRUE
-- You can have as many locales as you like. Currency can be set  to null if none have
-- been defined. i18n standard abbreviations should be used.
--
INSERT INTO BLC_LOCALE (LOCALE_CODE, DEFAULT_FLAG, FRIENDLY_NAME, CURRENCY_CODE) VALUES ('es', FALSE, 'Spanish', 'EUR');
INSERT INTO BLC_LOCALE (LOCALE_CODE, DEFAULT_FLAG, FRIENDLY_NAME, CURRENCY_CODE) VALUES ('fr', FALSE, 'French', 'EUR');
INSERT INTO BLC_LOCALE (LOCALE_CODE, DEFAULT_FLAG, FRIENDLY_NAME, CURRENCY_CODE) VALUES ('en_GB', FALSE,'English (United Kingdom)', 'GBP');
INSERT INTO BLC_LOCALE (LOCALE_CODE, DEFAULT_FLAG, FRIENDLY_NAME, CURRENCY_CODE) VALUES ('es_MX', FALSE, 'Spanish (Mexico)', 'MXN');
INSERT INTO BLC_LOCALE (LOCALE_CODE, DEFAULT_FLAG, FRIENDLY_NAME, CURRENCY_CODE) VALUES ('es_ES', FALSE, 'Spanish (Spain)', 'EUR');
INSERT INTO BLC_LOCALE (LOCALE_CODE, DEFAULT_FLAG, FRIENDLY_NAME, CURRENCY_CODE) VALUES ('fr_FR', FALSE,'French (France)', 'EUR');


--
-- The following items create page templates.   The key is to map a JSP template (TMPLT_PATH) to
-- a LOCALE_CODE.   In the example below, there is only one JSP template "basic".   The full
-- path to the template is .../WEB_INF/jsp/templates/basic.jsp.
--
INSERT INTO BLC_PAGE_TMPLT (PAGE_TMPLT_ID, LOCALE_CODE, TMPLT_NAME, TMPLT_DESCR, TMPLT_PATH) VALUES (2, 'es', 'Basic Spanish Template', 'This template provides a basic layout with header and footer surrounding the content and title.', '/content/default') ;

--
-- Map both the spanish template to this field group.
--
INSERT INTO BLC_PGTMPLT_FLDGRP_XREF(PAGE_TMPLT_ID, FLD_GROUP_ID, GROUP_ORDER) VALUES (2,1,0);


