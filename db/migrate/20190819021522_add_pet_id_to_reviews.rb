class AddPetIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :pet_id, :integer
  end
end
