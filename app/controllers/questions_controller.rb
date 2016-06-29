class QuestionsController < ApplicationController
  before_action :check_user, except: [:home]

  def home
    @home = Question.all
  end

  def index
  end

  def show
  end

  def new
    @qns = Question.new
  end

  def create
    #code
  end

  def edit
  end

end
