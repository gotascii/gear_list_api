class FunctionSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :items, serializer: ItemPreviewSerializer
end
