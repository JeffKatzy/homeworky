class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(params[:teacher])
    if @teacher.save
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def index
    @teachers = Teacher.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
