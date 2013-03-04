# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
CSV.read('/Users/nikita/Sites/rmapi/app/countries_seed.txt').each do |row|
  Country.create(
    :name => row[0],
    :code => row[1],
    :member_of_eu => row[2],
    :royal_mail_zone => row[3],
    :parcel_force_zone => row[4],
    :qualifies_for_royal_mail_airsure => row[5],
    :qualifies_for_royal_mail_international_signed_for => row[6])
end
CSV.read('/Users/nikita/Sites/rmapi/app/country_zones.txt').each do |row|
  ShippingService.create(
    :id => row[0],
    :name => row[1]
    )
end
CSV.read('/Users/nikita/Sites/rmapi/app/shipping_rates.txt').each do |row|
  ShippingRate.create(
    :id => row[0],
    :service_id => row[1],
    :packaging => row[2],
    :weight => row[3],
    :royal_mail_zone => row[4],
    :parcel_force_zone => row[5],
    :price => row[6],
    :member_of_eu => row[7]
    )
end