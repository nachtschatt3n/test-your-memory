class GameController < ApplicationController
  before_action :get_params

  def index
    session[:score] = 0 unless session[:score]
    
    case session[:mode]
      when 'image'
        if session[:image_id]
          @image = Image.find(session[:image_id]).next
        else 
          @image = Image.first 
        end
        @mode = 'image'
        #redirect_to(@finish_path) if @image.id == Image.all.last.id
      when 'question'
        @image = Image.find(session[:image_id])
        if session[:question_id]
          if (Question.find(session[:question_id]) == @image.questions.last) || 
             (!@image.questions.collect(&:id).include?(session[:question_id]))
            session[:question_id] = nil
            session[:mode] = "image"
            else 
             @question = @image.questions.find(session[:question_id]).next
          end
        else 
          @question = @image.questions.first 
          if @question 
            session[:question_id] = @question.id 
            @mode = 'question'
          else 
            session[:question_id] = nil 
            @mode = 'image'    
          end
        end
      else 
        session[:image_id] = Image.first.id
        session[:mode] = "image"
        @image = Image.first
    end
  end

  def image_shown
    session[:image_id] = @parameters[:id]
    session[:mode] = "question"
    redirect_to game_path
  end
  
  def answer_question
    a = Answer.find(@parameters[:id])
    session[:score] =session[:score]+1  if a.correct
    session[:mode] = "image" if a.question.answers.last.id == a.id 
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