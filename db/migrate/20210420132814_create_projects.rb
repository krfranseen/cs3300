class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :short_descr
      t.text :long_descr
      t.integer :complexity
      t.datetime :date
      t.string :images
      t.string :slug

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
