--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype.   Implementors can change this file
-- to load their initial catalog.
--

-- BLC Admin Required Categories
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (1,'Root','Root',NULL,NULL,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2, 'Primary Nav','Primary Nav',NULL,1,CURRENT_TIMESTAMP);

-- Custom store navigation (default template uses these for the header navigation)
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2001,'Home','Home','/',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2002,'Hot Sauces','Hot Sauces','/hot-sauces',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2003,'Merchandise','Merchandise','/merchandise',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2004,'Clearance','Clearance','/clearance',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2005,'New to Hot Sauce?','New to Hot Sauce?','/new-to-hot-sauce',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2006,'FAQs','FAQs','/faq',2,CURRENT_TIMESTAMP);

-- Builds the category hierarchy (simple in this case) - Root --> Nav --> All other categories
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2,1,1)
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2001,2,1);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2002,2,2);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2003,2,3);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2004,2,4);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2005,2,5);
INSERT INTO BLC_CATEGORY_XREF (SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2006,2,6);

------------------------------------------------------------------------------------------------------------------
-- Inserting products manually involves five steps which are outlined below.   Typically, products are loaded 
-- up front in the project and then managed via the Broadleaf Commerce admin.   
--
-- Loading through this script is a convenient way to get started when prototyping and can be useful in development
-- as a way to share data-setup without requiring a shared DB connection. 
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 1:  Create "default" SKUs
-- =============================================
-- The Broadleaf Commerce product model is setup such that every product has a default SKU.   For many products,
-- a product only has one SKU.    SKUs hold the pricing information for the product and are the actual entity
-- that is added to the cart.    Inventory, Pricing, and Fulfillment concerns are done at the SKU level
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (1,'Sudden Death Sauce','As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ',10.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (2,'Sweet Death Sauce','The perfect topper for chicken, fish, burgers or pizza. A great blend of Habanero, Mango, Passion Fruit and more make this Death Sauce an amazing tropical treat.',10.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (3,'Hoppin'' Hot Sauce','Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (4,'Day of the Dead Chipotle Hot Sauce','When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (5,'Day of the Dead Habanero Hot Sauce','If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero''s bold heat, unique flavor and aroma has made it the favorite of chile lovers.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (6,'Day of the Dead Scotch Bonnet Hot Sauce','Often mistaken for the Habanero, the Scotch Bonnet has a deeply inverted tip as opposed to the pointed end of the Habanero. Ranging in many colors from green to yellow-orange, the Scotch Bonnet is a staple in West Indies and Barbados style pepper sauces.',6.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (7,'Green Ghost','Made with Naga Bhut Jolokia, the World''s Hottest pepper.',11.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (8,'Blazin'' Saddle XXX Hot Habanero Pepper Sauce','You bet your boots, this hot sauce earned its name from folks that appreciate an outstanding hot sauce. What you''ll find here is a truly original zesty flavor, not an overpowering pungency that is found in those ordinary Tabasco pepper sauces - even though the pepper used in this product was tested at 285,000 Scoville units. So, saddle up for a ride to remember. To make sure we brought you only the finest Habañero pepper sauce, we went to the foothills of the Mayan mountains in Belize, Central America. This product is prepared entirely by hand using only fresh vegetables and all natural ingredients.',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (9,'Armageddon The Hot Sauce To End All','All Hell is breaking loose, fire & brimstone rain down? prepare to meet your maker.',12.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (10,'Dr. Chilemeister''s Insane Hot Sauce','Here is the Prescription for those who enjoy intolerable heat. Dr. Chilemeister''s sick and evil deadly brew should be used with caution. Pain can become addictive!',12.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (11,'Bull Snort Cowboy Cayenne Pepper Hot Sauce','Been there, roped that. Hotter than a buckin'' mare in heat! Sprinkle on meat entrees, seafood and vegetables. Use as additive in barbecue sauce or any food that needs a spicy flavor. Start with a few drops and work up to the desired flavor.',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (12,'Cafe Louisiane Sweet Cajun Blackening Sauce','One of the more unusual sauces we sell. The original was an old style Cajun sauce and this is it''s updated \blackening\" version. It''s sweet but you get a great hit of cinnamon and cloves with a nice kick of cayenne heat. Use on all foods to give that Cajun flair!"',4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (13,'Bull Snort Smokin'' Toncils Hot Sauce','Everything is bigger in Texas, even the burn of a Bull Snortin'' Hot Sauce! shower on that Texas sized steak they call the Ole 96er or your plane Jane vegetables. If you are a fan on making BBQ sauce from scratch like I am, you can use Bull Snort Smokin'' Tonsils Hot Sauce as an additive. Red hot habaneros and cayenne peppers give this tonsil tingler it''s famous flavor and red hot heat. Bull Snort Smokin'' Tonsils Hot Sauce''ll have your bowels buckin'' with just a drop!',3.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (14,'Cool Cayenne Pepper Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (15,'Roasted Garlic Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (16,'Scotch Bonnet Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);
------------------------------------------------------------------------------------------------------------------
-- Give some of the SKUs a sale price
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (17,'Insanity Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.99,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (18,'Hutin'' Jalepeno Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.49,'Y','Y',CURRENT_TIMESTAMP);
INSERT INTO BLC_SKU (SKU_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (19,'Roasted Red Pepper & Chipotle Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.09,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 2:  Create the products
-- =============================================
-- In this step, we are also populating the manufacturer for the product as well as linking to the defaultSku
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (1,1,2002,'/hot-sauces/sudden_death_sauce','Blair''s',TRUE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (2,2,2002,'/hot-sauces/sweet_death_sauce','Blair''s',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (3,3,2002,'/hot-sauces/hoppin_hot_sauce','Salsa Express',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (4,4,2002,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce','Spice Exchange',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (5,5,2002,'/hot-sauces/day_of_the_dead_habanero_hot_sauce','Spice Exchange',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (6,6,2002,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce','Spice Exchange',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (7,7,2002,'/hot-sauces/green_ghost','Garden Row',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (8,8,2002,'/hot-sauces/blazin_saddle_hot_ habanero_pepper_sauce','D. L. Jardine''s',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (9,9,2002,'/hot-sauces/armageddon_hot_sauce_to_end_all','Figueroa Brothers',TRUE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (10,10,2002,'/hot-sauces/dr_chilemeisters_insane_hot_sauce','Figueroa Brothers',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (11,11,2002,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce','Brazos Legends',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (12,12,2002,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce','Garden Row',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (13,13,2002,'/hot-sauces/bull_snort_smokin_toncils _hot_sauce','Brazos Legends',TRUE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (14,14,2002,'/hot-sauces/cool_cayenne_pepper_hot_sauce','Dave''s Gourmet',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (15,15,2002,'/hot-sauces/roasted_garlic_hot_sauce','Dave''s Gourmet',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (16,16,2002,'/hot-sauces/scotch_bonnet_hot_sauce','Dave''s Gourmet',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (17,17,2002,'/hot-sauces/insanity_sauce','Dave''s Gourmet',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (18,18,2002,'/hot-sauces/hutin_jalepeno_hot_sauce','Dave''s Gourmet',FALSE,CURRENT_TIMESTAMP);
INSERT INTO BLC_PRODUCT (PRODUCT_ID, DEFAULT_SKU_ID, DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT, ACTIVE_START_DATE) VALUES (19,19,2002,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce','Dave''s Gourmet',FALSE,CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 3:  Create Category/Product Mapping
-- ========================================================
-- Add all hot-sauce items to the hot-sauce category
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (1,2002,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2,2002,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3,2002,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (4,2002,4);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (5,2002,5);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (6,2002,6);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (7,2002,7);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (8,2002,8);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (9,2002,9);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (10,2002,10);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (11,2002,11);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (12,2002,12);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (13,2002,13);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (14,2002,14);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (15,2002,15);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (16,2002,16);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (17,2002,17);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (18,2002,18);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (19,2002,19);

-- home page items
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3,2001,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (6,2001,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (9,2001,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (12,2001,4);

-- clearance items
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (7,2004,1);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (8,2004,2);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (10,2004,3);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (11,2004,4);
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (18,2004,5);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 4:  Media Items used by products
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (101,'/img/sauces/Sudden-Death-Sauce-Bottle.jpg','Sudden Death Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (102,'/img/sauces/Sudden-Death-Sauce-Close.jpg','Sudden Death Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (201,'/img/sauces/Sweet-Death-Sauce-Bottle.jpg','Sweet Death Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (202,'/img/sauces/Sweet-Death-Sauce-Close.jpg','Sweet Death Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (301,'/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg','Hoppin Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (302,'/img/sauces/Hoppin-Hot-Sauce-Close.jpg','Hoppin Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (401,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg','Day of the Dead Chipotle Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (402,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg','Day of the Dead Chipotle Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (501,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg','Day of the Dead Habanero Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (502,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg','Day of the Dead Habanero Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (601,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg','Day of the Dead Scotch Bonnet Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (602,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg','Day of the Dead Scotch Bonnet Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (701,'/img/sauces/Green-Ghost-Bottle.jpg','Green Ghost Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (702,'/img/sauces/Green-Ghost-Close.jpg','Green Ghost Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (801,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (802,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (901,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg','Armageddon The Hot Sauce To End All Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (902,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg','Armageddon The Hot Sauce To End All Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1001,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg','Dr. Chilemeisters Insane Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1002,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg','Dr. Chilemeisters Insane Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1101,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1102,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1201,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1202,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1301,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg','Bull Snort Smokin Toncils Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1302,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg','Bull Snort Smokin Toncils Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1401,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg','Cool Cayenne Pepper Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1402,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg','Cool Cayenne Pepper Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1501,'/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg','Roasted Garlic Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1502,'/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg','Roasted Garlic Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1601,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg','Scotch Bonnet Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1602,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg','Scotch Bonnet Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1701,'/img/sauces/Insanity-Sauce-Bottle.jpg','Insanity Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1702,'/img/sauces/Insanity-Sauce-Close.jpg','Insanity Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1801,'/img/sauces/Hutin-Jalepeno-Hot-Sauce-Bottle.jpg','Hutin Jalepeno Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1802,'/img/sauces/Hutin-Jalepeno-Hot-Sauce-Close.jpg','Hutin Jalepeno Hot Sauce Close-up','alt1');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1901,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg','Roasted Red Pepper and Chipotle Hot Sauce Bottle','primary');
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, NAME, LABEL) VALUES (1902,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg','Roasted Red Pepper and Chipotle Hot Sauce Close-up','alt1');

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5:  Mapping for product to media
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (1,101,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (2,201,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (3,301,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (4,401,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (5,501,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (6,601,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (7,701,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (8,801,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (9,901,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (10,1001,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (11,1101,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (12,1201,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (13,1301,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (14,1401,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (15,1501,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (16,1601,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (17,1701,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (18,1801,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (19,1901,'primary');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (1,102,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (2,202,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (3,302,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (4,402,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (5,502,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (6,602,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (7,702,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (8,802,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (9,902,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (10,1002,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (11,1102,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (12,1202,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (13,1302,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (14,1402,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (15,1502,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (16,1602,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (17,1702,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (18,1802,'alt1');
INSERT INTO BLC_PRODUCT_MEDIA_MAP (BLC_PRODUCT_PRODUCT_ID, MEDIA_ID, MAP_KEY) VALUES (19,1902,'alt1');
