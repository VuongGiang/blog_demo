class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        #respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
    end

      end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
