class WorkedTimesController < ApplicationController
  def index
    @worked_times = WorkedTime.all
  end

  def new
    @worked_time = WorkedTime.new
    @users_list = User.all.map { |user| [user.name, user.id] }
  end

  def show
    render json: @worked_time
  end

  def destroy
    @worked_time=WorkedTime.find(params[:id])
    @worked_time.destroy!
  end

  def set_worked_time
    @worked_time = WorkedTime.find(params[:id])
  end


  def create
    @worked_time = WorkedTime.new(params.require(:worked_time).permit(:user_id, :start_date, :end_date))
    if @worked_time.save
      render json: @worked_time
      redirect_to worked_times_path
    end
  end
end
