class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.integer :function_id
      t.string :name
      t.decimal :weight
    end
  end

  def down
    drop_table :items
  end
end
