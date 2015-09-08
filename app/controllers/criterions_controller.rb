class CriterionsController < InheritedResources::Base
  respond_to :html
  before_filter :get_project

  def get_project
  	@project = Project.includes(:profiles).find params[:project_id]
  end

  def index
    @criterions = @project.criterions.order(:created_at)
    respond_to do |format|
      format.html
    end
  end

  def show
    @criterion = @project.criterions.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @criterion = @project.criterions.new
    respond_with @criterion
  end

  def edit
    @criterion = @project.criterions.find params[:id]
    respond_with @criterion
  end

  def create
    @criterion = @project.criterions.create(criterion_params)
    if @criterion.valid?
      if @criterion.save
        create_performance_if_exists_profiles_or_alternatives
      	respond_to do |format|
          format.html { redirect_to action: 'index' }
        end
      end
    else
      render :new
    end
  end

  def update
    @criterion = @project.criterions.find params[:id]
    if @criterion.update_attributes(criterion_params)
      respond_to do |format|
        format.html { redirect_to action: 'index' }
      end
    else
      render :edit
    end
  end

  def destroy
    @criterion = @project.criterions.find params[:id]
    if @criterion.destroy
      respond_to do |format|
        format.html { redirect_to action: 'index' }
      end
    end
  end
  private

    def criterion_params
      params.require(:criterion).permit(:name, :weigth, :preference, :indifference, :veto, :direction)
    end

    def create_performance_if_exists_profiles_or_alternatives
      if !@project.profiles.count.eql?(0)
        @project.profiles.each { |profile| profile.performances.build(value: 0, criterion: @criterion).save }
      end
    end
end

