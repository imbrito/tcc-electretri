class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :team]
  def index
  	@projects = Project.all
  end

  def about
  end

  def team
  end
end
