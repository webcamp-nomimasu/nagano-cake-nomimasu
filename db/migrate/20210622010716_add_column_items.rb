class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :checkbox, :boolean
    add_column :items, :allergies, :text
  end
end
