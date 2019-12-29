# frozen_string_literal: true

class User < ApplicationRecord
  has_one :user_card
  has_one :bin_card

end
