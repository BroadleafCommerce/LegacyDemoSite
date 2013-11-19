--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for initializing table sequences.   The numbers here need
-- to be greater than the ids that are inserted as part of load_catalog_data.sql (or other load files)
-- to prevent duplicate key exceptions.
--

--
-- Initialize SEQUENCE_GENERATOR values
--

-- Catalog
INSERT INTO SEQUENCE_GENERATOR VALUES ('CategoryImpl',10000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FieldImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('CategorySearchFacetImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('CategoryExcludedSearchFacetImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('SearchFacetImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('SearchFacetRangeImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('ProductImpl',10000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('CategoryProductImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('SkuImpl',10000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('ProductOptionImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('ProductOptionXrefImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('ProductOptionValueImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('ProductAttributeImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('MediaImpl',100000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('StaticAssetImpl',100000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('URLHandlerImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('SearchInterceptImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FeaturedProductImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('OfferItemCriteriaImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('OfferImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('OfferCodeImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FulfillmentOptionImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('CategoryXrefImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('CategoryProductXrefImpl',1000);

-- CMS
INSERT INTO SEQUENCE_GENERATOR VALUES ('PageImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('PageFieldImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('PageTemplateImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FieldDefinitionImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FieldEnumerationImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FieldEnumerationItemImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('StructuredContentImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('StructuredContentFieldImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('StructuredContentRuleImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('StructuredContentTypeImpl',1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('FieldGroupImpl', 1000);

-- Other
INSERT INTO SEQUENCE_GENERATOR VALUES ('RoleImpl', 1000);
INSERT INTO SEQUENCE_GENERATOR VALUES ('ChallengeQuestionImpl', 1000);