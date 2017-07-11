class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :find_active_relationship, except: :index

  def index
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t "not_found"
      redirect_to root_path
    end
    type = params[:type]
    @users = @user.send(type).paginate page: params[:page]
    @title = t type.to_s
  end

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
    @relationship_destroy = @active_relationship.find_by followed_id: @user.id
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
    @relationship_build = @active_relationship.build
  end

  private

  def find_active_relationship
    @active_relationship = current_user.active_relationships
  end
end
