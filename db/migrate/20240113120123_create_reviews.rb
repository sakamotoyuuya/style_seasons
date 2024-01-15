class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references   :user, null: false
      t.references   :cordinate, null: false
      t.text   :message, null: false
      t.timestamps
    end
  end
end
