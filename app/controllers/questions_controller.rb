class QuestionsController < ApplicationController

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    authorize @question
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:question_content, :question_topic, :question_type)
  end
end
