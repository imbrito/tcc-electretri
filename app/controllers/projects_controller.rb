class ProjectsController < InheritedResources::Base
  respond_to :html

  def index
    @projects = Project.where(:user_id => current_user.id).order(:created_at)
    respond_to do |format|
      format.html
    end
  end

  def show
    @project = Project.find params[:id]
    @count = Criterion.where(:project_id => @project.id).count
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
    @project = Project.create(project_params)
    if @project.valid?
      @project.user_id = current_user.id
      respond_to do |format|
        if @project.save
          format.html { redirect_to action: 'index' }
        end
      end
    else
      render :new
    end
  end

  def update
    @project = Project.find params[:id]
    if @project.update_attributes(project_params)
      respond_to do |format|
        format.html { redirect_to action: 'index' }
      end
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to action: 'index' }
      end
    end
  end
  private

    def project_params
      params.require(:project).permit(:name, :description, :cut)
    end
end

