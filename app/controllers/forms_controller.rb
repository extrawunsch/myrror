class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @forms = policy_scope(Form).order(created_at: :desc)
  end
  
  def show
    @form = Form.find(params[:id])
    @questions = Question.where(params[:form_id])
    #@answers = Answer.where(params[:question_id])
    authorize @form
  end

  def new
    @form = Form.new
    authorize @form
    @question = Question.new
    @questions = Question.where(predefined: true)
  end

  def create
    @questions = Question.where(predefined: true)
    @form = Form.new(form_params)
    @form.user = current_user
    # placeholder for proper presentation key
    @form.presentation_key = rand()
    authorize @form
    if @form.save
      # need to connect question with form_question if needed
      @question = Question.new(question_params)
      @question.predefined = false
      if @question.save
        redirect_to edit_form_path(@form)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @questions = Question.where(predefined: true)
    @form = Form.find(params[:id])
    authorize @form
    @form.questions.build
  end

  def update
    @questions = Question.where(predefined: true)
    @form = Form.find(params[:id])
    authorize @form
    if @form.update(both_params)
      redirect_to forms_path
    else
      render :edit
    end
  end

  private

  def form_params
    params.require(:form).permit(:name, :presented_on, :speaker)
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end
  
  def both_params
    params.require(:form).permit(:name, :presented_on, :speaker, questions_attributes: [:question_content, :question_topic, :question_type])
  end
end
