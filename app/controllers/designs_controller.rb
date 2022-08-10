class DesignsController < ApplicationController
  before_action :set_design, only: [:show, :edit, :update, :delete]

  # GET /designs
  def index
    @designs = Design.all
  end

  # GET /designs/1
  def show
    if params[:id].match(/\.json$/)
      contents = []
      m = @design.content.scan(/\<%= +([^ %]+) +%\>/)
      if m.present?
        contents = m.map do |row|
          row.first
        end.delete_if do |row|
          row == 'title'
        end
      end
      render json: {html: @design.layout.content.gsub(/\<%= content %\>/, @design.content), contents: contents}
    else
      @layout = Layout.find 1
      render layout: false
    end
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
    @design.layout_id = 2

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
    @design = Design.find params[:id].to_i
  end

  def design_params
    params.require(:design).permit([:title, :content])
  end
end
