class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.string :slug
      t.integer :identifier

      t.timestamps
    end
  end
end
