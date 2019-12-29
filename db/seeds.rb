# frozen_string_literal: true
TableCard.destroy_all
UserCard.destroy_all
BinCard.destroy_all
Card.destroy_all
User.destroy_all
Game.destroy_all

user1 = User.create(which_user: 'user1', nick: 'user1')
user2 = User.create(which_user: 'user2', nick: 'user2')
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
for x in 0..3
    TableCard.create(card: cards[x], row_id: x)
end
for x in 4..13
    UserCard.create(card: cards[x], user: user1)
end
for x in 14..23
    UserCard.create(card: cards[x], user: user2)
end

puts " - There are #{Card.count} cards." 
puts " - There are #{TableCard.count} cards on the table." 
puts " - There are #{UserCard.where(user: user1).count} cards in user1 hand." 
puts " - There are #{UserCard.where(user: user2).count} cards in user2 hand." 

