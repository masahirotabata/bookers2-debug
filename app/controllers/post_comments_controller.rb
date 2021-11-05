class PostCommentsController < ApplicationController
    
    
  def new
    @book = Book.find(params[:book_id])
    @posts = @book.post_comments
    @post_comments = PostComment.new
    
  end
    
  def create
      comment = current_user.post_comments.new(post_params)
      comment.book_id = params[:book_id]
  
      
    if comment.save
    flash[:success] = "Liked post"
    redirect_to request.referer
    
    else
      render :new
      
    end
  end
  
  def show
      
      @posts = PostComment.find(user_id:params[:id])
 
  end

  def destroy
    post_comment = current_user.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to request.referer
  end
  
  def post_params
    params.require(:post_comment).permit(:comment)
  end
  
end
