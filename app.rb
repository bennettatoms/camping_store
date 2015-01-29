require 'sinatra'
require_relative './model/inventory'

get '/' do
  @active = 'home' # added @active so the home tab is greyed out when on home page, see layout
  erb :home
end

get '/about' do
  @active = 'about'
  erb :about
end

get '/items' do
  @active = 'items'
  @search = params[:search]
  if @search && @search.length > 0
    @items = Inventory.search(@search)
  else
    @items = Inventory.all
  end
  erb :items
end

get '/items/:id' do
  @item = Inventory.find(params[:id].to_i)
  erb :item
end
