class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :description
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
