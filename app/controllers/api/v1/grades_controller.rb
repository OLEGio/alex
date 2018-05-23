module Api
  module V1
    class GradesController < ApiController
      def index
        render json: Grade.all
      end

      def create
        @grade = Grade.new(params.require(:grade).permit(:grade, :rate))

        if @grade.save
          render json: @grade
        else
          render json: @grade.errors.full_messages
        end
      end

      def update
        @grade=Grade.find_by(id: params[:id])

        if @grade.present?
          if @grade.update(params.require(:grade).permit(:grade, :rate))
            render json: @grade
          else
            render json: @grade.errors.full_messages
          end
        else
          render json: { error: 'Grade with such id doesn\'t exist' }
        end
      end

      def destroy
        @grade = Grade.find_by(id: params[:id])

        if @grade.present?
          @grade.destroy
          render json: { success: true }
        else
          render json: { success: false }
        end
      end
    end
  end
end
