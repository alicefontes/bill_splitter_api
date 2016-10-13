class Product
  include Mongoid::Document
  include ActiveModel::Validations

  field :id
  field :name, type: String
  field :price, type: Float
  field :quantity, type: Integer
  field :number_of_people_sharing, type: Integer

  # validates :name, length: { maximum: 20 }
  validates_length_of :name, maximum: 20
  validates_presence_of :price
  validates_presence_of :quantity
end
