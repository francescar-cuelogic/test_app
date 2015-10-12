require 'rails_helper'

RSpec.describe LocationPrediction, :type => :model do
  context "Associations" do
    it { should belong_to(:locations) }
  end
end