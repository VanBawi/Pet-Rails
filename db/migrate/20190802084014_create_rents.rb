class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table  :rents do |t|
      t.integer   :reter_id
      t.integer   :pet_id
      t.date      :start_date, null: false
      t.date      :end_date, null: false 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
