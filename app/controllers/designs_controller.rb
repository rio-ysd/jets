class DesignsController < ApplicationController
  before_action :set_design, only: [:show, :edit, :update, :delete]

  # GET /designs
  def index
    @designs = Design.all
  end

  # GET /designs/1
  def show
    @layout = Layout.find 2

    render layout: false
  end

  # GET /designs/new
  def new
    @design = Design.new
  end

  # GET /designs/1/edit
  def edit
  end

  # POST /designs
  def create
    @design = Design.new(design_params)
    @design.company_id = 1

    if @design.save
      redirect_to design_path(@design)
    else
      render :new
    end
  end

  # PUT /designs/1
  def update
    if @design.update(design_params)
      redirect_to design_path(@design)
    else
      render :edit
    end
  end

  # DELETE /designs/1
  def delete
    @design.destroy
    redirect_to designs_path
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_design
    @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit([:title, :content])
  end
end
