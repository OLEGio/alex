class CreateAccessLevel < ActiveRecord::Migration[5.1]
  def change
    create_table :access_levels do |t|
      t.integer :level
      t.string :description
    end
  end
end
