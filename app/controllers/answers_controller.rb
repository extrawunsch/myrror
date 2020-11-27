class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :feedback ]
  def new
    @answer = Answer.new
    @form = Form.find(params[:form_id])
    @questions = @form.questions
    # puts @questions
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save
  end

  def feedback
    @presentation_key = params[:presentation_key]
    @form = Form.where(presentation_key: @presentation_key).first
    puts @form
    unless @form.nil? 
      redirect_to new_form_answer_path(@form.id)
    end
  end

  def index
    @form = Form.find(params[:form_id])
    @question = Question.find(params[:question_id])
    @answers = policy_scope(Answer).where(question: @question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_content, :question_id)
  end
end
