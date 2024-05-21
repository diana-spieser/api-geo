class UsersController < ApplicationController
  require 'net/http'
  require 'json'

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    code_postal = params[:user][:code_postal]

    if code_postal
      puts code_postal
      uri = URI("https://geo.api.gouv.fr/communes?codePostal=#{code_postal}&fields=nom,code&format=json")
      response = Net::HTTP.get(uri)
      communes = JSON.parse(response)
puts communes
      if communes.any?
        @communes = communes # Assurez-vous d'assigner la liste des communes à la variable @communes
      else
        @error = "Aucune commune trouvée pour ce code postal."
      end
    end

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end
  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:nom, :prenom, :nom_jeune_fille, :lieu_naissance, :pays_naissance, :code_postal, :email)
  end
end
