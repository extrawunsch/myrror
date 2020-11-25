class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @answer = Answer.new
    @form = Form.find(params[:id])
  end

  def index
    @form = Form.find(params[:form_id])
    @question = Question.find(params[:question_id])
    @answers = policy_scope(Answer).where(question: @question)
  end
end
