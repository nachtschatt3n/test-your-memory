class GameController < ApplicationController
  before_action :get_params

  def index

    # check if we need to init the session 
    if !session[:score]
      session[:score] = 0
      session[:open_questions_ids] = Question.all.order(:sorting_prio).collect(&:id)
      session[:solved_questions_ids] = [] 
      session[:next_question_id] = session[:open_questions_ids].first
    end
     
    # check if there no questions left
    if session[:open_questions_ids].empty?
      redirect_to finish_path
    else 
      @question = Question.find(session[:next_question_id])
      @image = @question.image
    end

  end
  
  def answer_question
    a = Answer.find(@parameters[:id])
    session[:score] =session[:score]+1  if a.correct
    session[:solved_questions_ids] << a.id
    session[:open_questions_ids]= session[:open_questions_ids].drop(1)
    session[:next_question_id] = session[:open_questions_ids].first
    redirect_to game_path
  end

  def reset_session
    @_request.reset_session
    redirect_to root_path
  end

  def get_params
    @parameters = params.permit(params.keys).to_h
  end
end