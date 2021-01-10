class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def index 
    @gossips = Gossip.all
    @users = User.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    #@user = User.all
    #@city = City.all
  end

  def edit
      @gossip = Gossip.find(params[:id])
  end

  def update
      @gossip = Gossip.find(params[:id])
      @gossip.update(gossip_params)
  end

  def new
    @gossip = Gossip.new
  end

 def destroy
    @gossip = Gossip.find(params[:id])

    @gossip.destroy
    flash[:succes] = "Gossip supprimé"
    redirect_to root_path
  end

  def create
    @gossip = Gossip.new(title: params[:title],content: params[:content])
      @gossip.user = current_user

    if @gossip.save
      flash[:success] = "Nouveau gossip publié !"
      redirect_to root_path(@gossip.id)
    else
      flash[:failure] = "Erreur lors de la publication du gossip !"
      redirect_to request.referrer
    end
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      flash[:failure] = 'Veuillez vous connecter'
      redirect_to new_session_path
    end
  end
end