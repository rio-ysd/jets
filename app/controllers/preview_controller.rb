class PreviewController < ApplicationController
  def show
    @page = Page.find params[:id]
    render layout: false
  end
end
