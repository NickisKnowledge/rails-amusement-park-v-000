class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def ticket_update(user, attraction)
    user.update(tickets: user.tickets - attraction.tickets)
  end

  def nausea_update(user, attraction)
    user.update(nausea: user.nausea + attraction.nausea_rating)
  end

  def happiness_update(user, attraction)
    user.update(happiness: user.happiness + attraction.happiness_rating)
  end

  def take_ride
    user = User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. "\
      "You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.ticket_update(user, attraction)
      self.nausea_update(user, attraction)
      self.happiness_update(user, attraction)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
