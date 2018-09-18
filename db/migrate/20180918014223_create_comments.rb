class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :product, foreign_key: true
      t.text :body
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
