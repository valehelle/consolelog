class Removing < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :user_id
  end
end
