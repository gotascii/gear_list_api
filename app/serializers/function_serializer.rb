class FunctionSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :items, unless: :hide_items?

  def hide_items?
    scope == :hide_items
  end
end
