class AddLegendIdToStats < ActiveRecord::Migration[6.1]
  def change
    add_column :stats, :legend_id, :integer
  end
end
