class CreateCommentfs < ActiveRecord::Migration
  def change
    create_table :commentfs do |t|
      t.text :body
      t.references :forum

      t.timestamps
    end
    add_index :commentfs, :forum_id
  end
end
