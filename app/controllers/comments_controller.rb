class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comment_params)
  	@comment.user = current_user
  	
  

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was created successfully.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'Comment was NOT saved.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    @comment.save
    
  end


  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post
  end

private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end

end
