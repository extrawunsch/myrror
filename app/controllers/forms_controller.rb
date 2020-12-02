require 'securerandom'
#require 'rqrcode'

class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :destroy]

  def analytics
    @forms = policy_scope(Form).order(created_at: :desc)
    # @forms = Form.all 
  end

  def index
    @forms = policy_scope(Form).order(created_at: :desc)
  end

  def show
    @form = Form.find(params[:id])
    @questions = Question.where(form_id: @form)
    #@answers = Answer.where(params[:question_id])
    authorize @form
  end

  def new
    @form = Form.new
    authorize @form
    @question = Question.new
  end

  def create
    @questions = Question.where(predefined: true)
    @form = Form.new(form_params)
    @form.user = current_user
    @form.presentation_key = SecureRandom.alphanumeric(5)
    authorize @form
    @question = Question.new(question_content: params[:form][:question_content])
    @question.predefined = false
    @question.question_topic = 'General'
    @question.question_type = 'Star Rating'
    @answer = Answer.new(answer_content: params[:form][:answer_content])
    if @form.save && @question.save
      if @question.save
        @answer.question_id = @question.id
        @answer.save
        formquestion = FormQuestion.new
        formquestion.form_id = @form.id
        formquestion.question_id = @question.id
        formquestion.save
        redirect_to edit_form_path(@form)
      end
    else
      render :new
    end
  end

  def edit
    if params[:query].present?
      sql_query = "(question_topic ILIKE :query OR question_content ILIKE :query) AND predefined = true"
      @questions = Question.where(sql_query, query: "%#{params[:query]}%")
    else
      @questions = Question.where(predefined: true)
    end
    @question = Question.new
    @form = Form.find(params[:id])
    authorize @form
  end

  def update
    @questions = Question.where(predefined: true)
    @form = Form.find(params[:id])
    authorize @form
    if @form.update(form_params)
      question_content = params[:question][:question_content]
      question_type = params[:question][:question_type]
      question_topic = params[:question][:question_topic]
      @question = Question.new(question_content: question_content, question_type: question_type, question_topic: question_topic, predefined: false)
      if @question.save
        FormQuestion.create(form_id: @form.id, question_id: @question.id)
        redirect_to new_form_question_path(@form)
      else
        render :edit
      end
    end
  end

  def destroy
    @form = Form.find(params[:id])
    authorize @form
    @form.destroy
    redirect_to forms_path
  end

  def success
    @form = Form.find(params[:id])
    authorize @form
    @qr = RQRCode::QRCode.new("http://www.myrror.org/forms/#{@form.id}/answers/new", :size => 5, :level => :h )

    @png = @qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )
    
  end

  private

  def form_params
    params.require(:form).permit(:name, :presented_on, :speaker)
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end

end
