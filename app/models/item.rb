class Item < ActiveRecord::Base
  belongs_to :function

  validates_presence_of :name, :weight
end
