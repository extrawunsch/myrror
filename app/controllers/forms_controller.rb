class FormsController < ApplicationController

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
    authorize @form
  end
  
  def create
  end
end
