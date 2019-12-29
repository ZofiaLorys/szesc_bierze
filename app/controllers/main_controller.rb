# frozen_string_literal: true

class MainController < ApplicationController
  def start; end

  def final
    @user1 = User.where(which_user: "user1").first
    @user2 = User.where(which_user: "user2").first
    @user1_negative_points = BinCard.where(users: { which_user: "user1" }).joins(:user, :card).sum(:negative_points)
    @user2_negative_points = BinCard.where(users: { which_user: "user2" }).joins(:user, :card).sum(:negative_points)
    if @user1_negative_points < @user2_negative_points
      @winner = @user1
    elsif @user1_negative_points < @user2_negative_points
      @winner = @user2
    else
      @winner = "remis"
    end
  end

  def new_game
    TableCard.destroy_all
    UserCard.destroy_all
    BinCard.destroy_all
    Card.destroy_all
    User.destroy_all
    Game.destroy_all
    user1 = User.create(which_user: "user1", nick: users_params["user1_nick"])
    user2 = User.create(which_user: "user2", nick: users_params["user2_nick"])
    Game.create(
      user: user1,
    )

    (1..24).each do |x|
      if x % 10 == 0
        Card.create(
          value: x,
          negative_points: 3
        )
      elsif x % 5 == 0 && x % 10 != 0
        Card.create(value: x,
                    negative_points: 2)
      elsif x % 11 == 0
        Card.create(value: x,
                    negative_points: 5)
      else
        Card.create(value: x,
                    negative_points: 1)
      end
    end

    cards = Card.all.sample(24)
    (0..3).each do |x|
      TableCard.create(card: cards[x], row_id: x)
    end
    (4..13).each do |x|
      UserCard.create(card: cards[x], user: user1)
    end
    (14..23).each do |x|
      UserCard.create(card: cards[x], user: user2)
    end

    redirect_to :game_index
  end

  def users_params
    params.require(:user)
  end
  end
