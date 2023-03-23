class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.text :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
