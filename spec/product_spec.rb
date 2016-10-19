require 'rails_helper'

describe Product, type: :model do

  before do
    Product.delete_all
  end

  describe "validates name" do
    subject { Product.new(id: 10, name: name, quantity: 2, price: 20, number_of_people_sharing: 2) }

    context "long name" do
      let(:name) { "nome graaaaaaaaaaaaaaaaaaaaaaaande" }
      it "should not be vallid" do
        expect(subject).to_not be_valid
      end
    end

    context "short name" do
      let(:name) { "short name" }
      it "should be vallid" do
        expect(subject).to be_valid
      end
    end

    context "nil name" do
      let(:name) { nil }
      it "should be vallid" do
        expect(subject).to be_valid
      end
    end
  end

  describe "validates price" do
    subject { Product.new(id: 10, name: "cerveja", quantity: 2, price: price, number_of_people_sharing: 2) }

    context "no price" do
      let(:price) { nil }
      it "should not be vallid" do
        expect(subject).to_not be_valid
      end
    end

    context "ok price" do
      let(:price) { 30 }
      it "should be vallid" do
        expect(subject).to be_valid
      end
    end
  end

  describe "validates quantity" do
    subject { Product.new(id: 10, name: "cerveja", quantity: quantity, price: 4, number_of_people_sharing: 2) }

    context "no quantity" do
      let(:quantity) { nil }
      it "should not be vallid" do
        expect(subject).to_not be_valid
      end
    end

    context "ok quantity" do
      let(:quantity) { 30 }
      it "should be vallid" do
        expect(subject).to be_valid
      end
    end
  end

  describe "validates number_of_people_sharing" do
    subject { Product.new(id: 10, name: "cerveja", quantity: 20, price: 4, number_of_people_sharing: number_of_people_sharing) }

    context "number_of_people_sharing zero" do
      let(:number_of_people_sharing) { 0 }
      it "should not be vallid" do
        expect(subject).to_not be_valid
      end
    end

    context "number_of_people_sharing ok" do
      let(:number_of_people_sharing) { 30 }
      it "should be vallid" do
        expect(subject).to be_valid
      end
    end
  end
end
