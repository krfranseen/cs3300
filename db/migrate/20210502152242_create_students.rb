class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :username
      t.string :password
      t.text :degrees
      t.text :introduction
      t.text :resume
      t.string :image

      t.timestamps
    end
  end
end
