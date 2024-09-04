class AddUsersToMedium < ActiveRecord::Migration[7.1]
  def change
    add_reference :media, :users, index: true
  end
end
