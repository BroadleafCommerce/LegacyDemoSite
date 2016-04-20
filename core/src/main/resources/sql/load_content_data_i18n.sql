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

INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-1000, 1, 'es', 'Page', 'pageTemplate|title', 'Espa&ntilde;ol G&eacute;nerico');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-1001, 1, 'es', 'Page', 'pageTemplate|body', 'prueba de contenido');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-1002, 2, 'es', 'Page', 'pageTemplate|body', '<h2 style="text-align:center;">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2><h4 style="text-align:center;">Haga <a href="http://www.broadleafcommerce.com/features/content">click aqu&iacute;</a> para mas informaci&oacute;n.</h4>');
INSERT INTO BLC_TRANSLATION (TRANSLATION_ID, ENTITY_ID, LOCALE_CODE, ENTITY_TYPE, FIELD_NAME,  TRANSLATED_VALUE) VALUES (-1003, 3, 'es', 'Page', 'pageTemplate|body', '<h2 style="text-align:center;">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2>');
