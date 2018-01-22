class AddFlagToProjects < ActiveRecord::Migration
	class Project < ActiveRecord::Base
  end
  def change
    add_column :projects, :flag, :boolean
    Project.reset_column_information
    Project.all.each do |product|
      product.update_attributes!(:flag => false)
    end
  end
end
