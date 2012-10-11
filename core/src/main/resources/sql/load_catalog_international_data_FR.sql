--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype with data translated to French.
-- Implementers can change this file to load their initial catalog.
--

-----------------------------------------------------------------------------------------------------------------------------------
-- CATEGORY DATA TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store navigation in French
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME) VALUES (2001,'Page d''accueil','Page d''accueil');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME) VALUES (2002,'Sauces chaudes','Sauces chaudes');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME) VALUES (2003,'Marchandises','Marchandises');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME) VALUES (2004,'D&eacute;gagement','D&eacute;gagement');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME) VALUES (2005,'Nouveau Hot Sauce?','Nouveau Hot Sauce?');
INSERT INTO BLC_CATEGORY_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME) VALUES (2006,'FAQ','FAQ');

-- Custom store SKU cross reference with translations
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2001, 2001, 'fr');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2002, 2002, 'fr');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2003, 2003, 'fr');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2004, 2004, 'fr');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2005, 2005, 'fr');
INSERT INTO BLC_CATEGORY_TRANSLATION_XREF (CATEGORY_ID, TRANSLATION_ID, MAP_KEY) VALUES (2006, 2006, 'fr');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product options in French
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION (TRANSLATION_ID,LABEL) VALUES (2001,'Shirt Couleur');
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION (TRANSLATION_ID,LABEL) VALUES (2002,'Shirt Taille');

-- Custom store product options cross reference with translations
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION_XREF (PRODUCT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 2001, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_TRANSLATION_XREF (PRODUCT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2002, 'fr');

-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT OPTION VALUES TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product option values in French
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2001,'Noir');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2002,'Rouge');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2003,'Argent');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2011,'P');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2012,'M');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2013,'G');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION (TRANSLATION_ID,ATTRIBUTE_VALUE) VALUES (2014,'XG');

