class AuthorsController < ApplicationController
  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_param)
    if @author.save
      flash[:notice] = "Author Created"

      redirect_to authors_path
    else
      render 'new'
    end

  end

  def update
    @author = Author.find(params[:id])

    @author.update(author_param)

    flash[:notice] = "Category Updated"
    
    redirect_to authors_path
  end

  def edit
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy

    flash[:notice] = "Category Removed"
    
    redirect_to authors_path
  end

  def index
    @authors = Author.all
  end

  def show
  end

  private
    def author_param
      params.require(:author).permit(:first_name, :last_name)
    end
end
