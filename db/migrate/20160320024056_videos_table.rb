class VideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :attachment
      t.timestamps null: false
    end
  end
end
