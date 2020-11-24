class FormsController < ApplicationController

  def new
    @form = Form.new
    authorize @form
  end

  def create
    @form = Form.new(form_params)
    @form.user = current_user
    @form.presentation_key = 'ftest1'
    authorize @form
    if @form.save
      redirect_to :root
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:form).permit(:name, :presented_on)
  end
end
