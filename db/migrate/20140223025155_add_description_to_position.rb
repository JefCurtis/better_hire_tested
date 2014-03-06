class AddDescriptionToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :description, :text
  end
end
