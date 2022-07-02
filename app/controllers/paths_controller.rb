class PathsController < ApplicationController
  def show
    @path = Path.friendly.find(params[:id])

    if @path.courses.size == 1
      redirect_to path_course_path(@path, @path.courses.first)
    end
  end

  def index
    @default_path = Path.default_path
    @paths = Path.where.not(default_path: true).order(:position)
  end
end
