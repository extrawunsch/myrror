class FormsController < ApplicationController
  def show
    @form = Form.find(params[:id])
    authorize @form
  end

  def new
    @form = Form.new
    authorize @form
    @question = Question.new
  end

  def create
    @form = Form.new(form_params)
    @form.user = current_user
    # placeholder for proper presentation key
    @form.presentation_key = rand()
    authorize @form
    if @form.save
      # need to connect question to form
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

  private

  def form_params
    params.require(:form).permit(:name, :presented_on)
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end
end
