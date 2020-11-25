require 'securerandom'
require 'rqrcode'

class FormsController < ApplicationController

  def index
    @forms = policy_scope(Form).order(created_at: :desc)
  end

  def show
    @form = Form.find(params[:id])
    authorize @form
  end

  def new
    @form = Form.new
    authorize @form
    @question = Question.new
    @questions = Question.all
  end

  def create
    @questions = Question.all
    @form = Form.new(form_params)
    @form.user = current_user
    @form.presentation_key = SecureRandom.alphanumeric(5)
    authorize @form
    if @form.save
      # need to connect question with form_question if needed
      @question = Question.new(question_params)
      if @question.save
        redirect_to form_path(@form)
      else
        render :new
      end
    else
      render :new
    end
  end

  def success
    @form = Form.find(params[:id])
    authorize @form
    @qr = RQRCode::QRCode.new( 'https://github.com/whomwah/rqrcode', :size => 4, :level => :h )
  end

  private

  def form_params
    params.require(:form).permit(:name, :presented_on)
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end
end
