class CreatePicks < ActiveRecord::Migration
  def up
    create_table :picks do |t|
      t.integer :list_id
      t.integer :item_id
      t.boolean :packed, :default => true
    end
  end

  def down
    drop_table :picks
  end
end
