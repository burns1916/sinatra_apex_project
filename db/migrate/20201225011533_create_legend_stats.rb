class CreateLegendStats < ActiveRecord::Migration[6.1]
  def change
    create_table :legend_stats do |t|
      t.integer :legend_id
      t.integer :stat_id
    end
  end
end
