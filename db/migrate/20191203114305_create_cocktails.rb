class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :photo
      t.string :description

      t.timestamps
    end
  end
end
