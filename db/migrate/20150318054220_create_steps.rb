class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :step
      t.references :theme, index: true

      t.timestamps null: false
    end
    add_foreign_key :steps, :themes
  end
end
