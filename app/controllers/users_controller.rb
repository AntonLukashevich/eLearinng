# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  # load_and_authorize_resource
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all.includes(:achievements)
  end

  def new
    @user = User.new
  end

  def show
    @user_courses = User.find(params[:id]).courses
    # @organizations = Organization.includes(:staffs).where(staffs: {email: current_user.email })
    # puts '######################################################################################'
    # binding.pry
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.avatar.empty?
        avatar = @user.avatar = image_tag('default-avatar.png', alt: @user.email)
        @user.update(avatar: avatar)
      end
      sign_in @user
      redirect_to user_path(@user), success: 'Your profile created'
    else
      render 'new', danger: 'Error! Something went wrong... Check your input info.'
    end
  end

  def update
    if @user.update(user_params)
      sign_in current_user
      redirect_to @user, success: 'Profile updated'
    else
      render 'edit', danger: 'Error! Something went wrong... Check your input info.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, info: 'Profile deleted.'
  end

  private

  def user_params
    permitted = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                             :role_id, :avatar)

    permitted.merge!(role_id: Role.where(name: 'user').last.id)
  end

  def set_user
    @user ||= User.find(params[:id])
  end

  def user_avatar(user)
    user = current_user
    user.update[avatar: 'default-avatar.jpeg'] if user.avatar.nil?
  end
end
