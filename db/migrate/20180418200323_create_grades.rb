class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.integer :grade
      t.decimal :rate, precision: 2, scale: 2
    end
  end
end
