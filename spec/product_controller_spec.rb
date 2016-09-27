require 'rails_helper'

describe ProductController, type: :controller do

		describe "index" do
			it "tudo ok?" do
				get :index
				expect(response.status).to eq(200)
			end
		end

    # describe "show" do
    #   it "tudo ok?" do
    #
    #     # @chosen_product = Product.find(params[:id])
    #     get :show, self.find(params[:id])
    #     #  params: {:id => Product.find(params[:id])}
    #     # expect(page.current_path).to eq(item.id)
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

      it "blank name of the item" do
        post :new, params: { :item => nil, :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
        expect(response.status).to eq(200)
      end

      it "blank number of people sharing" do
        post :new, params: { :item => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => nil }
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
