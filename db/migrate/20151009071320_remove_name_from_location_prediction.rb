class RemoveNameFromLocationPrediction < ActiveRecord::Migration
  def change
  	remove_column :location_predictions, :name
  end
end
