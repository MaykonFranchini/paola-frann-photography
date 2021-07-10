class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios do |t|
      t.string :adress
      t.string :name

      t.timestamps
    end
  end
end
