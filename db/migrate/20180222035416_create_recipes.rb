class CreateRecipes < ActiveRecord::Migration[5.1]
  def up 
    create_table :recipes do |t| 
      t.string :name 
      t.string :ingredients
      t.time   :cook_time
    end
  end
  
  def down 
    drop_table :recipes
  end
end
