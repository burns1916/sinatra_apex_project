class CreateLegends < ActiveRecord::Migration[6.1]
  def change
    create_table :legends do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
