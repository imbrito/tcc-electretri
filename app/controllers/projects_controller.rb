class ProjectsController < InheritedResources::Base
  respond_to :html

  def index
    @projects = Project.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @project = Project.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @project = Project.new
    respond_with @project
  end

  def edit
    @project = Project.find params[:id]
    respond_with @project
  end

  def create
    @project = Project.create!(project_params)
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to action: 'index' }
      end
    end
  end

  def update
    @project = Project.find params[:id]
    respond_to do |format|
      @project.update_attributes(project_params)
      if @project.save
        format.html { redirect_to action: 'index' }
      end
    end
  end
  private

    def project_params
      params.require(:project).permit(:name, :description, :cut)
    end
end

