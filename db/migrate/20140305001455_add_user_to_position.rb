class AddUserToPosition < ActiveRecord::Migration
  def change
    add_reference :positions, :user, index: true
  end
end
