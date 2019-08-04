class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :rater_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
