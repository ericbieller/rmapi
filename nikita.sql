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

CREATE TABLE `country_zones` (
`countryId` INT( 11 ) NOT NULL ,
`name` VARCHAR( 120 ) NOT NULL ,
`code` CHAR( 2 ) NOT NULL ,
INDEX ( `countryId` )
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `shipping_services` (
`name` VARCHAR( 120 ) NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `shipping_rates` (
`serviceId` INT( 11 ) NOT NULL ,
`packaging` VARCHAR( 12 ) NOT NULL ,
`weight` INT( 5 ) NOT NULL ,
`royalMailZone` ENUM( 'UK', 'EU', 'WZ1', 'WZ2' ) NOT NULL ,
`parcelForceZone` INT( 2 ) NOT NULL ,
`price` FLOAT( 10, 2 ) NOT NULL ,
`memberOfEU` CHAR( 1 ) NOT NULL ,
INDEX ( `serviceId` )
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;