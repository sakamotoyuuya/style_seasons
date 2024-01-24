class CreateCordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :cordinates do |t|
      t.references  :admin
      t.string   :title, null: false
      t.text   :introduction, null: false
      t.references :season
      t.timestamps
    end
  end
end
