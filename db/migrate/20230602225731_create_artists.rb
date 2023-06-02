class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :styles, array: true, default: []
      t.string :pricing
      t.string :contact_info

      t.timestamps
    end
  end
end
