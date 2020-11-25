class FormsController < ApplicationController
  def index
    @forms = policy_scope(Form).order(created_at: :desc)
  end
  def show
    @form = Form.find(params[:id])
  end

  def success
    @form = Form.find(params[:id])
    authorize @form
  end

end
