# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :total_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
