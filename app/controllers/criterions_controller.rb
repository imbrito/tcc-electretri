class CriterionsController < ApplicationController
  before_filter :set_project
  before_action :set_criterion, only: [:show, :edit, :update, :destroy]

  def index
    @criterions = @project.criterions.order(:created_at)
  end

  def show
  end

  def new
    @criterion = @project.criterions.new
  end

  def edit
  end

  def create
    @criterion = @project.criterions.create(criterion_params)
    respond_to do |format|
      if @criterion.save
        create_performance_if_exists_profiles_or_alternatives
        format.html { redirect_to project_path(@project) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @criterion.update_attributes(criterion_params)
        format.html { redirect_to project_path(@project) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @criterion.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project) }
    end
  end
  private

    def criterion_params
      params.require(:criterion).permit(:name, :weight, :preference, :indifference, :veto, :direction)
    end

    def set_project
      @project = Project.includes([:profiles,:alternatives]).find params[:project_id]
    end

    def set_criterion
      @criterion = @project.criterions.find params[:id]
    end

    def create_performance_if_exists_profiles_or_alternatives
      if !@project.profiles.count.eql?(0)
        @project.profiles.each { |profile| profile.performances.build(value: 0, criterion: @criterion).save }
      end
      if !@project.alternatives.count.eql?(0)
        @project.alternatives.each { |alternative| alternative.performances.build(value: 0, criterion: @criterion).save }
      end
    end
end
