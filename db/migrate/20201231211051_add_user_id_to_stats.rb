class AddUserIdToStats < ActiveRecord::Migration[6.1]
  def change
    add_column :stats, :user_id, :integer
  end
end
