class QuestionsController < ApplicationController
  before_action :check_user, except: [:home]

  def home
    @home = Question.all
  end

  def index
    @myqns = Question.where(user_id: current_user)
  end

  def show
    @qns = Question.find(params[:id])
  end

  def new
    @qns = Question.new
  end

  def create
    @qns = Question.new(question_params)
    @qns.user = current_user

    if @qns.save
      redirect_to home_path, notice: "Successfully created!"
    else
      render "new", notice: "Couldn't create question. Please contact administrator."
    end
  end

  def edit
    @qns = Question.find(params[:id])
  end

  def update
    @qns = Question.find(params[:id])

    if @qns.update_attributes(question_params)
      redirect_to user_question_path(current_user, @qns), notice: "Successfully updated!"
    else
      render "edit", notice: "Update failed"
    end
  end

  def destroy
    qns = Question.find(params[:id])
    qns.destroy
    redirect_to home_path, notice: "successfully deleted!"
  end

  private

  def question_params
    params.require(:question).permit(:title, :questions)
  end

end
