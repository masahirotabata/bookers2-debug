class PostCommentsController < ApplicationController
    
    
  def new
    @book_show = Book.find(params[:book_id])
    @posts = @book_show.post_comments
    @post_comments = PostComment.new
    @user = @book_show.user
    @books = @user.books
    @book = Book.new
    
  end
    
  def create
      comment = current_user.post_comments.new(post_params)
      comment.book_id = params[:book_id]
      
    @book_show = Book.find(params[:book_id])
    @posts = @book_show.post_comments
    @post_comments = PostComment.new
    @user = @book_show.user
    @books = @user.books
    @book = Book.new
  
      
    if comment.save
    flash[:success] = "Liked post"
    redirect_to request.referer
    
    else
      render :new,　user: @user,book: @book_show
      
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
