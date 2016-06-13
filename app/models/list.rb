class List < ActiveRecord::Base
  has_many :picks, -> { includes(:item) }, dependent: :destroy
  has_many :packed_picks, -> { where(packed: true) }, class_name: 'Pick'
  has_many :worn_picks, -> { where(packed: false) }, class_name: 'Pick'

  has_many :items, through: :picks
  has_many :packed_items, class_name: 'Item', through: :packed_picks, source: :item
  has_many :worn_items, class_name: 'Item', through: :worn_picks, source: :item

  validates_presence_of :name

  # def weight
  #   sum_and_truncate(items)
  # end

  # def packed_weight
  #   sum_and_truncate(packed_items)
  # end

  # def worn_weight
  #   sum_and_truncate(worn_items)
  # end

  # private
  # def sum_and_truncate(val)
  #   val.sum('weight').to_short_d
  # end
end
