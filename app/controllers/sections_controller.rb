class SectionsController < ApplicationController

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find_by_id(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_parameters)
    if @section.save
      flash[:notice] = 'Section created successfully.'
      redirect_to(:action => 'index')
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
      redirect_to(:action => 'show', :id => @section.id)
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
    redirect_to(:action => 'index')
  end

  private

    def section_parameters
      params.require(:section).permit(:page_id, :name, :content_type, :position, :visible)
    end

end
