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

#corrigir: ver se o json retorna os parametros certos
    context "shows the chosen product properly" do
      it { expect(assigns(:chosen_product).name).to eq("batata") }
      it { expect(assigns(:chosen_product).quantity).to eq(2) }
      it { expect(assigns(:chosen_product).price).to eq(20) }
      it { expect(assigns(:chosen_product).number_of_people_sharing).to eq(2) }
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

      it { expect(assigns(:product_edited).name).to eq("batata 2") }
      it { expect(assigns(:product_edited).quantity).to eq(3) }
      it { expect(assigns(:product_edited).price).to eq(30) }
      it { expect(assigns(:product_edited).number_of_people_sharing).to eq(3) }
    end

    context "save only one new parameter and keep the rest" do
      let(:name) { "outra batata" }

      it { expect(assigns(:product_edited).name).to eq("outra batata") }
      it { expect(assigns(:product_edited).quantity).to eq(2) }
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
end
