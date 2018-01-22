class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :text
      t.string :name

      t.timestamps
    end
  end
end
