class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :label
      t.boolean :compilation, default: false

      t.timestamps
    end
  end
end
