class Mypage::LayoutsController < Mypage::ApplicationController
  before_action :set_layout, only: %i[show edit update delete]

  # GET /layouts
  def index
    @layouts = Layout.all
  end

  # GET /layouts/1
  def show
    render layout: false
  end

  # GET /layouts/new
  def new
    @layout = Layout.new
  end

  # GET /layouts/1/edit
  def edit
  end

  # POST /layouts
  def create
    p current_user.company.id
    @layout = current_user.company.layouts.new(layout_params)

    if @layout.save
      redirect_to mypage_layout_path(@layout)
    else
      render :new
    end
  end

  # PUT /layouts/1
  def update
    if @layout.update(layout_params)
      redirect_to mypage_layout_path(@layout)
    else
      render :edit
    end
  end

  # DELETE /layouts/1
  def delete
    @layout.destroy
    redirect_to layouts_path
  end

  private

  def set_layout
    @layout = Layout.find(params[:id])
  end

  def layout_params
    params.require(:layout).permit(%i[title content])
  end
end