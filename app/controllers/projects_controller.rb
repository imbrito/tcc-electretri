class ProjectsController < InheritedResources::Base
  respond_to :html
  before_filter :get_user

  def index
    @projects = @user.projects.order(updated_at: :desc)
    respond_to do |format|
      format.html
    end
  end

  def show
    @project = @user.projects.includes([:criterions,:profiles,:alternatives]).find params[:id]
    @criterions = @project.criterions
    @profiles = @project.profiles
    @alternatives = @project.alternatives
    respond_to do |format|
      format.html
    end
  end

  def new
    @project = @user.projects.new
    respond_with @project
  end

  def edit
    @project = @user.projects.find params[:id]
    respond_with @project
  end

  def create
    @project = @user.projects.create(project_params)
    if @project.valid?
      if @project.save
        respond_to do |format|
          format.html { redirect_to project_path(@project) }
        end
      end
    else
      render :new
    end
  end

  def update
    @project = @user.projects.find params[:id]
    if @project.update_attributes(project_params)
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
      end
    else
      render :edit
    end
  end

  def destroy
    @project = @user.projects.find params[:id]
    if @project.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end
  private

    def project_params
      params.require(:project).permit(:name, :description, :cut)
    end

    def get_user
      @user = current_user 
    end
end

