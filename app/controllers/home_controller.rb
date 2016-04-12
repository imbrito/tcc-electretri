class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :team]
  before_filter :get_user

  def index
    @projects = @user.projects.paginate(:page => params[:page], :per_page => 5).order(updated_at: :desc)
  end

  def about
  end

  def team
  end
  private

    def get_user
      @user = current_user
    end
end
