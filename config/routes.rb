# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'main#start', as: 'main_start'
  get '/game', to: 'game#index', as: 'game_index'
  patch '/game/play_a_card', to: 'game#save_cards', as: 'game_play_a_card'
end
