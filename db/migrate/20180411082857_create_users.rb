class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.decimal :amount, precision: 5, scale: 2
    end
  end
end
