CREATE TABLE `countries` (
`name` VARCHAR( 120 ) NOT NULL ,
`code` CHAR( 2 ) NOT NULL ,
`royalMailZone` ENUM( 'UK', 'EU', 'WZ1', 'WZ2' ) NOT NULL ,
`parcelForceZone` INT( 2 ) NOT NULL ,
`qualifiesForRoyalMailAirsure` CHAR( 1 ) NOT NULL ,
`qualifiesForRoyalMailInternationalSignedFor` CHAR( 1 ) NOT NULL ,
`memberOfEU` CHAR( 1 ) NOT NULL ,
INDEX ( `code` )
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;