class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.string :name
      t.float :weigth
      t.float :preference
      t.float :indifference
      t.float :veto
      t.string :direction
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
