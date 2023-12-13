require 'spec_helper'
require_relative '../lib/linked_list'

RSpec.describe LinkedList do
  describe "adding an item" do
    it "should increase the count by 1" do
      linked_list = LinkedList.new
      linked_list.add(1)
      expect(linked_list.count).to eq(1)
    end
  end

  describe "#count" do
    it "should start at zero" do
      linked_list = LinkedList.new
      expect(linked_list.count).to eq(0)
    end
  end
end
