class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :feedback ]

  def home
  end

  def feedback
    @presentation_key = params[:presentation_key]
    @form = Form.where(presentation_key: @presentation_key).first
    puts @form
    unless @form.nil? 
      redirect_to form_feedback_path(@form.id)
    end
  end
end
