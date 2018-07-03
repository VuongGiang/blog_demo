class LikesController < ApplicationController
	 def create
        post = Post.find(params[:post_id])
        current_user.like(post)
        redirect_to request.referrer || root_url
    end
    def destroy
    Like.destroy(params[:id])
    redirect_to request.referrer || root_url
end
 private

    def like_params
      params.require(:like).permit(:post_id)
    end
end
