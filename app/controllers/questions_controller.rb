class QuestionsController < ApplicationController
  before_action :check_user, except: [:home]
  before_action :your_question?, only: [:edit, :update, :destroy]

  def home
    @home = Question.all.order(updated_at: :desc)
  end

  def index
    @myqns = Question.where(user_id: current_user).order(updated_at: :desc)
  end

  def show
    @qns = Question.find(params[:id])
    @comment = Comment.find_by(question_id: params[:id])
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

  def your_question?
    @qns = Question.find(params[:id])
    redirect_to home_path, notice: "This does not belong to you!" unless @qns.user == current_user
  end
end
