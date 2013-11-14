--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the BLC out-of-box Admin users.   You need at least one
-- admin setup in the system in order to use the BLC admin.   You can use this file initially and
-- then setup your own admin users, but you should always disable these default accounts in a real,
-- production system.
--

--
-- Sample admin users
--
INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-1,'admin@yourdomain.com','admin','Administrator','admin{-1}', true);
INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-2,'merchandise@yourdomain.com','merchandise','Merchandise Manager','admin{-2}', true);
INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-3,'promo@yourdomain.com','promo','Promotion Manager','admin{-3}', true);
INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-4,'csr@yourdomain.com','csr','CSR','admin{-4}', true);
INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-5,'cms_edit@yourdomain.com','cmsEditor','CMS Editor','admin{-5}', true);
INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-6,'cms_approver@yourdomain.com','cmsApprover','CMS Approver','admin{-6}', true);

-- Sample data for use with the org.springframework.security.authentication.encoding.ShaPasswordEncoder which is
-- configured OOB in the 'production' environment. This is the password 'admin' salted with the user's primary key
-- INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-1,'admin@yourdomain.com','admin','Administrator','c25519e7c79bee0b21cb6f3636c4b08e1161a1f9', true);
-- INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-2,'merchandise@yourdomain.com','merchandise','Merchandise Manager','524cd27c55b237be4abab4bad9c30077e73e8095', true);
-- INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-3,'promo@yourdomain.com','promo','Promotion Manager','c2e4e7387afbcada3f650e896f43bcd71846c09e', true);
-- INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-4,'csr@yourdomain.com','csr','CSR','94870e2edbc43e860acb4f6455743c737492d62e', true);
-- INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-5,'cms_edit@yourdomain.com','cmsEditor','CMS Editor','9d8155b591446b5f6e7d7bebae1401765f8988ae', true);
-- INSERT INTO BLC_ADMIN_USER (ADMIN_USER_ID, EMAIL, LOGIN, NAME, PASSWORD, ACTIVE_STATUS_FLAG) VALUES (-6,'cms_approver@yourdomain.com','cmsApprover','CMS Approver','efca1f2d13a506925e0e5721789ee3b9ed619204', true);


--
-- Roles for sample admin users.
--
INSERT INTO BLC_ADMIN_USER_ROLE_XREF (ADMIN_ROLE_ID, ADMIN_USER_ID) VALUES (-1,-1);
INSERT INTO BLC_ADMIN_USER_ROLE_XREF (ADMIN_ROLE_ID, ADMIN_USER_ID) VALUES (-2,-2);
INSERT INTO BLC_ADMIN_USER_ROLE_XREF (ADMIN_ROLE_ID, ADMIN_USER_ID) VALUES (-3,-3);
INSERT INTO BLC_ADMIN_USER_ROLE_XREF (ADMIN_ROLE_ID, ADMIN_USER_ID) VALUES (-4,-4);
INSERT INTO BLC_ADMIN_USER_ROLE_XREF (ADMIN_ROLE_ID, ADMIN_USER_ID) VALUES (-5,-5);
INSERT INTO BLC_ADMIN_USER_ROLE_XREF (ADMIN_ROLE_ID, ADMIN_USER_ID) VALUES (-6,-6);
