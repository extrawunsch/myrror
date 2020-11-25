class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def answers
    @form = Form.find(params[:id])
    @questions = Question.where(params[:form_id])
    #@answers = Answer.where(params[:question_id])
    authorize @form
  end

  def index
    @forms = policy_scope(Form).order(created_at: :desc)
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
    # placeholder for proper presentation key
    @form.presentation_key = rand()
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

  def show
    @form = Form.find(params[:id])
    @questions = Question.where(params[:form_id])
    #@answers = Answer.where(params[:question_id])
    authorize @form
  end

  private

  def form_params
    params.require(:form).permit(:name, :presented_on)
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end

end
