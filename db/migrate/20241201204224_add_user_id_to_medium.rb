class AddUserIdToMedium < ActiveRecord::Migration[7.1]
  def change
    add_reference :media, :user, null: false, foreign_key: true
  end
end
