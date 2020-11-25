class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :feedback ]

  def home
  end

  def feedback
    @form = Form.new
  end
end
