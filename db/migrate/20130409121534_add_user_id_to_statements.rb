class AddUserIdToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :user_id, :integer
  end
end
