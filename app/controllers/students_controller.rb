class StudentsController < ApplicationController

  load_and_authorize_resource

  def index
    @student = Student.all
    @user_id = User.all

  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
      if @student.save
        flash[:success] = "You have signed up successfully"
          redirect_to @student
      else
        render 'new'
      end
  end

  def show
    @student = Student.find(params[:id])
    @topic_id = Student.fetch_topic
  end

  #def fecth
  #  @topic_id = Student.fetch_topic
  #end

  def destroy
    @student=Student.find(params[:id])
      @student.destroy
        redirect_to student_answer_questions_path
  end
  def fetch_student

  end

  private
    def student_params
      params.require(:student).permit(:name,:qualification,:age,:email,:password,:password_confirmation)
    end
end
