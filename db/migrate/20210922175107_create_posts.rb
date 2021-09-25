class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :category
      t.string :title
      t.string :link
      t.string :cover_link
      t.string :origin
      t.text   :description

      t.timestamps
    end
  end
end
