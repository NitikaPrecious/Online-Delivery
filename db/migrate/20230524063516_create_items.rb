# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :restaurant, null: false, foreign_key: true
      t.references :item_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
