module Api
  module V1
    class UsersController < ApiController
      def index
        render json: User.all
      end

      def create
        @user = User.new(params.require(:user).permit(:name, :amount, :grade_id))

        if @user.save
          render json: @user
        else
          render json: @user.errors.full_messages
        end
      end

      def update
        @user = User.find_by(id: params[:id])

        if @user.present?
          if @user.update(params.require(:user).permit(:name, :amount, :grade_id))
            render json: @user
          else
            render json: @user.errors.full_messages
          end
        else
          render json: { error: 'User doesn\'t exist' }
        end
      end

      def destroy
        @user = User.find_by(id: params[:id])

        if @user.present?
          @user.destroy
          render json: { success: true }
        else
          render json: { success: false }
        end
      end
    end
  end
end