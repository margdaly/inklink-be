class RemoveContactInfoFromArtists < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :contact_info, :string
  end
end
