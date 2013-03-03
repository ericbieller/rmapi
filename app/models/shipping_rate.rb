class ShippingRate < ActiveRecord::Base
  attr_accessible :id, :member_of_eu, :packaging, :parcel_force_zone, :price, :royal_mail_zone, :service_id, :weight
end