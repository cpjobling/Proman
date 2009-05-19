class GateController < ApplicationController
  
  def list
    @users = User.find(:all)
  end
  
  def index
    @user = User.find(session[:user_id])
    @roles = []
    @user.roles.each do |r|
      @roles.push(r.name)
    end
  end
end
