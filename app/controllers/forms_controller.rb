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
    # placeholder for proper presentation key
    @form.presentation_key = rand()
    authorize @form
    if @form.save
      # need to connect question with form_question if needed
      @question = Question.new(question_params)
      if @question.save
        redirect_to new_form_question_path(@form)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @questions = Question.all
    @form = Form.find(params[:id])
    authorize @form
  end

  def update
    @questions = Question.all
    @form = Form.find(params[:id])
    authorize @form
    if @form.update(form_params)
      question_content = params[:question_content]
      question_type = params[:question_type]
      question_topic = params[:question_topic]
      @question = Question.new(question_content: question_content, question_type: question_type, question_topic: question_topic)
      if @question.save
        redirect_to new_form_question_path(@form)
      else
        render :new
      end
    end
  end

  private

  def form_params
    params.require(:form).permit(:name, :presented_on, :speaker)
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end
end
