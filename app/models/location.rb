class Location < ActiveRecord::Base
	has_many :location_predictions
	
end
