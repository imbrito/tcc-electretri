class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :team]
  def index
  	@count = Project.where(:user_id => current_user.id).count
  end

  def about
  end

  def team
  end
end