class PerformancesController < InheritedResources::Base
  respond_to :html
  before_filter :get_performable

  def edit
    @performance = @performable.performances.find params[:id]
    respond_with @performance
  end

  def update
    @performance = @performable.performances.find params[:id]
    if @performance.update_attributes(performance_params)
      respond_to do |format|
      	if @performance[:performable_type].eql?('Profile')
        	format.html { redirect_to project_profile_path(@project, @performable) }
        end
      end
    else
      render :edit
    end
  end
  private

    def performance_params
      params.require(:performance).permit(:value)
    end

    def get_performable
    	@project = Project.find params[:project_id]
    	klass = [Profile].detect{|c| params["#{c.name.underscore}_id"]}
      @performable = klass.find params["#{klass.name.underscore}_id"]
    end
end

