class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.references :item, foreign_key: true, null: false
      t.references :customer, foreign_key: true, null: false
      t.timestamps
    end
  end
end
