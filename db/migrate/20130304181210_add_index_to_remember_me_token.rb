class AddIndexToRememberMeToken < ActiveRecord::Migration
  def change
    add_index :users, :remember_me_token, unique: true
  end
end
