class ReportsController < ApplicationController
  def index
    @users_list = User.all
  end

  def result
    @user = User.find(params[:user_id])
    @sum = 0.0
    @user.worked_times.each do |work_time|
      @sum += (work_time.end_date - work_time.start_date).to_i * @user.amount * @user.grade.rate
    end
  end

  def result_total
    @user = User.All
    @sum = 0.0
    @user.worked_times.each do |work_time|
      @sum += (work_time.end_date - work_time.start_date).to_i * @user.amount * @user.grade.rate
    end

    # render json: { sum: @sum, amount: @amount }
  end
end


