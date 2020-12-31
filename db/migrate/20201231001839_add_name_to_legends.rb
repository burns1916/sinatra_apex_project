class AddNameToLegends < ActiveRecord::Migration[6.1]
  def change
    add_column :legends, :name, :integer
  end
end
