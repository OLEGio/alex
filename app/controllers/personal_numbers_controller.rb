class PersonalNumbersController < ApplicationController
  def index
    @personalnumbers = PersonalNumber.all
  end

  def new
    @personalnumber = PersonalNumber.new
  end

  def create
    @personalnumber = PersonalNumber.new(params.require(:personalnumber).permit(:number, :user))
  end
end
