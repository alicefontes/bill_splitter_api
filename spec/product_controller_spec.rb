require 'rails_helper'

describe ProductController, type: :controller do

  before do
    Product.delete_all
  end

	describe "index option" do
		it "has 200 status code if requested" do
			get :index
			expect(response.status).to eq(200)
		end
	end

  describe "show option" do
    it "has 200 status code if requested" do
      allow(Product).to receive(:find).with("30") { "ok" }
      get :show, params: { :id => 30 }
      expect(response.status).to eq(200)
    end

    it "shows the chosen product properly" do
      fake_product = instance_double("Product")

      allow(Product).to receive(:find).with("30") { fake_product }

      get :show, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
      expect(assigns(:chosen_product)).to eq(fake_product)
    end
  end

  describe "edit option" do
    before do
      product = Product.new(:id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)
      allow(Product).to receive(:find).with("30") { product }
    end

    it "has 200 status code if requested" do
      put :edit, params: { :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
      expect(response.status).to eq(200)
    end

    it "save the new parameters" do
      put :edit, params: { :id => 30, :name => "batata 2", :quantity => 3, :price => 30, :number_of_people_sharing => 3 }

      expect(assigns(:product_edited).name).to eq("batata 2")
      expect(assigns(:product_edited).quantity).to eq(3)
      expect(assigns(:product_edited).price).to eq(30)
      expect(assigns(:product_edited).number_of_people_sharing).to eq(3)
    end

    it "save only one new parameter and keep the rest" do
      put :edit, params: { :id => 30, :name => "outra batata" }

      expect(assigns(:product_edited).name).to eq("outra batata")
      expect(assigns(:product_edited).quantity).to eq(2)
    end
  end

  describe "new option" do
    it "has 200 status code when requested" do
      post :new, params: { :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
      expect(response.status).to eq(200)
    end

    it "has 200 status code w/ blank name of the item" do
      post :new, params: { :name => nil, :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
      expect(response.status).to eq(200)
    end

    it "error > name of the product bigger than 20 char" do
      post :new, params: { :name => "batata frita com cheddar e bacon nao interessa", :quantity => 2, :price => 20, :number_of_people_sharing => 2 }
      expect(response.status).to eq(400)
    end

    it "error > number of people sharing cant be 0" do
      post :new, params: { :name => "batata frita", :quantity => 2, :price => 20, :number_of_people_sharing => 0 }
      expect(response.status).to eq(400)
    end

  end

  describe "delete option" do
    it "has 200 status code w/ id passed" do
      fake_product = instance_double("Product", :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)

      allow(Product).to receive(:find).with("30") { fake_product }
      expect(fake_product).to receive(:destroy)

      delete :delete, params: { :id => 30 }
      expect(response.status).to eq(200)
    end
  end
end
