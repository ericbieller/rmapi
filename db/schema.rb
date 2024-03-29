# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130303225629) do

  create_table "countries", :force => true do |t|
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "royal_mail_zone"
    t.integer  "parcel_force_zone"
    t.boolean  "qualifies_for_royal_mail_airsure"
    t.string   "code"
    t.string   "name"
    t.boolean  "qualifies_for_royal_mail_international_signed_for"
    t.boolean  "member_of_eu"
  end

  create_table "country_zones", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "country_id"
    t.integer  "parcel_force_zone"
  end

  create_table "payments", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.string   "email"
    t.string   "stripe_token"
  end

  create_table "shipping_rates", :force => true do |t|
    t.integer  "service_id"
    t.string   "packaging"
    t.integer  "weight"
    t.string   "royal_mail_zone"
    t.integer  "parcel_force_zone"
    t.float    "price"
    t.boolean  "member_of_eu"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "shipping_services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "authentication_token"
    t.string   "status",                 :default => "free"
    t.string   "stripe_customer_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
