class CommentsController < ApplicationController
  before_action :your_comment?

  def new
    @qns = Question.find(params[:question_id])
    @comment = Comment.new
    @prev_comments = Comment.where(question_id: params[:question_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.question_id = params[:question_id].to_i
    @comment.user_id = params[:user_id].to_i

    if @comment.save
      redirect_to user_question_path(current_user, @comment.question_id), notice: "Comment saved!"
    else
      render "new", notice: "Creation failed. Please contact administrator."
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @qns = Question.find(params[:question_id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to user_question_path(current_user, @comment.question_id), notice: "Comment updated!"
    else
      render "edit", notice: "Edit failed. Please contact administrator."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comments)
  end

  def your_comment?
    @comment = Comment.find(params[:id])
    redirect_to user_question_path(current_user, params[:question_id]), notice: "That does not belong to you!" unless @comment.user == current_user
  end
end
