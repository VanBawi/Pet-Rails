class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table  :pets do |t|
      t.string    :title
      t.text      :description
      t.string    :picture
      t.references :user, foreign_key: true
      t.string    :images
      t.timestamps
    end
  end
end
