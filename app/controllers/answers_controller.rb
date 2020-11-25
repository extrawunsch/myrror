class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @answer = Answer.new
    @form = Form.find(params[:id])
  end
end
