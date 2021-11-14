class BusinessesController < ApplicationController
  before_action :get_user_data

  def index
    @categories = Business.new.get_all_categories
  end

  def recommendations
    if !params[:category].nil?
      category = params[:category]
      zip_code = session[:zip_code] 
      @businesses = Business.new.get_business_from_category(category, zip_code)
    else
      redirect_to categories_path
    end
  end

  protected

  def get_user_data
    if user_signed_in?
      @user = current_user
    elsif session["user"] && (User.clean_answers session["user"])
      @user = User.create_guest session["user"]
    else
      flash.alert = "Warning, you are not logged in and you haven't answered the questions."
    end
  end

end
