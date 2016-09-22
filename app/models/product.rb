class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :quantity, type: Integer
  field :number_of_people_sharing, type: Integer
end
