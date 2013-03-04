class UpdatePaymentsAddFields < ActiveRecord::Migration
  def up
    add_column :payments, :email, :string
    add_column :payments, :stripe_token, :string
  end

  def down
  end
end
