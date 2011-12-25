class HomeController < ApplicationController
  respond_to :html, :xml
  def index
    @message = " burasi home index oluyor"
    # @parametre_mesaji = " URL`e yazilan soru isaretinden sonraki kisim."
    # @parametre_mesaji = params[:m]
  end

  def about
  end
  
  def new
    
  end
  
  def create
    if params[:messages] != ""
    @parametre_mesaji = params[:messages]
    else
    # render :text => @message
    @bu = "burasi create oluyor"
    end
  end
  
  def yeni
    @y = "yeni action"
    respond_with(@y)
    #send_file "/Users/ahmet/Pictures/navi.png"
    session[:zaman] = Time.now
  end
  
  
  def ornek (first_argument, second_argument)  
    @answer = (first_argument*second_argument)-5 + (first_argument*second_argument)-5  
    return  @answer  
  end

end
