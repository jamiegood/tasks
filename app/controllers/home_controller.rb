class HomeController < ApplicationController
  
  
  def index
    
    @tasks = Task.all
    
    puts @tasks
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end    
  end
end
