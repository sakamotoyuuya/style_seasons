class CreateCordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :cordinates do |t|
      t.references  :user
      t.string   :title, null: false
      t.text   :introduction, null: false
      t.timestamps
    end
  end
end
