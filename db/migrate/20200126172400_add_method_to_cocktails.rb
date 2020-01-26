class AddMethodToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :method, :text
  end
end
