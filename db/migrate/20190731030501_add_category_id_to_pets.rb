class AddCategoryIdToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :category_id, :integer
  end
end
