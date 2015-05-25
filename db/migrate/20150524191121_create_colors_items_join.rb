class CreateColorsItemsJoin < ActiveRecord::Migration
  def change
    create_table :colors_items, id: false do |t|
      t.belongs_to :color, index: true
      t.belongs_to :item,  index: true
    end
  end
end
