require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |season_str, contestants|
    if season_str == season
      contestants.each do |contestant_hash|
        contestant_hash.each do |k, v|
          if k == "status" && v == "Winner"
            winner = contestant_hash["name"].split
            return winner[0]
          end
        end
      end
    end
  end
end


def get_contestant_name(data, occupation)
  data.each do |season_str, contestants|
    contestants.each do |contestant_hash|
      contestant_hash.each do |k, v|
        if k == "occupation" && v == occupation
          return contestant_hash["name"]
        end
      end
    end
  end
end


def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_str, contestants|
    contestants.each do |contestant_hash|
      contestant_hash.each do |k, v|
        if k == "hometown" && v == hometown
          count += 1
        end
      end
    end
  end
  count
end


def get_occupation(data, hometown)
  data.each do |season_str, contestants|
    contestants.each do |contestant_hash|
      contestant_hash.each do |k, v|
        if k == "hometown" && v == hometown
          return contestant_hash["occupation"]
        end
      end
    end
  end
end


def get_average_age_for_season(data, season)
  ages = []
  data.each do |season_str, contestants|
    if season_str == season
      contestants.each do |contestant_hash|
        contestant_hash.each do |k, v|
          if k == "age"
            ages << v.to_i
          end
        end
      end
    end
  end
  ages = ages.inject{ |sum, el| sum + el }.to_f / ages.length
  ages.round
end
