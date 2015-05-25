class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
