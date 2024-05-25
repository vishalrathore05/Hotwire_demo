# app/controllers/schools_controller.rb
class SchoolsController < ApplicationController
  before_action :set_school, only: %i[show edit update destroy]

  def index
    @schools = School.all
  end

  def show; end

  def new
    @school = School.new
  end

  def edit; end

  def create
    @school = School.new(school_params)
    if @school.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @school, notice: "School was successfully created." }
      end
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @school, notice: "School was successfully updated." }
      end
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to schools_url, notice: "School was successfully destroyed." }
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name)
  end
end
