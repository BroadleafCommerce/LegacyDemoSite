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


-- Create an about-us page with "test-content" as the body of the page.
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL) VALUES (1, 'About Us', 1, '/about_us');
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL) VALUES (2, 'FAQ', 1, '/faq');
INSERT INTO BLC_PAGE (PAGE_ID, DESCRIPTION, PAGE_TMPLT_ID, FULL_URL) VALUES (3, 'New to Hot Sauce', 1, '/new-to-hot-sauce');

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, VALUE, PAGE_ID) VALUES (1, 'body', 'test content', 1);
INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, VALUE, PAGE_ID) VALUES (2, 'title', 'test title', 1);

INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, VALUE, PAGE_ID) VALUES (3, 'body', '<h2 style="text-align:center;">This is an example of a content-managed page.</h2><h4 style="text-align:center;"><a href="http://www.broadleafcommerce.com/features/content">Click Here</a> to see more about Content Management in Broadleaf.</h4>', 2);

-- This creates an empty new to hot sauce 
INSERT INTO BLC_PAGE_FLD(PAGE_FLD_ID, FLD_KEY, VALUE, PAGE_ID) VALUES (4, 'body', '<h2 style="text-align:center;">This is an example of a content-managed page.</h2>', 3);
