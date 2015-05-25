class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.boolean :available_in_store

      t.timestamps null: false
    end
  end
end
