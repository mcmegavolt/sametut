class CreateNews < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :body
      t.datetime :released_at

      t.timestamps
    end
  end
end
