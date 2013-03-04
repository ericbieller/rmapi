class AddRoyalMailZoneToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :royalMailZone, :string
  end
end
