class AddUserIdToCommentfs < ActiveRecord::Migration
  def change
    add_column :commentfs, :user_id, :integer
  end
end
