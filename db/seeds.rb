# frozen_string_literal: true

Card.destroy_all

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

puts " - There are #{Card.count} users." # lepiej size'a
