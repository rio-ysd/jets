class Mypage::PagesController < Mypage::ApplicationController
  before_action :set_page, only: %i[show edit update delete]
  before_action :set_designs, only: %i[new edit]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show
    render layout: false
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @page = current_user.company.pages.new(page_params)

    if @page.save
      redirect_to mypage_page_path(@page)
    else
      render :new
    end
  end

  # PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to mypage_page_path(@page)
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def delete
    @page.destroy
    redirect_to pages_path
  end

  private

  def set_page
    @page = Page.find params[:id]
  end

  def set_designs
    @designs = Design.all
  end

  def page_params
    params.require(:page).permit(%i[design_id title]).to_hash.merge content: content_params.to_json
  end

  def content_params
    params.require(:page).permit(:content)
  end
end
