class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find_by_id(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id})
    @pages = @page.subject.pages.sorted
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_parameters)
    if @section.save
      flash[:notice] = 'Section created successfully.'
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find_by_id(params[:id])
  end

  def update
    @section = Section.find_by_id(params[:id])
    if @section.update_attributes(section_parameters)
      flash[:notice] = 'Section updated successfully.'
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find_by_id(params[:id])
  end

  def destroy
    section = Section.find_by_id(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully."
    redirect_to(:action => 'index', :page_id => @page.id)
  end

  private

    def section_parameters
      params.require(:section).permit(:page_id, :name, :content_type, :content, :position, :visible)
    end

    def find_page
      @page = Page.find_by_id(params[:page_id])
    end

end
