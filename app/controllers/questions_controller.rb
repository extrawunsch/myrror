class QuestionsController < ApplicationController
  before_action :find_form, only: [:new, :create, :answers]

  # def answers
  #   @question = Question.find(params[:form_id])
  #   @answers = Answer.where(params[:question_id])
  #   authorize @question
  # end

  def index
    @questions = policy_scope(Question)
  end

  def new
    @questions = Question.all
    @question = Question.new
    authorize @question
  end

  def create
    @questions = Question.all
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
