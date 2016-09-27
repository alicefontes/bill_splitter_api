class ItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :number_of_people_sharing, :quantity, :name
  product.as_json(except: [:id])
end
