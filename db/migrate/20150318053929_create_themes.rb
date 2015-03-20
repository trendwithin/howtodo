class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end