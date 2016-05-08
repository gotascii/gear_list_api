class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight

  belongs_to :function
end
