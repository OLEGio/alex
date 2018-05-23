module Api
    module V1
      class ReportsController < ApiController
        def index
          # @users_list = User.all
        end

        def result
          @user = User.find(params[:user_id])
          @sum = 0.0
          @user.worked_times.each do |work_time|
            @sum += (work_time.end_date - work_time.start_date).to_i * @user.amount * @user.grade.rate
          end
          render json: { sum: @sum }
        end

        def result_total
          @users = User.all
          @sum = 0.0
          @users.each do |user|
            user.worked_times.each do |work_time|
              @sum += (work_time.end_date - work_time.start_date).to_i * user.amount * user.grade.rate
            end
          end

           render json: { sum: @sum }
        end
      end
    end
end



