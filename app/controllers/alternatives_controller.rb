class AlternativesController < ApplicationController
	before_filter :set_project
	before_action :set_alternative, only: [:edit, :update, :destroy]

	def index
	  @alternatives = @project.alternatives.order(:created_at)
	end

	def show
	  @performable = @project.alternatives.includes(:performances).find params[:id]
	end

	def new
	  @alternative = @project.alternatives.new
	end

	def edit
	end

	def create
	  @alternative = @project.alternatives.create(alternative_params)
		respond_to do |format|
			if @alternative.save
    		@project.criterions.each { |criterion| @alternative.performances.build(value: 0, criterion: criterion).save }
        format.html { redirect_to project_path(@project) }
	  	else
	    	format.html { render :new }
			end
	  end
	end

	def update
    respond_to do |format|
			if @alternative.update_attributes(alternative_params)
      	format.html { redirect_to project_path(@project) }
	  	else
	    	format.html { render :edit }
			end
	  end
	end

	def destroy
	  @alternative.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project) }
    end
	end
  private

    def alternative_params
      params.require(:alternative).permit(:name, :description)
    end

    def set_project
    	@project = Project.includes([:criterions,:alternatives]).find params[:project_id]
    end

		def set_alternative
			@alternative = @project.alternatives.find params[:id]
		end
end
