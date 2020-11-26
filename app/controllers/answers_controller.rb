class AnswersController < ApplicationController

  def index
    @form = Form.find(params[:form_id])
    @question = Question.find(params[:question_id])
    @answers = policy_scope(Answer).where(question: @question)
  end

end
