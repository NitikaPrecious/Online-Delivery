class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :city_area_id

      t.timestamps
    end
  end
end
