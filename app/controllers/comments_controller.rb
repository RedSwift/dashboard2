class CommentsController < ApplicationController
  def new
    @qns = Question.find(params[:question_id])
    @comment = Comment.new
    @prev_comments = Comment.find_by(question_id: params[:question_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.question_id = params[:question_id].to_i
    @comment.user_id = params[:user_id].to_i

    if @comment.save
      redirect_to user_question_path(current_user, @comment.question_id)
    else

    end
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comments)
  end
end
