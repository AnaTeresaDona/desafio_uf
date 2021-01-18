class UfsController < ApplicationController
  def question
      api_url = "https://mindicador.cl/api/uf/#{(params[:date])}"
      response = HTTParty.get(api_url)
      uf = JSON.parse(response.read_body)
      

      if uf['serie'][0].nil?
        return render json: {mensaje:"Valor no encontrado para esa fecha"}
      else 
        if request.headers['X-CLIENT'].present?
          Search.create(date_query: params[:date], name: request.headers['X-CLIENT'])
          render json: uf["serie"][0]["valor"]
        else
          rander json: "Cliente no reconocido"
        end
      end
  end

  def count_question
    count = Search.where(name: params[:name]).count 
    render json: count
  end
end
