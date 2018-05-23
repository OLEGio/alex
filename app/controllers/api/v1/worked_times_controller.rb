module Api
  module V1
    class WorkedTimesController < ApiController
        def index
          render json: WorkedTime.all
        end

        def create
          @worked_time = WorkedTime.new(params.require(:worked_time).permit(:user_id, :start_date, :end_date))
          if @worked_time.save
            render json: @worked_time
          else
            render json: @worked_time.errors.full_messages
          end
        end

        def update
          @worked_time = WorkedTime.find_by(id: params[:id])

          if @worked_time.present?
            if @worked_time.update(params.require(:worked_time).permit(:user_id, :start_date, :end_date))
              render json: @worked_time
            else
              render json: @worked_time.errors.full_messages
            end
          else
            render json: { error: 'Worked time with such id doesn\'t exist' }
          end
        end

        def destroy
          @worked_time=WorkedTime.find_by(id: params[:id])

          if @worked_time.present?
            @worked_time.destroy
            render json: { success: true }
          else
            render json: { success: false }
          end
        end
     end
  end
end

