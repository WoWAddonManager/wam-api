class CreateAddons < ActiveRecord::Migration[6.0]
  def change
    create_table :addons do |t|
      t.string :version
      t.string :wowversion
      t.string :description
      t.string :torrentinfo

      t.timestamps
    end
  end
end
