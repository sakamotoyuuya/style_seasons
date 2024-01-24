class CreateCordinateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cordinate_items do |t|
      t.references   :cordinate, null: false
      t.references   :item, null: false
      t.timestamps
    end
  end
end
