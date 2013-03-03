class AddFieldsToCountries < ActiveRecord::Migration
  def change
    execute <<-SQL 
      ALTER TABLE countries
      ADD name VARCHAR( 120 ) NOT NULL ,
      ADD code CHAR( 2 ) NOT NULL ,
      ADD parcelForceZone INTEGER NOT NULL ,
      ADD qualifiesForRoyalMailAirsure CHAR( 1 ) NOT NULL ,
      ADD qualifiesForRoyalMailInternationalSignedFor CHAR( 1 ) NOT NULL ,
      ADD memberOfEU CHAR( 1 ) NOT NULL;
      CREATE TYPE royalMailZone AS ENUM( 'UK', 'EU', 'WZ1', 'WZ2' );
    SQL
  end
end
