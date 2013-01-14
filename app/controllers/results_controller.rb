class ResultsController < ApplicationController
  def show
  end

  def new
    @result = Result.new
  end

  def index
    @results = Result.all
  end

  def create
    param = params[:result]
    unless Student.find_by_roll_no(params[:result][:student_id]).nil?
      Result.create(param)
      flash[:notice] = "Result Added"
    else
      flash[:notice] = "Roll No doesnt exist"      
    end
    redirect_to new_result_path
  end

  def search
    @student = Student.find_by_roll_no(params[:roll_no])
    @results = @student.results
  end
end
