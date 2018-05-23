class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(params.require(:grade).permit(:grade, :rate))

    redirect_to grades_path if @grade.save
  end
end
