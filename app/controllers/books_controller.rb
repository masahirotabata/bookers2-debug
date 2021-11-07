class BooksController < ApplicationController
  
  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @posts = @book.post_comments
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @books_serch = @books.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?  #この行を追記
end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    
   if @book.user == current_user

     render:edit

   else

    redirect_to books_path

   end

  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

 end