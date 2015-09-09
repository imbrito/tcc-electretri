class AlternativesController < InheritedResources::Base
	respond_to :html
	before_filter :get_project

	def get_project
		@project = Project.includes([:criterions,:alternatives]).find params[:project_id]
	end

	def index
	  @alternatives = @project.alternatives.order(:created_at)
	  respond_to do |format|
	    format.html
	  end
	end

	def show
	  @performable = @project.alternatives.includes(:performances).find params[:id]
	  respond_to do |format|
	    format.html
	  end
	end

	def new
	  @alternative = @project.alternatives.new
	  respond_with @alternative
	end

	def edit
	  @alternative = @project.alternatives.find params[:id]
	  respond_with @alternative
	end

	def create
	  @alternative = @project.alternatives.create(alternative_params)
	  if @alternative.valid?
	    if @alternative.save
	    	@project.criterions.each { |criterion| @alternative.performances.build(value: 0, criterion: criterion).save }
	    	respond_to do |format|
	        format.html { redirect_to project_alternative_path(@project, @alternative) }
	      end
	    end
	  else
	    render :new
	  end
	end

	def update
	  @alternative = @project.alternatives.find params[:id]
	  if @alternative.update_attributes(alternative_params)
	    respond_to do |format|
	      format.html { redirect_to action: 'index' }
	    end
	  else
	    render :edit
	  end
	end

	def destroy
	  @alternative = @project.alternatives.find params[:id]
	  if @alternative.destroy
	    respond_to do |format|
	      format.html { redirect_to action: 'index' }
	    end
	  end
	end
  private

    def alternative_params
      params.require(:alternative).permit(:name, :description)
    end
end

