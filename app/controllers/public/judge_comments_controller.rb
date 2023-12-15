class Public::JudgeCommentsController < ApplicationController
  def create
    judge = Judge.find(params[:judge_id])
    comment = current_user.judge_comments.new(judge_comment_params)
    comment.judge_id = judge.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    JudgeComment.find(params[:id]).destroy
    redirect_to judge_path(params[:judge_id])
  end
  
  private

  def judge_comment_params
     params.require(:judge_comment).permit(:comment)
  end
end
