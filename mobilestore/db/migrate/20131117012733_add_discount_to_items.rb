class AddDiscountToItems < ActiveRecord::Migration
  def change
    add_column :items, :discount, :string, :default => 'full price'
  end
end
