class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.string :telegram
      t.string :whatsapp
      t.string :address
      t.integer :entity_id
      t.string :entity_type
    end
  end
end
