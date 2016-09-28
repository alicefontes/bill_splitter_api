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
        allow(Product).to receive(:find).with("30") { "ok" }

        get :show, params: { :id => 30 }
        expect(response.status).to eq(200)
      end

      it "tudo ok2?" do
        produto_fake = instance_double("Product", :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)
        allow(Product).to receive(:find).with("30") { produto_fake }
        get :show, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
        expect(assigns(:chosen_product)).to eq(produto_fake)
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
