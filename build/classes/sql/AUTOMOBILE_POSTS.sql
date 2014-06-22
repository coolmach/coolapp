DROP VIEW AUTOMOBILE_POSTS;
CREATE VIEW AUTOMOBILE_POSTS AS SELECT PDAU.POST_ID,PDAU.SUB_CATEGORY,PDAU.CITY,PDAU.LOCATION,PDAU.MAKE,PDAU.MODEL,PDAU.COLOR,PDAU.YEAR,PDAU.NO_OF_OWNERS,PDAU.FUEL_TYPE,PDAU.KMS_DONE,PDAU.MILEAGE,PDAU.PRICE,PDAU.PRICE_NEGOTIABLE,PDAU.INSURANCE_AVAILABLE,PDAU.REG_NO,PDAU.REG_CITY,PDAU.REG_STATE,PDAU.CREATED_ON,PDAU.CREATED_BY,PDAU.MODIFIED_ON,PDAU.MODIFIED_BY, POIT.TITLE,POIT.CONTACT_NO,POIT.CONTACT_PERSON_NAME,POIT.DESCRIPTION,POIT.IMAGE_FILE_NAME,POIT.CORP_ID FROM PDAU,POIT where POIT.POST_ID = PDAU.POST_ID; 