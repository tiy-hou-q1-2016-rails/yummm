class ChangeToPhotoForRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :photo_url, :string
    add_column :recipes, :photo_id, :string
  end
end
