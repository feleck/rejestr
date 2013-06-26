class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new(section_params)    # Not the final implementation!
    if @section.save
      flash[:success] = 'Section created'
      redirect_to @section
    else
      render 'new'
    end    
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = 'Section updated'
      redirect_to @section
    else
      render 'edit'
    end
  end

private

    def section_params
      params.require(:section).permit(:long_name, :short_name)
    end
end
