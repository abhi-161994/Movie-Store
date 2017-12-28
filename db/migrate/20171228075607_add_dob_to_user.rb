class AddDateOfBirthToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :Date0fbirth, :string
  end
end
