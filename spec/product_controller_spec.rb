require 'rails_helper'

describe ProductController, type: :controller do

		describe "index" do
			it "tudo ok?" do
				get :index
				expect(response.status).to eq(200)
			end
		end

    describe "show" do
      it "tudo ok?" do

        # @chosen_product = Product.find(params[:id])
        get :show, params: {:id => @chosen_product.id}
        # get :show, params: {id: "57e4563e00d4f842afcf5533"}, session: {product_id: "57e4563e00d4f842afcf5533"}
        # expect(page.current_path).to eq(item.id)
        expect(response.status).to eq(200)
      end
    end

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
