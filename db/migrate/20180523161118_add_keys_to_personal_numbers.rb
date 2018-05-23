class AddKeysToPersonalNumbers < ActiveRecord::Migration[5.1]
  def change
    add_column :personal_numbers, :user_id, :integer
  end
end
