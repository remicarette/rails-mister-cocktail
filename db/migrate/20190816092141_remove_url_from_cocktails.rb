class RemoveUrlFromCocktails < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :url, :string
  end
end
