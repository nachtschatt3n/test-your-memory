class FinishController < ApplicationController

  before_action :get_params

  def index
    @questions_incorrect = ((Question.all.count - session[:score]).to_f * 1.25).round
  end
  

  def get_params
    @parameters = params.permit(params.keys).to_h
    session[:init] = true
  end

end
