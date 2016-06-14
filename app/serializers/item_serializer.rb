class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight

  belongs_to :function, serializer: FunctionPreviewSerializer
end
