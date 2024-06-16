class CreateTips < ActiveRecord::Migration[7.1]
  def change
    create_table :tips do |t|
      t.references :order, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.numeric :amount_cents, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
