class ChangeStripeTokenColumnName < ActiveRecord::Migration
  def up
    remove_column :users, :stripe_token
    add_column :users, :stripe_customer_id, :string
  end

  def down
    remove_column :users, :stripe_customer_id
    add_column :users, :stripe_token, :string
  end
end
