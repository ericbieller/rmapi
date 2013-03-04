class Country < ActiveRecord::Base
  attr_accessible :name, :code, :member_of_eu, :royal_mail_zone, :parcel_force_zone, :qualifies_for_royal_mail_airsure, :qualifies_for_royal_mail_international_signed_for
end
