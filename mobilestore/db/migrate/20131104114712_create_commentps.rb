class CreateCommentps < ActiveRecord::Migration
  def change
    create_table :commentps do |t|
      t.text :body
      t.references :post

      t.timestamps
    end
    add_index :commentps, :post_id
  end
end
