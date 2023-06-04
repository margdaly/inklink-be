class ChangeUsernameColumnForArtist < ActiveRecord::Migration[7.0]
  def change
    rename_column :artists, :username, :email
  end
end
