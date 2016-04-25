class ProfilesController < InheritedResources::Base
  respond_to :html
  before_filter :get_project

  def index
    @profiles = @project.profiles.order(:created_at)
    respond_to do |format|
      format.html
    end
  end

  def show
    @performable = @project.profiles.includes(:performances).find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @profile = @project.profiles.new
    respond_with @profile
  end

  def edit
    @profile = @project.profiles.find params[:id]
    respond_with @profile
  end

  def create
    @profile = @project.profiles.create(profile_params)
    if @profile.save
    	@project.criterions.each { |criterion| @profile.performances.build(value: 0, criterion: criterion).save }
    	respond_to do |format|
        format.html { redirect_to project_path(@project) }
      end
    else
      render :new
    end
  end

  def update
    @profile = @project.profiles.find params[:id]
    if @profile.update_attributes(profile_params)
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
      end
    else
      render :edit
    end
  end

  def destroy
    @profile = @project.profiles.find params[:id]
    if @profile.destroy
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
      end
    end
  end
  private

    def profile_params
      params.require(:profile).permit(:name, :description)
    end

    def get_project
      @project = Project.includes([:criterions,:profiles]).find params[:project_id]
    end
end

