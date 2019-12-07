# frozen_string_literal: true

class BinCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
end
