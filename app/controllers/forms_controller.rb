class FormsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]

  def show
    @form = Form.find(params[:id])
    @questions = Question.where(params[:form_id])
    #@answers = Answer.where(params[:question_id])
    authorize @form
  end
end
