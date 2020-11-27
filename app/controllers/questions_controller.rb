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
    @questions = Question.where(["predefined = ? and question_topic = ?", true, "Content"])
    @question = Question.new
    authorize @question
  end

  def create
    @questions = Question.where(predefined: true)
    @question = Question.new(question_params)
    authorize @question
    if @question.save
      FormQuestion.create(form_id: @form.id, question_id: @question.id)
      redirect_to new_form_question_path(@form)
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
