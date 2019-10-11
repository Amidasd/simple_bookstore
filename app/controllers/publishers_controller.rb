class PublishersController < ApplicationController
  def new
    @page_title = 'Add New Publisger'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_param)
     if @publisher.save
      flash[:notice] = "Author Created"

      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])

    @publisher.update(publisher_param)

    flash[:notice] = "Publisher Updated"
    
    redirect_to publishers_path
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])

    @publisher.destroy

    flash[:notice] = "Category Removed"
    
    redirect_to publishers_path
  end

  def index
    @publishers = Publisher.all
  end

  def show
  end

   private
    def publisher_param
      params.require(:publisher).permit(:name)
    end
end
