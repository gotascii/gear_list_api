class Item < ActiveRecord::Base
  belongs_to :function
  has_many :picks, dependent: :destroy

  validates_presence_of :name, :weight
end
