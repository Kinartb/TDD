require 'spec_helper'
require_relative '../lib/home_controller'

RSpec.describe HomeController do
  describe '#index' do
    it 'should render special template on Tuesdays' do
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 10)) # Tuesday
      expect(subject.index).to eq('special_index')
    end

    it 'should render default template on non-Tuesdays' do
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 9)) # Monday
      expect(subject.index).to eq('index')
    end
  end
end
