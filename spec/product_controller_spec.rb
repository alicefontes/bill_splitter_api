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
        produto_fake = instance_double("Product")
        allow(Product).to receive(:find).with("30") { produto_fake }
        get :show, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
        expect(assigns(:chosen_product)).to eq(produto_fake)
      end
    end

    describe "edit" do
      it "tudo ok?" do
        produto_fake = instance_double("Product", :name= => "a", :quantity= => 2, :price= => 20, :number_of_people_sharing= => 2)
        allow(Product).to receive(:find).with("30") { produto_fake }
        allow(produto_fake).to receive(:save)
        put :edit, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
        expect(response.status).to eq(200)
      end

      # it "salva os parametros novos?" do
      #   produto_fake = instance_double("Product", :name= => "batata", :quantity= => 2, :price= => 20, :number_of_people_sharing= => 2)
      #   allow(Product).to receive(:find).with("30") { produto_fake }
      #   allow(produto_fake).to receive(:save)
      #   expect(produto_fake).to receive(:name=).with("batata")
      #   expect(produto_fake).to receive(:quantity=).with("2")
      #   expect(produto_fake).to receive(:price=).with("20")
      #   expect(produto_fake).to receive(:number_of_people_sharing=).with("2")
      #   put :edit, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
      #   expect(response.status).to eq(200)
      # end

      it "salva os parametros novos?" do
        product = Product.new(:id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)
        allow(Product).to receive(:find).with("30") { product }
        allow(product).to receive(:save)

        expect(product).to receive(:name=).with("batata")
        expect(product).to receive(:quantity=).with("2")
        expect(product).to receive(:price=).with("20")
        expect(product).to receive(:number_of_people_sharing=).with("2")
        put :edit, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
        expect(response.status).to eq(200)
      end
      
      it "salva só um parametro novo?" do
        product = Product.new(:id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)

        allow(Product).to receive(:find).with("30") { product }
        allow(product).to receive(:save)

        put :edit, params: { :id => 30, :name => "outra batata" }
        expect(assigns(:product_edited).name).to eq("outra batata")
        expect(assigns(:product_edited).quantity).to eq(2)
      end
    end

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

    describe "delete" do
      it "tudo ok?" do
        produto_fake = instance_double("Product", :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)
        allow(Product).to receive(:find).with("30") { produto_fake }
        expect(produto_fake).to receive(:destroy)
        delete :delete, params: { :id => 30 }
        expect(response.status).to eq(200)
      end
    end
end
