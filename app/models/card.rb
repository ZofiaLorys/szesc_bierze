# frozen_string_literal: true

class Card < ApplicationRecord
  validates :value, uniqueness: true
  has_one :user_card
  has_one :table_card
  has_one :bin_card
  has_one :temporary_card_place
  has_one :user, through: :user_card
  # has_one :user, through: :bin_card
end
