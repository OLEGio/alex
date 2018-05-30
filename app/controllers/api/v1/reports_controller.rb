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
        render json: {sum: @sum}
      end

      def result_inject
        @user = User.find(params[:user_id])
        @sum = 0.0
        @sum= @user.worked_times.inject(0) {|sum, work_time| sum +(work_time.end_date - work_time.start_date).to_i*@user.amount * @user.grade.rate}
        render json: {sum: @sum}
      end

      def result_total
        @users = User.all
        @sum = 0.0
        @users.each do |user|
          user.worked_times.each do |work_time|
            @sum += (work_time.end_date - work_time.start_date).to_i * user.amount * user.grade.rate
          end
        end

        render json: {sum: @sum}
      end

    def result_total_inject
      @users = User.all
      @sum = 0.0
      @sum= @users.inject(0){|summ,user| summ +user.worked_times.inject(0) {|days, work_time| days +(work_time.end_date - work_time.start_date).to_i*user.amount * user.grade.rate}}

      render json: {sum: @sum}
    end


    def report_monthly
        month = params[:month]
        year = params[:year]
        begining = DateTime.parse("#{month} #{year}")
        ending = begining.end_of_month
        worked_times = WorkedTime.where('(start_date < ? or start_date < ?) and (end_date > ? or end_date > ?)',
                                        begining, ending, begining, ending).all

        amounts = []
        worked_times.each do |worked_time|
          days_count = (Array(worked_time.start_date..worked_time.end_date) & Array(begining..ending)).count
          amount = worked_time.user.amount * worked_time.user.grade.rate * days_count

          finded_amount = amounts.find {|a| a[:user_name] == worked_time.user.name}

          if finded_amount.present?
            finded_amount[:amount] = finded_amount[:amount] + amount
          else
            amounts << {user_name: worked_time.user.name, amount: amount}
          end
        end

        render json: amounts
      end

      def report_monthly_by_one
        month = params[:month]
        year = params[:year]
        user_name = params[:name]
        @user = User.find_by_name(user_name)
        if @user.present?
          begining = DateTime.parse("#{month} #{year}")
          ending = begining.end_of_month
          worked_times = WorkedTime.where('(start_date < ? or start_date < ?) and (end_date > ? or end_date > ?) and user_id = ?',
                                          begining, ending, begining, ending,@user.id).all

          amounts = []
          worked_times.each do |worked_time|
            days_count = (Array(worked_time.start_date..worked_time.end_date) & Array(begining..ending)).count
            amount = worked_time.user.amount * worked_time.user.grade.rate * days_count

            finded_amount = amounts.find {|a| a[:user_name] == worked_time.user.name}

            if finded_amount.present?
              finded_amount[:amount] = finded_amount[:amount] + amount
            else
              amounts << {user_name: worked_time.user.name, amount: amount}
            end
          end
        end


        render json: amounts
      end
    end
  end
end



