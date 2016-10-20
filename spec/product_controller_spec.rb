require 'rails_helper'

describe ProductController, type: :controller do

  before do
    Product.delete_all
  end

	describe "GET list" do
    subject { response.status }

    before do
      get :list
    end

    context "has 200 status code if requested" do
			it { is_expected.to eq 200 }
		end
	end

  describe "GET show" do
    subject { response.status }

    before do
      product = Product.new(id: 30, name: "batata", quantity: 2, price: 20, number_of_people_sharing: 2)
      allow(Product).to receive(:find).with("30") { product }
      get :show, params: { id: 30, name: "batata", quantity: 2, price: 20, number_of_people_sharing: 2 }
    end

    context "has 200 status code if requested" do
      it { is_expected.to eq 200 }
    end

    context "saved right?" do
      it "should be valid" do
        json = JSON.parse(response.body)
        expect(json['id']).to eq(30)
        expect(json['name']).to eq("batata")
        expect(json['quantity']).to eq(2)
        expect(json['price']).to eq(20)
        expect(json['number_of_people_sharing']).to eq(2)
      end
    end
  end

  describe "PUT edit" do
    subject { response.status }

    let(:name) { "batata" }
    let(:quantity) { 2 }
    let(:price) { 20 }
    let(:number_of_people_sharing) { 2 }

    before do
      product = Product.new(id: 30, name: "batata", quantity: 2, price: 20, number_of_people_sharing: 2)
      allow(Product).to receive(:find).with("30") { product }
      put :edit, params: { id: 30, name: name, quantity: quantity, price: price, number_of_people_sharing: number_of_people_sharing }
    end

    context "has 200 status code if requested" do
      it { is_expected.to eq 200 }
    end

    context "save the new parameters" do
      let(:name) { "batata 2" }
      let(:quantity) { 3 }
      let(:price) { 30 }
      let(:number_of_people_sharing) { 3 }

      it "should be valid" do
        json = JSON.parse(response.body)
        expect(json['name']).to eq("batata 2")
        expect(json['quantity']).to eq(3)
        expect(json['price']).to eq(30)
        expect(json['number_of_people_sharing']).to eq(3)
      end
    end

    context "save only one new parameter and keep the rest" do
      let(:name) { "outra batata" }

      it "should be valid" do
        json = JSON.parse(response.body)
        expect(json['name']).to eq("outra batata")
        expect(json['quantity']).to eq(2)
      end
    end
  end

  describe "POST new" do
    subject { response.status }

    before do
      post :new, params: { name: name, quantity: 2, price: 20, number_of_people_sharing: 2 }
    end

    context "has 200 status code when requested" do
      let(:name) { "batata" }
      it { is_expected.to eq 200 }
    end

    context "has 200 status code w/ blank name of the item" do
      let(:name) { nil }
      it { is_expected.to eq 200 }
    end
  end

  describe "DELETE delete" do
    subject { response.status }

    before do
      fake_product = instance_double("Product", :id => 30, :name => "batata", :quantity => 2, :price => 20, :number_of_people_sharing => 2)
      allow(Product).to receive(:find).with("30") { fake_product }
      expect(fake_product).to receive(:destroy)
      delete :delete, params: { id: 30 }
    end

    context "has 200 status code w/ id passed" do
      it { is_expected.to eq 200 }
    end
  end

  describe "validates json response" do
    before do
      product = Product.new(id: 30, name: "batata", quantity: 2, price: 20, number_of_people_sharing: 2)
      allow(Product).to receive(:find).with("30") { product }
      get :show, params: { id: 30, name: "batata", quantity: 2, price: 20, number_of_people_sharing: 2 }
    end
    context "saved right?" do
      it "should be valid" do
        json = JSON.parse(response.body)
        expect(json['id']).to eq(30)
        expect(json['name']).to eq("batata")
        expect(json['quantity']).to eq(2)
        expect(json['price']).to eq(20)
        expect(json['number_of_people_sharing']).to eq(2)
      end
    end
  end
end
