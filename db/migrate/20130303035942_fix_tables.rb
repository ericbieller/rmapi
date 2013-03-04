class FixTables < ActiveRecord::Migration
  def up
    remove_column :countries, :royalMailZone
    add_column :countries, :royal_mail_zone, :string
    
    remove_column :countries, :parcelforcezone
    add_column :countries, :parcel_force_zone, :integer
    
    remove_column :countries, :qualifiesforroyalmailairsure
    add_column :countries, :qualifies_for_royal_mail_airsure, :boolean
    
    remove_column :countries, :code
    add_column :countries, :code, :string
    
    remove_column :countries, :name
    add_column :countries, :name, :string
    
    remove_column :countries, :qualifiesforroyalmailinternationalsignedfor
    add_column :countries, :qualifies_for_royal_mail_international_signed_for, :boolean
    
    remove_column :countries, :memberofeu
    add_column :countries, :member_of_eu, :boolean
    
    remove_column :country_zones, :countryId
    add_column :country_zones, :country_id, :integer
  end
end
