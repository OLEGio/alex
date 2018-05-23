class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.integer :unp
      t.string :description
      t.string :name
    end
  end
end
