require('sinatra')
require('sinatra/reloader')

require_relative('./models/film')
also_reload('./models/*')


get '/films' do
  @films = Film.all
  erb(:film)
end

get '/films/:id' do
    data = Film.return_by_id(params[:id]).first
    @film_name = data.title
    @film_price = data.price
    erb(:film_details)
end
