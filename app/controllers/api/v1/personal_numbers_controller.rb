module Api
  module V1
    class PersonalNumbersController < ApiController
      def index
        render json: PersonalNumber.all
      end

      def create
        @personalnumber = PersonalNumber.new(params.require(:personal_number).permit(:number))
        @user=User.find_by(id: params[:personal_number][:user_id])

        if @user.present?
          @personalnumber.user_id = @user.id
        else
          render json:{ error: 'User with such id doesn\'t exist' }
          return
        end

        if @personalnumber.save
         # @user.update(personal_number: @personalnumber)
          render json: @personalnumber
        else
          render json: @personalnumber.errors.full_messages
        end
      end

      def update
        @personalnumber = PersonalNumber.find_by(id: params[:id])

        if @personalnumber.present?
          if @personalnumber.update(params.require(:personal_number).permit(:number))
            render json: @personalnumber
          else
            render json: @personalnumber.errors.full_messages
          end
        else
          render json: { error: 'Personal number with such id doesn\'t exist' }
        end
      end

      def destroy
        @personalnumber = PersonalNumber.find_by(id: params[:id])

        if @personalnumber.present?
          @personalnumber.destroy
          render json: { success: true }
        else
          render json: { success: false }
        end
      end
    end
  end
end

