# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'main#start', as: 'main_start'
  get '/game', to: 'game#index', as: 'game_index'
  get '/main/final', to: 'main#final', as: 'main_final'
  patch '/game/play_a_card', to: 'game#save_cards', as: 'game_play_a_card'
  post '/main/new_game', to: 'main#new_game', as: 'main_new_game'

end
