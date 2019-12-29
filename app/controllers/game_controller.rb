# frozen_string_literal: true

class GameController < ApplicationController
  def index
    @active_user = Game.first.user.nick
    @cards_user1 = Card.where(users: { which_user: "user1" }).joins(:user, :user_card)
    @cards_user2 = Card.where(users: { which_user: "user2" }).joins(:user, :user_card)
    @cards_active_user = Card.where(user_cards: { user: Game.first.user}).joins(:user, :user_card)
    @cards_row0 = Card.where(table_cards: { row_id: 0 }).joins(:table_card).order(value: :asc)
    @cards_row1 = Card.where(table_cards: { row_id: 1 }).joins(:table_card).order(value: :asc)
    @cards_row2 = Card.where(table_cards: { row_id: 2 }).joins(:table_card).order(value: :asc)
    @cards_row3 = Card.where(table_cards: { row_id: 3 }).joins(:table_card).order(value: :asc)
    @cards_user1_bin =  BinCard.where(users: { which_user: "user1" }).joins(:user)
    @cards_user2_bin =  BinCard.where(users: { which_user: "user2" }).joins(:user)


  end

  def save_cards
    card = Card.find(card_params["card"].to_i)
    row = card_params["row"].to_i
    if (rows_to_take(card).include? row) || (row_to_add_in(card) == row)
      if Game.first.user == User.where(which_user: 'user1').first
        TemporaryCardPlace.create(card: card, row: row, user: active_user)
        change_active_user
      else
        TemporaryCardPlace.create(card: card, row: row, user: active_user)
        change_active_user
        TemporaryCardPlace.joins(:card).order("cards.value").each do |temp|
          play_a_card(temp.card, temp.row, temp.user)
        end
        TemporaryCardPlace.delete_all
      end
      redirect_to action: "index"
    else
      puts "Tutaj nie mozesz połozyc karty"
      redirect_to action: "index"
    end
  end

  def play_a_card(card, row, user)
    if rows_to_take(card).include? row
      move_to_bin(row, user)
      TableCard.create(card: card, row_id: row)
      UserCard.where(card: card).first.delete
      change_active_user
    elsif row_to_add_in(card) == row
      if TableCard.where(row_id: row).count == 5
        move_to_bin(row, user)
      end
      UserCard.where(card: card).first.delete
      TableCard.create(card: card, row_id: row)
      change_active_user
    end
  end

  def move_to_bin(row, user)
    TableCard.where(row_id: row).each do |table_card|
      card = table_card.card
      BinCard.create(card: card, user: user)
      table_card.delete
    end
  end

  def last_card_in_row
    last_card_in_row = {}
    last_card_in_row[0] = Card.where(table_cards: { row_id: 0 }).joins(:table_card).order(value: :asc).last
    last_card_in_row[1] = Card.where(table_cards: { row_id: 1 }).joins(:table_card).order(value: :asc).last
    last_card_in_row[2] = Card.where(table_cards: { row_id: 2 }).joins(:table_card).order(value: :asc).last
    last_card_in_row[3] = Card.where(table_cards: { row_id: 3 }).joins(:table_card).order(value: :asc).last
    last_card_in_row
  end

  def rows_to_take(card)
    rows = []
    (0...4).each do |r|
      if card.value < last_card_in_row[r].value
        rows.append(r)
      end
    end
    rows
  end

  def row_to_add_in(card)
    row_to_add_in = [0, 1, 2, 3] - rows_to_take(card)

    diff = {}
    row_to_add_in.each do |row|
      diff[row] = card.value - last_card_in_row[row].value
    end
    diff.min_by { |_k, v| v }.first
  end

  def card_params
    params.require(:card)
  end

  def change_active_user
    if active_user == User.first
      Game.first.update(user: User.last)
    else
      Game.first.update(user: User.first)
    end
  end

  def active_user
    Game.first.user
  end
end
