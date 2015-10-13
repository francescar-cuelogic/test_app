class Location < ActiveRecord::Base
	has_many :location_predictions, :dependent => :destroy
	validates_presence_of :name
end
