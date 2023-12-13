class Member
  def initialize
    @friends = []
  end

  def tell_my_friends(message)
    friends.each { |friend| friend.hear_news(message) }
  end

  def hear_news(message)
    friends.each { |friend| friend.hear_news(message) }
  end

  def add_friend(friend)
    @friends << friend
  end

  def friends
    @friends.dup
  end
end
 
