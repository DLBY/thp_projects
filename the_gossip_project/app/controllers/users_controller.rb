class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @cities = City.all
  end

  def create
    
=begin
    @user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city_id: 19,
      description: params[:description],
      age: params[:age],
      first_name: params[:first_name],
      last_name: params[:last_name]
    )
=end

    @user = User.new(params.permit(:first_name, :last_name, :email, :age, :description, :password,))
    @user.city = City.find_by(params.permit(:zip_code))
    @user.valid?

    if @user.save
      flash[:success] = "Compte bien créé !"
      redirect_to root_path
    else
      flash[:failure] = "Erreur lors de la création du compte !"
      render 'new'
    end
  end
end
