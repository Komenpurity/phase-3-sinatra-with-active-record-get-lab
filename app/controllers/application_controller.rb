class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the bakery in the database using its ID
    bake = Bakeries.find(params[:id])
    # send a JSON-formatted response of the bakery data 
    bake.to_json(include: baked_goods)
  end

  get '/baked_goods/by_price' do
    baked = BakedGood.order(price: :desc).all 
    baked.to_json
  end

  get '/baked_goods/most_expensive' do
    baked = BakedGood.order(price: :desc).first
    baked.to_json 
  end

end
