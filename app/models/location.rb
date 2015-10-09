class Location < ActiveRecord::Base
	has_many :location_predictions
	validates_presence_of :name
end
