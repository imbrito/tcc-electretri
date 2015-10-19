class ChangeWeigthToCriterions < ActiveRecord::Migration
  def change
  	change_table :criterions do |t|
  		t.rename :weigth, :weight
  	end
  end
end
