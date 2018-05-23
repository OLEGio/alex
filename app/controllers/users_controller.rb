class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @grades_list = Grade.all.map { |grade| [grade.grade, grade.id] }
  end

  def update
    @user.update(params.require(:user).permit(:name, :amount, :grade_id))
  end
  def show
    render json: @user
  end

  def destroy
    @user=User.find_by_name(name)
    @user.destroy!
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :amount, :grade_id))

    if @user.save
      redirect_to users_path
    end
  end
end
