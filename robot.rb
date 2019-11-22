# frozen_string_literal: true
class Robot
    #TDD Training exercise

    VALIDDIRECITONS = %w{N W S E}
    MAXBOARDSIZE = 5

    attr :current_position


    def place(directions)
        return nil unless validate_position(directions)
        @current_position = directions

        current_position
    end

    def move
        # have we been placed?
        return if current_position == nil

        # is next coord out of bounds
        next_position = current_position
        case next_position[:f]
        when 'N'
            next_position[:y] += 1
        when 'E'
            next_position[:x] += 1
        when 'S'
            next_position[:y] -= 1
        when 'W'
            next_position[:x] -= 1
        end

        # move
        return unless validate_position next_position
        
        @current_position = next_position
    end

    def rotate(direction)
        return if current_position == nil  
        case direction
        when "LEFT"
            offset = -1
        when "RIGHT"
            offset = 1
        else 
            return
        end

        for found in 0..length(VALIDDIRECITONS)
            break if VALIDDIRECITONS[found] == current_position[:f] 
        end

        new_index = found % MAXBOARDSIZE 
        current_position[:f] = VALIDDIRECITONS[new_index]
    end

    # returns true/false
    def validate_position(directions)
        if !directions.has_key?(:x) ||  !directions.has_key?(:y) || !directions.has_key?(:f)
            return false
        end
        
        return false unless VALIDDIRECITONS.include?(directions[:f])
        return false unless directions[:x].between?(0,MAXBOARDSIZE-1)
        return false unless directions[:y].between?(0,MAXBOARDSIZE-1)
        return true
    end
end 


