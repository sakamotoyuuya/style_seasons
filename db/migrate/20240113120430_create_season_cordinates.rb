class CreateSeasonCordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :season_cordinates do |t|
      t.references   :cordinate, null: false
      t.references   :season, null: false
      t.timestamps
    end
  end
end
