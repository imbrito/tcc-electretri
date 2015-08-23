class CriterionsController < InheritedResources::Base
  respond_to :html

  def index
  	@project = Project.find params[:project_id]
    @criterions = Criterion.where(:project_id => params[:project_id]).order(:created_at)
    respond_to do |format|
      format.html
    end
  end

  def show
  	@project = Project.find params[:project_id]
    @criterion = Criterion.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
  	@project = Project.find params[:project_id]
    @criterion = Criterion.new
    respond_with @criterion
  end

  def edit
    @project = Project.find params[:project_id]
    @criterion = Criterion.find params[:id]
    respond_with @criterion
  end

  def create
  	@project = Project.find params[:project_id]
    @criterion = Criterion.create(criterion_params)
    if @criterion.valid?
      @criterion.project_id = params[:project_id]
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
  	@project = Project.find params[:project_id]
    @criterion = Criterion.find params[:id]
    @criterion.update_attributes(criterion_params)
    if @criterion.valid?
      respond_to do |format|
        if @criterion.save
          format.html { redirect_to action: 'index' }
        end
      end
    else
      render :edit
    end
  end

  def destroy
  	@project = Project.find params[:project_id]
    @criterion = Criterion.find params[:id]
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

