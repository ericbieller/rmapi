class CreateShippingRates < ActiveRecord::Migration
  def change
    create_table :shipping_rates do |t|
      t.integer :service_id
      t.string :packaging
      t.integer :weight
      t.string :royal_mail_zone
      t.integer :parcel_force_zone
      t.float :price
      t.boolean :member_of_eu

      t.timestamps
    end
  end
end
