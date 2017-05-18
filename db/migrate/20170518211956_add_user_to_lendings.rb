class AddUserToLendings < ActiveRecord::Migration[5.0]
  def change
    add_reference :lendings, :user, foreign_key: true
  end
end
