class CreateWorkedTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :worked_times do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
    end
  end
end
