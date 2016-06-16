class PerformancesController < ApplicationController
  before_filter :set_performable
  before_action :set_performance

  def edit
  end

  def update
    respond_to do |format|
      if @performance.update_attributes(performance_params)
      	format.html { redirect_to polymorphic_url([@project, @performable]) }
      else
        format.html { render :edit }
      end
    end
  end
  private

    def performance_params
      params.require(:performance).permit(:value)
    end

    def set_performable
    	@project = Project.find params[:project_id]
    	klass = [Profile, Alternative].detect{|c| params["#{c.name.underscore}_id"]}
      @performable = klass.find params["#{klass.name.underscore}_id"]
    end

    def set_performance
      @performance = @performable.performances.find params[:id]
    end
end
