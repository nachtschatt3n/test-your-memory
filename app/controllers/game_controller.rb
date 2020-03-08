class GameController < ApplicationController
  
  def index
    case session[:mode]
      when 'image'
        if session[:image_id]
          @image = Image.find(session[:image_id]).next
        else 
          @image = Image.first 
        end
        @mode = 'image'
      when 'question'
        @mode = 'question'
      when 'finished'
        redirect_to(@finish_path)
      else 
        session[:mode] = "image"
        session[:image_id] = Image.first.id
    end
    
    #@questions = @image.questions

  end

  def image_shown
    session[:image_id] = id
    session[:mode] = "question"
  end
  

  def answer_question(id)
    
  end
  
end
