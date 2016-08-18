class PagesController < ApplicationController

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find_by_id(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_parameters)
    if @page.save
      flash[:notice] = 'Page created successfully.'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find_by_id(params[:id])
  end

  def update
    @page = Page.find_by_id(params[:id])
    if @page.update_attributes(page_parameters)
      flash[:notice] = 'Page updated successfully.'
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find_by_id(params[:id])
  end

  def destroy
    page = Page.find_by_id(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

    def page_parameters
      params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
    end

end
