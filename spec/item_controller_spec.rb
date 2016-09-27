require 'rails_helper'

describe ItemController, type: :controller do

		describe "index" do
			it "tudo ok?" do
				get :index
				expect(response.status).to eq(200)
			end
		end

    # describe "show" do
    #   it "tudo ok?" do
    #     get :show
    #     expect(response.status).to eq(200)
    #   end
    # end

    # describe "edit" do
    #   it "tudo ok?" do
    #     put :edit
    #     expect(response.status).to eq(200)
    #   end
    # end

    describe "new" do
      it "tudo ok?" do
        post :new, params: { :item => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
        expect(response.status).to eq(200)
      end
    end
    
    # describe "delete" do
    #   it "tudo ok?" do
    #     delete :delete
    #     expect(response.status).to eq(200)
    #   end
    # end
end
