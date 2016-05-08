class Item < ActiveRecord::Base
  belongs_to :function

  validates_presence_of :name, :weight

  scope :order_by_function_name, -> {
    includes(:function).
    order('functions.name, items.name')
  }
end
