class StudentsController < ApplicationController
  # before_filter :authenticate_user!
  
  def new
    @student = Student.new
  end

  def create
    param = params[:student]
    flag = Student.create(param)
    if flag
      flash[:notice] = "Successfully created"
    else
      flash[:notice] = "Something went wrong. Try later"      
    end
  end

  def update
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def update    
  end

  def edit
  end

  def destroy
  end
end
