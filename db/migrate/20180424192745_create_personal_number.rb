class CreatePersonalNumber < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_numbers do |t|
      t.string :number
    end
  end
end
