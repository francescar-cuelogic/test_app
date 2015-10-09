require 'spec_helper'

describe Location do
  context "Associations" do
    it { should belong_to(:location_predictions) }
  end
  context "Validations" do
    it { should validate_presence_of(:name) }
  end
end
