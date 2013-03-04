class CreateCountryZones < ActiveRecord::Migration
  def change
    create_table :country_zones do |t|
      t.integer :countryId
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