-- Custom store product option values cross reference with translations
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 2001, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2002, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 2003, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (11, 2011, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (12, 2012, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (13, 2013, 'fr');
INSERT INTO BLC_PRODUCT_OPTION_VALUE_TRANSLATION_XREF (PRODUCT_OPTION_VALUE_ID, TRANSLATION_ID, MAP_KEY) VALUES (14, 2014, 'fr');


-----------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT SKU TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store SKUs in French
-- -- Hot Sauces translations
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2001,'Sudden Death Sauce','Sauce mort subite ','Comme mes Chilipals sais, je suis pas du genre &agrave; &ecirc;tre satisfaite. Par cons&eacute;quent, la cr&eacute;ation de la mort subite. Lorsque vous avez besoin d''aller au-del&agrave; ... Mort subite livrera!');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2002,'Sweet Death Sauce','Sauce Sweet Death','Le parfait topper pour le poulet, le poisson, des hamburgers ou une pizza. Un grand m&eacute;lange de Habanero, mangue, fruits de la passion et de plus faire cette sauce Mort d''un festin incroyable tropicale');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2003,'Hoppin'' Hot Sauce','Hot Sauce Hoppin','Tangy, venu de Cayenne poivron flux avec l''ail, l''oignon p&acirc;te de tomate, et un soupçon de sucre de canne pour en faire une sauce onctueuse avec une morsure. Magnifique sur les œufs, la volaille, le porc ou le poisson, cette sauce marie pour faire des marinades et des soupes riches.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2004,'Day of the Dead Chipotle Hot Sauce','Jour de la sauce chaude Morte Chipotle','Lorsque tout le poivre est s&eacute;ch&eacute; et fum&eacute;, il est consid&eacute;r&eacute; comme un Chipotle. Normalement, avec un aspect froiss&eacute;, drak brun, le chipotle fum&eacute; offre une saveur douce qui est g&eacute;n&eacute;ralement utilis&eacute; pour ajouter un smokey, saveur rôtie aux salsas, les ragoûts et marinades.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2005,'Day of the Dead Habanero Hot Sauce','Jour de la sauce Habanero Hot Morte','Si vous voulez chaud, c''est le piment de choisir. Originaire de la Caraïbe, du Yucatan et du Nord Côte de l''Am&eacute;rique du Sud, le Habanero se pr&eacute;sente dans une vari&eacute;t&eacute; de couleurs allant du vert p&acirc;le au rouge vif. La chaleur gras Habanero, la saveur et l''arôme unique, en a fait le favori des amateurs de chili.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2006,'Day of the Dead Scotch Bonnet Hot Sauce','Jour de la sauce Scotch Bonnet Hot Morte','Souvent confondu avec le Habanero, le Scotch Bonnet a une pointe profond&eacute;ment invers&eacute;e par rapport &agrave; l''extr&eacute;mit&eacute; pointue de l''Habanero. Allant dans de nombreuses couleurs allant du vert au jaune-orange, le Scotch Bonnet est un aliment de base dans les Antilles et sauces au poivre de style Barbade.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2007,'Green Ghost','Green Ghost','Fabriqu&eacute; avec Naga Bhut Jolokia, plus chaud poivre dans le monde.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2008,'Blazin'' Saddle XXX Hot Habanero Pepper Sauce','Blazin ''Selle XXX Hot Habanero sauce au poivre','Vous misez vos bottes, cette sauce chaude valu son nom de gens qui appr&eacute;cient une sauce chaude exceptionnel. Ce que vous trouverez ici est une saveur piquante vraiment original, pas un piquant irr&eacute;sistible que l''on retrouve dans les sauces au poivre Tabasco ordinaires - m&ecirc;me si le piment utilis&eacute; dans ce produit a &eacute;t&eacute; test&eacute; &agrave; 285.000 unit&eacute;s Scoville. Alors, en selle pour une balade inoubliable. Pour vous assurer que nous vous avons apport&eacute; la plus belle sauce au poivre de Habanero, nous sommes all&eacute;s aux contreforts des montagnes mayas au Belize, en Am&eacute;rique centrale. Ce produit est pr&eacute;par&eacute; enti&egrave;rement &agrave; la main en utilisant uniquement des l&eacute;gumes frais et de tous les ingr&eacute;dients naturels.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2009,'Armageddon The Hot Sauce To End All','Armageddon Le Hot Sauce To End All','Tout l''enfer se d&eacute;chaîne, le feu et le soufre pleuvoir? se pr&eacute;parer &agrave; rencontrer votre machine?');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2010,'Dr. Chilemeister''s Insane Hot Sauce','Dr Chilemeister Sauce Hot Insane','Voici la prescription pour ceux qui aiment la chaleur intol&eacute;rable. Dr Chilemeister potion de malades et mal mortel doit &ecirc;tre utilis&eacute; avec prudence. La douleur peut devenir une d&eacute;pendance!');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2011,'Bull Snort Cowboy Cayenne Pepper Hot Sauce','Bull Snort Cowboy poivre de Cayenne Hot Sauce','Been there, encord&eacute;s cela. Hotter than jument buckin ''en chaleur! Saupoudrez de plats de viande, de fruits de mer et l&eacute;gumes. Utilisation comme additif dans une sauce barbecue ou tout aliment qui a besoin d''une saveur &eacute;pic&eacute;e. Commencez avec quelques gouttes et travailler jusqu''&agrave; la saveur d&eacute;sir&eacute;e.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2012,'Cafe Louisiane Sweet Cajun Blackening Sauce','Caf&eacute; Cajun Louisiane Douce Sauce Blackening','L''une des sauces les plus insolites que nous vendons. L''original &eacute;tait un vieux style sauce cajun et c''est ça le noircissement &agrave; jour de version. C''est gentil, mais vous obtenez un grand succ&egrave;s de cannelle et de clou de girofle avec un coup de chaleur agr&eacute;able de Cayenne. Utilisez-le sur tous les aliments &agrave; donner cette ambiance cajun.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2013,'Bull Snort Smokin'' Toncils Hot Sauce','Bull Snort Smokin ''Hot Sauce Toncils','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Tout est plus grand au Texas, m&ecirc;me la brûlure de Hot Sauce une Snortin Bull! douche sur le Texas Steak taille qu''ils appellent le 96er Ole ou vos l&eacute;gumes Jane avion. Si vous &ecirc;tes un fan sur faire de la sauce barbecue &agrave; partir de z&eacute;ro comme je suis, vous pouvez utiliser la sauce Bull amygdales Snort Smokin ''Hot tant qu''additif. Red hot habaneros et piments donner &agrave; cette tingler amygdales sa saveur c&eacute;l&egrave;bre et rouge de chaleur chaud. Bull Snort Smokin ''Hot amygdales Sauce''ll avoir vos entrailles buckin »avec une goutte d''eau.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2014,'Cool Cayenne Pepper Hot Sauce','Frais Poivre de Cayenne Hot Sauce','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2015,'Roasted Garlic Hot Sauce','Sauce &agrave; l''ail rôti chaud','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2016,'Insanity Sauce','Sauce Scotch Bonnet chaud','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2017,'Insanity Sauce','Sauce Scotch Bonnet chaud','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2018,'Hurtin'' Jalepeno Hot Sauce','Sauces chaudes Jalapeno','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2019,'Roasted Red Pepper & Chipotle Hot Sauce','Sauce chaudes Chipotle','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d''am&eacute;liorer la saveur de la plupart de n''importe quel repas.');
-- -- Merchandise translations
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2100,'Hawt Like a Habanero Shirt (Men''s)','Hawt comme une chemise Habanero (Hommes)','Collecte Hommes Habanero standards chemise &agrave; manches courtes t s&eacute;rigraphi&eacute;es en 30 coton doux singles en coupe regular.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2200,'Hawt Like a Habanero Shirt (Women''s)','Hawt comme une chemise Habanero (Femmes)','Collecte de femmes Habanero standards chemise &agrave; manches courtes shirt s&eacute;rigraphi&eacute; &agrave; 30 coton doux singles en coupe regular.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2300,'Heat Clinic Hand-Drawn (Men''s)','Clinique de chaleur tir&eacute; par la main (Hommes)','Ce t-shirt logo dessin&eacute; &agrave; la main pour les hommes dispose d''une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2400,'Heat Clinic Hand-Drawn (Women''s)','Clinique de chaleur tir&eacute; par la main (Femmes)','Ce t-shirt logo dessin&eacute; &agrave; la main pour les hommes dispose d''une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2500,'Heat Clinic Mascot (Men''s)','Mascot Clinique chaleur (Hommes)','Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd''hui!');
INSERT INTO BLC_SKU_TRANSLATION (TRANSLATION_ID,DESCRIPTION,NAME,LONG_DESCRIPTION) VALUES (2600,'Heat Clinic Mascot (Women''s)','Mascot Clinique chaleur (Femmes)','Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd''hui!');


