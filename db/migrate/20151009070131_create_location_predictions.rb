class CreateLocationPredictions < ActiveRecord::Migration
  def change
    create_table :location_predictions do |t|
      t.string :name
      t.text :description
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
