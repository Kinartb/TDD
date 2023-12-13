# spec/member_spec.rb
require 'spec_helper'
require_relative '../lib/member'

RSpec.describe Member do
  describe '#tell_my_friends' do
    it 'sends the news to all friends' do
      member = Member.new
      friend1 = spy('friend1')
      friend2 = spy('friend2')
      member.add_friend(friend1)
      member.add_friend(friend2)

      member.tell_my_friends('Great news!')

      expect(friend1).to have_received(:hear_news).with('Great news!')
      expect(friend2).to have_received(:hear_news).with('Great news!')
    end
  end

  describe '#hear_news' do
    it 'propagates the news to my friends' do
      member = Member.new
      friend = spy('friend')
      member.add_friend(friend)

      member.hear_news('Exciting news!')

      expect(friend).to have_received(:hear_news).with('Exciting news!')
    end
  end

  describe '#add_friend' do
    it 'adds a friend to the list' do
      member = Member.new
      friend = spy('friend')

      member.add_friend(friend)

      expect(member.friends).to include(friend)
    end
  end
end
