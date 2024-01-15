class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references   :cordinate, null: false
      t.string   :name, null: false
      t.integer   :price, null: false
      t.text   :message, null: false
      t.timestamps
    end
  end
end
