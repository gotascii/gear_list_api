class Pick < ActiveRecord::Base
  belongs_to :list
  belongs_to :item, -> { includes(:function) }

  # scope :order_by_item_function_name, -> {
  #   joins('INNER JOIN items ON items.id = picks.item_id INNER JOIN functions ON functions.id = items.function_id').
  #   order('functions.name, items.name')
  # }
end
