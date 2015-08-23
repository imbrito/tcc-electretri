class ProjectsController < InheritedResources::Base
  respond_to :html
  before_filter :get_user

  def get_user
    @user = current_user 
  end

  def index
    @projects = @user.projects.order(:created_at)
    respond_to do |format|
      format.html
    end
  end

  def show
    @project = @user.projects.find params[:id]
    @count = Criterion.where(:project_id => @project.id).count
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
          format.html { redirect_to action: 'index' }
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
        format.html { redirect_to action: 'index' }
      end
    else
      render :edit
    end
  end

  def destroy
    @project = @user.projects.find params[:id]
    if @project.destroy
      respond_to do |format|
        format.html { redirect_to action: 'index' }
      end
    end
  end
  private

    def project_params
      params.require(:project).permit(:name, :description, :cut)
    end
end

