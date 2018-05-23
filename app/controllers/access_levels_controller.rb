class AccessLevelsController < ApplicationController
  def index
    @access_levels = AccessLevel.all
  end

  def new
    @access_level = AccessLevel.new
  end

  def update
    @access_level.update(params.require(:AccessLevel).permit(:level, :description))
  end
  def show
    render json: @access_level
  end

  def destroy
    @access_level=AccessLevel.find_by_name(name)
    @access_level.destroy!
  end

  def create
    @access_level = AccessLevel.new(params.require(:AccessLevel).permit(:level, :description))

    if @access_level.save
      redirect_to users_path
    end
  end
end
