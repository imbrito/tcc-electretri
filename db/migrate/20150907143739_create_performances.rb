class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.float :value
      t.references :criterion, index: true, foreign_key: true
      t.references :performable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
