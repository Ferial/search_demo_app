class CreateItemsSizesJoin < ActiveRecord::Migration
  def change
    create_table :items_sizes, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :size, index: true
    end
  end
end
