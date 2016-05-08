class PopulateFoodItems < ActiveRecord::Migration
  def foods
    ["oatmeal",
    "cream of wheat",
    "coffee",
    "gel",
    "bars",
    "bouillon",
    "potatoes",
    "butter",
    "ramen",
    "peanut butter",
    "chicken",
    "salmon",
    "olive oil",
    "honey roasted almonds",
    "chocolate almonds",
    "roasted almonds",
    "honey roasted peanuts",
    "roasted peanuts",
    "cashews",
    "dried berries",
    "raisins",
    "granola",
    "honey",
    "salt",
    "pepper",
    "basil",
    "cumin",
    "cilantro",
    "thyme"]
  end

  def up
    if (defined?(Function) && defined?(Item))
      food = Function.find_by_name("Food")
      foods.uniq.each do |name|
        Item.create!(:function => food, :name => name.titleize, :weight => 0)
      end
    end
  end

  def down
    if (defined?(Item))
      foods.uniq.each do |name|
        Item.find_by_name(name.titleize).destroy
      end
    end
  end
end
