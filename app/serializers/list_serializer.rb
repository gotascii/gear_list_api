class ListSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :picks, serializer: PickPreviewSerializer
end

