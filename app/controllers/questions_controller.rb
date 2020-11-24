class QuestionsController < ApplicationController
  before_action :find_form, only: [:new, :create]

  def index
    @questions = policy_scope(Question)
  end

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    authorize @question
    if @question.save
      redirect_to form_path(@form)
    else
      render :new
    end
  end

  private

  def find_form
    @form = Form.find(params[:form_id])
  end

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end
end