-- Custom store SKU cross reference with translations
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 2001, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2002, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 2003, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (4, 2004, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (5, 2005, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (6, 2006, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (7, 2007, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (8, 2008, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (9, 2009, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (10, 2010, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (11, 2011, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (12, 2012, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (13, 2013, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (14, 2014, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (15, 2015, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (16, 2016, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (17, 2017, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (18, 2018, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (19, 2019, 'fr');
-- -- Merchandise cross reference
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (100, 2100, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (200, 2200, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (300, 2300, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (400, 2400, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (500, 2500, 'fr');
INSERT INTO BLC_SKU_TRANSLATION_XREF (SKU_ID, TRANSLATION_ID, MAP_KEY) VALUES (600, 2600, 'fr');

-----------------------------------------------------------------------------------------------------------------------------------
-- FULFILLMENT OPTIONS TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Custom store product options in French
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION (TRANSLATION_ID,NAME,LONG_DESCRIPTION) VALUES (2001,'First Class', '2 - 7 Journ&eacute;es');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION (TRANSLATION_ID,NAME,LONG_DESCRIPTION) VALUES (2002,'Priorit&eacute;', '2 - 5 Journ&eacute;es');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION (TRANSLATION_ID,NAME,LONG_DESCRIPTION) VALUES (2003,'Express', '1 - 2 Journ&eacute;es');

-- Custom store product options cross reference with translations
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION_XREF (FULFILLMENT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 2001, 'fr');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION_XREF (FULFILLMENT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2002, 'fr');
INSERT INTO BLC_FULFILLMENT_OPTION_TRANSLATION_XREF (FULFILLMENT_OPTION_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 2003, 'fr');

-----------------------------------------------------------------------------------------------------------------------------------
-- SEARCH FACET TRANSLATION
-----------------------------------------------------------------------------------------------------------------------------------
-- Search facet in French
INSERT INTO BLC_SEARCH_FACET_TRANSLATION (TRANSLATION_ID,LABEL) VALUES (2001,'Fabricant');
INSERT INTO BLC_SEARCH_FACET_TRANSLATION (TRANSLATION_ID,LABEL) VALUES (2002,'Degr&eacute; de chaleur');
INSERT INTO BLC_SEARCH_FACET_TRANSLATION (TRANSLATION_ID,LABEL) VALUES (2003,'Prix');

-- Search facet cross reference with translations
INSERT INTO BLC_SEARCH_FACET_TRANSLATION_XREF (SEARCH_FACET_ID, TRANSLATION_ID, MAP_KEY) VALUES (1, 2001, 'fr');
INSERT INTO BLC_SEARCH_FACET_TRANSLATION_XREF (SEARCH_FACET_ID, TRANSLATION_ID, MAP_KEY) VALUES (2, 2002, 'fr');
INSERT INTO BLC_SEARCH_FACET_TRANSLATION_XREF (SEARCH_FACET_ID, TRANSLATION_ID, MAP_KEY) VALUES (3, 2003, 'fr');