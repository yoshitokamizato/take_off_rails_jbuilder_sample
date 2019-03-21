class UsersController < ApplicationController
  def index
    @users = User.all
    render "index", :formats => [:json], :handlers => [:jbuilder]
  end
end
