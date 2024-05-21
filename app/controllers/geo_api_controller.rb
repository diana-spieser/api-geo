class GeoApiController < ApplicationController
   require 'net/http'
  require 'uri'
  require 'json'

  def index
    code_postal = params[:code_postal]

    if code_postal
      uri = URI("https://geo.api.gouv.fr/communes?codePostal=#{code_postal}&fields=nom,code&format=json")
      response = Net::HTTP.get(uri)
      communes = JSON.parse(response)

      if communes.any?
        @commune = communes.first # On prend la première commune de la réponse
      else
        @error = "Aucune commune trouvée pour ce code postal."
      end
    end
  end
end
