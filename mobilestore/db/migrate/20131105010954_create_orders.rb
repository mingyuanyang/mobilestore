class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :receiver_name
      t.text :receiver_address
      t.string :receiver_mobile
      t.datetime :order_date
      t.references :user

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
