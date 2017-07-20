class UserGroupsController < ApplicationController
  def create
    @group = Group.find(params[:user_group][:group_id])
    params[:user_group][:users].each do |u|
      @group.user_groups.create(user_id: u)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @group = UserGroup.where("group_id=#{params[:id]} and user_id=#{current_user.id}").first
    @group.update(accepted: true)
    @group.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @group = UserGroup.where("group_id=#{params[:id]} and user_id=#{current_user.id}").first
    @group.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
end
