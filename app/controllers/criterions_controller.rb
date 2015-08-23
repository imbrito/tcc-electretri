class CriterionsController < InheritedResources::Base
  respond_to :html
  before_filter :get_project

  def get_project
  	@project = Project.find params[:project_id]
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
      respond_to do |format|
        if @criterion.save
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
    respond_to do |format|
      if @criterion.destroy
        format.html { redirect_to action: 'index' }
      end
    end
  end
  private

    def criterion_params
      params.require(:criterion).permit(:name, :weigth, :preference, :indifference, :veto, :direction, :project_id)
    end
end

