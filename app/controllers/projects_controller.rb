class ProjectsController < ApplicationController
  before_filter :set_user
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = @user.projects.order(updated_at: :desc)
  end

  def show
    @project = @user.projects.includes([:criterions,:profiles,:alternatives]).find params[:id]
    @criterions = @project.criterions
    @profiles = @project.profiles
    @alternatives = @project.alternatives
  end

  def new
    @project = @user.projects.new
  end

  def edit
  end

  def create
    @project = @user.projects.create(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to project_path(@project) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def result
    @project = @user.projects.includes([:criterions,:profiles,:alternatives]).find params[:project_id]
    @criterions = @project.criterions
    @profiles = @project.profiles
    @alternatives = @project.alternatives
    respond_to do |format|
      format.html
    end
  end
  private

    def project_params
      params.require(:project).permit(:name, :description, :cut)
    end

    def set_user
      @user = current_user
    end

    def set_project
      @project = @user.projects.find params[:id]
    end
end
