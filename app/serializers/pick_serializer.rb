class PickSerializer < ActiveModel::Serializer
  attributes :id, :packed

  belongs_to :item
  belongs_to :list, serializer: ListPreviewSerializer
end

