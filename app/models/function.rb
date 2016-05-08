class Function < ActiveRecord::Base
  has_many :items
  validates_uniqueness_of :name

  scope :order_by_name, -> { order('functions.name ASC') }

  def name
    self[:name].upcase
  end
end
