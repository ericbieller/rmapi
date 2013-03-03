class AddParcelForceZoneToCountryZones < ActiveRecord::Migration
  def change
    add_column :country_zones, :parcel_force_zone, :integer
  end
end
