require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  before :each do
    # @location = FactoryGirl.create(:location)
    # @location_without_name = Location.create(name: nil)
  end
  let(:valid_attributes) {
    {name: 'Kakinada'}
  }
  let(:invalid_attributes) {
    {name: '',pin: 34}
  }


  describe 'POST #create' do
    context 'with valid attributes' do
      # it 'creates the location' do
      #   post :create, location: @location
      #   expect(Location.count).to eq(1)
      # end
      describe "GET new" do
        it "assigns a new book as @location" do
          get :new, {}
          expect(assigns(:location)).to be_a(Location)
        end
      end
      it "should show the new location" do
        post :create, location: valid_attributes
        expect(assigns(:location)).to be_a(Location)
        expect(assigns(:location)).to be_persisted
        @location = Location.find(Location.last.id)
        expect(response).to redirect_to @location
      end 
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved location" do
        post :create, location: invalid_attributes
        expect(assigns(:location)).to be_a(Location)
      end

      it "re-renders the 'new' template" do
        post :create, location: invalid_attributes
        expect(response).to render_template("new")
      end
    end


    describe "DELETE destroy" do
      it "destroys the requested location" do
        location = Location.create! valid_attributes
        expect {
          delete :destroy, {:id => location.to_param}
        }.to change(Location, :count).by(-1)
      end

      it "redirects to the locations list" do
        location = Location.create! valid_attributes
        delete :destroy, {:id => location.to_param}
        expect(response).to redirect_to(locations_url)
      end
    end

    # context 'with invalid attributes' do
    #   it 'does not create the location' do
    #     post :create, location: @location_without_name
    #     expect(Location.count).to eq(0)
    #   end

    #   it 're-renders the "new" view' do
    #     post :create, location: @location_without_name
    #     expect(response).to render_template :new
    #   end
    # end
  end
end
