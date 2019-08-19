class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table  :pets do |t|
      t.string    :title
      t.text      :description
      t.string    :picture
      t.string    :images
      t.integer   :user_id
      t.float     :price
      t.timestamps
    end
  end
end
