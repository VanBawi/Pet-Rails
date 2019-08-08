class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string  :address
      t.float   :lat
      t.float   :lng
      t.string  :city
      t.string  :state
      t.integer :age
      t.integer :contact
      t.string  :pet_type
      t.integer :post_code


      t.timestamps
    end
  end
end
