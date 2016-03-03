class AddViewCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :view_count, :integer, default: 0
  end
end
