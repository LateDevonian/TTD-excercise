
require_relative '../robot.rb'
require 'rspec'
require 'spec_helper'

RSpec.describe Robot do 

  let(:rob) { Robot.new }

  def set_direction(x, y, f)
    { x: x, y: y, f: f }
  end

  describe 'Successful placement of the robot' do
    it 'places it in the start position ' do
      set_place = set_direction(0, 0, 'N')
      result = rob.place(set_place)
      expect(result).to eq(x: 0, y: 0, f: 'N')
    end

    it 'unsuccessfully places a robot' do
      set_place = set_direction(0, 0, 'Z')
      result = rob.place(set_place)
      expect(result).to be_nil
    end

    it "can move like a dancing queen" do
      set_place = set_direction(2, 1, 'N')
      rob.place set_place
      rob.move
      expect(rob.current_position).to eq({x: 2, y: 2, f:'N'})
    end

    it "doesn't move out of bounds" do
      set_place = set_direction(0,0,'S')
      rob.place set_place
      rob.move
      expect(rob.current_position).to eq(set_place)
    end

    it "rotates correctly" do
      set_place = set_direction(0,0,'N')
      rob.place set_place
      rob.rotate 'LEFT'

      expect(rob.current_position).to eq({x: 0, y: 0, f:'W'})
    end
  end
end

