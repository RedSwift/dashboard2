class QuestionsController < ApplicationController
  before_action :check_user, except: [:home]

  def home
    @home = Question.all
  end

  def index
    @myqns = Question.where(user_id: current_user)
  end

  def show
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
  end

  private

  def question_params
    params.require(:question).permit(:title, :questions)
  end

end
