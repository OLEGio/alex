class AddGradeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :grade_id, :integer
  end
end
