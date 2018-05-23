module Api
  module V1
    class ContactsController < ApiController
      def index
        render json: Contact.all
      end

      def create
        @contact = Contact.new(params.require(:contact).permit(:email, :phone, :telegram))

        if params[:company_id].present?
          @contact.entity_type = "Company"
          @contact.entity_id = params[:company_id]
        else
          @contact.entity_type = "User"
          @contact.entity_id = params[:user_id]
        end

        if @contact.save
          render json: @contact
        else
          render json: @contact.errors.full_messages
        end
      end

      def update
        @contact = WorkedTime.find_by(id: params[:id])

        if @contact.present?
          if @contact.update(params.require(:worked_time).permit(:email, :phone, :telegram))
            render json: @contact
          else
            render json: @contact.errors.full_messages
          end
        else
          render json: { error: 'Worked time with such id doesn\'t exist' }
        end
      end

      def destroy
        @contact=Contact.find_by(id: params[:id])

        if @contact.present?
          @contact.destroy
          render json: { success: true }
        else
          render json: { success: false }
        end
      end
    end
  end
end

