class PickPreviewSerializer < ActiveModel::Serializer
  attributes :id, :packed

  belongs_to :item
end


