class ProfilesController < ApplicationController
  before_filter :set_project
  before_action :set_profile, only: [:edit, :update, :destroy]

  def index
    @profiles = @project.profiles.order(:created_at)
  end

  def show
    @performable = @project.profiles.includes(:performances).find params[:id]
  end

  def new
    @profile = @project.profiles.new
  end

  def edit
  end

  def create
    @profile = @project.profiles.create(profile_params)
    respond_to do |format|
      if @profile.save
    	   @project.criterions.each { |criterion| @profile.performances.build(value: 0, criterion: criterion).save }
        format.html { redirect_to project_path(@project) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update_attributes(profile_params)
        format.html { redirect_to project_path(@project) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project) }
    end
  end
  private

    def profile_params
      params.require(:profile).permit(:name, :description)
    end

    def set_project
      @project = Project.includes([:criterions,:profiles]).find params[:project_id]
    end

    def set_profile
      @profile = @project.profiles.find params[:id]
    end
end
