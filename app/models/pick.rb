class Pick < ActiveRecord::Base
  belongs_to :list
  belongs_to :item, -> { includes(:function) }

  validates_presence_of :list_id, :item_id
end
