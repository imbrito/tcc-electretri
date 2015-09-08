class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :team]
  before_filter :get_user

  def get_user
  	@user = current_user
  end
  def index
  	@count = @user.projects.count
    @projects = @user.projects.order(updated_at: :desc).limit(5)
  end

  def about
  end

  def team
  end
end
