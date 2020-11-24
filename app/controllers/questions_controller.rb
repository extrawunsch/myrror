class QuestionsController < ApplicationController

  def show
    @form = Form.find(params[:form_id])
  end

  def new
    @form = Form.find(params[:form_id])
    @question = Question.new
  end

  def create
    
  end
end
