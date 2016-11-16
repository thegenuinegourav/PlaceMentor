class AddPictureToRecipes < ActiveRecord::Migration
  def change
    add_column :companies, :picture, :string
  end
end
