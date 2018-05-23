module Api
  module V1
    class CompaniesController < ApiController
      def index
        render json: Company.all
      end

      def create
        @company = Company.new(params.require(:company).permit(:name, :unp, :description))
        if @company.save
          render json: @company
        else
          render json: @company.errors.full_messages
        end
      end

      def update
        @company = Company.find_by(id: params[:id])

        if @company.present?
          if @company.update(params.require(:company).permit(:name, :unp, :description))
            render json: @company
          else
            render json: @company.errors.full_messages
          end
        else
          render json: { error: 'Worked time with such id doesn\'t exist' }
        end
      end

      def destroy
        @company=Company.find_by(id: params[:id])

        if @company.present?
          @company.destroy
          render json: { success: true }
        else
          render json: { success: false }
        end
      end
    end
  end
end

