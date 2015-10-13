require 'rails_helper'

describe LocationPrediction do
  context "Associations" do
    it { should belong_to(:location) }
  end
end